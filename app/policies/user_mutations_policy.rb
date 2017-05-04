class UserMutationsPolicy < Policy
  class << self
    def allow?(_action, _object = nil, user = User.current)
      user.admin?
    end
  end
end