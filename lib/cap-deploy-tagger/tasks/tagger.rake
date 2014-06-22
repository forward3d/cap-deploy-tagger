namespace :deploy do
  
  desc "Tag deployed release"
  task :tag do
    run_locally do
      if ENV['SKIP_DEPLOY_TAGGING'] || fetch(:skip_deploy_tagging, false)
        info "[cap-deploy-tagger] Skipped deploy tagging"
      else
        tag_name = "#{fetch(:deploy_tag, "deployed")}_#{fetch(:stage)}"
        latest_revision = fetch(:current_revision)
        strategy.git "tag -f #{tag_name} #{latest_revision}"
        strategy.git "push -f --tags"
        info "[cap-deploy-tagger] Tagged #{latest_revision} with #{tag_name}"
      end
    end
  end
  
  after :cleanup, 'deploy:tag'
  
end
