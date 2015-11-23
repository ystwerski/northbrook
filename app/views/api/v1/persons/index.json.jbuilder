json.all_persons_info @persons do |person|
  json.person_id person.id
  json.first_name person.first_name
  json.last_name person.last_name
  json.birthday person.birthday
  json.email person.email
  json.password person.password
  json.phone person.phone
  json.address person.address
  json.city person.city
  json.state person.state
  json.past_id person.past_id
  json.notes person.notes
end