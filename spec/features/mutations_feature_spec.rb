require File.expand_path('../../rails_helper', __FILE__)

describe 'При мутации', js: true do
  include_context :user_and_admin
  before :each do
    login_user(init_user.login, 'foo')
    visit users_path
  end

  context 'если пользователь админ' do
    describe 'то отображается ссылка переключения пользователя' do
      it 'после нажатия на которую появляется идентификатор другого пользователя и кнопка обратного переключения' do
        click_link "Стать #{user.login}"
        expect(page).to have_css('#turn-back-panel > a', text: "Снова стать #{init_user.login}")
        expect(page).to have_css('#loggedas', text: "Вошли как #{user.login}")
      end
    end

    describe 'ссылка обратного переключения на админа' do
      it 'не сохраняется после завершения сеанса' do
        click_link "Стать #{user.login}"
        click_link "Выйти"
        login_user(user.login, 'foo')
        expect(page).to have_no_link("Снова стать #{init_user.login}")
      end
    end
  end

  context 'если пользователь не админ' do
    let(:init_user) { user }

    describe 'ссылка переключения пользователя' do
      it 'не существует' do
        expect(page).to have_no_css('.change-user')
      end
    end
  end
end

