# Per-job Overrides for Active Job's DelayedJobAdapter

Delayed Job allows you to override various settings on a per-job basis (see https://github.com/collectiveidea/delayed_job#custom-jobs).  I really missed this feature when I switched to using Active Job, so I wrote this gem, which allows max_attempts, destroy_failed_jobs?, and max_run_time to be defined within your (active) job - just like Delayed Job.  See Usage section below for an example.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activejob_dj_overrides'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activejob_dj_overrides

## Usage

```ruby
class YourJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    # sleep 1.minute # tests max_run_time
    # nil > 0 # tests max_attempts and destroy_failed_jobs?
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
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/activejob_dj_overrides/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
