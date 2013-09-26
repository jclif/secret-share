module UsersHelper

  def get_friendable_users
    users = User.all
    users.reject do |user|
      (user == current_user) ||
      (current_user.victims.include?(user))
    end
  end
end
