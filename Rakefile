# Arg
require 'yaml'

hieranodes = "/etc/puppet/hieradata/nodes"


desc "Instantiate and start a node called 'nodename'"
task :start_node, :nodename do |t, args|
  pcert = "/var/lib/puppet/ssl/ca/signed/#{args.nodename}.pem"
  system "puppet cert clean #{args.nodename}" if File.exist?(pcert)
  system "lxc-create -n #{args.nodename} -t future"
  system "lxc-start -n #{args.nodename} -d"
end

desc "Stop and delete node 'nodename'"
task :del_node, :nodename do |t, args|
  system "lxc-stop -n #{args.nodename}"
  system "lxc-destroy -n #{args.nodename}"
  system "puppet cert clean #{args.nodename}"
end

desc "Build nodes from list 'nodelist'"
task :make_nodes, :nodelist do |t,args|
  nodes = YAML.load_file(args.nodelist)
  nodes.each do |node,pattern|
    FileUtils.ln_s("#{hieranodes}/#{pattern}.yaml","#{hieranodes}/#{node}.yaml")
    pcert = "/var/lib/puppet/ssl/ca/signed/#{node}.pem"
    system "puppet cert clean #{node}" if File.exist?(pcert)
    system "lxc-create -n #{node} -t future"
    system "lxc-start -n #{node} -d"
  end
end

desc "Tear down nodes in 'nodelist'"
task :remove_nodes, :nodelist do |t,args|
  nodes = YAML.load_file(args.nodelist)
  nodes.each do |node,pattern|
    FileUtils.rm("#{hieranodes}/#{node}.yaml")
    system "lxc-stop -n #{node}"
    system "lxc-destroy -n #{node}"
    system "puppet cert clean #{node}"
  end
end
