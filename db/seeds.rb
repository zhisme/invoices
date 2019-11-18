# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

user = User.create(login: 'test_user', auth_token: SecureRandom.hex(64))
['Company A', 'Company B', 'Company C'].each.with_index do |comp_name, _idx|
  comp = Company.create(user: user, title: comp_name)
  location_title = ->(comp_id, idx) { "Location #{comp_id}.#{idx}" }

  3.downto(i) do
    Location.create(company: comp, title: location_title.call(comp.id, i))
  end
end

Company.last.update(settings: {billing_process: :per_company})

puts 'Seeded succesfully.'
