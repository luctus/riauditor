package "libffi-dev" #ruby 2.2.0 needs it (http://stackoverflow.com/questions/27915581/error-with-rbenv-install-2-2-0)

include_recipe "rbenv::vagrant"

package "libqt4-dev"
package "libicu52"
package "vim"
package "phantomjs"
