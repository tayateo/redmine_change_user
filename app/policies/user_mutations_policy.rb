class UserMutationsPolicy < Policy
  class << self
    def allow?(_action, _object = nil, user = User.current)
      _action == 'destroy' || user.admin?
    end
  end
end