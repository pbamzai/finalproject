# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  approved   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
class UserGroup < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:group, { :required => true, :class_name => "Group", :foreign_key => "group_id" })

  validates(:user_id, { :presence => true })

  validates(:group_id, { :presence => true })

  validates(:approved, { :presence => true })

end
