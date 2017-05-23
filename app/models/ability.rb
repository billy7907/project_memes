class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :manage, Post do |post|
      post.user == user
    end

    can :manage, Vote do |v|
      user == v.user
    end

  end
end
