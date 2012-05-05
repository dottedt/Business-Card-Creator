namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 last_name: "User",
                 phone_number: "312-123-1234",
                 twitter: "@hereyougo",
                 email: "example@railstutorial.org"
                 )
    99.times do |n|
      first_name  = Forgery::Name.first_name
      last_name = Forgery::Name.last_name
      email = Forgery::Email.address

      phone_number = Forgery::Address.phone
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   twitter: "@#{last_name}",
                   phone_number: phone_number

                   )


    end
  end
end