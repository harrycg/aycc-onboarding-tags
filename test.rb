

require 'nationbuilder'

client = NationBuilder::Client.new('harrycossar', ENV['NATIONBUILDER_APIKEY'], retries: 8)

puts "starting app"

ob_step_1_tag = {
  tag: "ONBOARDING%20STEP%201"
  }
  
ob_step_1_tag_1 = client.call(:people_tags, :people, ob_step_1_tag)
ob_step_1_tag_2 = NationBuilder::Paginator.new(client, ob_step_1_tag_1)


tagged_people = []
  tagged_people += ob_step_1_tag_2.body['results']
while ob_step_1_tag_2.next?
  ob_step_1_tag_2 = ob_step_1_tag_2.next
  tagged_people += ob_step_1_tag_2.body['results']
 
end  

tagged_people.each do |tagged_person|
  tagged_id = tagged_person['id']
yesterday_1 =  DateTime.now - 1
  
filter = {
  person_id: "#{tagged_id}",
  status: "no_answer"
  }

response = client.call(:contacts, :index, filter)

page = NationBuilder::Paginator.new(client, response)

people = []
  people += page.body['results']

 while page.next?
  page = page.next
  break unless Date.parse(people.last['created_at']) >= yesterday_1
  people += page.body['results']
 
 
end  

people.each do |person|
  if Date.parse(person['created_at']) >= yesterday_1  
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['person_id']
  status=person['status']
contactedon=person['created_at']
puts "#{first_name} #{id} #{status} on #{contactedon}" 
  
   
    params = {
 id: "#{id}",
  tagging: {
    tag: "ONBOARDING STEP 3"
  }
  
}

    client.call(:people, :tag_person , params)
    
  else  
  id = person['person_id']
 contactedon=person['created_at']
  status=person['status']

puts "too late #{first_name} #{id} #{status} on #{contactedon}" 
    
end

end

end

puts "Onboarding step 2 done"

puts "finding peeps step 1"

filter = {
  tag: "ONBOARDING%20STEP%201"
  }
  
info = client.call(:people_tags, :people, filter)
info_2 = NationBuilder::Paginator.new(client, info)


tagged_people = []
  tagged_people += info_2.body['results']
while info_2.next?
  info_2 = info_2.next
  tagged_people += info_2.body['results']
 
end  

tagged_people.each do |tagged_person|
  tagged_id = tagged_person['id']
yesterday_1 =  DateTime.now - 1
  
filter = {
  person_id: "#{tagged_id}",
  status: "no_answer"
  }

response = client.call(:contacts, :index, filter)

page = NationBuilder::Paginator.new(client, response)

people = []
  people += page.body['results']

 while page.next?
  page = page.next
  break unless Date.parse(people.last['created_at']) >= yesterday_1
  people += page.body['results']
 
 
end  

people.each do |person|
  if Date.parse(person['created_at']) >= yesterday_1  
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['person_id']
  status=person['status']
contactedon=person['created_at']
puts "#{first_name} #{id} #{status} on #{contactedon}" 
  
   
    params = {
 id: "#{id}",
  tagging: {
    tag: "ONBOARDING STEP 2"
  }
  
}

    client.call(:people, :tag_person , params)
    
  else  
  id = person['person_id']
 contactedon=person['created_at']
  status=person['status']

puts "too late #{first_name} #{id} #{status} on #{contactedon}" 
    
end

end

end

puts "Onboarding step 1 done"

puts "finding peeps step 1"

filter = {
  tag: "another"
  }
  
info = client.call(:people_tags, :people, filter)
info_2 = NationBuilder::Paginator.new(client, info)


tagged_people = []
  tagged_people += info_2.body['results']
while info_2.next?
  info_2 = info_2.next
  tagged_people += info_2.body['results']
 
end  

tagged_people.each do |tagged_person|
  tagged_id = tagged_person['id']
yesterday_1 =  DateTime.now - 1
  
filter = {
  person_id: "#{tagged_id}",
  status: "no_answer"
  }

response = client.call(:contacts, :index, filter)

page = NationBuilder::Paginator.new(client, response)

people = []
  people += page.body['results']

 while page.next?
  page = page.next
  break unless Date.parse(people.last['created_at']) >= yesterday_1
  people += page.body['results']
 
 
end  

people.each do |person|
  if Date.parse(person['created_at']) >= yesterday_1  
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['person_id']
  status=person['status']
contactedon=person['created_at']
puts "#{first_name} #{id} #{status} on #{contactedon}" 
  
   
    params = {
 id: "#{id}",
  tagging: {
    tag: "ONBOARDING STEP 1"
  }
  
}

    client.call(:people, :tag_person , params)
    
  else  
  id = person['person_id']
 contactedon=person['created_at']
  status=person['status']

puts "too late #{first_name} #{id} #{status} on #{contactedon}" 
    
end

end

end

puts "Onboarding want to vols done"


