class NotifyInactiveUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users_2_day = User.where('(last_sign_in_at + INTERVAL \'2 day\') < now()')
    UserMailer.notify_inactive_users(users_2_day, 2)

    users_3_day = User.where('(last_sign_in_at + INTERVAL \'3 day\') < now()')
    UserMailer.notify_inactive_users(users_3_day, 3)

    users_5_day = User.where('(last_sign_in_at + INTERVAL \'5 day\') < now()')
    UserMailer.notify_inactive_users(users_5_day, 5)
  end
end
