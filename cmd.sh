  110  yum install -y epel-release
  111  yum install -y ocserv
   
   56  vi /etc/ocserv/ocserv.conf 
   57  vi /etc/ocserv/ocserv.conf 
   58  history
   59  systemctl restart ocserv
   60  top
   61  exit
   62  ocpasswd -c /etc/ocserv/passwd ocuser
   63  iptables --help
   64  iptables --list
   65  ls
   66  service iptables status
   67  iptables -S
   68  ll /etc/pki/ocserv/public/server.crt
   69  cd /etc/pki/ocserv/
   70  ls
   71  cd public/
   72  ls
   73  ll
   74  cd ..
   75  cd /etc/ocserv/
   76  ls
   77  cat passwd 
   78  vi ocserv.conf 
   79  mkdir -p /tmp/ssl
   80  cd /tmp/ssl
   81  ls
   82  certtool --generate-privkey --outfile ca-key.pem
   83  cat << _EOF_ >ca.tmpl
   84  cn = "shan"
   85  organization = "leo"
   86  serial = 1
   87  expiration_days = 3650
   88  ca
   89  signing_key
   90  cert_signing_key
   91  crl_signing_key
   92  _EOF_
   93  certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem 
   94  certtool --generate-privkey --outfile server-key.pem 
   95  cat << _EOF_ >server.tmpl
   96  cn = "shan"
   97  organization = "leo"
   98  serial = 2
   99  expiration_days = 3650
  100  signing_key
  101  encryption_key #only if the generated key is an RSA one
  102  tls_www_server
  103  _EOF_
  104  certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
  105  ll
  106  cp server-cert.pem /etc/pki/ocserv/public/server.crt
  107  cp server-key.pem /etc/pki/ocserv/private/server.key
  108  systemctl restart ocserv
  109  systemctl status ocserv
  110  yum install -y epel-release
  111  yum install -y ocserv
  112  top
  113  vi /etc/osserv/ocserv.conf
  114  vi /etc/ocserv/ocserv.conf 
  115  vi /etc/sysctl.conf
  116  service iptables status
  117  history
  118  systemctl status wg-quick@wg0
  119  wg-quick down wg0
  120  systemctl status wg-quick@wg0
  121  systemctl start wg-quick@wg0
  122  systemctl status wg-quick@wg0
  123  vi /usr/lib/systemd/system/wg-quick@.service
  124  wg
  125  top
  126  vi /etc/ocserv/ocserv.conf 
  127  cd /etc/ocserv/
  128  ls
  129  ll
  130  vi ocserv.conf 
  131  cd ..
  132  cd pki
  133  ks
  134  ls
  135  cd CA/
  136  ls
  137  cd ..
  138  ls
  139  cd ..
  140  ls
  141  cd ocserv/
  142  ls
  143  vi ocserv.conf 
  144  lsmod | grep bbr
  145  iptables -nL
  146  ocserv --help
  147  ocserv -v
  148  iptables -nL
  149  iptables -L
