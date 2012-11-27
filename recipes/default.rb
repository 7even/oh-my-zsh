include_recipe "git"
include_recipe "zsh"

package "zsh" unless node['oh-my-zsh']['users'].empty?

node['oh-my-zsh']['users'].each do |username, hash|
  home = hash['home'] || (username == "root" ? "/root" : "/home/#{username}")

  git "#{home}/.oh-my-zsh" do
    repository 'git://github.com/robbyrussell/oh-my-zsh.git'
    user       username
    reference  "master"
    action     :sync
  end

  template "#{home}/.zshrc" do
    source "zshrc.erb"
    owner username
    mode "644"
    variables({
      :user           => username,
      :theme          => hash['theme']          || 'gentoo',
      :case_sensitive => hash['case_sensitive'] || false,
      :plugins        => hash['plugins']        || []
    })
  end

  user username do
    action :modify
    shell '/bin/zsh'
  end

  execute "source /etc/profile to all zshrc" do
    command "echo 'source /etc/profile' >> /etc/zsh/zprofile"
    not_if  "grep 'source /etc/profile' /etc/zsh/zprofile"
  end
end
