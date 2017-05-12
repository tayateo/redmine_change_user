require File.expand_path('../../rails_helper', __FILE__)

describe 'Mutation' do
  let!(:user) { FactoryGirl.create(:user, department: Department.new) }
  let(:admin) { FactoryGirl.create(:admin, login: 'admin', department: Department.new) }

  describe 'Turning into user' do
    context 'User has admin privileges' do

      before :each do
        login_user(admin.login, 'foo')
      end

      describe 'Turning button visibility' do
        it 'should be visible' do
          visit users_path
          expect(page).to have_selector('.change-user')
        end
      end
    end
    context 'User does not have admin privileges' do
      before :each do
        login_user(user.login, 'foo')
      end

      describe 'Turning button visibility' do
        it 'should not be visible' do
          visit users_path
          expect(page).not_to have_selector('.change-user')
        end
      end
    end
  end
end

