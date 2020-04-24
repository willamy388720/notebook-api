namespace :dev do
  desc "Configura o ambiemte de desenvolvimento"
  task setup: :environment do

    puts %x(rails db:drop)
    puts %x(rails db:create)
    puts %x(rails db:migrate)

    puts "Cadastrando os tipos de Contato..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de Contato Cadastrados com Sucesso..."

    puts "Cadastrando Contatos..."
    
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contatos Cadastrados com Sucesso..."

    puts "Cadastrando Telefones..."
    
    Contact.all.each do |contact|
      Random.rand(3).times do
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones Cadastrados com Sucesso..."

    puts "Cadastrando os Endereços..."
    
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços Cadastrados com Sucesso..."

  end

end
