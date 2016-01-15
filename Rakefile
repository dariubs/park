lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'park/version'

task :buildgem do
	sh("gem build park.gemspec")
end

task :installgem do
	sh("gem install park-" + Park::VERSION + ".gem")
end

task :default =>[:buildgem, :installgem]
