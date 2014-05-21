---
title: "Arken Quickstart Guide"
date: "2014-05-14"
groups: ['gettingStarted']
linktitle: "Quickstart"
groups_weight: 10
---

## Getting Started

### nuxeo.io Clustering

#### Single VM setup

- Go to `nuxeo.io/vms` folder
- Run `vagrant up`
- Run `vagrant status` to check if a virtual machine is running:

        nxio-core-01              running (virtualbox)

#### Multi VMs setup

To start several VMs and really mimic a cluster, edit the `VagrantFile` file and change the number of `NUM_INSTANCES` to the desired number of VMs. Due to `etcd`, you need at least three VMs.

- Run `vagrant status` to check if a virtual machine is running:

        nxio-core-01              running (virtualbox)
        nxio-core-02              running (virtualbox)
        nxio-core-03              running (virtualbox)

### nuxeo.io Front Application

- [Download a Nuxeo server](http://www.nuxeo.com/en/downloads) (the zip version)
- Go to `nuxeo.io/manager` folder
- Run `mvn clean install -Pmarketplace`
- The marketplace zip is generated: `nuxeo.io/manager/marketplace-nuxeo-io/marketplace/target/marketplace-nuxeo-io-1.0-SNAPSHOT.zip`
- Install nuxeo-io addon from command line
  - Linux/Mac:
    - `NUXEO_HOME/bin/nuxeoctl mp-init`
    - `NUXEO_HOME/bin/nuxeoctl mp-install marketplace-nuxeo-io-1.0-SNAPSHOT.zip`
    - `NUXEO_HOME/bin/nuxeoctl start`
  - Windows:
    - `NUXEO_HOME\bin\nuxeoctl.bat mp-init`
    - `NUXEO_HOME\bin\nuxeoctl.bat mp-install marketplace-nuxeo-io-1.0-SNAPSHOT.zip`
    - `NUXEO_HOME\bin\nuxeoctl.bat start`
- From your browser, go to `http://localhost:8080/nuxeo`

- Follow Nuxeo Wizard by clicking 'Next' buttons, re-start once completed

- Check Nuxeo correctly re-started `http://localhost:8080/nuxeo/nuxeo.io`
  - username: Administrator
  - password: Administrator

## Creating nuxeo.io Cloud Instances

- Back to the shell where Nuxeo server has been started, run following commands:
    - Go to `nuxeo.io/vms`
    - Run `source setup_fleet_tunnel.sh` to create `fleet` SSH tunneling

- From your browser, go to `http://localhost:8080/nuxeo`
    - Create a "Client"

    ![](/img/nuxeoioDM1.png)

    ![](/img/nuxeoioDM2.png)

    - Make sure you have all these documents created

    ![](/img/nuxeoioDM3.png)

- From your browser, go to `http://localhost:8080/nuxeo/nuxeo.io`
    - Click on Environment

    ![](/img/nuxeoioSC1.png)

    - Create an environment (for instance `nuxeo-demo`)

    ![](/img/nuxeoioSC2.png)

    - Click on Start button

    - Before clicking on the new Nuxeo cloud `Domain` instance link, you have to configure locally your `hosts configuration`:
        - Open your Terminal and edit /etc/hosts file
        - Add a new entry on a new line: `127.0.0.1 nuxeo-demo-vlad.trial.nuxeo.io`

    - Open your browser @ `http://nuxeo-demo-vlad.trial.nuxeo.io:7777` or click on the `Domain` instance link

    ![](/img/nuxeoioSC3.png)

- Miscellaneous
    - You can click on Stop button to suspend your instance
    - Clicking the Delete button will remove all instance data
