# ActivejobDjOverrides

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/activejob_dj_overrides`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

Delayed Job allows you to override various settings on a per-job basis (see https://github.com/collectiveidea/delayed_job#custom-jobs).  I really missed this feature when I switched to using Active Job.  So, I wrote this gem, which allows max_attempts, destroy_failed_jobs?, and max_run_time to be defined within your (active) job - just like Delayed Job.

```ruby
class YourJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def max_attempts
    2
  end

  def destroy_failed_jobs?
    false
  end

  def max_run_time
    5
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
