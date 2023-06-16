require "rexml/document"
require "date"

puts "В этом сундуке хранятся ваши желания."
puts "Чего бы вы хотели?"

wish_user = STDIN.gets.chomp

puts "До какого числа вы хотите осуществить это желание?"
puts "(укажите дату в формате ДД.ММ.ГГГГ)"

date_imput = STDIN.gets.chomp
wish_user_deadline = Date.parse(date_imput)

current_path = File.dirname(__FILE__)
file_name = current_path + "/wish.xml"

file = File.new(file_name, "r:UTF-8")

doc = REXML::Document.new(file)

file.close

wishes = doc.elements.find("wishes").first

wish = wishes.add_element "wish", {
	'date' => wish_user_deadline.strftime('%d.%m.%Y')
}

wish.text = wish_user

file = File.new(file_name, 'w:UTF-8')
doc.write(file, 2)
file.close

puts "Ваше желание в сундуке"