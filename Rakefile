require 'bundler/gem_tasks'
require 'rake/testtask'
require 'json'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList['spec/*_spec.rb', 'spec/mobile-fu/*_spec.rb']
  t.verbose = true
end

desc "Pull in data from Mobile Detect"
task :pull_mobile_detect_data do
  content = File.read('Mobile_Detect.json')
  json    = JSON.parse(content)
  values  = json['uaMatch']['tablets'].each.map { |_, v| v }
  regex   = values.join('|').downcase

  file = 'lib/mobile-fu/tablet.rb'
  more_content = File.read(file)
  more_content.gsub!(/TABLET_USER_AGENTS = \/.*\//, "TABLET_USER_AGENTS = \/#{regex}\/")
  File.open(file, 'w') { |f| f.write more_content }
end

# desc 'Generate documentation for the mobile_fu plugin.'
# Rake::RDocTask.new(:rdoc) do |rdoc|
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title    = 'MobileFu'
#   rdoc.options << '--line-numbers' << '--inline-source'
#   rdoc.rdoc_files.include('README')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end
