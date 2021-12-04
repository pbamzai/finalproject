# == Schema Information
#
# Table name: group_events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  group_id   :integer
#
class GroupEvent < ApplicationRecord
  belongs_to(:event, { :required => true, :class_name => "Event", :foreign_key => "event_id" })

  belongs_to(:group, { :required => true, :class_name => "Group", :foreign_key => "group_id" })

  validates(:group_id, { :presence => true })

  validates(:event_id, { :presence => true })

end
