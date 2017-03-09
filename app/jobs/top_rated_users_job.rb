class TopRatedUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    best_users = User.find_by_sql('select email, sum(rate) as count from users u join reviews r on u.id=r.user_id
                               where r.created_at>(now() - interval \'7 days\')
                               group by u.id
                               order by count desc
                               limit 10')

    UserMailer.rating_80_users(best_users)

  end
end
