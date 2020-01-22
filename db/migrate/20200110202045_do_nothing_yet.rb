class DoNothingYet < ActiveRecord::Migration[6.0]
  def up
    puts "***doing nothing***"
  end
  # def change
  # this is a short version of the up & down methods
  # for some cases ruby can't generate down method
  # then you should write the explicitly yourself
  # end
  def down
  end

end
