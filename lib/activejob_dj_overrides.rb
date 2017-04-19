require "activejob_dj_overrides/version"

module ActivejobDjOverrides
  extend ActiveSupport::Concern

  def max_attempts
    job.max_attempts rescue Delayed::Worker.max_attempts
  end

  def destroy_failed_jobs?
    job.destroy_failed_jobs? rescue Delayed::Worker.destroy_failed_jobs
  end

  def max_run_time
    job.max_run_time rescue Delayed::Worker.max_run_time
  end

  def reschedule_at(current_time, attempts)
    job.reschedule_at(current_time, attempts) rescue (current_time + (attempts**4) + 5)
  end

  def failure
    job.failure(job) rescue nil
  end

  private
    def job
      @job ||= ActiveJob::Base.deserialize(job_data)
    end
end

ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper.send(:include, ActivejobDjOverrides)
