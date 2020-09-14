# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do |i|
    puts "cadastrando sodas..."
Soda.create!([
    {brand: 'FANTA',        category: 'PET',     flavor: 'LARANJA',           capacity: 600,  price: 4.55, quantiti: 10},
    {brand: 'FANTA',        category: 'LATA',    flavor: 'UVA',               capacity: 250,  price: 2.80, quantiti: 25},
    {brand: 'FANTA',        category: 'GARRAFA', flavor: 'MARACUJA',          capacity: 1000, price: 5.69, quantiti: 30},
    {brand: 'COCA-COLA',    category: 'PET',     flavor: 'COLA',              capacity: 250,  price: 3.40, quantiti: 35},
    {brand: 'COCA-COLA',    category: 'PET',     flavor: 'COLA E LIMÃO',      capacity: 600,  price: 5.40, quantiti: 35},
    {brand: 'COCA-COLA',    category: 'LATA',    flavor: 'COLA FORTE',        capacity: 1000, price: 8.50, quantiti: 20},
    {brand: 'PEPSI',        category: 'LATA',    flavor: 'COLA',              capacity: 250,  price: 3.80, quantiti: 25},
    {brand: 'PEPSI',        category: 'LATA',    flavor: 'LIMÃO',             capacity: 600,  price: 4.95, quantiti: 25},
    {brand: 'PEPSI',        category: 'GARRAFA', flavor: 'MARACUJA',          capacity: 1000, price: 7.40, quantiti: 10},
    {brand: 'GUARANÁ',      category: 'GARRAFA', flavor: 'GUARANÁ',           capacity: 1000, price: 7.40, quantiti: 15},
    {brand: 'GUARANÁ',      category: 'GARRAFA', flavor: 'GUARANÁ E LIMÃO',   capacity: 600,  price: 5.55, quantiti: 5},
    {brand: 'GUARANÁ',      category: 'GARRAFA', flavor: 'PURO GUARANÁ',      capacity: 600,  price: 5.55, quantiti: 80},
    {brand: 'SCHWEPPES',    category: 'PET',     flavor: 'LIMÃO',             capacity: 1000, price: 7.65, quantiti: 40},
    {brand: 'SCHWEPPES',    category: 'LATA',    flavor: 'ABACAXI',           capacity: 250,  price: 4.00, quantiti: 35},
    {brand: 'SCHWEPPES',    category: 'LATA',    flavor: 'CITRUS',            capacity: 250,  price: 4.00, quantiti: 10},
    {brand: 'SÃO GERALDO',  category: 'PET',     flavor: 'CAJUINA',           capacity: 600,  price: 5.50, quantiti: 10},
    {brand: 'SÃO GERALDO',  category: 'GARRAFA', flavor: 'CAJUINA E LIMÃO',   capacity: 1000, price: 7.30, quantiti: 25},
    {brand: 'SÃO GERALDO',  category: 'GARRAFA', flavor: 'CAJUINA ARTESANAL', capacity: 1000, price: 7.20, quantiti: 50}
    
])
    puts "cadastrados!"
end

1.times do |i|
    puts "cadastrando usuários..."
User.create!([
    {email: 'refri@unilab.com.br', password: 'naUniLab'}
])
    puts "cadastrados!"
end