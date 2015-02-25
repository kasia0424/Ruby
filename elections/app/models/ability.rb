class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    if user.role.name == "admin"
      can :manage, :all
      can :destory, Constituency
	    cannot :create, Vote
    elsif user.role.name == "centralny"
      can :menage, :all
      can :read, Voivodeship
			can :frekwencja, Voivodeship
			can :results, Voivodeship
      can [:create, :read, :edit, :update], Committee
			can :read, Constituency
			can :frekwencja, Constituency
			can :results, Constituency
      can :invalid, Voivodeship
			#cannot :edit, Constituency
			can :read, Vote
			can :listconsti, Vote
    elsif user.role.name == "okregowy"
      #can :create, Vote
      can [:read, :edit ], Constituency do |const|
	      const.try(:user_id) == user
      end
      can :edit, Constituency do |constituency|
        constituency.try(:user_id) == user
      end
      can :edit, Constituency
      can :update, Constituency do |constituency|
        constituency.try(:user_id) == user
      end
      #can [:create, :read, :edit, :update], Committee
      can [:create, :read, :edit, :update], Vote
    end
  end
end
