class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def info_to_all_users_about_new_exchange
    User.all.each do |user|
      mail(to: user.email, subject: 'New exchange').deliver!
    end
  end
end
