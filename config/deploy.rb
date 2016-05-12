require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :domain, 'lockit.hermanzdosilovic.me'
set :user, 'titus'
set :deploy_to, '/var/www/lockit'
set :repository, 'git@github.com:hermanzdosilovic/lockitorloseit-web.git'
set :branch, 'master'
set :forward_agent, true
set :rails_env, 'production'

set :shared_paths, %w{.env log}

task setup: :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end

task :environment do
  invoke :'rbenv:load'
end
