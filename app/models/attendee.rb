# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  rsvp       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
class Attendee < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:event, { :required => true, :class_name => "Event", :foreign_key => "event_id" })

  validates(:user_id, { :presence => true })

  validates(:event_id, { :presence => true })

  

end
