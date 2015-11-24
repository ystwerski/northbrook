# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# parshas = ["תישארב", "חנ", "ךל-ךל", "אריו", "הרש ייח", ]

seforim = ["בראשית", "שמות", "ויקרא", "במדבר", "דברים"]

parshas = ["בראשית", "נח", "לך-לך", "וירא", "חיי שרה", "תולדות", "ויצא", "וישלח", "וישב", "מקץ", "ויגש", "ויחי", "שמות", "וארא", "בא", "בשלח", "יתרו", "משפטים", "תרומה", "תצוה", "כי-תשא", "ויקהל", "פקודי", "ויקרא", "צו", "שמיני", "תזריע", "מצורע", "אחרי-מות", "קדושים", "אמור", "בהר", "בחקתי", "במדבר", "נשא", "בהעלתך", "שלח", "קרח", "חקת", "בלק", "פינחס", "מטות", "מסעי", "דברים", "ואתחנן", "עקב", "ראה", "שופטים", "כי-תצא", "כי-תבוא", "נצבים", "וילך", "האזינו"]

seforim.each do |sefer|
  Sefer.create({:name => sefer})
end

index = 0

until parshas[index] == "שמות"
  Parsha.create({
  	:name => parshas[index],
  	:sefer_id => 1
  })
  index += 1
end

until parshas[index] == "ויקרא"
  Parsha.create({
  	:name => parshas[index],
  	:sefer_id => 2
  })
  index += 1
end

until parshas[index] == "ויקרא"
  Parsha.create({
  	:name => parshas[index],
  	:sefer_id => 2
  })
  index += 1
end

until parshas[index] == "ויקרא"
  Parsha.create({
  	:name => parshas[index],
  	:sefer_id => 2
  })
  index += 1
end

until parshas[index] == "ויקרא"
  Parsha.create({
  	:name => parshas[index],
  	:sefer_id => 2
  })
  index += 1
end