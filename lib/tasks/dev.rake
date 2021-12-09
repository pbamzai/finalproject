desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
require 'faker'

User.destroy_all
5.times do 
  user = User.new
  user.first_name = Faker::Name.first_name 
  user.email = "#{user.first_name}@example.com"
  user.password = "password"
  user.save
end
users = User.all

p "you created #{users.count} users"
p "first user is #{users.first.email}"

# Table name: groups
#
#  title            :string
#  group_creator_id :integer


Group.destroy_all
10.times do 
  group = Group.new
  group.title = Faker::Name.last_name
  group.group_creator_id = User.all.sample.id
  group.save
end
groups = Group.all

# Table name: events
#
#  date        :date
#  description :string
#  location    :string
#  name        :string
#  start_time  :time
#  host_id     :integer
Event.destroy_all
GroupEvent.destroy_all
30.times do 
  event = Event.new
  event.name = Faker::Sports::Football.competition
  event.host_id = users.sample.id
  event.location = Faker::Address.full_address
  event.date = Faker::Date.between(from: 2.days.ago, to: 30.days.from_now)
  event.start_time = Time.now
  event.description = Faker::Lorem.paragraph
  event.save
  group_events = GroupEvent.new
  group_events.event_id = event.id
  group_events.group_id = groups.sample.id
  group_events.save
end
events = Event.all

p "you created #{events.count} events"

# Table name: user_groups
#
#  approved   :boolean
#  group_id   :integer
#  user_id    :integer
UserGroup.destroy_all
5.times do 
  user_group = UserGroup.new
  user_group.group_id = groups.sample.id
  user_group.approved = Faker::Boolean.boolean
  user_group.user_id = users.sample.id
  user_group.save
end
p "created #{UserGroup.all.count} user groups"

# Table name: attendees
#

#  rsvp       :boolean
#  event_id   :integer
#  user_id    :integer

Attendee.destroy_all
50.times do 
  attendees = Attendee.new
  attendees.event_id = events.sample.id
  attendees.user_id = users.sample.id
  attendees.rsvp = Faker::Boolean.boolean
  attendees.save
end
p "created #{Attendee.all.count} attendees"

# Table name: group_events
#
#  event_id   :integer
#  group_id   :integer

# GroupEvent.destroy_all
# 20.times do 
#   group_events = GroupEvent.new
#   group_events.event_id = events.sample.id
#   group_events.group_id = groups.sample.id
#   group_events.save
# end
p "created #{GroupEvent.all.count} group events"







end
