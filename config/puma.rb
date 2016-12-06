# Change to match your CPU core count
workers 4

# Min and Max threads per worker
threads 1, 8

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
# port        ENV.fetch("PORT") { 3000 }

app_dir = File.expand_path("../..", __FILE__)
# shared_dir = "#{app_dir}/shared"

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "development" }

# Set up socket location
# bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
# stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
# pidfile "#{shared_dir}/pids/puma.pid"
# state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
