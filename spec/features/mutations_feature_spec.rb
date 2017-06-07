require File.expand_path('../../rails_helper', __FILE__)

describe 'При мутации', js: true do
  include_context :user_and_admin

  before :each do
    login_user(init_user.login, 'foo')
  end

  context 'если пользователь админ' do
    it 'есть ссылка переключения пользователя в списке пользователей' do
      visit users_path
      click_link "Стать #{user.login}"
      expect(page).to have_link("Снова стать admin")
      expect(page).to have_css('#loggedas', text: "Вошли как #{user.login}")
      click_link("Снова стать #{init_user.login}")
      expect(page).to have_link("Стать #{user.login}")
    end

    it 'есть ссылка переключения на пользователя на странице пользователя' do
      visit user_path(user.id)
      expect(page).to have_link("Стать #{user.login}")
      click_link("Стать #{user.login}")
      expect(page).to have_css('#turn-back-panel > a', text: "Снова стать admin")
      expect(page).to have_css('#loggedas', text: "Вошли как #{user.login}")
    end

    it 'нет ссылки переключения на смого себя на своей странице' do
      visit user_path(admin.id)
      expect(page).to have_no_link("Стать #{admin.login}")
    end

    it 'ссылка обратного переключения на админа не сохраняется после завершения сеанса' do
      visit users_path
      click_link "Стать #{user.login}"
      click_link "Выйти"
      login_user(user.login, 'foo')
      expect(page).to have_no_link("Снова стать #{init_user.login}")
    end
  end

  context 'если пользователь не админ' do
    let(:init_user) { user }

    it 'нет ссылки переключения пользователя в списке пользователей' do
      visit users_path
      expect(page).to have_no_link("Стать #{user2.login}")
    end

    it 'нет ссылки переключения пользователя на странице пользователя' do
      visit user_path(user2.id)
      expect(page).to have_no_link("Стать #{user2.login}")
    end
  end
end

