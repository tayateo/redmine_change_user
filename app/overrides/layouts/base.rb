Deface::Override.new virtual_path: 'layouts/base',
                     name: 'add-change-user-style',
                     original: 'fe3189c8cb34a6f01575263fa73a181e4e936023',
                     insert_after: "erb[loud]:contains('favicon')",
                     partial: 'layouts/change_style'

Deface::Override.new virtual_path: 'layouts/base',
                     name: 'add-turn-back-btn',
                     original: 'f7be8fb9039e02a4a2af8479c5dbfeee1484c91b',
                     insert_before: '#top-menu',
                     partial: 'layouts/turn_back'
