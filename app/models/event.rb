class Event < ActiveRecord::Base
  attr_accessible :title
  serialize :schedule, IceCube::Schedule
  before_save :update_auto_attributes

# event factory method
  def self.build_event(params)

    t = Time.now.change(:usec => 0)  # Removes micro seconds from time
    ev = Event.new(params)
    ev.schedule = IceCube::Schedule.new(t + 2.minutes)
    ev.schedule.add_recurrence_rule IceCube::Rule.hourly(1)
    ev
  end

  # this is here for test purposes since I want
  # to display schedule's notion of next occurence
  def calc_next
      self.schedule.next_occurrence
  end

  private

  def update_auto_attributes
    puts "=========> Checking @next_instance <========="
#    next_occ = self.schedule.next_occurrence.change(:usec => 0)
    next_occ = self.schedule.next_occurrence
    puts "C: #{next_occ} #{next_occ.usec} A: #{self.next_instance} #{self.next_instance}"
    self.next_instance = next_occ unless !next_occ
    puts "=========> @next_instance Now #{self.next_instance } <========="
  end
end
