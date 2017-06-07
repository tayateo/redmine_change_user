shared_context(:user_and_admin) do
  let(:department) { create(:department) }
  let!(:user) { create(:user, department: department) }
  let!(:user2) { create(:user, department: department) }
  let!(:admin) { create(:admin, login: 'admin', department: department) }
  let(:init_user) { admin }
end