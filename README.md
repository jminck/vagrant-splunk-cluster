# CentOS 7 Splunk cluster install via Ansible

forked from https://github.com/phips/splunkbox

Installs and sets running Splunk, on top of a [@core CentOS 7 Vagrant Box](https://atlas.hashicorp.com/centos/boxes/7).

You need to have [Ansible](http://ansible.com) installed prior to spinning this box up.

Look at [playbook.yml](http://github.com/jminck/vagrant-splunk-cluster/blob/master/playbook.yml) to see what Ansible is doing to the base CentOS [box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

**Software versions information**

| Software              | Version     | Download                        |
| --------------------------------- | ----------- | ----------------------------------------- |
| CentOS|7.0| Guest OS <br/> VMWare and Virtual box :[chef/centos-7.0](https://atlas.hashicorp.com/centos/boxes/7) <br/> & parallels : [parallels/centos-7.1](https://atlas.hashicorp.com/parallels/boxes/centos-7.1) |
| Splunk              | 6.4.0    |    [Download Splunk](https://www.splunk.com/page/download_track?file=6.4.0/linux/splunk-6.4.0-f2c836328108-linux-2.6-x86_64.rpm&platform=Linux&architecture=x86_64&version=6.4.0&product=splunk&typed=release&name=linux_installer) |
| Splunk Forwarder                     | 6.4.0      | [Download Splunk Forwarder](https://www.splunk.com/page/download_track?file=6.4.0/linux/splunkforwarder-6.4.0-f2c836328108-Linux-x86_64.tgz&platform=Linux&architecture=x86_64&version=6.4.0&product=universalforwarder&typed=release&name=linux_installer)  |
| Sideview app | 1.3.5 | [Download](https://splunkbase.splunk.com/)|
| S.o.S. Splunk on Splunk | 3.2.1 | [Download](https://splunkbase.splunk.com/app/748/)|
| Splunk 6.x Dashboard Examples | 5.0.1| [Download](https://splunkbase.splunk.com/app/1603/)|
| Splunk App for Unix and Linux | 5.1.0| [Download](https://splunkbase.splunk.com/app/273/)|
| Virtualbox VM Additions | 5.0.16| Extract from Virtualbox additions ISO)|

The VMs will boot and install Splunk and will also install nginx from [EPEL](https://fedoraproject.org/wiki/EPEL), set it listening on port 80, and proxy to Splunk. There are notes in the [splunk.conf](http://github.com/minck/vagrant-splunk-cluster/blob/master/templates/splunk.conf.j2) file about how to listen on https, and how to use basic authentication.

There are also a number of Splunk '[must have](http://wiki.splunk.com/Things_I_wish_I_knew_then)' apps that are installed. You'll need to download these from [apps.splunk.com]() first - all the URLs are noted in [the playbook](http://github.com/phips/splunkbox/blob/master/playbook.yml). If you want to skip them, just set installapps to false (with [extra-vars](http://docs.ansible.com/playbooks_variables.html#passing-variables-on-the-command-line) - see the [Vagrantfile](http://github.com/minck/vagrant-splunk-cluster/blob/master/Vagrantfile)).
NOTE - this is a work in progress, some of the apps being installed are deprecated with the version of splunk being installed. Currently they are still being installed, won't hurt anything but may not work properly.
