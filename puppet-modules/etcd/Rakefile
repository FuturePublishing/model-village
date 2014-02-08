require 'puppet-lint'

desc "Run lint on manifests"
task :lint do ||
  PuppetLint.configuration.send("disable_80chars")
  PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
  linter = PuppetLint.new
  files = File.join("**", "*.pp")
  Dir.glob(files).each do |puppet_file|
    puts "Evaluating #{puppet_file}"
    linter.file = puppet_file
    linter.run
  end
end

desc "Validate puppet sysntax"
task :validate do ||
  files = File.join("**", "*.pp")
  Dir.glob(files).each do |puppet_file|
    sh %{puppet parser validate #{puppet_file}}
  end
end

desc "Generate module documentation"
task :doc do ||
  work_dir = File.dirname(__FILE__)
  sh %{puppet doc \
    --outputdir #{work_dir}/doc \
    --mode rdoc}
end

desc "Package module for upload"
task :package do ||
  puts "packaging now"
end

desc "Run all tasks."
task :all => [:validate, :lint, :doc, :package ] do
    puts "Complete."
 end

