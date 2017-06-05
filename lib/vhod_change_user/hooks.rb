class VhodChangeUser::Hooks < Redmine::Hook::ViewListener
  render_on :view_layouts_base_body_top,
            partial: 'hooks/vhod_change_user/turn_back'
  render_on :view_layouts_base_html_head,
      partial: 'hooks/vhod_change_user/change_user_style'
  render_on :view_account_left_bottom,
            partial: 'hooks/vhod_change_user/mutate_on_user_page'
end