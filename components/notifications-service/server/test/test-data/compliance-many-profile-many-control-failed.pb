
run_id8http://localhost/viz/#/compliance/reporting/nodes/run_idhuman-readable-name"uuid*1.30.02U� �(Q:��
ssh	Basic SSH1.1.0"=Verify that SSH Server and SSH Client are configured securely*Chef Software, Inc.2 Proprietary, All rights reserved:Chef Software, Inc.Bsupport@chef.ioJ@f56ef31e9e8be7c9064e84f1db699d3f0175924a0ee4517e3a626c38727ebf93R b�
basic-1  �?/etc/ssh should be a directory"�control 'basic-1' do
  impact 1.0
  title '/etc/ssh should be a directory'
  desc '
    In order for OpenSSH to function correctly, its
    configuration path must be a folder.
  '
  describe file('/etc/ssh') do
    it { should be_directory }
  end
end
*TIn order for OpenSSH to function correctly, its
configuration path must be a folder.2(
$base/ssh/controls/ssh_folder_spec.rbJ0
passed!File /etc/ssh should be directory��;b�
basic-2  �? /etc/ssh should be owned by root"�control 'basic-2' do
  impact 1.0
  title '/etc/ssh should be owned by root'
  desc '
    The OpenSSH configuration folder should be owned
    by the root user. It is an important step towards making
    sure, that configuration files are only changed by
    priviledged users.
  '
  describe file('/etc/ssh') do
    it { should be_owned_by 'root' }
  end
end
*�The OpenSSH configuration folder should be owned
by the root user. It is an important step towards making
sure, that configuration files are only changed by
priviledged users.2(
$base/ssh/controls/ssh_folder_spec.rbJ6
passed'File /etc/ssh should be owned by "root"��<b�
basic-3   ?+/etc/ssh should have limited access to 0755"�control 'basic-3' do
  impact 0.5
  title '/etc/ssh should have limited access to 0755'
  desc '
    The OpenSSH configuration folder should have restricted
    access permissions. It is an important step towards making
    sure, that configuration files are only changed by
    priviledged users, while leaving them readable for the
    SSH client.
  '
  describe file('/etc/ssh') do
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('others') }
    it { should_not be_readable.by('others') }
  end
end
*�The OpenSSH configuration folder should have restricted
access permissions. It is an important step towards making
sure, that configuration files are only changed by
priviledged users, while leaving them readable for the
SSH client.2(
$base/ssh/controls/ssh_folder_spec.rb%J<
passed-File /etc/ssh should not be writable by group��9J=
passed.File /etc/ssh should not be writable by others~�c9Jr
failed.File /etc/ssh should not be readable by others0e`;*3expected File /etc/ssh not to be readable by othersb�
basic-6   ?0ssh_config should have restricted access to 0644"�control 'basic-6' do
  impact 0.5
  title 'ssh_config should have restricted access to 0644'
  desc '
    The system-wide client ssh configuration file
    should only be modified by its owner (root).
  '
  describe file('/etc/ssh/ssh_config') do
    it { should be_mode 0o644 }
  end
end
*ZThe system-wide client ssh configuration file
should only be modified by its owner (root).2!
base/ssh/controls/ssh_spec.rbJ:
passed+File /etc/ssh/ssh_config should be mode 420Ú�<b�
ssh-1���= Client: Configure address family"�control 'ssh-1' do
  impact 0.1
  title 'Client: Configure address family'
  desc '
    OpenSSH should be configured to the network family.
    Set it to inet if you use IPv4 only. For IPv6 only set it
    to inet6.
  '
  describe ssh_config do
    its('AddressFamily') { should match(/inet|any/) }
  end
end
*wOpenSSH should be configured to the network family.
Set it to inet if you use IPv4 only. For IPv6 only set it
to inet6.2!
base/ssh/controls/ssh_spec.rbJh
failed7SSH Configuration AddressFamily should match /inet|any/��+;* expected nil to match /inet|any/b�
ssh-3���=Client: Configure expected port"�control 'ssh-3' do
  impact 0.1
  title 'Client: Configure expected port'
  desc '
    Configure the port which you expect your SSH client to
    connect to.
  '
  describe ssh_config do
    its('Port') { should eq('22') }
  end
end
*BConfigure the port which you expect your SSH client to
connect to.2!
base/ssh/controls/ssh_spec.rb$Ji
failed%SSH Configuration Port should eq "22"4��:*3
expected: "22"
     got: nil

(compared using ==)
b�
ssh-4  �?%Client: Set SSH protocol version to 2"�control 'ssh-4' do
  impact 1.0
  title 'Client: Set SSH protocol version to 2'
  desc "
    Set the SSH protocol version to 2. Don't use legacy
    insecure SSHv1 connections anymore.
  "
  describe ssh_config do
    its('Protocol') { should eq('2') }
  end
end
*WSet the SSH protocol version to 2. Don't use legacy
insecure SSHv1 connections anymore.2!
base/ssh/controls/ssh_spec.rb0Jk
failed(SSH Configuration Protocol should eq "2"7�:*2
expected: "2"
     got: nil

(compared using ==)
b�
ssh-5���=Client: Disable batch mode"�control 'ssh-5' do
  impact 0.1
  title 'Client: Disable batch mode'
  desc '
    Avoid batch mode in the default configuration.
  '
  describe ssh_config do
    its('BatchMode') { should eq('no') }
  end
end
*.Avoid batch mode in the default configuration.2!
base/ssh/controls/ssh_spec.rb<Jn
failed*SSH Configuration BatchMode should eq "no"�p:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-6   ?Client: Check Host IPs"�control 'ssh-6' do
  impact 0.5
  title 'Client: Check Host IPs'
  desc '
    Make sure that SSH checks the host IP address in the
    known_hosts file, to avoid DNS spoofing effects.
  '
  describe ssh_config do
    its('CheckHostIP') { should eq('yes') }
  end
end
*eMake sure that SSH checks the host IP address in the
known_hosts file, to avoid DNS spoofing effects.2!
base/ssh/controls/ssh_spec.rbGJr
failed-SSH Configuration CheckHostIP should eq "yes"QL�9*4
expected: "yes"
     got: nil

(compared using ==)
b�
ssh-7   ?#Client: Ask when checking host keys"�control 'ssh-7' do
  impact 0.5
  title 'Client: Ask when checking host keys'
  desc "
    Don't automatically add new host keys to the list of
    known hosts.
  "
  describe ssh_config do
    its('StrictHostKeyChecking') { should match(/ask|yes/) }
  end
end
*ADon't automatically add new host keys to the list of
known hosts.2!
base/ssh/controls/ssh_spec.rbSJn
failed>SSH Configuration StrictHostKeyChecking should match /ask|yes/&�9*expected nil to match /ask|yes/b�
ssh-8   ?Client: Configure safe ciphers"�control 'ssh-8' do
  impact 0.5
  title 'Client: Configure safe ciphers'
  desc '
    Configure a list of current ciphers and avoid older
    and weaker settings.
  '
  describe ssh_config do
    its('Ciphers') { should match(ssh_crypto.valid_ciphers) }
  end
end
*HConfigure a list of current ciphers and avoid older
and weaker settings.2!
base/ssh/controls/ssh_spec.rb_J�
failedISSH Configuration Ciphers should match "aes256-ctr,aes192-ctr,aes128-ctr"ߧ*:*8expected nil to match "aes256-ctr,aes192-ctr,aes128-ctr"b�
ssh-9   ?Client: Configure safe MACs"�control 'ssh-9' do
  impact 0.5
  title 'Client: Configure safe MACs'
  desc '
    Configure a list of current MACs and avoid older
    and weaker settings.
  '
  describe ssh_config do
    its('MACs') { should match(ssh_crypto.valid_macs) }
  end
end
*EConfigure a list of current MACs and avoid older
and weaker settings.2!
base/ssh/controls/ssh_spec.rbkJ�
failedPSSH Configuration MACs should match "hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"ͯ�9*Bexpected nil to match "hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"b�
ssh-10   ?.Client: Configure safe Key Exchange algorithms"�control 'ssh-10' do
  impact 0.5
  title 'Client: Configure safe Key Exchange algorithms'
  desc '
    Configure a list of current key-exchange algorithms
    and avoid older and weaker settings.
  '
  describe ssh_config do
    its('KexAlgorithms') { should match(ssh_crypto.valid_kexs) }
  end
end
*XConfigure a list of current key-exchange algorithms
and avoid older and weaker settings.2!
base/ssh/controls/ssh_spec.rbwJ�
failed�SSH Configuration KexAlgorithms should match "diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1"��:*{expected nil to match "diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1"b�
ssh-11   ? Client: Disable agent forwarding"�control 'ssh-11' do
  impact 0.5
  title 'Client: Disable agent forwarding'
  desc '
    Prevent agent forwarding by default, as it can
    be used in a limited way to enable attacks.
  '
  describe ssh_config do
    its('ForwardAgent') { should eq('no') }
  end
end
*ZPrevent agent forwarding by default, as it can
be used in a limited way to enable attacks.2"
base/ssh/controls/ssh_spec.rb�Jq
failed-SSH Configuration ForwardAgent should eq "no"�� :*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-12   ?Client: Disable X11 forwarding"�control 'ssh-12' do
  impact 0.5
  title 'Client: Disable X11 forwarding'
  desc '
    Prevent X11 forwarding by default, as it can
    be used in a limited way to enable attacks.
  '
  describe ssh_config do
    its('ForwardX11') { should eq('no') }
  end
end
*XPrevent X11 forwarding by default, as it can
be used in a limited way to enable attacks.2"
base/ssh/controls/ssh_spec.rb�Jo
failed+SSH Configuration ForwardX11 should eq "no"(,�9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-13   ?)Client: Disable host-based authentication"�control 'ssh-13' do
  impact 0.5
  title 'Client: Disable host-based authentication'
  desc '
    Avoid host-based authentication, as it opens more ways
    for an attacker to enter a system.
    '
  describe ssh_config do
    its('HostbasedAuthentication') { should eq('no') }
  end
end
*YAvoid host-based authentication, as it opens more ways
for an attacker to enter a system.2"
base/ssh/controls/ssh_spec.rb�J|
failed8SSH Configuration HostbasedAuthentication should eq "no"��:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-14   ?+Client: Disable rhosts-based authentication"�control 'ssh-14' do
  impact 0.5
  title 'Client: Disable rhosts-based authentication'
  desc '
    Avoid rhosts-based authentication, as it opens more ways
    for an attacker to enter a system.
    '
  describe ssh_config do
    its('RhostsRSAAuthentication') { should eq('no') }
  end
end
*[Avoid rhosts-based authentication, as it opens more ways
for an attacker to enter a system.2"
base/ssh/controls/ssh_spec.rb�J|
failed8SSH Configuration RhostsRSAAuthentication should eq "no"���9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-15   ?!Client: Enable RSA authentication"�control 'ssh-15' do
  impact 0.5
  title 'Client: Enable RSA authentication'
  desc '
    Make sure RSA authentication is used by default.
  '
  describe ssh_config do
    its('RSAAuthentication') { should eq('yes') }
  end
end
*0Make sure RSA authentication is used by default.2"
base/ssh/controls/ssh_spec.rb�Jx
failed3SSH Configuration RSAAuthentication should eq "yes"��9*4
expected: "yes"
     got: nil

(compared using ==)
b�
ssh-16   ?-Client: Disable password-based authentication"�control 'ssh-16' do
  impact 0.5
  title 'Client: Disable password-based authentication'
  desc '
    Avoid all password-based authentications. They are
    often weaker than key-based authentication and may enable
    weak passwords to enter a system.
  '
  describe ssh_config do
    its('PasswordAuthentication') { should eq('no') }
  end
end
*�Avoid all password-based authentications. They are
often weaker than key-based authentication and may enable
weak passwords to enter a system.2"
base/ssh/controls/ssh_spec.rb�J{
failed7SSH Configuration PasswordAuthentication should eq "no"��9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-19���=Client: Disable tunnels"�control 'ssh-19' do
  impact 0.1
  title 'Client: Disable tunnels'
  desc '
    Avoid using SSH tunnels.
  '
  describe ssh_config do
    its('Tunnel') { should eq('no') }
  end
end
*Avoid using SSH tunnels.2"
base/ssh/controls/ssh_spec.rb�Jk
failed'SSH Configuration Tunnel should eq "no"`�9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-20   ?$Client: Do not permit local commands"�control 'ssh-20' do
  impact 0.5
  title 'Client: Do not permit local commands'
  desc '
    Do not permit any local command execution.
  '
  describe ssh_config do
    its('PermitLocalCommand') { should eq('no') }
  end
end
**Do not permit any local command execution.2"
base/ssh/controls/ssh_spec.rb�Jw
failed3SSH Configuration PermitLocalCommand should eq "no"���9*3
expected: "no"
     got: nil

(compared using ==)
b�
basic-4  �?#sshd_config should be owned by root"�control 'basic-4' do
  impact 1.0
  title 'sshd_config should be owned by root'
  desc '
    The SSH server configuration file
    should only be modified by its owner (root).
  '
  describe file('/etc/ssh/sshd_config') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
*NThe SSH server configuration file
should only be modified by its owner (root).2"
base/ssh/controls/sshd_spec.rbJB
passed3File /etc/ssh/sshd_config should be owned by "root"x%�<J�
failed7File /etc/ssh/sshd_config should be grouped into "root"�b�9*Texpected `File /etc/ssh/sshd_config.grouped_into?("root")` to return true, got falseb�
	basic-4.1   ?3sshd_config should not be group-writable/executable"�control 'basic-4.1' do
  impact 0.5
  title 'sshd_config should not be group-writable/executable'
  desc '
    The SSH server configuration file
    should not be executable (to its owner).
  '
  describe file('/etc/ssh/sshd_config') do
    it { should_not be_executable.by('owner') }
  end
end
*JThe SSH server configuration file
should not be executable (to its owner).2"
base/ssh/controls/sshd_spec.rbJJ
passed;File /etc/ssh/sshd_config should not be executable by owner�&�9b�
basic-5   ?3sshd_config should not be group-writable/executable"�control 'basic-5' do
  impact 0.5
  title 'sshd_config should not be group-writable/executable'
  desc '
    The SSH server configuration file
    should only be modified and used by its owner (root).
  '
  describe file('/etc/ssh/sshd_config') do
    it { should_not be_writable.by('group') }
    it { should_not be_executable.by('group') }
  end
end
*WThe SSH server configuration file
should only be modified and used by its owner (root).2"
base/ssh/controls/sshd_spec.rb$JH
passed9File /etc/ssh/sshd_config should not be writable by group�s69JJ
passed;File /etc/ssh/sshd_config should not be executable by group{i
9b�
	basic-6.1  �?7sshd_config should not be writable/executable to others"�control 'basic-6.1' do
  impact 1.0
  title 'sshd_config should not be writable/executable to others'
  desc '
    The SSH server configuration file
    should only be modified and used by its owner (root).
  '
  describe file('/etc/ssh/sshd_config') do
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end
*WThe SSH server configuration file
should only be modified and used by its owner (root).2"
base/ssh/controls/sshd_spec.rb1JI
passed:File /etc/ssh/sshd_config should not be writable by others�n 9JK
passed<File /etc/ssh/sshd_config should not be executable by others�9b�
	basic-6.2���=.sshd_config should not be accessible to others"�control 'basic-6.2' do
  impact 0.1
  title 'sshd_config should not be accessible to others'
  desc '
    The SSH server configuration file
    should only be modified and used by its owner (root).
  '
  describe file('/etc/ssh/sshd_config') do
    it { should_not be_readable.by('others') }
  end
end
*WThe SSH server configuration file
should only be modified and used by its owner (root).2"
base/ssh/controls/sshd_spec.rb>J�
failed:File /etc/ssh/sshd_config should not be readable by others��9*?expected File /etc/ssh/sshd_config not to be readable by othersb�
sshd-7  �?&Server: Do not permit root-based login"�control 'sshd-7' do
  impact 1.0
  title 'Server: Do not permit root-based login'
  desc '
    To reduce the potential to gain full privileges
    of a system in the course of one attack (by either misconfiguration
    or vulnerabilities), do not allow logging in as the root user.
  '
  describe sshd_config do
    its('PermitRootLogin') { should match(/no|without-password/) }
  end
end
*�To reduce the potential to gain full privileges
of a system in the course of one attack (by either misconfiguration
or vulnerabilities), do not allow logging in as the root user.2"
base/ssh/controls/sshd_spec.rbJJ�
failedESSHD Configuration PermitRootLogin should match /no|without-password/�t�:*+expected nil to match /no|without-password/b�
sshd-8��?"Server: Configure the service port"�control 'sshd-8' do
  impact 0.6
  title 'Server: Configure the service port'
  desc '
    Always specify which port the SSH server should listen to.
    Prevent unexpected settings.
  '
  describe sshd_config do
    its('Port') { should eq('22') }
  end
end
*WAlways specify which port the SSH server should listen to.
Prevent unexpected settings.2"
base/ssh/controls/sshd_spec.rbWJj
failed&SSHD Configuration Port should eq "22"G�:*3
expected: "22"
     got: nil

(compared using ==)
b�
sshd-9���=&Server: Specify a valid address family"�control 'sshd-9' do
  impact 0.1
  title 'Server: Specify a valid address family'
  desc '
    OpenSSH should be configured to the network family.
    Set it to inet if you use IPv4 only. For IPv6 only set it
    to inet6.
  '
  describe sshd_config do
    its('AddressFamily') { should match(/inet|any/) }
  end
end
*wOpenSSH should be configured to the network family.
Set it to inet if you use IPv4 only. For IPv6 only set it
to inet6.2"
base/ssh/controls/sshd_spec.rbcJi
failed8SSHD Configuration AddressFamily should match /inet|any/�i�:* expected nil to match /inet|any/b�
sshd-10��?"Server: Configure a listen address"�control 'sshd-10' do
  impact 0.6
  title 'Server: Configure a listen address'
  desc "
    Limit the SSH server to listen to a specific
    address. Don't let it listen on all interfaces to avoid
    logins from unexpected sources.
  "
  describe sshd_config do
    its('ListenAddress') { should_not eq('0.0.0.0') }
    its('ListenAddress') { should_not eq('::') }
    its('ListenAddress') { should_not eq(nil) }
  end
end
*�Limit the SSH server to listen to a specific
address. Don't let it listen on all interfaces to avoid
logins from unexpected sources.2"
base/ssh/controls/sshd_spec.rbpJG
passed8SSHD Configuration ListenAddress should not eq "0.0.0.0"�n:JB
passed3SSHD Configuration ListenAddress should not eq "::"zl�8J~
failed2SSHD Configuration ListenAddress should not eq nil��9*;
expected: value != nil
     got: nil

(compared using ==)
b�
sshd-11  �?%Server: Set protocol version to SSHv2"�control 'sshd-11' do
  impact 1.0
  title 'Server: Set protocol version to SSHv2'
  desc "
    Set the SSH protocol version to 2. Don't use legacy
    insecure SSHv1 connections anymore.
  "
  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end
*WSet the SSH protocol version to 2. Don't use legacy
insecure SSHv1 connections anymore.2"
base/ssh/controls/sshd_spec.rbJ8
passed)SSHD Configuration Protocol should eq "2"�:b:b�
sshd-12  �?Server: Enable strict mode"�control 'sshd-12' do
  impact 1.0
  title 'Server: Enable strict mode'
  desc "
    Verify file modes and ownerships before accepting a
    user's login. Prevent misconfiguration of novice users.
  "
  describe sshd_config do
    its('StrictModes') { should eq('yes') }
  end
end
*kVerify file modes and ownerships before accepting a
user's login. Prevent misconfiguration of novice users.2#
base/ssh/controls/sshd_spec.rb�Js
failed.SSHD Configuration StrictModes should eq "yes"��k:*4
expected: "yes"
     got: nil

(compared using ==)
b�
	sshd-14.1���=Server: Enable verbose logging"�control 'sshd-14.1' do
  impact 0.1
  title 'Server: Enable verbose logging'
  desc '
    Be verbose in logging, to allow analysis in case
    of unexpected behavior.
  '
  describe sshd_config do
    its('LogLevel') { should match(/VERBOSE|DEBUG/) }
  end
end
*HBe verbose in logging, to allow analysis in case
of unexpected behavior.2#
base/ssh/controls/sshd_spec.rb�Jn
failed8SSHD Configuration LogLevel should match /VERBOSE|DEBUG/)�V:*%expected nil to match /VERBOSE|DEBUG/b�
	sshd-14.2   ?)Server: Set the minimum log level to info"�control 'sshd-14.2' do
  impact 0.5
  title 'Server: Set the minimum log level to info'
  desc "
    Don't reduce logs below info level, to gain
    all necessary information for later analysis.
  "
  describe sshd_config do
    its('LogLevel') { should match(/INFO|VERBOSE|DEBUG/) }
  end
end
*YDon't reduce logs below info level, to gain
all necessary information for later analysis.2#
base/ssh/controls/sshd_spec.rb�Jx
failed=SSHD Configuration LogLevel should match /INFO|VERBOSE|DEBUG/��D:**expected nil to match /INFO|VERBOSE|DEBUG/b�
sshd-15���> Server: Configure a valid cipher"�control 'sshd-15' do
  impact 0.3
  title 'Server: Configure a valid cipher'
  desc '
    Configure a list of current ciphers and avoid older
    and weaker settings.
  '
  describe sshd_config do
    its('Ciphers') { should eq(ssh_crypto.valid_ciphers) }
  end
end
*HConfigure a list of current ciphers and avoid older
and weaker settings.2#
base/ssh/controls/sshd_spec.rb�J�
failedGSSHD Configuration Ciphers should eq "aes256-ctr,aes192-ctr,aes128-ctr"Es:*Q
expected: "aes256-ctr,aes192-ctr,aes128-ctr"
     got: nil

(compared using ==)
b�
sshd-16���>Server: Configure a valid MAC"�control 'sshd-16' do
  impact 0.3
  title 'Server: Configure a valid MAC'
  desc '
    Configure a list of current MACs and avoid older
    and weaker settings.
  '
  describe sshd_config do
    its('MACs') { should eq(ssh_crypto.valid_macs) }
  end
end
*EConfigure a list of current MACs and avoid older
and weaker settings.2#
base/ssh/controls/sshd_spec.rb�J�
failedNSSHD Configuration MACs should eq "hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"��Z:*[
expected: "hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"
     got: nil

(compared using ==)
b�
sshd-17���>0Server: Configure a valid Key-Exchange Algorithm"�control 'sshd-17' do
  impact 0.3
  title 'Server: Configure a valid Key-Exchange Algorithm'
  desc '
    Configure a list of current key-exchange algorithms
    and avoid older and weaker settings.
  '
  describe sshd_config do
    its('KexAlgorithms') { should eq(ssh_crypto.valid_kexs) }
  end
end
*XConfigure a list of current key-exchange algorithms
and avoid older and weaker settings.2#
base/ssh/controls/sshd_spec.rb�J�
failed�SSHD Configuration KexAlgorithms should eq "diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1".VT:*�
expected: "diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1"
     got: nil

(compared using ==)
b�
sshd-18���>&Server: Disable legacy login mechanism"�control 'sshd-18' do
  impact 0.3
  title 'Server: Disable legacy login mechanism'
  desc '
    Do not use login for interactive login sessions.
  '
  describe sshd_config do
    its('UseLogin') { should eq('no') }
  end
end
*0Do not use login for interactive login sessions.2#
base/ssh/controls/sshd_spec.rb�Jn
failed*SSHD Configuration UseLogin should eq "no"��R:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-19   ?!Server: Use priviledge separation"�control 'sshd-19' do
  impact 0.5
  title 'Server: Use priviledge separation'
  desc '
    Use an unprivileged child process to deal with
    incoming network traffic, to avoid privilege escalation
    by an attacker.
  '
  describe sshd_config do
    its('UsePrivilegeSeparation') { should eq('yes') }
  end
end
*vUse an unprivileged child process to deal with
incoming network traffic, to avoid privilege escalation
by an attacker.2#
base/ssh/controls/sshd_spec.rb�J~
failed9SSHD Configuration UsePrivilegeSeparation should eq "yes"0e`:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-20   ?9Server: Disable users loading their environment variables"�control 'sshd-20' do
  impact 0.5
  title 'Server: Disable users loading their environment variables'
  desc '
    Do not enable custom user environments. They may be used
    to bypass access restrictions in certain configurations.
  '
  describe sshd_config do
    its('PermitUserEnvironment') { should eq('no') }
  end
end
*qDo not enable custom user environments. They may be used
to bypass access restrictions in certain configurations.2#
base/ssh/controls/sshd_spec.rb�J{
failed7SSHD Configuration PermitUserEnvironment should eq "no"�n:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-21���>"Server: Set a grace-time for login"�control 'sshd-21' do
  impact 0.3
  title 'Server: Set a grace-time for login'
  desc '
    Limit the login time to avoid resource starvation attacks.
  '
  describe sshd_config do
    its('LoginGraceTime') { should eq('30s') }
  end
end
*:Limit the login time to avoid resource starvation attacks.2#
base/ssh/controls/sshd_spec.rb�Jv
failed1SSHD Configuration LoginGraceTime should eq "30s"�SI:*4
expected: "30s"
     got: nil

(compared using ==)
b�
sshd-22   ?"Server: Limit maximum auth retries"�control 'sshd-22' do
  impact 0.5
  title 'Server: Limit maximum auth retries'
  desc '
    Limit the maximum number of authentication retries in one
    run, to prevent resource starvation attacks.
  '
  describe sshd_config do
    its('MaxAuthTries') { should eq('2') }
  end
end
*fLimit the maximum number of authentication retries in one
run, to prevent resource starvation attacks.2#
base/ssh/controls/sshd_spec.rb�Jp
failed-SSHD Configuration MaxAuthTries should eq "2" �@:*2
expected: "2"
     got: nil

(compared using ==)
b�
sshd-23   ?)Server: Limit maximum user sessions to 10"�control 'sshd-23' do
  impact 0.5
  title 'Server: Limit maximum user sessions to 10'
  desc '
    Limit the maximum number of user sessions to a reasonable
    number. This avoid resource starvation attacks.
  '
  describe sshd_config do
    its('MaxSessions') { should eq('10') }
  end
end
*iLimit the maximum number of user sessions to a reasonable
number. This avoid resource starvation attacks.2#
base/ssh/controls/sshd_spec.rb�Jq
failed-SSHD Configuration MaxSessions should eq "10"Y�M:*3
expected: "10"
     got: nil

(compared using ==)
b�
sshd-24   ?Server: Limit maximum startups"�control 'sshd-24' do
  impact 0.5
  title 'Server: Limit maximum startups'
  desc '
    Limit the number of concurrent unauthenticated sessions
    to prevent resource starvation attacks.
  '
  describe sshd_config do
    its('MaxStartups') { should eq('10:30:100') }
  end
end
*_Limit the number of concurrent unauthenticated sessions
to prevent resource starvation attacks.2#
base/ssh/controls/sshd_spec.rb�J
failed4SSHD Configuration MaxStartups should eq "10:30:100"y�e:*:
expected: "10:30:100"
     got: nil

(compared using ==)
b�
sshd-25   ?*Server: Activate public key authentication"�control 'sshd-25' do
  impact 0.5
  title 'Server: Activate public key authentication'
  desc '
    Prefer public key authentication mechanisms. Other methods
    are noticeably weaker (e.g. passwords). This is the preferred
    login mechanism.
  '
  describe sshd_config do
    its('PubkeyAuthentication') { should eq('yes') }
  end
end
*�Prefer public key authentication mechanisms. Other methods
are noticeably weaker (e.g. passwords). This is the preferred
login mechanism.2#
base/ssh/controls/sshd_spec.rb�J|
failed7SSHD Configuration PubkeyAuthentication should eq "yes"Ӆ:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-26333?+Server: Ignore legacy .rhosts configuration"�control 'sshd-26' do
  impact 0.7
  title 'Server: Ignore legacy .rhosts configuration'
  desc '
    Avoid host-based authentication, as it opens more ways
    for an attacker to enter a system.
  '
  describe sshd_config do
    its('IgnoreRhosts') { should eq('yes') }
  end
end
*YAvoid host-based authentication, as it opens more ways
for an attacker to enter a system.2#
base/ssh/controls/sshd_spec.rb�Jt
failed/SSHD Configuration IgnoreRhosts should eq "yes"�_:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-27   ?Server: Ignore user known hosts"�control 'sshd-27' do
  impact 0.5
  title 'Server: Ignore user known hosts'
  desc '
    Avoid host-based authentication, as it opens more ways
    for an attacker to enter a system.
  '
  describe sshd_config do
    its('IgnoreUserKnownHosts') { should eq('yes') }
  end
end
*YAvoid host-based authentication, as it opens more ways
for an attacker to enter a system.2#
base/ssh/controls/sshd_spec.rb�J|
failed7SSHD Configuration IgnoreUserKnownHosts should eq "yes"�X:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-28   ?(Server: Disable hostbased authentication"�control 'sshd-28' do
  impact 0.5
  title 'Server: Disable hostbased authentication'
  desc '
    Avoid host-based authentication, as it opens more ways
    for an attacker to enter a system.
  '
  describe sshd_config do
    its('HostbasedAuthentication') { should eq('no') }
  end
end
*YAvoid host-based authentication, as it opens more ways
for an attacker to enter a system.2#
base/ssh/controls/sshd_spec.rb�J}
failed9SSHD Configuration HostbasedAuthentication should eq "no"�u�:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-29���>Server: Disable PAM"�control 'sshd-29' do
  impact 0.3
  title 'Server: Disable PAM'
  desc '
    Avoid challenge-response and password-based authentications.
  '
  describe sshd_config do
    its('UsePAM') { should eq('no') }
  end
end
*<Avoid challenge-response and password-based authentications.2#
base/ssh/controls/sshd_spec.rb�Jn
failed(SSHD Configuration UsePAM should eq "no"�'�:*5
expected: "no"
     got: "yes"

(compared using ==)
b�
sshd-30   ?-Server: Disable password-based authentication"�control 'sshd-30' do
  impact 0.5
  title 'Server: Disable password-based authentication'
  desc '
    Avoid challenge-response and password-based authentications.
  '
  describe sshd_config do
    its('PasswordAuthentication') { should eq('no') }
  end
end
*<Avoid challenge-response and password-based authentications.2#
base/ssh/controls/sshd_spec.rb�J|
failed8SSHD Configuration PasswordAuthentication should eq "no"��:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-31  �?Server: Disable empty passwords"�control 'sshd-31' do
  impact 1.0
  title 'Server: Disable empty passwords'
  desc '
    Precautionary setting if password-based authentication is used
    to avoid empy passwords.
  '
  describe sshd_config do
    its('PermitEmptyPasswords') { should eq('no') }
  end
end
*WPrecautionary setting if password-based authentication is used
to avoid empy passwords.2#
base/ssh/controls/sshd_spec.rb�Jz
failed6SSHD Configuration PermitEmptyPasswords should eq "no""¿:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-32   ?1Server: Disable challenge-response authentication"�control 'sshd-32' do
  impact 0.5
  title 'Server: Disable challenge-response authentication'
  desc '
    Avoid challenge-response and password-based authentications.
  '
  describe sshd_config do
    its('ChallengeResponseAuthentication') { should eq('no') }
  end
end
*<Avoid challenge-response and password-based authentications.2#
base/ssh/controls/sshd_spec.rb�J�
failedASSHD Configuration ChallengeResponseAuthentication should eq "no"f<*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-34   ?EServer: Disable Kerberos or Local Password (due to the password part)"�control 'sshd-34' do
  impact 0.5
  title 'Server: Disable Kerberos or Local Password (due to the password part)'
  desc '
    Avoid password-based authentication, which is used as a fallback
    when Kerberos fails in this setting.
  '
  describe sshd_config do
    its('KerberosOrLocalPasswd') { should eq('no') }
  end
end
*eAvoid password-based authentication, which is used as a fallback
when Kerberos fails in this setting.2#
base/ssh/controls/sshd_spec.rb�J{
failed7SSHD Configuration KerberosOrLocalPasswd should eq "no"ˠZ:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-38   ?Server: Disable TCP KeepAlive"�control 'sshd-38' do
  impact 0.5
  title 'Server: Disable TCP KeepAlive'
  desc "
    Use ClientAlive messages which are sent over the encrypted
    channel and aren't spoofable to see if the client is still alive.
  "
  describe sshd_config do
    its('TCPKeepAlive') { should eq('no') }
  end
end
*|Use ClientAlive messages which are sent over the encrypted
channel and aren't spoofable to see if the client is still alive.2#
base/ssh/controls/sshd_spec.rb�Jr
failed.SSHD Configuration TCPKeepAlive should eq "no"iqF:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-39   ?)Server: Configure a client alive interval"�control 'sshd-39' do
  impact 0.5
  title 'Server: Configure a client alive interval'
  desc "
    Use ClientAlive messages which are sent over the encrypted
    channel and aren't spoofable to see if the client is still alive.
  "
  describe sshd_config do
    its('ClientAliveInterval') { should eq('600') }
  end
end
*|Use ClientAlive messages which are sent over the encrypted
channel and aren't spoofable to see if the client is still alive.2#
base/ssh/controls/sshd_spec.rb�J{
failed6SSHD Configuration ClientAliveInterval should eq "600".VT:*4
expected: "600"
     got: nil

(compared using ==)
b�
sshd-40   ?-Server: Configure a few client alive counters"�control 'sshd-40' do
  impact 0.5
  title 'Server: Configure a few client alive counters'
  desc "
    Use ClientAlive messages which are sent over the encrypted
    channel and aren't spoofable to see if the client is still alive.
  "
  describe sshd_config do
    its('ClientAliveCountMax') { should eq('3') }
  end
end
*|Use ClientAlive messages which are sent over the encrypted
channel and aren't spoofable to see if the client is still alive.2#
base/ssh/controls/sshd_spec.rb�Jw
failed4SSHD Configuration ClientAliveCountMax should eq "3"��U:*2
expected: "3"
     got: nil

(compared using ==)
b�
sshd-41   ?Server: Disable tunnels"�control 'sshd-41' do
  impact 0.5
  title 'Server: Disable tunnels'
  desc '
    Avoid using SSH tunnels.
  '
  describe sshd_config do
    its('PermitTunnel') { should eq('no') }
  end
end
*Avoid using SSH tunnels.2#
base/ssh/controls/sshd_spec.rb�Jr
failed.SSHD Configuration PermitTunnel should eq "no"�X:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-42���>Server: Disable TCP forwarding"�control 'sshd-42' do
  impact 0.3
  title 'Server: Disable TCP forwarding'
  desc '
    If shell access is disabled, this option can
    be used to effectively disable TCP forwarders by the client.
  '
  describe sshd_config do
    its('AllowTcpForwarding') { should eq('no') }
  end
end
*iIf shell access is disabled, this option can
be used to effectively disable TCP forwarders by the client.2#
base/ssh/controls/sshd_spec.rb�Jx
failed4SSHD Configuration AllowTcpForwarding should eq "no"��G:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-43���> Server: Disable Agent forwarding"�control 'sshd-43' do
  impact 0.3
  title 'Server: Disable Agent forwarding'
  desc '
    If shell access is disabled, this option can
    be used to effectively disable agent forwarding by the client.
  '
  describe sshd_config do
    its('AllowAgentForwarding') { should eq('no') }
  end
end
*kIf shell access is disabled, this option can
be used to effectively disable agent forwarding by the client.2#
base/ssh/controls/sshd_spec.rb�Jz
failed6SSHD Configuration AllowAgentForwarding should eq "no"ǂB:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-44   ?Server: Disable gateway ports"�control 'sshd-44' do
  impact 0.5
  title 'Server: Disable gateway ports'
  desc '
    Prevent remote hosts from connecting to
    forwarded ports on the node.
  '
  describe sshd_config do
    its('GatewayPorts') { should eq('no') }
  end
end
*DPrevent remote hosts from connecting to
forwarded ports on the node.2#
base/ssh/controls/sshd_spec.rb�Jr
failed.SSHD Configuration GatewayPorts should eq "no"�-:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-45  �?Server: Disable X11 forwarding"�control 'sshd-45' do
  impact 1.0
  title 'Server: Disable X11 forwarding'
  desc '
    Prevent X11 forwarding by default, as it can
    be used in a limited way to enable attacks.
  '
  describe sshd_config do
    its('X11Forwarding') { should eq('no') }
  end
end
*XPrevent X11 forwarding by default, as it can
be used in a limited way to enable attacks.2#
base/ssh/controls/sshd_spec.rb�Js
failed/SSHD Configuration X11Forwarding should eq "no"I.:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-46333?)Server: If X11 is used, enforce localhost"�control 'sshd-46' do
  impact 0.7
  title 'Server: If X11 is used, enforce localhost'
  desc '
    Prevent X11 forwarding by default, as it can
    be used in a limited way to enable attacks.
  '
  describe sshd_config do
    its('X11UseLocalhost') { should eq('yes') }
  end
end
*XPrevent X11 forwarding by default, as it can
be used in a limited way to enable attacks.2#
base/ssh/controls/sshd_spec.rb�Jw
failed2SSHD Configuration X11UseLocalhost should eq "yes"5	^:*4
expected: "yes"
     got: nil

(compared using ==)
:��
ssh-baselineDevSec SSH Baseline2.2.0"*Test-suite for best-practice SSH hardening*DevSec Hardening Framework Team2
Apache-2.0:DevSec Hardening Framework TeamBhello@dev-sec.ioJ@3cd02faf99fcb75aefe3e3932498dbeadb668b056fa4a4c61455a6e920e5a17cR b�
ssh-01  �?6client: Check ssh_config owner, group and permissions."�control 'ssh-01' do
  impact 1.0
  title 'client: Check ssh_config owner, group and permissions.'
  desc 'The ssh_config should owned by root, only be writable by owner and readable to all.'

  describe file('/etc/ssh/ssh_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into os.darwin? ? 'wheel' : 'root' }
    it { should_not be_executable }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end
*SThe ssh_config should owned by root, only be writable by owner and readable to all.2,
(ssh-baseline-master/controls/ssh_spec.rbJ4
passed%File /etc/ssh/ssh_config should existz�:J6
passed'File /etc/ssh/ssh_config should be file�Z9JA
passed2File /etc/ssh/ssh_config should be owned by "root"��~9JF
passed7File /etc/ssh/ssh_config should be grouped into "wheel"(,�8J@
passed1File /etc/ssh/ssh_config should not be executablej�l9JC
passed4File /etc/ssh/ssh_config should be readable by ownerQL�8JC
passed4File /etc/ssh/ssh_config should be readable by group�U9JC
passed4File /etc/ssh/ssh_config should be readable by otherA׾8JC
passed4File /etc/ssh/ssh_config should be writable by ownero9JG
passed8File /etc/ssh/ssh_config should not be writable by groupY��8JG
passed8File /etc/ssh/ssh_config should not be writable by other��9b�
ssh-02  �?.Client: Specify the AddressFamily to your need"�control 'ssh-02' do
  impact 1.0
  title 'Client: Specify the AddressFamily to your need'
  desc 'OpenSSH should be configured to the network family. Set it to inet if you use IPv4 only. For IPv6 only set it to inet6.'
  describe ssh_config do
    its('AddressFamily') { should match(/inet|inet6|any/) }
  end
end
*wOpenSSH should be configured to the network family. Set it to inet if you use IPv4 only. For IPv6 only set it to inet6.2,
(ssh-baseline-master/controls/ssh_spec.rb-Jt
failed=SSH Configuration AddressFamily should match /inet|inet6|any/Y��:*&expected nil to match /inet|inet6|any/b�
ssh-03  �?!Client: Specify expected ssh port"�control 'ssh-03' do
  impact 1.0
  title 'Client: Specify expected ssh port'
  desc 'Always specify which port the SSH client should connect. Prevent unexpected settings.'
  describe ssh_config do
    its('Port') { should eq('22') }
  end
end
*UAlways specify which port the SSH client should connect. Prevent unexpected settings.2,
(ssh-baseline-master/controls/ssh_spec.rb6Ji
failed%SSH Configuration Port should eq "22"��:*3
expected: "22"
     got: nil

(compared using ==)
b�
ssh-04  �?"Client: Specify protocol version 2"�control 'ssh-04' do
  impact 1.0
  title 'Client: Specify protocol version 2'
  desc "Only SSH protocol version 2 connections should be permitted. Version 1 of the protocol contains security vulnerabilities. Don't use legacy insecure SSHv1 connections anymore."
  describe ssh_config do
    its('Protocol') { should eq('2') }
  end
end
*�Only SSH protocol version 2 connections should be permitted. Version 1 of the protocol contains security vulnerabilities. Don't use legacy insecure SSHv1 connections anymore.2,
(ssh-baseline-master/controls/ssh_spec.rb?Jk
failed(SSH Configuration Protocol should eq "2"�:*2
expected: "2"
     got: nil

(compared using ==)
b�
ssh-05  �?Client: Disable batch mode"�control 'ssh-05' do
  impact 1.0
  title 'Client: Disable batch mode'
  desc 'Avoid batch mode in the default configuration.'
  describe ssh_config do
    its('BatchMode') { should eq('no') }
  end
end
*.Avoid batch mode in the default configuration.2,
(ssh-baseline-master/controls/ssh_spec.rbHJn
failed*SSH Configuration BatchMode should eq "no"6�C:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-06  �?Client: Check Host IPs"�control 'ssh-06' do
  impact 1.0
  title 'Client: Check Host IPs'
  desc 'Make sure that SSH checks the host IP address in the known_hosts file, to avoid DNS spoofing effects.'
  describe ssh_config do
    its('CheckHostIP') { should eq('yes') }
  end
end
*eMake sure that SSH checks the host IP address in the known_hosts file, to avoid DNS spoofing effects.2,
(ssh-baseline-master/controls/ssh_spec.rbQJr
failed-SSH Configuration CheckHostIP should eq "yes"a��9*4
expected: "yes"
     got: nil

(compared using ==)
b�
ssh-07  �?#Client: Ask when checking host keys"�control 'ssh-07' do
  impact 1.0
  title 'Client: Ask when checking host keys'
  desc "Don't automatically add new hosts keys to the list of known hosts."
  describe ssh_config do
    its('StrictHostKeyChecking') { should match(/ask|yes/) }
  end
end
*BDon't automatically add new hosts keys to the list of known hosts.2,
(ssh-baseline-master/controls/ssh_spec.rbZJn
failed>SSH Configuration StrictHostKeyChecking should match /ask|yes/a�;*expected nil to match /ask|yes/b�
ssh-08  �?$Client: Check for secure ssh ciphers"�control 'ssh-08' do
  impact 1.0
  title 'Client: Check for secure ssh ciphers'
  desc 'Configure a list of ciphers to the best secure ciphers (avoid older and weaker ciphers)'
  describe ssh_config do
    its('Ciphers') { should eq(ssh_crypto.valid_ciphers) }
  end
end
*WConfigure a list of ciphers to the best secure ciphers (avoid older and weaker ciphers)2,
(ssh-baseline-master/controls/ssh_spec.rbcJ�
failed�SSH Configuration Ciphers should eq "chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr"�Z4:*�
expected: "chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr"
     got: nil

(compared using ==)
b�
ssh-09  �?3Client: Check for secure ssh Key-Exchange Algorithm"�control 'ssh-09' do
  impact 1.0
  title 'Client: Check for secure ssh Key-Exchange Algorithm'
  desc 'Configure a list of Key-Exchange Algorithms (Kexs) to the best secure Kexs (avoid older and weaker Key-Exchange Algorithm)'
  describe ssh_config do
    its('KexAlgorithms') { should eq(ssh_crypto.valid_kexs) }
  end
end
*zConfigure a list of Key-Exchange Algorithms (Kexs) to the best secure Kexs (avoid older and weaker Key-Exchange Algorithm)2,
(ssh-baseline-master/controls/ssh_spec.rblJ�
failedmSSH Configuration KexAlgorithms should eq "curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256";�:*r
expected: "curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256"
     got: nil

(compared using ==)
b�
ssh-10  �?9Client: Check for secure ssh Message Authentication Codes"�control 'ssh-10' do
  impact 1.0
  title 'Client: Check for secure ssh Message Authentication Codes'
  desc 'Configure a list of Message Authentication Codes (MACs) to the best secure MACs (avoid older and weaker Message Authentication Codes)'
  describe ssh_config do
    its('MACs') { should eq(ssh_crypto.valid_macs) }
  end
end
*�Configure a list of Message Authentication Codes (MACs) to the best secure MACs (avoid older and weaker Message Authentication Codes)2,
(ssh-baseline-master/controls/ssh_spec.rbuJ�
failed�SSH Configuration MACs should eq "hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"
�~;*�
expected: "hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"
     got: nil

(compared using ==)
b�
ssh-11  �? Client: Disable agent forwarding"�control 'ssh-11' do
  impact 1.0
  title 'Client: Disable agent forwarding'
  desc 'Prevent agent forwarding by default, as it can be used in a limited way to enable attacks.'
  describe ssh_config do
    its('ForwardAgent') { should eq('no') }
  end
end
*ZPrevent agent forwarding by default, as it can be used in a limited way to enable attacks.2,
(ssh-baseline-master/controls/ssh_spec.rb~Jq
failed-SSH Configuration ForwardAgent should eq "no"P�7:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-12  �?Client: Disable X11Forwarding"�control 'ssh-12' do
  impact 1.0
  title 'Client: Disable X11Forwarding'
  desc 'Prevent X11 forwarding by default, as it can be used in a limited way to enable attacks.'
  describe ssh_config do
    its('ForwardX11') { should eq('no') }
  end
end
*XPrevent X11 forwarding by default, as it can be used in a limited way to enable attacks.2-
(ssh-baseline-master/controls/ssh_spec.rb�Jo
failed+SSH Configuration ForwardX11 should eq "no"`�0:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-13  �?'Client: Disable HostbasedAuthentication"�control 'ssh-13' do
  impact 1.0
  title 'Client: Disable HostbasedAuthentication'
  desc 'This option is a weak way for authentication and provide attacker more ways to enter the system.'
  describe ssh_config do
    its('HostbasedAuthentication') { should eq('no') }
  end
end
*`This option is a weak way for authentication and provide attacker more ways to enter the system.2-
(ssh-baseline-master/controls/ssh_spec.rb�J|
failed8SSH Configuration HostbasedAuthentication should eq "no"J�:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-14  �?+Client: Disable rhosts-based authentication"�control 'ssh-14' do
  impact 1.0
  title 'Client: Disable rhosts-based authentication'
  desc 'Avoid rhosts-based authentication, as it opens more ways for an attacker to enter a system.'
  describe ssh_config do
    its('RhostsRSAAuthentication') { should eq('no') }
  end
end
*[Avoid rhosts-based authentication, as it opens more ways for an attacker to enter a system.2-
(ssh-baseline-master/controls/ssh_spec.rb�J|
failed8SSH Configuration RhostsRSAAuthentication should eq "no"QL�9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-15  �?!Client: Enable RSA authentication"�control 'ssh-15' do
  impact 1.0
  title 'Client: Enable RSA authentication'
  desc 'Make sure RSA authentication is used by default.'
  describe ssh_config do
    its('RSAAuthentication') { should eq('yes') }
  end
end
*0Make sure RSA authentication is used by default.2-
(ssh-baseline-master/controls/ssh_spec.rb�Jx
failed3SSH Configuration RSAAuthentication should eq "yes"���9*4
expected: "yes"
     got: nil

(compared using ==)
b�
ssh-16  �?-Client: Disable password-based authentication"�control 'ssh-16' do
  impact 1.0
  title 'Client: Disable password-based authentication'
  desc 'Avoid password-based authentications.'
  describe ssh_config do
    its('PasswordAuthentication') { should eq('no') }
  end
end
*%Avoid password-based authentications.2-
(ssh-baseline-master/controls/ssh_spec.rb�J{
failed7SSH Configuration PasswordAuthentication should eq "no"���9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-17  �?$Client: Disable GSSAPIAuthentication"�control 'ssh-17' do
  impact 1.0
  title 'Client: Disable GSSAPIAuthentication'
  desc 'If you do not use GSSAPI authentication then disable it.'
  describe ssh_config do
    its('GSSAPIAuthentication') { should eq('no') }
  end
end
*8If you do not use GSSAPI authentication then disable it.2-
(ssh-baseline-master/controls/ssh_spec.rb�Jy
failed5SSH Configuration GSSAPIAuthentication should eq "no"K"�9*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-18  �?)Client: Disable GSSAPIDelegateCredentials"�control 'ssh-18' do
  impact 1.0
  title 'Client: Disable GSSAPIDelegateCredentials'
  desc 'If you do not use GSSAPI authentication then disable it.'
  describe ssh_config do
    its('GSSAPIDelegateCredentials') { should eq('no') }
  end
end
*8If you do not use GSSAPI authentication then disable it.2-
(ssh-baseline-master/controls/ssh_spec.rb�J~
failed:SSH Configuration GSSAPIDelegateCredentials should eq "no"�!*:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-19  �?Client: Disable tunnels"�control 'ssh-19' do
  impact 1.0
  title 'Client: Disable tunnels'
  desc 'Avoid using SSH tunnels.'
  describe ssh_config do
    its('Tunnel') { should eq('no') }
  end
end
*Avoid using SSH tunnels.2-
(ssh-baseline-master/controls/ssh_spec.rb�Jk
failed'SSH Configuration Tunnel should eq "no"��:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-20  �?$Client: Do not permit local commands"�control 'ssh-20' do
  impact 1.0
  title 'Client: Do not permit local commands'
  desc 'Do not permit any local command execution.'
  describe ssh_config do
    its('PermitLocalCommand') { should eq('no') }
  end
end
**Do not permit any local command execution.2-
(ssh-baseline-master/controls/ssh_spec.rb�Jw
failed3SSH Configuration PermitLocalCommand should eq "no"�;:*3
expected: "no"
     got: nil

(compared using ==)
b�
ssh-21  �?Client: Do not allow Roaming"�control 'ssh-21' do
  impact 1.0
  title 'Client: Do not allow Roaming'
  desc 'Workaround for SSH Client Bug CVE-2016-0777 and CVE-2016-0778'
  describe ssh_config do
    its('UseRoaming') { should eq('no') }
  end
end
*=Workaround for SSH Client Bug CVE-2016-0777 and CVE-2016-07782-
(ssh-baseline-master/controls/ssh_spec.rb�Jo
failed+SSH Configuration UseRoaming should eq "no"��:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-01  �?$Server: Check for secure ssh ciphers"�control 'sshd-01' do
  impact 1.0
  title 'Server: Check for secure ssh ciphers'
  desc 'Configure a list of ciphers to the best secure ciphers (avoid older and weaker ciphers)'
  describe sshd_config do
    its('Ciphers') { should eq(ssh_crypto.valid_ciphers) }
  end
end
*WConfigure a list of ciphers to the best secure ciphers (avoid older and weaker ciphers)2-
)ssh-baseline-master/controls/sshd_spec.rbJ�
failed�SSHD Configuration Ciphers should eq "chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr"�&�:*�
expected: "chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr"
     got: nil

(compared using ==)
b�
sshd-02  �?3Server: Check for secure ssh Key-Exchange Algorithm"�control 'sshd-02' do
  impact 1.0
  title 'Server: Check for secure ssh Key-Exchange Algorithm'
  desc 'Configure a list of Key-Exchange Algorithms (Kexs) to the best secure Kexs (avoid older and weaker Key-Exchange Algorithm)'
  describe sshd_config do
    its('KexAlgorithms') { should eq(ssh_crypto.valid_kexs) }
  end
end
*zConfigure a list of Key-Exchange Algorithms (Kexs) to the best secure Kexs (avoid older and weaker Key-Exchange Algorithm)2-
)ssh-baseline-master/controls/sshd_spec.rb"J�
failednSSHD Configuration KexAlgorithms should eq "curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256"�`�:*r
expected: "curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256"
     got: nil

(compared using ==)
b�
sshd-03  �?9Server: Check for secure ssh Message Authentication Codes"�control 'sshd-03' do
  impact 1.0
  title 'Server: Check for secure ssh Message Authentication Codes'
  desc 'Configure a list of Message Authentication Codes (MACs) to the best secure MACs (avoid older and weaker Message Authentication Codes)'
  describe sshd_config do
    its('MACs') { should eq(ssh_crypto.valid_macs) }
  end
end
*�Configure a list of Message Authentication Codes (MACs) to the best secure MACs (avoid older and weaker Message Authentication Codes)2-
)ssh-baseline-master/controls/sshd_spec.rb+J�
failed�SSHD Configuration MACs should eq "hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"y�e:*�
expected: "hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160"
     got: nil

(compared using ==)
b�
sshd-04  �?6Server: Check SSH folder owner, group and permissions."�control 'sshd-04' do
  impact 1.0
  title 'Server: Check SSH folder owner, group and permissions.'
  desc 'The SSH folder should owned by root, only be writable by owner and readable by others.'
  describe file('/etc/ssh') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into os.darwin? ? 'wheel' : 'root' }
    it { should be_executable }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end
*VThe SSH folder should owned by root, only be writable by owner and readable by others.2-
)ssh-baseline-master/controls/sshd_spec.rb4J)
passedFile /etc/ssh should exist�]�8J0
passed!File /etc/ssh should be directory�S�8J6
passed'File /etc/ssh should be owned by "root"��9J;
passed,File /etc/ssh should be grouped into "wheel"Y��8J1
passed"File /etc/ssh should be executableE�8J8
passed)File /etc/ssh should be readable by ownerRI9J8
passed)File /etc/ssh should be readable by group�/9J8
passed)File /etc/ssh should be readable by other���8J8
passed)File /etc/ssh should be writable by owner��8J<
passed-File /etc/ssh should not be writable by group{i�9J<
passed-File /etc/ssh should not be writable by other0b9b�
sshd-05  �?7Server: Check sshd_config owner, group and permissions."�control 'sshd-05' do
  impact 1.0
  title 'Server: Check sshd_config owner, group and permissions.'
  desc 'The sshd_config should owned by root, only be writable/readable by owner and not be executable.'

  describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into os.darwin? ? 'wheel' : 'root' }
    it { should_not be_executable }
    it { should be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end
*_The sshd_config should owned by root, only be writable/readable by owner and not be executable.2-
)ssh-baseline-master/controls/sshd_spec.rbGJ5
passed&File /etc/ssh/sshd_config should existA׾8J7
passed(File /etc/ssh/sshd_config should be file0b9JB
passed3File /etc/ssh/sshd_config should be owned by "root"���8JG
passed8File /etc/ssh/sshd_config should be grouped into "wheel"��9JA
passed2File /etc/ssh/sshd_config should not be executable�Z49JD
passed5File /etc/ssh/sshd_config should be readable by ownerA׾8J�
failed9File /etc/ssh/sshd_config should not be readable by group�xL9*>expected File /etc/ssh/sshd_config not to be readable by groupJ�
failed9File /etc/ssh/sshd_config should not be readable by other$9*>expected File /etc/ssh/sshd_config not to be readable by otherJD
passed5File /etc/ssh/sshd_config should be writable by owner��8JH
passed9File /etc/ssh/sshd_config should not be writable by group���8JH
passed9File /etc/ssh/sshd_config should not be writable by othera��8b�
sshd-06  �?gServer: Do not permit root-based login or do not allow password and keyboard-interactive authentication"�control 'sshd-06' do
  impact 1.0
  title 'Server: Do not permit root-based login or do not allow password and keyboard-interactive authentication'
  desc 'Reduce the potential risk to gain full privileges access of the system because of weak password and keyboard-interactive authentication, do not allow logging in as the root user or with password authentication.'
  describe sshd_config do
    its('PermitRootLogin') { should match(/no|without-password/) }
  end
end
*�Reduce the potential risk to gain full privileges access of the system because of weak password and keyboard-interactive authentication, do not allow logging in as the root user or with password authentication.2-
)ssh-baseline-master/controls/sshd_spec.rb[J�
failedESSHD Configuration PermitRootLogin should match /no|without-password/���:*+expected nil to match /no|without-password/b�
sshd-07  �?#Server: Specify the listen ssh Port"�control 'sshd-07' do
  impact 1.0
  title 'Server: Specify the listen ssh Port'
  desc 'Always specify which port the SSH server should listen to. Prevent unexpected settings.'
  describe sshd_config do
    its('Port') { should eq('22') }
  end
end
*WAlways specify which port the SSH server should listen to. Prevent unexpected settings.2-
)ssh-baseline-master/controls/sshd_spec.rbdJj
failed&SSHD Configuration Port should eq "22"��:*3
expected: "22"
     got: nil

(compared using ==)
b�
sshd-08  �?.Server: Specify the AddressFamily to your need"�control 'sshd-08' do
  impact 1.0
  title 'Server: Specify the AddressFamily to your need'
  desc 'OpenSSH should be configured to the network family. Set it to inet if you use IPv4 only. For IPv6 only set it to inet6.'
  describe sshd_config do
    its('AddressFamily') { should match(/inet|inet6|any/) }
  end
end
*wOpenSSH should be configured to the network family. Set it to inet if you use IPv4 only. For IPv6 only set it to inet6.2-
)ssh-baseline-master/controls/sshd_spec.rbmJu
failed>SSHD Configuration AddressFamily should match /inet|inet6|any/K"{:*&expected nil to match /inet|inet6|any/b�
sshd-09  �?Server: Specify ListenAddress"�control 'sshd-09' do
  impact 1.0
  title 'Server: Specify ListenAddress'
  desc "Limit the SSH server to listen to a specific address. Don't let it listen on all interfaces to avoid logins from unexpected sources."
  describe sshd_config do
    its('ListenAddress') { should match(/.*/) }
  end
end
*�Limit the SSH server to listen to a specific address. Don't let it listen on all interfaces to avoid logins from unexpected sources.2-
)ssh-baseline-master/controls/sshd_spec.rbvJ]
failed2SSHD Configuration ListenAddress should match /.*/$�:*expected nil to match /.*/b�
sshd-10  �?"Server: Specify protocol version 2"�control 'sshd-10' do
  impact 1.0
  title 'Server: Specify protocol version 2'
  desc "Only SSH protocol version 2 connections should be permitted. Version 1 of the protocol contains security vulnerabilities. Don't use legacy insecure SSHv1 connections anymore."
  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end
*�Only SSH protocol version 2 connections should be permitted. Version 1 of the protocol contains security vulnerabilities. Don't use legacy insecure SSHv1 connections anymore.2-
)ssh-baseline-master/controls/sshd_spec.rbJ8
passed)SSHD Configuration Protocol should eq "2""`:b�
sshd-11  �?Server: Enable StrictModes"�control 'sshd-11' do
  impact 1.0
  title 'Server: Enable StrictModes'
  desc 'Prevent the use of insecure home directory and key file permissions.'
  describe sshd_config do
    its('StrictModes') { should eq('yes') }
  end
end
*DPrevent the use of insecure home directory and key file permissions.2.
)ssh-baseline-master/controls/sshd_spec.rb�Js
failed.SSHD Configuration StrictModes should eq "yes"�]u:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-12  �?&Server: Specify SyslogFacility to AUTH"�control 'sshd-12' do
  impact 1.0
  title 'Server: Specify SyslogFacility to AUTH'
  desc 'Logging should be set to go to the /var/log/auth.log facility by using the SysLog AUTH parameter. This will ensure that any problems around invalid logins or the like are forwarded to a central security file for auditing purposes'
  describe sshd_config do
    its('SyslogFacility') { should eq('AUTH') }
  end
end
*�Logging should be set to go to the /var/log/auth.log facility by using the SysLog AUTH parameter. This will ensure that any problems around invalid logins or the like are forwarded to a central security file for auditing purposes2.
)ssh-baseline-master/controls/sshd_spec.rb�Jx
failed2SSHD Configuration SyslogFacility should eq "AUTH"�?]:*5
expected: "AUTH"
     got: nil

(compared using ==)
b�
sshd-13  �?#Server: Specify LogLevel to VERBOSE"�control 'sshd-13' do
  impact 1.0
  title 'Server: Specify LogLevel to VERBOSE'
  desc 'Be verbose in logging, to allow analysis in case of unexpected behavior.'
  describe sshd_config do
    its('LogLevel') { should eq('VERBOSE') }
  end
end
*HBe verbose in logging, to allow analysis in case of unexpected behavior.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jx
failed/SSHD Configuration LogLevel should eq "VERBOSE"3�Q:*8
expected: "VERBOSE"
     got: nil

(compared using ==)
b�
sshd-14  �?Server: Specify SSH HostKeys"�control 'sshd-14' do
  impact 1.0
  title 'Server: Specify SSH HostKeys'
  desc 'Specify HostKey for protection against Man-In-The-Middle Attacks'
  describe sshd_config do
    its('HostKey') { should cmp ssh_crypto.valid_hostkeys }
  end
end
*@Specify HostKey for protection against Man-In-The-Middle Attacks2.
)ssh-baseline-master/controls/sshd_spec.rb�J�
failed�SSHD Configuration HostKey should cmp == ["/etc/ssh/ssh_host_rsa_key", "/etc/ssh/ssh_host_ecdsa_key", "/etc/ssh/ssh_host_ed25519_key"]KY�:*�
expected: ["/etc/ssh/ssh_host_rsa_key", "/etc/ssh/ssh_host_ecdsa_key", "/etc/ssh/ssh_host_ed25519_key"]
     got: 

(compared using `cmp` matcher)
b�
sshd-15  �?Server: Specify UseLogin to NO"�control 'sshd-15' do
  impact 1.0
  title 'Server: Specify UseLogin to NO'
  desc 'Disable legacy login mechanism and do not use login for interactive login sessions.'
  describe sshd_config do
    its('UseLogin') { should eq('no') }
  end
end
*SDisable legacy login mechanism and do not use login for interactive login sessions.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jn
failed*SSHD Configuration UseLogin should eq "no"~b:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-16  �? Server: Use privilege separation"�control 'sshd-16' do
  impact 1.0
  title 'Server: Use privilege separation'
  desc 'UsePrivilegeSeparation is an option, when enabled will allow the OpenSSH server to run a small (necessary) amount of code as root and the of the code in a chroot jail environment. This enables ssh to deal incoming network traffic in an unprivileged child process to avoid privilege escalation by an attacker.'
  describe sshd_config do
    its('UsePrivilegeSeparation') { should eq(ssh_crypto.valid_privseparation) }
  end
end
*�UsePrivilegeSeparation is an option, when enabled will allow the OpenSSH server to run a small (necessary) amount of code as root and the of the code in a chroot jail environment. This enables ssh to deal incoming network traffic in an unprivileged child process to avoid privilege escalation by an attacker.2.
)ssh-baseline-master/controls/sshd_spec.rb�J�
failed=SSHD Configuration UsePrivilegeSeparation should eq "sandbox"��c:*8
expected: "sandbox"
     got: nil

(compared using ==)
b�
sshd-17  �?%Server: Disable PermitUserEnvironment"�control 'sshd-17' do
  impact 1.0
  title 'Server: Disable PermitUserEnvironment'
  desc 'Enabling environment processing may enable users to bypass access restrictions in some configurations using mechanisms such as LD_PRELOAD.'
  describe sshd_config do
    its('PermitUserEnvironment') { should eq('no') }
  end
end
*�Enabling environment processing may enable users to bypass access restrictions in some configurations using mechanisms such as LD_PRELOAD.2.
)ssh-baseline-master/controls/sshd_spec.rb�J{
failed7SSHD Configuration PermitUserEnvironment should eq "no":�[:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-18  �?Server: Specify LoginGraceTime"�control 'sshd-18' do
  impact 1.0
  title 'Server: Specify LoginGraceTime'
  desc 'The LoginGraceTime gives the user 30 seconds to accomplish a login. This could be used to conduct a Denial of Service (DoS) against a running SSH daemon.'
  describe sshd_config do
    its('LoginGraceTime') { should eq('30s') }
  end
end
*�The LoginGraceTime gives the user 30 seconds to accomplish a login. This could be used to conduct a Denial of Service (DoS) against a running SSH daemon.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jv
failed1SSHD Configuration LoginGraceTime should eq "30s"�+V:*4
expected: "30s"
     got: nil

(compared using ==)
b�
sshd-19  �?8Server: Specify Limit for maximum authentication retries"�control 'sshd-19' do
  impact 1.0
  title 'Server: Specify Limit for maximum authentication retries'
  desc 'MaxAuthTries limits the user to three wrong attempts before the login attempt is denied. This avoid resource starvation attacks.'
  describe sshd_config do
    its('MaxAuthTries') { should eq('2') }
  end
end
*�MaxAuthTries limits the user to three wrong attempts before the login attempt is denied. This avoid resource starvation attacks.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jp
failed-SSHD Configuration MaxAuthTries should eq "2"�X_:*2
expected: "2"
     got: nil

(compared using ==)
b�
sshd-20  �? Server: Specify maximum sessions"�control 'sshd-20' do
  impact 1.0
  title 'Server: Specify maximum sessions'
  desc 'Specifies the maximum number of open sessions permitted per network connection. This could be used to conduct a Denial of Service (DoS) against a running SSH daemon.'
  describe sshd_config do
    its('MaxSessions') { should eq('10') }
  end
end
*�Specifies the maximum number of open sessions permitted per network connection. This could be used to conduct a Denial of Service (DoS) against a running SSH daemon.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jq
failed-SSHD Configuration MaxSessions should eq "10"�J:*3
expected: "10"
     got: nil

(compared using ==)
b�
sshd-21  �? Server: Specify maximum startups"�control 'sshd-21' do
  impact 1.0
  title 'Server: Specify maximum startups'
  desc 'Limit the number of concurrent unauthenticated sessions to prevent Denial of Service (DoS) against a running SSH daemon.'
  describe sshd_config do
    its('MaxStartups') { should eq('10:30:100') }
  end
end
*xLimit the number of concurrent unauthenticated sessions to prevent Denial of Service (DoS) against a running SSH daemon.2.
)ssh-baseline-master/controls/sshd_spec.rb�J
failed4SSHD Configuration MaxStartups should eq "10:30:100"U��:*:
expected: "10:30:100"
     got: nil

(compared using ==)
b�
sshd-22  �?#Server: Enable PubkeyAuthentication"�control 'sshd-22' do
  impact 1.0
  title 'Server: Enable PubkeyAuthentication'
  desc 'Prefer public key authentication mechanisms, because other methods are weaker (e.g. passwords).'
  describe sshd_config do
    its('PubkeyAuthentication') { should eq('yes') }
  end
end
*_Prefer public key authentication mechanisms, because other methods are weaker (e.g. passwords).2.
)ssh-baseline-master/controls/sshd_spec.rb�J|
failed7SSHD Configuration PubkeyAuthentication should eq "yes"�v\:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-23  �?Server: Disable IgnoreRhosts"�control 'sshd-23' do
  impact 1.0
  title 'Server: Disable IgnoreRhosts'
  desc 'Ignore legacy .rhosts configuration, because rhosts are a weak way to authenticate systems and provide attacker more ways to enter the system.'
  describe sshd_config do
    its('IgnoreRhosts') { should eq('yes') }
  end
end
*�Ignore legacy .rhosts configuration, because rhosts are a weak way to authenticate systems and provide attacker more ways to enter the system.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jt
failed/SSHD Configuration IgnoreRhosts should eq "yes"j�l:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-24  �?#Server: Enable IgnoreUserKnownHosts"�control 'sshd-24' do
  impact 1.0
  title 'Server: Enable IgnoreUserKnownHosts'
  desc 'This option is a weak way for authentication and provide attacker more ways to enter the system.'
  describe sshd_config do
    its('IgnoreUserKnownHosts') { should eq('yes') }
  end
end
*`This option is a weak way for authentication and provide attacker more ways to enter the system.2.
)ssh-baseline-master/controls/sshd_spec.rb�J|
failed7SSHD Configuration IgnoreUserKnownHosts should eq "yes"J�T:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-25  �?'Server: Disable HostbasedAuthentication"�control 'sshd-25' do
  impact 1.0
  title 'Server: Disable HostbasedAuthentication'
  desc 'This option is a weak way for authentication and provide attacker more ways to enter the system.'
  describe sshd_config do
    its('HostbasedAuthentication') { should eq('no') }
  end
end
*`This option is a weak way for authentication and provide attacker more ways to enter the system.2.
)ssh-baseline-master/controls/sshd_spec.rb�J}
failed9SSHD Configuration HostbasedAuthentication should eq "no"oV:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-27  �?-Server: Disable password-based authentication"�control 'sshd-27' do
  impact 1.0
  title 'Server: Disable password-based authentication'
  desc 'Avoid password-based authentications.'
  describe sshd_config do
    its('PasswordAuthentication') { should eq('no') }
  end
end
*%Avoid password-based authentications.2.
)ssh-baseline-master/controls/sshd_spec.rb�J|
failed8SSHD Configuration PasswordAuthentication should eq "no"���:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-28  �?$Server: Disable PermitEmptyPasswords"�control 'sshd-28' do
  impact 1.0
  title 'Server: Disable PermitEmptyPasswords'
  desc 'Accounts should be protected and users should be accountable. For this reason the usage of empty passwords should never be allowed.'
  describe sshd_config do
    its('PermitEmptyPasswords') { should eq('no') }
  end
end
*�Accounts should be protected and users should be accountable. For this reason the usage of empty passwords should never be allowed.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jz
failed6SSHD Configuration PermitEmptyPasswords should eq "no"��]:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-29  �?/Server: Disable ChallengeResponseAuthentication"�control 'sshd-29' do
  impact 1.0
  title 'Server: Disable ChallengeResponseAuthentication'
  desc 'Avoid challenge-response and password-based authentications.'
  describe sshd_config do
    its('ChallengeResponseAuthentication') { should eq('no') }
  end
end
*<Avoid challenge-response and password-based authentications.2.
)ssh-baseline-master/controls/sshd_spec.rb�J�
failedASSHD Configuration ChallengeResponseAuthentication should eq "no"��m:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-30  �?Server: Disable Kerberos"�control 'sshd-30' do
  impact 1.0
  title 'Server: Disable Kerberos'
  desc 'Avoid kerberos authentication.'
  describe sshd_config do
    its('KerberosAuthentication') { should eq('no') }
  end
end
*Avoid kerberos authentication.2.
)ssh-baseline-master/controls/sshd_spec.rb�J|
failed8SSHD Configuration KerberosAuthentication should eq "no"'[:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-31  �?*Server: Disable Kerberos or Local Password"�control 'sshd-31' do
  impact 1.0
  title 'Server: Disable Kerberos or Local Password'
  desc 'Avoid kerberos authentication because it use password-based authentication as fallback.'
  describe sshd_config do
    its('KerberosOrLocalPasswd') { should eq('no') }
  end
end
*WAvoid kerberos authentication because it use password-based authentication as fallback.2.
)ssh-baseline-master/controls/sshd_spec.rb�J{
failed7SSHD Configuration KerberosOrLocalPasswd should eq "no"��\:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-32  �?$Server: Enable KerberosTicketCleanup"�control 'sshd-32' do
  impact 1.0
  title 'Server: Enable KerberosTicketCleanup'
  desc "Specifies whether to automatically destroy the user's ticket cache file on logout."
  describe sshd_config do
    its('KerberosTicketCleanup') { should eq('yes') }
  end
end
*RSpecifies whether to automatically destroy the user's ticket cache file on logout.2.
)ssh-baseline-master/controls/sshd_spec.rb�J}
failed8SSHD Configuration KerberosTicketCleanup should eq "yes"*8<:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-33  �?$Server: Disable GSSAPIAuthentication"�control 'sshd-33' do
  impact 1.0
  title 'Server: Disable GSSAPIAuthentication'
  desc 'If you do not use GSSAPI authentication then disable it.'
  describe sshd_config do
    its('GSSAPIAuthentication') { should eq('no') }
  end
end
*8If you do not use GSSAPI authentication then disable it.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jz
failed6SSHD Configuration GSSAPIAuthentication should eq "no"P�7:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-34  �?'Server: Enable GSSAPICleanupCredentials"�control 'sshd-34' do
  impact 1.0
  title 'Server: Enable GSSAPICleanupCredentials'
  desc "Automatically destroy the user's credentials cache on logout."
  describe sshd_config do
    its('GSSAPICleanupCredentials') { should eq('yes') }
  end
end
*=Automatically destroy the user's credentials cache on logout.2.
)ssh-baseline-master/controls/sshd_spec.rb�J�
failed;SSHD Configuration GSSAPICleanupCredentials should eq "yes"��I:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-35  �?Server: Disable TCPKeepAlive"�control 'sshd-35' do
  impact 1.0
  title 'Server: Disable TCPKeepAlive'
  desc 'Avoid the TCPKeepAlive messages to see if the client is still alive, because they are sent over unencrypted connection and are spoofable.'
  describe sshd_config do
    its('TCPKeepAlive') { should eq('no') }
  end
end
*�Avoid the TCPKeepAlive messages to see if the client is still alive, because they are sent over unencrypted connection and are spoofable.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jr
failed.SSHD Configuration TCPKeepAlive should eq "no"��W:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-36  �?#Server: Set a client alive interval"�control 'sshd-36' do
  impact 1.0
  title 'Server: Set a client alive interval'
  desc 'ClientAlive messages are sent over encrypted connection and are not spoofable.'
  describe sshd_config do
    its('ClientAliveInterval') { should eq('600') }
  end
end
*NClientAlive messages are sent over encrypted connection and are not spoofable.2.
)ssh-baseline-master/controls/sshd_spec.rb�J{
failed6SSHD Configuration ClientAliveInterval should eq "600"�Q:*4
expected: "600"
     got: nil

(compared using ==)
b�
sshd-37  �?-Server: Configure a few client alive counters"�control 'sshd-37' do
  impact 1.0
  title 'Server: Configure a few client alive counters'
  desc 'This indicates the total number of checkalive message sent by the ssh server without getting any response from the ssh client. ClientAlive messages are sent over encrypted connection and are not spoofable.'
  describe sshd_config do
    its('ClientAliveCountMax') { should eq('3') }
  end
end
*�This indicates the total number of checkalive message sent by the ssh server without getting any response from the ssh client. ClientAlive messages are sent over encrypted connection and are not spoofable.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jw
failed4SSHD Configuration ClientAliveCountMax should eq "3""�L:*2
expected: "3"
     got: nil

(compared using ==)
b�
sshd-38  �?Server: Disable tunnels"�control 'sshd-38' do
  impact 1.0
  title 'Server: Disable tunnels'
  desc 'Avoid to use tunnels.'
  describe sshd_config do
    its('PermitTunnel') { should eq('no') }
  end
end
*Avoid to use tunnels.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jr
failed.SSHD Configuration PermitTunnel should eq "no"F{<:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-39  �?Server: Disable TCP forwarding"�control 'sshd-39' do
  impact 1.0
  title 'Server: Disable TCP forwarding'
  desc 'If you use TCP forwarding in an uncontrolled manner then you can bypass the firewalls'
  describe sshd_config do
    its('AllowTcpForwarding') { should eq('no') }
  end
end
*UIf you use TCP forwarding in an uncontrolled manner then you can bypass the firewalls2.
)ssh-baseline-master/controls/sshd_spec.rb�Jx
failed4SSHD Configuration AllowTcpForwarding should eq "no"Dl0:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-40  �? Server: Disable Agent forwarding"�control 'sshd-40' do
  impact 1.0
  title 'Server: Disable Agent forwarding'
  desc "Users with the ability to bypass file permissions on the remote host (for the agent's UNIX-domain socket) can access the local agent through the forwarded connection. An attacker cannot obtain key material from the agent, however they can perform operations on the keys that enable them to authenticate using the identities loaded into the agent."
  describe sshd_config do
    its('AllowAgentForwarding') { should eq('no') }
  end
end
*�Users with the ability to bypass file permissions on the remote host (for the agent's UNIX-domain socket) can access the local agent through the forwarded connection. An attacker cannot obtain key material from the agent, however they can perform operations on the keys that enable them to authenticate using the identities loaded into the agent.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jz
failed6SSHD Configuration AllowAgentForwarding should eq "no"�x1:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-41  �?Server: Disable gateway ports"�control 'sshd-41' do
  impact 1.0
  title 'Server: Disable gateway ports'
  desc 'Prevent remote hosts from connecting to forwarded ports on the node.'
  describe sshd_config do
    its('GatewayPorts') { should eq('no') }
  end
end
*DPrevent remote hosts from connecting to forwarded ports on the node.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jr
failed.SSHD Configuration GatewayPorts should eq "no"wN3:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-42  �?Server: Disable X11Forwarding"�control 'sshd-42' do
  impact 1.0
  title 'Server: Disable X11Forwarding'
  desc 'Prevent X11 forwarding by default, as it can be used in a limited way to enable attacks.'
  describe sshd_config do
    its('X11Forwarding') { should eq('no') }
  end
end
*XPrevent X11 forwarding by default, as it can be used in a limited way to enable attacks.2.
)ssh-baseline-master/controls/sshd_spec.rb�Js
failed/SSHD Configuration X11Forwarding should eq "no"��N:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-43  �?Server: Enable X11UseLocalhost"�control 'sshd-43' do
  impact 1.0
  title 'Server: Enable X11UseLocalhost'
  desc 'SSH daemon should bind the X11 forwarding server to the loopback address. This prevents remote hosts from connecting to the proxy display and reduce the attack surface'
  describe sshd_config do
    its('X11UseLocalhost') { should eq('yes') }
  end
end
*�SSH daemon should bind the X11 forwarding server to the loopback address. This prevents remote hosts from connecting to the proxy display and reduce the attack surface2.
)ssh-baseline-master/controls/sshd_spec.rb�Jw
failed2SSHD Configuration X11UseLocalhost should eq "yes"�I:*4
expected: "yes"
     got: nil

(compared using ==)
b�
sshd-44  �?Server: Disable PrintMotd"�control 'sshd-44' do
  impact 1.0
  title 'Server: Disable PrintMotd'
  desc 'This specifies that the SSH daemon itself should not read and display the message of the day file.'
  describe sshd_config do
    its('PrintMotd') { should eq('no') }
  end
end
*bThis specifies that the SSH daemon itself should not read and display the message of the day file.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jo
failed+SSHD Configuration PrintMotd should eq "no"��K:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-45  �?Server: PrintLastLog"�control 'sshd-45' do
  impact 1.0
  title 'Server: PrintLastLog'
  desc 'This tells the SSH daemon to print out information about the last time you logged in.'
  describe sshd_config do
    its('PrintLastLog') { should eq('no') }
  end
end
*UThis tells the SSH daemon to print out information about the last time you logged in.2.
)ssh-baseline-master/controls/sshd_spec.rb�Jr
failed.SSHD Configuration PrintLastLog should eq "no"��Z:*3
expected: "no"
     got: nil

(compared using ==)
b�
sshd-46  �?Server: Banner"�control 'sshd-46' do
  impact 1.0
  title 'Server: Banner'
  desc 'Specifies a banner file to serve before authentication succeeds'
  describe sshd_config do
    its('Banner') { should eq('none') }
  end
end
*?Specifies a banner file to serve before authentication succeeds2.
)ssh-baseline-master/controls/sshd_spec.rb�Jp
failed*SSHD Configuration Banner should eq "none"�]Z:*5
expected: "none"
     got: nil

(compared using ==)
b�
sshd-47  �?Server: DebianBanner"�control 'sshd-47' do
  impact 1.0
  title 'Server: DebianBanner'
  desc 'Specifies whether to include OS distribution in version information'
  case os[:family]
  when 'debian' then
    describe sshd_config do
      its('DebianBanner') { should eq('no') }
    end
  else
    describe file(sshd_config.path) do
      its('content') { should_not match(/DebianBanner/) }
    end
  end
end
*CSpecifies whether to include OS distribution in version information2.
)ssh-baseline-master/controls/sshd_spec.rb�J<
passed-File  content should not match /DebianBanner/�519b�
sshd-48  �?Server: DH primes"�control 'sshd-48' do
  impact 1.0
  title 'Server: DH primes'
  desc 'Verifies if strong DH primes are used in /etc/ssh/moduli'
  describe command("test $(awk '$5 < 2047 && $5 ~ /^[0-9]+$/ { print $5 }' /etc/ssh/moduli | uniq | wc -c) -eq 0") do
    its('exit_status') { should eq 0 }
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end
*8Verifies if strong DH primes are used in /etc/ssh/moduli2.
)ssh-baseline-master/controls/sshd_spec.rb�J�
passed|Command test $(awk '$5 < 2047 && $5 ~ /^[0-9]+$/ { print $5 }' /etc/ssh/moduli | uniq | wc -c) -eq 0 exit_status should eq 0IL=J�
passedxCommand test $(awk '$5 < 2047 && $5 ~ /^[0-9]+$/ { print $5 }' /etc/ssh/moduli | uniq | wc -c) -eq 0 stdout should eq ""Xs�9J�
passedxCommand test $(awk '$5 < 2047 && $5 ~ /^[0-9]+$/ { print $5 }' /etc/ssh/moduli | uniq | wc -c) -eq 0 stderr should eq ""n�::��
apache-baselineDevSec Apache Baseline2.0.2"-Test-suite for best-practice apache hardening*DevSec Hardening Framework Team2
Apache-2.0:DevSec Hardening Framework TeamBhello@dev-sec.ioJ@678ce3873016a080288af9e22593269c5c7d294f766ccb4b2516ef8d80d4f10dR b�
	apache-01  �?Apache should be running"�control 'apache-01' do
  impact 1.0
  title 'Apache should be running'
  desc 'Apache should be running.'
  describe service(apache.service) do
    it { should be_installed }
    it { should be_running }
  end
end
*Apache should be running.22
.apache-baseline-master/controls/apache_spec.rbJ\
failed!Service httpd should be installed?�<**expected that `Service httpd` is installedJX
failedService httpd should be running��<*(expected that `Service httpd` is runningb�
	apache-02  �?Apache should be enabled"�control 'apache-02' do
  impact 1.0
  title 'Apache should be enabled'
  desc 'Configure apache service to be automatically started at boot time'
  only_if { os[:family] != 'ubuntu' && os[:release] != '16.04' } || only_if { os[:family] != 'debian' && os[:release] != '8' }
  describe service(apache.service) do
    it { should be_enabled }
  end
end
*AConfigure apache service to be automatically started at boot time22
.apache-baseline-master/controls/apache_spec.rb'JX
failedService httpd should be enabled)$�<*(expected that `Service httpd` is enabledb�
	apache-03   ?$Apache should start max. 1 root-task"�control 'apache-03' do
  title 'Apache should start max. 1 root-task'
  desc 'The Apache service in its own non-privileged account. If the web server process runs with administrative privileges, an attack who obtains control over the apache process may control the entire system.'
  total_tasks = command("ps aux | grep #{apache.service} | grep -v grep | grep root | wc -l | tr -d [:space:]").stdout.to_i
  describe total_tasks do
    it { should eq 1 }
  end
end
*�The Apache service in its own non-privileged account. If the web server process runs with administrative privileges, an attack who obtains control over the apache process may control the entire system.22
.apache-baseline-master/controls/apache_spec.rb1JL
failed0 should eq 1�ϝ9*.
expected: 1
     got: 0

(compared using ==)
b�
	apache-04  �?8Check Apache config folder owner, group and permissions."�control 'apache-04' do
  impact 1.0
  title 'Check Apache config folder owner, group and permissions.'
  desc 'The Apache config folder should owned and grouped by root, be writable, readable and executable by owner. It should be readable, executable by group and not readable, not writeable by others.'
  describe file(apache.conf_dir) do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should be_executable.by('owner') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should be_executable.by('group') }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should be_executable.by('others') }
  end
end
*�The Apache config folder should owned and grouped by root, be writable, readable and executable by owner. It should be readable, executable by group and not readable, not writeable by others.22
.apache-baseline-master/controls/apache_spec.rb:J�
failed*File /etc/httpd/ should be owned by "root"+�b:*Gexpected `File /etc/httpd/.owned_by?("root")` to return true, got falseJ�
failed.File /etc/httpd/ should be grouped into "root"C�9*Kexpected `File /etc/httpd/.grouped_into?("root")` to return true, got falseJn
failed,File /etc/httpd/ should be readable by ownerUg5:*1expected File /etc/httpd/ to be readable by ownerJn
failed,File /etc/httpd/ should be writable by ownerͯf9*1expected File /etc/httpd/ to be writable by ownerJr
failed.File /etc/httpd/ should be executable by owner�51:*3expected File /etc/httpd/ to be executable by ownerJn
failed,File /etc/httpd/ should be readable by group�p9*1expected File /etc/httpd/ to be readable by groupJ?
passed0File /etc/httpd/ should not be writable by group,GH9Jr
failed.File /etc/httpd/ should be executable by group0e`9*3expected File /etc/httpd/ to be executable by groupJ@
passed1File /etc/httpd/ should not be readable by others,D:J@
passed1File /etc/httpd/ should not be writable by others��9Jt
failed/File /etc/httpd/ should be executable by others�X_9*4expected File /etc/httpd/ to be executable by othersb�!
	apache-05  �?6Check Apache config file owner, group and permissions."�
control 'apache-05' do
  impact 1.0
  title 'Check Apache config file owner, group and permissions.'
  desc 'The Apache config file should owned and grouped by root, only be writable and readable by owner and not write- and readable by others.'
  describe file(apache.conf_path) do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should_not be_executable.by('owner') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
  describe file(File.join(apache.conf_dir, '/conf-enabled/hardening.conf')) do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should_not be_executable.by('owner') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end
*�The Apache config file should owned and grouped by root, only be writable and readable by owner and not write- and readable by others.22
.apache-baseline-master/controls/apache_spec.rbMJ�
failed9File /etc/httpd/conf/httpd.conf should be owned by "root"Ɏ�9*Vexpected `File /etc/httpd/conf/httpd.conf.owned_by?("root")` to return true, got falseJ�
failed=File /etc/httpd/conf/httpd.conf should be grouped into "root"�q�9*Zexpected `File /etc/httpd/conf/httpd.conf.grouped_into?("root")` to return true, got falseJ�
failed;File /etc/httpd/conf/httpd.conf should be readable by owner�vw9*@expected File /etc/httpd/conf/httpd.conf to be readable by ownerJ�
failed;File /etc/httpd/conf/httpd.conf should be writable by owner'�9*@expected File /etc/httpd/conf/httpd.conf to be writable by ownerJP
passedAFile /etc/httpd/conf/httpd.conf should not be executable by owner��*9J�
failed;File /etc/httpd/conf/httpd.conf should be readable by groupͯf9*@expected File /etc/httpd/conf/httpd.conf to be readable by groupJN
passed?File /etc/httpd/conf/httpd.conf should not be writable by group0e`9JP
passedAFile /etc/httpd/conf/httpd.conf should not be executable by group�/9JO
passed@File /etc/httpd/conf/httpd.conf should not be readable by othersˠ�9JO
passed@File /etc/httpd/conf/httpd.conf should not be writable by others4�79JQ
passedBFile /etc/httpd/conf/httpd.conf should not be executable by others$9J�
failedEFile /etc/httpd/conf-enabled/hardening.conf should be owned by "root"섗9*bexpected `File /etc/httpd/conf-enabled/hardening.conf.owned_by?("root")` to return true, got falseJ�
failedIFile /etc/httpd/conf-enabled/hardening.conf should be grouped into "root"ɑN9*fexpected `File /etc/httpd/conf-enabled/hardening.conf.grouped_into?("root")` to return true, got falseJ�
failedGFile /etc/httpd/conf-enabled/hardening.conf should be readable by ownerN+�9*Lexpected File /etc/httpd/conf-enabled/hardening.conf to be readable by ownerJ�
failedGFile /etc/httpd/conf-enabled/hardening.conf should be writable by ownerzlK9*Lexpected File /etc/httpd/conf-enabled/hardening.conf to be writable by ownerJ\
passedMFile /etc/httpd/conf-enabled/hardening.conf should not be executable by ownerzlK9J�
failedGFile /etc/httpd/conf-enabled/hardening.conf should be readable by groupj�l9*Lexpected File /etc/httpd/conf-enabled/hardening.conf to be readable by groupJZ
passedKFile /etc/httpd/conf-enabled/hardening.conf should not be writable by groupzl�9J\
passedMFile /etc/httpd/conf-enabled/hardening.conf should not be executable by group^�$9J[
passedLFile /etc/httpd/conf-enabled/hardening.conf should not be readable by others���9J[
passedLFile /etc/httpd/conf-enabled/hardening.conf should not be writable by othersͯf9J]
passedNFile /etc/httpd/conf-enabled/hardening.conf should not be executable by othersj�+9b�
	apache-06  �?%User and group should be set properly"�control 'apache-06' do
  impact 1.0
  title 'User and group should be set properly'
  desc 'For security reasons it is recommended to run Apache in its own non-privileged account.'
  describe apache_conf do
    its('User') { should eq [apache.user] }
    its('Group') { should eq [apache.user] }
  end
end
*WFor security reasons it is recommended to run Apache in its own non-privileged account.22
.apache-baseline-master/controls/apache_spec.rbmJf
skipped(Apache Config /etc/httpd/conf/httpd.conf�S�72,Can't find file "/etc/httpd/conf/httpd.conf"b�
	apache-07  �?Set the apache server token"�control 'apache-07' do
  impact 1.0
  title 'Set the apache server token'
  desc '\'ServerTokens Prod\' tells Apache to return only Apache as product in the server response header on the every page request'

  describe file(File.join(apache.conf_dir, '/conf-enabled/security.conf')) do
    its('content') { should match(/^ServerTokens Prod/) }
  end

  # open bug https://github.com/chef/inspec/issues/786, if the bug solved use this test
  # describe apache_conf do
  #   its('ServerTokens') { should eq 'Prod' }
  # end
end
*y'ServerTokens Prod' tells Apache to return only Apache as product in the server response header on the every page request22
.apache-baseline-master/controls/apache_spec.rbwJ�
failedTFile /etc/httpd/conf-enabled/security.conf content should match /^ServerTokens Prod/N+�9**expected nil to match /^ServerTokens Prod/b�
	apache-08  �?Should not load certain modules"�
control 'apache-08' do
  impact 1.0
  title 'Should not load certain modules'
  desc 'Apache HTTP should not load legacy modules'

  module_path = File.join(apache.conf_dir, '/mods-enabled/')
  loaded_modules = command('ls ' << module_path).stdout.split.keep_if { |file_name| /.load/.match(file_name) }

  loaded_modules.each do |id|
    describe file(File.join(module_path, id)) do
      its('content') { should_not match(/^\s*?LoadModule\s+?dav_module/) }
      its('content') { should_not match(/^\s*?LoadModule\s+?cgid_module/) }
      its('content') { should_not match(/^\s*?LoadModule\s+?cgi_module/) }
      its('content') { should_not match(/^\s*?LoadModule\s+?include_module/) }
    end
  end

  # open bug https://github.com/chef/inspec/issues/786, if the bug solved use this test
  # describe apache_conf do
  #   its('LoadModule') { should_not eq 'dav_module' }
  #   its('LoadModule') { should_not eq 'cgid_module' }
  #   its('LoadModule') { should_not eq 'cgi_module' }
  #   its('LoadModule') { should_not eq 'include_module' }
  #   its('content') { should_not match(/^\s*?LoadModule\s+?dav_module/) }
  #   its('content') { should_not match(/^\s*?LoadModule\s+?cgid_module/) }
  #   its('content') { should_not match(/^\s*?LoadModule\s+?cgi_module/) }
  #   its('content') { should_not match(/^\s*?LoadModule\s+?include_module/) }
  # end
end
**Apache HTTP should not load legacy modules23
.apache-baseline-master/controls/apache_spec.rb�b�
	apache-09  �?Disable TRACE-methods"�control 'apache-09' do
  impact 1.0
  title 'Disable TRACE-methods'
  desc 'The web server doesn’t allow TRACE request and help in blocking Cross Site Tracing attack.'

  describe file(File.join(apache.conf_dir, '/conf-enabled/security.conf')) do
    its('content') { should match(/^\s*?TraceEnable\s+?Off/) }
  end

  # open bug https://github.com/chef/inspec/issues/786, if the bug solved use this test
  # describe apache_conf do
  #   its('TraceEnable') { should eq 'Off' }
  # end
end
*\The web server doesn’t allow TRACE request and help in blocking Cross Site Tracing attack.23
.apache-baseline-master/controls/apache_spec.rb�J�
failedYFile /etc/httpd/conf-enabled/security.conf content should match /^\s*?TraceEnable\s+?Off/ͯ�9*/expected nil to match /^\s*?TraceEnable\s+?Off/b�
	apache-10  �?Disable insecure HTTP-methods"�control 'apache-10' do
  impact 1.0
  title 'Disable insecure HTTP-methods'
  desc 'Disable insecure HTTP-methods and allow only necessary methods.'

  describe file(File.join(apache.conf_dir, '/conf-enabled/hardening.conf')) do
    its('content') { should match(/^\s*?<LimitExcept\s+?GET\s+?POST>/) }
  end

  # open bug https://github.com/chef/inspec/issues/786, if the bug solved use this test
  # describe apache_conf do
  #   its('LimitExcept') { should eq ['GET','POST'] }
  # end
end
*?Disable insecure HTTP-methods and allow only necessary methods.23
.apache-baseline-master/controls/apache_spec.rb�J�
faileddFile /etc/httpd/conf-enabled/hardening.conf content should match /^\s*?<LimitExcept\s+?GET\s+?POST>/l�9*9expected nil to match /^\s*?<LimitExcept\s+?GET\s+?POST>/b�
	apache-11  �?GDisable Apache’s follows Symbolic Links for directories in alias.conf"�control 'apache-11' do
  impact 1.0
  title 'Disable Apache’s follows Symbolic Links for directories in alias.conf'
  desc 'Should include -FollowSymLinks or +SymLinksIfOwnerMatch for directories in alias.conf'

  describe file(File.join(apache.conf_dir, '/mods-enabled/alias.conf')) do
    its('content') { should match(/-FollowSymLinks/).or match(/\+SymLinksIfOwnerMatch/) }
  end
end
*UShould include -FollowSymLinks or +SymLinksIfOwnerMatch for directories in alias.conf23
.apache-baseline-master/controls/apache_spec.rb�J�
failedpFile /etc/httpd/mods-enabled/alias.conf content should match /-FollowSymLinks/ or match /\+SymLinksIfOwnerMatch/�\;*e   expected nil to match /-FollowSymLinks/

...or:

   expected nil to match /\+SymLinksIfOwnerMatch/b�
	apache-12  �?7Disable Directory Listing for directories in alias.conf"�control 'apache-12' do
  impact 1.0
  title 'Disable Directory Listing for directories in alias.conf'
  desc 'Should include -Indexes for directories in alias.conf'

  describe file(File.join(apache.conf_dir, '/mods-enabled/alias.conf')) do
    its('content') { should match(/-Indexes/) }
  end
end
*5Should include -Indexes for directories in alias.conf23
.apache-baseline-master/controls/apache_spec.rb�Jx
failedGFile /etc/httpd/mods-enabled/alias.conf content should match /-Indexes/�)�9* expected nil to match /-Indexes/b�

	apache-13  �?SSL honor cipher order"�control 'apache-13' do
  impact 1.0
  title 'SSL honor cipher order'
  desc 'When choosing a cipher during an SSLv3 or TLSv1 handshake, normally the client\'s preference is used. If this directive is enabled, the server\'s preference will be used instead.'

  describe file(File.join(apache.conf_dir, '/mods-enabled/ssl.conf')) do
    its('content') { should match(/^\s*?SSLHonorCipherOrder\s+?On/i) }
  end

  sites_enabled_path = File.join(apache.conf_dir, '/sites-enabled/')
  loaded_sites = command('ls ' << sites_enabled_path).stdout.split.keep_if { |file_name| /.conf/.match(file_name) }

  loaded_sites.each do |id|
    virtual_host = file(File.join(sites_enabled_path, id)).content.gsub(/#.*$/, '').scan(%r{<virtualhost.*443(.*?)<\/virtualhost>}im).flatten
    next if virtual_host.empty?
    describe virtual_host do
      it { should include(/^\s*?SSLHonorCipherOrder\s+?On/i) }
    end
  end
end
*�When choosing a cipher during an SSLv3 or TLSv1 handshake, normally the client's preference is used. If this directive is enabled, the server's preference will be used instead.23
.apache-baseline-master/controls/apache_spec.rb�J�
failed\File /etc/httpd/mods-enabled/ssl.conf content should match /^\s*?SSLHonorCipherOrder\s+?On/izlK9*7expected nil to match /^\s*?SSLHonorCipherOrder\s+?On/ib�
	apache-14  �?Enable Apache Logging"�control 'apache-14' do
  impact 1.0
  title 'Enable Apache Logging'
  desc 'Apache allows you to logging independently of your OS logging. It is wise to enable Apache logging, because it provides more information, such as the commands entered by users that have interacted with your Web server.'

  sites_enabled_path = File.join(apache.conf_dir, '/sites-enabled/')
  loaded_sites = command('ls ' << sites_enabled_path).stdout.split.keep_if { |file_name| /.conf/.match(file_name) }

  loaded_sites.each do |id|
    describe file(File.join(sites_enabled_path, id)).content.gsub(/#.*$/, '').scan(%r{<virtualhost(.*?)<\/virtualhost>}im).flatten do
      it { should include(/CustomLog.*$/i) }
    end
  end
end
*�Apache allows you to logging independently of your OS logging. It is wise to enable Apache logging, because it provides more information, such as the commands entered by users that have interacted with your Web server.23
.apache-baseline-master/controls/apache_spec.rb�