set :application, "iSmile"
set :repository,  "git@github.com:yeyicheng/ismile.git"
default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "ye.yicheng123@gmail.com"  # The server's user for deploys
set :scm_passphrase, "yyc_910310"  # The deploy user's password
set :branch, "master"
set :deploy_via, :remote_cache

role :web, "www.ismile-consulting.com"                          # Your HTTP server, Apache/etc
role :app, "www.ismile-consulting.com"                          # This may be the same as your `Web` server
role :db,  "ismile1.db.10014354.hostedresource.com", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

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