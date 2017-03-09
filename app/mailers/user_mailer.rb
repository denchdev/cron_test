class UserMailer < ApplicationMailer
  default from: 'company@example.com'

  def notify_inactive_users(users, days)
    @days = days
    users.each do |user|
      mail(to: user.email, subject: 'Go to the site')
    end
  end

  def rating_80_users(users)
    users.each do |user|
      mail(to: user.email, subject: 'You are the best customer')
    end
  end

  def top_rated_users(top_users)
    @top_users = top_users
    User.all.each do |user|
      mail(to: user.email, subject: 'Rating')
    end
  end
end
