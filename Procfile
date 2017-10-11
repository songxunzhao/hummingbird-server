web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq
release: bundle exec rake librato:deploy:start[$HEROKU_RELEASE_VERSION, $HEROKU_SLUG_DESCRIPTION] db:migrate librato:deploy:end
