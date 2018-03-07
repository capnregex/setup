#!/usr/bin/env rake

SRC_REGEX = %r(src/(\w*)\.json)
src_files = FileList['src/*.json']
names = []
src_files.each do |src_file|
  m = SRC_REGEX.match(src_file)
  name = m[1]
  names.push name
  box_file = "#{name}.virtualbox.box"
  file box_file => src_file do
    rm_rf "out/#{name}"
    sh "packer build -var 'name=#{name}' #{src_file}"
  end
  namespace :build do
    desc "Build the #{name} box"
    task name => [box_file]
  end
  namespace :uninstall do
    desc "uninstall the #{name} box"
    task name do
      sh "vagrant box remove #{name} -f || true"
    end
  end
  namespace :install do
    desc "install the #{name} box"
    task name => box_file do
      sh "vagrant box add --force --name=#{name} #{box_file}"
    end
  end
  namespace :test do
    desc "test the #{name} box"
    task name => "install:#{name}" do
      mkdir_p name
      cd name
      sh "vagrant up"
      sh "vagrant ssh"
      sh "vagrant destroy -f"
    end
  end
  namespace :clean do
    desc "remove the #{name} box"
    task name do
      rm_rf FileList["#{name}.virtualbox.box"]
      rm_rf FileList["out/#{name}"]
    end
  end
  task build: "build:#{name}"
  task install: "install:#{name}"
  task uninstall: "uninstall:#{name}"
end

desc "install all the boxes"
task :install

desc "uninstall all the boxes"
task :uninstall

#  sh "vagrant box add --force --name=test/minor ./minor.virtualbox.box"

file 'major.virtualbox.box' => 'minor.virtualbox.box'
file 'minor.virtualbox.box' => 'minimus.virtualbox.box'

#  sh "vagrant box add --force --name=test/minor ./minor.virtualbox.box"
#  sh "cd major; vagrant destroy -f; vagrant up"

task default: :major

task :clean do
  rm_rf FileList['*.box']
  rm_rf FileList['out/*']
end

