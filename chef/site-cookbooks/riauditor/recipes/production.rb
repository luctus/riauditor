# creates /var/www/vhosts
directory node[:nginx][:vhosts_dir] do
  mode 0777
  owner node[:nginx][:user]
  group node[:nginx][:user]
  action :create
  recursive true
end

package "libqt4-dev"
#package "libicu48"
package "vim"
package "phantomjs"
