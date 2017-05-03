# packer-vagrant-builder

#### Table of Contents

1. [Project Description - What this project does and why it is usefull](#project-description)
2. [Requirements - The basics of getting started with packer-vagrant-builder](#requirements)
3. [Usage - How to build a box](#usage)
    * [Build a base box](#build-a-base-box)
4. [Reference - An under-the-hood peek at what this project is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Project Description

packer-vagrant-builder is a project that encapsulates [Packer](https://www.packer.io) templates for building [Vagrant](https://www.vagrantup.com) base boxes with Puppet pre-installed.

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

## Reference

### Templates

* `centos-6.8-x86_64`: Create a CentOS 6.8 (64 bit) server
* `centos-7.3-x86_64`: Create a CentOS 7.3.1611 (64 bit) server

## Limitations

This project has been tested on:

* Windows 7 Enterprise

Testing on other platforms cannot be guaranteed