class Event < ActiveRecord::Base
  attr_accessible :title
  serialize :schedule, IceCube::Schedule
  before_save :update_auto_attributes

  # event factory method
#  def self.build_event(interval, params)
#    if interval == 0 # one time
#      # one time set up
#      puts "================ One Off =================="
#    else if interval == 1 # daily
#      puts "================= Daily ==================="
#    else if intervale == 2 # weekly
#      puts "================ Weekly ==================="
#    else
#      puts "=========== interval failure =============="
#      raise 'failure interval'
#    end
  def self.build_event(params)

    t = Time.now.change(:usec => 0)
    ev = Event.new(params)
    ev.schedule = IceCube::Schedule.new(t + 2.minutes)
    ev.schedule.add_recurrence_rule IceCube::Rule.hourly(1)
    ev
  end

  def calc_next
      self.schedule.next_occurrence
  end

  private

  def update_auto_attributes
    puts "=========> Checking @next_instance <========="
    next_occ = self.schedule.next_occurrence.change(:usec => 0)
    puts "C: #{next_occ} #{next_occ.usec} A: #{self.next_instance} #{self.next_instance}"
    self.next_instance = next_occ unless !next_occ
    puts "=========> @next_instance Now #{self.next_instance } <========="
  end
end
