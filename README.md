# packer-vagrant-builder

#### Table of Contents

1. [Project Description - What this project does and why it is usefull](#project-description)
2. [Requirements - The basics of getting started with packer-vagrant-builder](#requirements)
3. [Usage - How to build a box](#usage)
    * [Build a base box](#build-a-base-box)
    * [Customize Puppet version](#customize-puppet-version)
    * [Customize salt version](#customize-salt-version)
4. [Reference - An under-the-hood peek at what this project is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Project Description

packer-vagrant-builder is a project that encapsulates [Packer](https://www.packer.io) templates for building [Vagrant](https://www.vagrantup.com) base boxes.

## Requirements

* [Packer](https://www.packer.io/downloads.html), tested with 1.0.0
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads), tested with 5.1.18

## Usage

All interaction is done via `packer`.

### Build a base box

To build a base box with CentOS 6.8 (64 bit):

```
$ packer build centos-6.8-x86_64.json
```

To build a base box with CentOS 6.8 (64 bit) and Puppet Agent 1.4.1 pre-installed (which can be used with the Vagrant Puppet Apply provisioner):

```
$ packer build centos-6.8-x86_64-puppet.json
```

To build a base box with CentOS 6.8 (64 bit) and salt-minion 2016.11 pre-installed:

```
$ packer build centos-6.8-x86_64-salt.json
```

### Customize Puppet version

To install Puppet Agent 1.8.0 on CentOS 7.3:

```
$ packer build -var 'puppet_version=1.8.0-1' centos-7.3-x86_64-puppet.json
```

### Customize salt version

To install salt-minion 2016.3 on CentOS 7.3:

```
$ packer build -var 'salt_version=2016.3-1' centos-7.3-x86_64-salt.json
```

## Reference

### Templates

* `centos-6.8-x86_64.json`: Create a CentOS 6.8 (64 bit) server.
* `centos-7.3-x86_64.json`: Create a CentOS 7.3.1611 (64 bit) server.
* `centos-6.8-x86_64-puppet.json`: Create a CentOS 6.8 (64 bit) server with Puppet Agent 1.4.1 pre-installed.
* `centos-7.3-x86_64-puppet.json`: Create a CentOS 7.3 (64 bit) server with Puppet Agent 1.4.1 pre-installed.
* `centos-6.8-x86_64-salt.json`: Create a CentOS 6.8 (64 bit) server with salt-minion 2016.11 pre-installed.
* `centos-7.3-x86_64-salt.json`: Create a CentOS 7.3 (64 bit) server with salt-minion 2016.11 pre-installed.

## Limitations

This project has been tested on:

* Windows 7 Enterprise

Testing on other platforms cannot be guaranteed.