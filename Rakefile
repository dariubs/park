lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'park/version'

require "bundler/setup"

require 'rake/testtask'

desc "Build local gem"
task :buildgem do
	sh("gem build park.gemspec")
end

desc "Install local gem"
task :installgem do
	sh("gem install park-" + Park::VERSION + ".gem")
end

desc "Publish gem file"
task :publishgem do
	sh("gem push park" + + Park::VERSION + ".gem")
end

desc "Test codes"
Rake.TestTask.new(:test) do |t|
	t.libs << "test"
	t.test_files = FileList["test/**/*.rb"]
end

task :default =>[:buildgem, :installgem]
