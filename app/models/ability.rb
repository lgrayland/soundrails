class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all

    elsif user.persisted?
      can :create, Track
      can :read, Track
      can :update, Track, user_id: user.id
      can :destroy, Track, user_id: user.id

      can :read, Genre
      can :create, Genre

      can :read, User, id: user.id
      can :update, User, id: user.id

    else
      can :read, :all
    end
  end
end