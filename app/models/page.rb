class Page < ApplicationRecord
    belongs_to :subject , { :optional => false }#, {:optional => true} for creating a page without a parent but be careful!
    has_and_belongs_to_many :admin_users
    has_many :sections

    scope :visible, lambda {where(:visible => true)}
    scope :invisible, lambda {where(:visible => false)}
    scope :sorted, lambda {order(:position => :ASC)}
    scope :newest_first, lambda {order("created_at DESC")}
end
