ssh -i mymaster.pem  ec2-user@10.0.2.56 -o "proxycommand ssh -W %h:%p -i mymaster.pem ec2-user@mybastion.elb.amazonaws.com"

cat <<EOF | tee .ssh/config
Host dev-vertica
  Hostname 10.106.169.24
  IdentityFile ~/.ssh/dev-vertica.pem
  ForwardAgent yes
  User ${whoami}
  ProxyCommand ssh -W %h:%p -i ~/.ssh/dev-vertica.pem ec2-user@ebsbastion.us-west-2.elb.amazonaws.com
EOF