namespace :dev do
  desc "Configura o ambiemte de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando Contatos..."

    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end

    puts "Contatos Cadastrados com Sucesso..."
  end

end
