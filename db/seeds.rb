@user = User.create(email: "test@test.com", 
                    password: "asdfasdf", 
                    password_confirmation: "asdfasdf", 
                    first_name: "Jon", 
                    last_name: "Snow",
                    phone: "55555555555")
puts "1 User created"

AdminUser.create(email: "Marineepo@gmail.com", 
                 password: "Buckeyefan1987$", 
                 password_confirmation: "Buckeyefan1987$", 
                 first_name: "Benjamin", 
                 last_name: "Nicklaus",
                 phone: "12393510443")

puts "1 Admin created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 posts have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: Date.today)
end

puts "100 audit logs have been created"
