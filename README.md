# Vagrant CentOS 7 Splunk cluster deployment via Ansible

forked from https://github.com/phips/splunkbox

Installs and configures a Splunk cluster, on top of a [CentOS 7 Vagrant Box](https://atlas.hashicorp.com/centos/boxes/7).

You need to have [Ansible](http://ansible.com) installed prior to spinning this box up.

Look at [playbook.yml](http://github.com/jminck/vagrant-splunk-cluster/blob/master/playbook.yml) (for indexers and search heads), and [uf-playbook.yml](http://github.com/jminck/vagrant-splunk-cluster/blob/master/uf-playbook.yml) (for the universal forwarder) to see what Ansible is doing to the base CentOS [box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

**Software versions information**

| Software              | Version     | Download                        |
| --------------------------------- | ----------- | ----------------------------------------- |
| Splunk              | 6.5.1    |    [Download Splunk](https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.5.1&product=splunk&filename=splunk-6.5.1-f74036626f0c-linux-2.6-x86_64.rpm&wget=true) |
| Splunk Forwarder                     | 6.5.1      | [Download Splunk Forwarder](https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.5.1&product=universalforwarder&filename=splunkforwarder-6.5.1-f74036626f0c-linux-2.6-x86_64.rpm&wget=true)  |
| Sideview app | 1.3.5 | [Download](https://splunkbase.splunk.com/)|
| S.o.S. Splunk on Splunk | 3.2.1 | [Download](https://splunkbase.splunk.com/app/748/)|
| Splunk 6.x Dashboard Examples | 5.0.1| [Download](https://splunkbase.splunk.com/app/1603/)|
| Splunk App for Unix and Linux | 5.1.0| [Download](https://splunkbase.splunk.com/app/273/)|
| Virtualbox VM Additions | 5.0.16| Extract from Virtualbox additions ISO)|
| Download these requirements from my archive | all | [download](https://goo.gl/FLeBOU)


The VMs will boot and install Splunk and will also install nginx from [EPEL](https://fedoraproject.org/wiki/EPEL), set it listening on port 80, and proxy to Splunk. There are notes in the [splunk.conf](http://github.com/minck/vagrant-splunk-cluster/blob/master/templates/splunk.conf.j2) file about how to listen on https, and how to use basic authentication.

There are also a number of Splunk '[must have](http://wiki.splunk.com/Things_I_wish_I_knew_then)' apps that are installed. You'll need to download these from [apps.splunk.com]() first - all the URLs are noted in [the playbook](http://github.com/phips/splunkbox/blob/master/playbook.yml). If you want to skip them, just set installapps to false (with [extra-vars](http://docs.ansible.com/playbooks_variables.html#passing-variables-on-the-command-line) - see the [Vagrantfile](http://github.com/minck/vagrant-splunk-cluster/blob/master/Vagrantfile)).
NOTE - this is a work in progress, some of the apps being installed are deprecated with the version of splunk being installed. Currently they are still being installed, won't hurt anything but may not work properly.

<br />
**MACHINE CONFIGURATION**

| VM Name|Default IP| VM Port <=> Host Port|Description|
| -------|----------|----------------------|-----------|
|master|192.168.33.101|8000<=>8001|cluster master|
|index1|192.168.33.102|8000<=>8002|indexer node|
|index2|192.168.33.103|8000<=>8003|indexer node|
|index3|192.168.33.104|8000<=>8004|indexer node|
|index4|192.168.33.105|8000<=>8005|indexer node|
|search1|192.168.33.106|8000<=>8006|search head|
|search2|192.168.33.107|8000<=>8007|search head|
|search3|192.168.33.108|8000<=>8008|search head|
|uf1|192.168.33.109|N/A|universal forwarder|




1. Pre Requisite & Set up
--

**Must have on your host machine**

* VirtualBox (I'm using 5.0.15)
* Vagrant (I'm using 1.8.1)
* Ansible installed on the host machine (I'm using 2.0.2.0)
  -  I'm running on a MAC, so I installed [Brew] (http://brew.sh/) and then ran **brew install ansible** to get ansible installed on my host machine

**Clone this repository**

`git clone https://github.com/jminck/vagrant-splunk-cluster.git`

**Download Installation Files**

Download the software requirements for the Splunk cluster from their respective authoritative locations outlined above in teh Software Versions Information table, or from my archive [download](https://goo.gl/FLeBOU)
*	Place all the files sw/ subfolder of this repo. the sw/ folder should have the following contents:

   | File Size        |  File name                                      |
   |------------------|-------------------------------------------------|
   |197800    | sideview-utils-lgpl_135.tgz                             |
   |222276777 | splunk-6.4.0-f2c836328108-linux-2.6-x86_64.rpm          |
   |4239833   | splunk-6x-dashboard-examples_501.tgz                    |
   |2370913   | splunk-app-for-unix-and-linux_510.tgz                   |
   |19671080  | splunkforwarder-6.4.0-f2c836328108-linux-2.6-x86_64.rpm |
   |43529656  |vmadditions.tar.gz                                       |
   |659k  |app-for-twitter-data_301.tgz                                       |

*	Optional - grab sampledata/ folder from my download link and unzip to sampledata/ subfolder in repo
  note - this is not used in any automation process, so its not a requirement for the deployment to work

2. Launch a new Splunk cluster
--

**Launch the cluster deployment**

Simply go in the cloned directory (vagrant-splunk-cluster by default).<br />
Execute this command :
**vagrant up**

3. Access the cluster
--

**Open Splunk console in browser**
Access the splunk console on master node via [http://localhost:8001 ] (http://localhost:8001)<br />
**username:** admin <br />
**password:** splunk <br />
(default Splunk credentials are admin/changeme but Ansible automation sets the password to "splunk" during installation) <br />
