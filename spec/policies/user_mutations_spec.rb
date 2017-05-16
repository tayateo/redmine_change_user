require File.expand_path('../../rails_helper', __FILE__)

describe UserMutationsPolicy, type: :policy do
  include_context :user_and_admin

  subject { UserMutationsPolicy.new(user, nil) }

  context 'Обычный пользователь' do
    it { should_not permit(:update) }
  end
end