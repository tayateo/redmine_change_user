require File.expand_path('../../rails_helper', __FILE__)

describe 'Мутация', js: true do
  let!(:user) { FactoryGirl.create(:user, department: Department.new) }
  let(:admin) { FactoryGirl.create(:admin, login: 'admin', department: Department.new) }

  context 'при наличии у пользователя админских привелегий' do

    before :each do
      login_user(admin.login, 'foo')
    end

    describe 'ссылка переключения пользователя' do
      it 'должна существовать' do
        visit users_path
        expect(page).to have_selector('.change-user > a', text: 'Стать jsmith')
      end
    end

    describe 'нажатие на ссылку Стать <username>' do
      it 'вызывает появление кнопки снова стать админом' do
        visit users_path
        click_link 'Стать jsmith'
        expect(page).to have_selector('#turn-back-panel > a', text: 'Снова стать admin')
      end
    end
  end

  context 'при отсутствии у пользователя админских привелегий' do
    describe 'ссылка переключения пользователя' do
      it 'не должна существовать' do
        login_user(user.login, 'foo')
        visit users_path
        expect(page).not_to have_selector('.change-user')
      end
    end
  end
end

