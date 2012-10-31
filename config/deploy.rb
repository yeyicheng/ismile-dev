set :application, "iSmile"
set :repository,  "git@github.com:yeyicheng/ismile.git"
default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "ye.yicheng123@gmail.com"  # The server's user for deploys
set :scm_passphrase, "yyc_910310"  # The deploy user's password
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "ismile0719"
set :password, "V!ctor0719"
set :deploy_to, '/try/'

role :web, "118.139.174.1"                          # Your HTTP server, Apache/etc
role :app, "118.139.174.1"                          # This may be the same as your `Web` server
role :db,  "182.50.133.152", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

ssh_options[:keys] = %w(~/.ssh/hello) 


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end