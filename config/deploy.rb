# config valid only for current version of Capistrano
lock '3.3.5'

set :application, "RIAuditor"
set :repo_url,  "git@github.com:luctus/riauditor.git"
set :deploy_to, "/var/www/vhosts/riauditor"
set :scm, :git
set :branch, "master"
set :user, "root"
#set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 22 }
set :keep_releases, 3

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.0p0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

#default_run_options[:pty] = true

server "riauditor", roles: %w(app web db), :primary => true


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
