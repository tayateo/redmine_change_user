class VhodChangeUser::Hooks < Redmine::Hook::ViewListener
  render_on :view_layouts_base_body_top,
            partial: 'hooks/vhod_change_user/view_layouts_base_body_top'
  render_on :view_layouts_base_html_head,
      partial: 'hooks/vhod_change_user/view_layouts_base_html_head'
  render_on :view_account_left_bottom,
            partial: 'hooks/vhod_change_user/view_account_left_bottom'
end