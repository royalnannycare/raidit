require 'repository'
require 'models/permission'

class CheckUserPermissions

  attr_reader :current_user, :current_guild

  def initialize(params = {})
    @current_user = params[:current_user]
    @current_guild = params[:current_guild]
  end

  # Should this be #run to be consistent with other interactors?
  def allowed?(permission)
    user_permissions = Repository.for(Permission).
      find_by_user_and_guild(@current_user, @current_guild)
    user_permissions ? user_permissions.allows?(permission) : false
  end
end