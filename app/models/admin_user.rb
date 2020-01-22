class AdminUser < ApplicationRecord
    attr_accessor :first_name
    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits
    # or the longer version
    # def first_name
    #     @first_name
    # end
    # def first_name=(value)
    #     @first_name = value
    # end

end


# This would easily substitute that and you will do less work in future

# class AdminUser < ActiveRecord::Base 
# end
# admin = AdminUser.new
# admin.first_name = "Naz"
# admin.first_name >> "Naz"