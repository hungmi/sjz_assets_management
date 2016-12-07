# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'sjz_assets_management'
set :repo_url, 'git@github.com:hungmi/sjz_assets_management.git'
set :branch, :master

# rbenv 的設定
set :rbenv_type, :user 
set :rbenv_ruby, "2.3.3"
# set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all 

set :deploy_to, '/home/deploy/sjz_assets_management'

set :log_level, :debug

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# Default value for :pty is false
set :pty, true

# Default value for keep_releases is 5
set :keep_releases, 5

# Puma:
set :puma_conf, "/home/deploy/sjz_assets_management/shared/config/puma.rb"
 
namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end
end