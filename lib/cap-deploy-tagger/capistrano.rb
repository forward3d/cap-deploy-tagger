# Ensure deploy tasks are loaded before we run
require 'capistrano/deploy'

# Load extra tasks into the deploy namespace
load File.expand_path("../cap-deploy-tagger/tasks/tagger.rake", __FILE__)

module CapDeployTagger
end
