# cap-deploy-tagger

## What does this do?

This gem allows you to automatically tag Git commits when you deploy with Capistrano.

## Compatibility

This gem will only work with Capistrano 3.x. For a similar gem that works with
Capistrano 2.x, use [capistrano-deploy-tagger](https://github.com/forward/capistrano-deploy-tagger).

## Why would you tag on deploy?

One reason you would want to tag on deploy is to keep track of what commit is currently 
in production (or in staging or some other stage). You may also want to track this 
if you're using some kind of scaling process to deploy code - this will allow you to
deploy the same release that other servers are currently using.

## Installation

Add this line to your application's Gemfile:

    gem 'cap-deploy-tagger'

Since deploy only happens in development, you may want to wrap it in a Bundler group
so that it's not deployed to your production servers:

    group :development do
      gem 'cap-deploy-tagger'
    end

Now add the gem to your Capistrano `Capfile`:

    require 'cap-deploy-tagger'

## Usage and configuration

### Tag name

When you include the gem into your Capfile, it will tag each deploy you make to each stage.
It will assemble the tag name from the stage name like so: `deployed_stage`. For example,
when deploying to production it will create a tag called `deployed_production`, and when
deploying to staging it will create a tag called `deployed_staging`.

You can change the tag name by setting the Capistrano variable `:deploy_tag`:

    set :deploy_tag, 'in_the_world'

This will create tags like `in_the_world_production`.

### Skipping tagging

You may want to skip tagging in some instances - to do so, either set the Capistrano variable
`:skip_deploy_tagging` to `true`, or set the environment variable SKIP_DEPLOY_TAGGING to `'true'`:

    # From the command line
    SKIP_DEPLOY_TAGGING=true cap production deploy
    
    # Inside your deploy.rb
    set :skip_deploy_tagging, true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
