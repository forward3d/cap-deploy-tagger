namespace :deploy do
  
  desc "Tag deployed release"
  task :tag do
    if ENV['SKIP_DEPLOY_TAGGING'] || fetch(:skip_deploy_tagging, false)
      info "Skipped deploy tagging"
    else
      tag = CapDeployTagger::Helper.tag(fetch(:deploy_tag, "deployed"), fetch(:stage))
      info "Tagged #{CapDeployTagger::Helper.latest_revision} with #{tag}"
    end
  end
  
  after :cleanup, 'deploy:tag'
  
end