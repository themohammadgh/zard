class Page < ApplicationRecord
    belongs_to :subject , { :optional => false }#, {:optional => true} for creating a page without a parent but be careful!
    has_and_belongs_to_many :admin_users
    has_many :sections

    scope :visible, lambda {where(:visible => true)}
    scope :invisible, lambda {where(:visible => false)}
    scope :sorted, lambda {order(:position => :ASC)}
    scope :newest_first, lambda {order("created_at DESC")}


    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :permalink
    validates_length_of :permalink, :within => 3..255
    # use presence_of with length_of to disallow spaces
    validates_uniqueness_of :permalink
    # for unique values by subject not everywhere use ":scope => :subject_id"
end
