# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  date        :date
#  description :string
#  location    :string
#  name        :string
#  start_time  :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  host_id     :integer
#
class Event < ApplicationRecord
  belongs_to(:host, { :required => true, :class_name => "User", :foreign_key => "host_id" })

  has_many(:attendees, { :class_name => "Attendee", :foreign_key => "event_id", :dependent => :destroy })

  has_many(:group_events, { :class_name => "GroupEvent", :foreign_key => "event_id", :dependent => :destroy })

  has_many(:users, { :through => :attendees, :source => :user })

  has_many(:groups, { :through => :group_events, :source => :group })

  has_many(:group_creators, { :through => :groups, :source => :group_creator })

  validates(:name, { :presence => true })

  validates(:host_id, { :presence => true })

  validates(:date, { :presence => true })

  

end
