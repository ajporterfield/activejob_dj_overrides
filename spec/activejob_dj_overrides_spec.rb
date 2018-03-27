require 'spec_helper'

describe ActivejobDjOverrides do
  let(:job_wrapper) { ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper.new(job.serialize) }
  let(:current_time) { Time.now }
  let(:attempts) { 1 }

  context 'when the job contains DJ override methods' do
    let(:job) { OverridesJob.new }

    it 'exposes those methods to DJ through the JobWrapper class' do
      expect(job_wrapper.max_attempts).to eq job.max_attempts
      expect(job_wrapper.destroy_failed_jobs?).to eq job.destroy_failed_jobs?
      expect(job_wrapper.max_run_time).to eq job.max_run_time
      expect(job_wrapper.reschedule_at(current_time, attempts)).to eq job.reschedule_at(current_time, attempts)
    end
  end

  context "when the job doesn't contain DJ override methods" do
    let(:job) { NoOverridesJob.new }

    it 'returns DJ defaults' do
      expect(job_wrapper.max_attempts).to eq Delayed::Worker.max_attempts
      expect(job_wrapper.destroy_failed_jobs?).to eq Delayed::Worker.destroy_failed_jobs
      expect(job_wrapper.max_run_time).to eq Delayed::Worker.max_run_time
      expect(job_wrapper.reschedule_at(current_time, attempts)).to eq (current_time + (attempts**4) + 5)
    end
  end
end
