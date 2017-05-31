namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the overtime managment dashboard to request overtime or confirm your hours for last week: https://ben-overtimeapp.herokuapp.com"
  	# 4. Send a message that has instructions and a link to log time
  	  employees.each do |employee|
  	    AuditLog.create!(user_id: employee.id)
  		  SmsTool.send_sms(number: employee.phone, message: notification_message)
  	  end
    end
  end
  
  desc "Sends mail notification to managers (admin users) each to to inform of pending overtime request"
  task manager_email: :environment do
    ## 1. iterate over the list of pending overtime requests
    # 2. check if there are request
    # 2. iterate over the list admin users/managers
    # 4. send the email to each admin
    submitted_posts = Post.submitted 
    admin_users = AdminUser.all
    
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end