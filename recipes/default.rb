unless node[:oh_my_zsh][:users].empty?
  include_recipe 'git'
  include_recipe 'zsh'
end

node[:oh_my_zsh][:users].each do |hash|
  login = hash[:login]
  home  = hash[:home] || (username == 'root' ? '/root' : "/home/#{username}")
  
  git "#{home}/.oh-my-zsh" do
    repository 'git://github.com/robbyrussell/oh-my-zsh.git'
    user       login
    reference  'master'
    action     :sync
    depth      1
  end
  
  template "#{home}/.zshrc" do
    source 'zshrc.erb'
    owner login
    mode '644'
    variables(
      user:           login,
      theme:          hash[:theme]          || node[:oh_my_zsh][:theme],
      case_sensitive: hash[:case_sensitive] || node[:oh_my_zsh][:case_sensitive],
      plugins:        hash[:plugins]        || node[:oh_my_zsh][:plugins],
      autocorrect:    node[:oh_my_zsh][:autocorrect]
    )
  end
  
  user login do
    action :modify
    shell '/bin/zsh'
  end
  
  execute 'source /etc/profile to all zshrc' do
    command "echo 'source /etc/profile' >> /etc/zsh/zprofile"
    not_if  "[[ ! -f /etc/zsh/zprofile ]] || grep 'source /etc/profile' /etc/zsh/zprofile"
  end
end
