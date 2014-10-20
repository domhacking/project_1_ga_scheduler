class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all

    elsif user.role? :student
        can :create, Post


        can :update, Post do |post|
            post.user_id == user.id
            end

    elsif user.role? :moderator
        can :destroy, Comment
    else
        can :read, Post
        end

      end
    end