require File.expand_path('../../rails_helper', __FILE__)

describe UserMutationsPolicy, type: :policy do
  include_context :user_and_admin

  subject { UserMutationsPolicy.new(admin, nil) }

  context 'Администратор' do
    it { should permit(:update) }
  end
end