class OverridesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def max_attempts
    1 # default is 25
  end

  def destroy_failed_jobs?
    false # default is true
  end

  def max_run_time
    5 # default is 4.hours
  end

  def reschedule_at(current_time, attempts)
    current_time + 5.seconds # default is current_time + (attempts**4) + 5
  end
end
