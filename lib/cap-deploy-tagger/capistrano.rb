# Ensure deploy tasks are loaded before we run
require 'capistrano/deploy'

# Load extra tasks into the deploy namespace
load File.expand_path("../tasks/tagger.rake", __FILE__)

module CapDeployTagger
  class Helper

    def self.tag(tag, stage)
      git "tag -f #{tag}_#{stage}"
      git "push -f --tags"
      "#{tag}_#{stage}"
    end

    def self.git(cmd)
      `git #{cmd} 2>&1`.chomp
    end

    def self.latest_revision
      git "rev-parse --short HEAD"
    end

  end
end
