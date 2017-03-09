class Rating80UsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.find_by_sql('select email, avg(rate) from users u join reviews r on u.id=r.user_id  group by u.id having avg(rate) > 80')
    UserMailer.rating_80_users(users)
  end
end
