class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    # if user.admin?
    #   can :manage, :all
    # end

    can :manage, Post do |post|
      post.user == user
    end

    can :vote, Post do |post|
      user != post.user
    end

    cannot :vote, Post do |post|
      user == post.user
    end

    can :manage, Vote do |v|
      user == v.user
    end

  end
end
