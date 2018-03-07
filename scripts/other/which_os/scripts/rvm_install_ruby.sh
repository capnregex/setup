#!/usr/bin/sudo -u vagrant sh -eux
rvm install ruby
gem install bundler
rvm install 2.5.0
gem install bundler
rvm cleanup all
