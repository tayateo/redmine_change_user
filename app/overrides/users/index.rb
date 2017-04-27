Deface::Override.new :virtual_path  => 'users/index',
                     :name              => 'add-change-user-btn',
                     :original          => '3cfdcc601d69f3168c111c2f625842623de0d7d2',
                     :insert_before     => 'td.username',
                     :partial           => 'users/change_user'


Deface::Override.new :virtual_path  => 'users/index',
                     :name              => 'add-change-user-thead',
                     :original          => '2ba927adba7920d26097724835b57fe6e21d8098',
                     :insert_top        => 'thead tr',
                     :partial           => 'users/change_user_header'