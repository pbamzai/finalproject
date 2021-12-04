# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:groups, { :class_name => "Group", :foreign_key => "group_creator_id", :dependent => :destroy })

  has_many(:attendees, { :class_name => "Attendee", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:user_groups, { :class_name => "UserGroup", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:hosted_events, { :class_name => "Event", :foreign_key => "host_id", :dependent => :destroy })

  has_many(:events, { :through => :attendees, :source => :event })

  has_many(:membership, { :through => :user_groups, :source => :group })

  has_many(:group_admin_events, { :through => :groups, :source => :events })

  validates(:first_name, { :presence => true })


end
