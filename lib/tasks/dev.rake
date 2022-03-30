namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    kinds = %w(Amigo Comercial Conhecido)
    
    puts "Cadastrando os tipos de contato..."
      kinds.each do |kind|
      Kind.create!(
      description: kind
    )
    puts "Tipos de contato cadastrados com sucesso!"
    
    puts "Cadastrando os contatos ..."
  
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 40.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
        )
      end
      puts "Contatos cadastrados com sucesso"
    end
  end
end
