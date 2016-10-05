class Ability
  include CanCan::Ability

  def initialize(user)
   if user.has_role? :teacher
      can :manage, :all
    else
      can :read, :all
      cannot :teacher_dashboard
    end
  end
end
