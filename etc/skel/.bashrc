# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Install ohmybash locally for your user.
install_ohmybash () {
  echo "Cloning oh-my-bash"
  git clone git://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash

  echo "Backing up your bashrc"
  cp ~/.bashrc ~/.bashrc.pre-oh-my-bash

  echo "Copying the oh-my-bash bashrc template"
  cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc

  echo "Sourcing, and finished!"
  source ~/.bashrc
}