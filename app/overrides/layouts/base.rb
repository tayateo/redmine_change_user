Deface::Override.new :virtual_path  => 'layouts/base',
                     :name              => 'add-change-user-style',
                     :original          => '71a7c98915466d6c3b79a99e7779f4fe90fcb91f',
                     :insert_after      => "erb[loud]:contains('favicon')",
                     :partial           => 'layouts/change_style'
