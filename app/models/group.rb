# == Schema Information
#
# Table name: groups
#
#  id               :integer          not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  group_creator_id :integer
#
class Group < ApplicationRecord
  belongs_to(:group_creator, { :required => true, :class_name => "User", :foreign_key => "group_creator_id" })

  has_many(:user_groups, { :class_name => "UserGroup", :foreign_key => "group_id", :dependent => :destroy })

  has_many(:group_events, { :class_name => "GroupEvent", :foreign_key => "group_id", :dependent => :destroy })

  has_many(:users, { :through => :user_groups, :source => :user })

  has_many(:events, { :through => :group_events, :source => :event })

  validates(:title, { :presence => true })

  validates(:group_creator_id, { :presence => true })

end
