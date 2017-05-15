require File.expand_path('../../rails_helper', __FILE__)

describe 'Мутация', js: true do
  let!(:user) { FactoryGirl.create(:user, department: Department.new) }
  let(:admin) { FactoryGirl.create(:admin, login: 'admin', department: Department.new) }

  context 'при наличии админских полномочий' do

    before :each do
      login_user(admin.login, 'foo')
    end

    describe 'ссылка переключения пользователя' do
      it 'должна существовать' do
        visit users_path
        expect(page).to have_selector('.change-user > a', text: "Стать #{user.login}")
      end
    end

    describe 'нажатие на ссылку Стать <username>' do
      it 'вызывает появление идентификационной подписи в правом верхнем углу' do
        visit users_path
        click_link "Стать #{user.login}"
        expect(page).to have_selector('#loggedas', text: "Вошли как #{user.login}")
      end
      it 'вызывает появление кнопки снова стать админом' do
        visit users_path
        click_link "Стать #{user.login}"
        expect(page).to have_selector('#turn-back-panel > a', text: "Снова стать #{admin.login}")
      end
    end

    describe 'возможность обратной мутации' do
      it 'не сохраняется после завершения сеанса' do
        visit users_path
        click_link "Стать #{user.login}"
        click_link "Выйти"
        login_user(user.login, 'foo')
        expect(page).not_to have_selector('#turn-back-panel > a', text: "Снова стать #{admin.login}")
      end
    end
  end

  context 'при отсутствии админских полномочий' do
    describe 'ссылка переключения пользователя' do
      it 'не должна существовать' do
        login_user(user.login, 'foo')
        visit users_path
        expect(page).not_to have_selector('.change-user')
      end
    end
  end
end

