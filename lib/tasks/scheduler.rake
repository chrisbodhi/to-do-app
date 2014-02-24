desc "This task is called by the Heroku scheduler add-on:"

task :send_email => :environment do
  puts "Sending email..."
  User.all.each do |user|
    ReminderMailer.reminder(user).deliver
  end
  puts "done."
end
