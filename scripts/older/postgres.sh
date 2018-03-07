#!/bin/sh -eux

sudo apt-get install -y --no-install-recommends \
  postgresql postgresql-contrib libpq-dev ruby-pg

sudo -u postgres createuser --superuser vagrant

cat <<SQL | sudo -u postgres psql
\password vagrant
vagrant
vagrant
SQL

sudo -u postgres createdb vagrant

