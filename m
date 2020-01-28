Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4314B35E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 12:11:53 +0100 (CET)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwOme-0001f6-CS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 06:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iwOls-0001Cs-Pz
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:11:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iwOlr-0001ET-C9
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:11:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:45742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iwOlr-0001Da-53
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:11:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iwOlp-0006D7-Eh
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 11:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6CC9E2E80CB
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 11:11:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jan 2020 10:58:17 -0000
From: Frank Heimes <1859656@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=maas; status=New; importance=Undecided;
 assignee=lee.trager@canonical.com; 
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntu-z-systems; status=Triaged; importance=High;
 assignee=maas; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fheimes ltrager paelzer sfeole
X-Launchpad-Bug-Reporter: Sean Feole (sfeole)
X-Launchpad-Bug-Modifier: Frank Heimes (fheimes)
References: <157902669328.14768.4315907500950527119.malonedeb@wampee.canonical.com>
Message-Id: <158020909766.19232.18348718339215570447.malone@gac.canonical.com>
Subject: [Bug 1859656] Re: [2.6] Unable to reboot s390x KVM machine after
 initial deploy
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3f7dcde994e6be0b25b1274fba8c91c01e664d0e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1859656 <1859656@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It took some time (due to travel), but I was now able to do a setup
based on the old 2.6.0 version [2.6.0 (7803-g6fc5f26eb-
0ubuntu1~18.04.1)] for testing.

And with the combination:

$ apt-cache policy maas
maas:
  Installed: 2.6.0-7803-g6fc5f26eb-0ubuntu1~18.04.1
  Candidate: 2.6.0-7803-g6fc5f26eb-0ubuntu1~18.04.1
  Version table:
 *** 2.6.0-7803-g6fc5f26eb-0ubuntu1~18.04.1 500
        500 http://ppa.launchpad.net/maas-maintainers/testing/ubuntu bionic=
/main s390x Packages
        100 /var/lib/dpkg/status
     2.4.2-7034-g2f5deb8b8-0ubuntu1 500
        500 http://us.ports.ubuntu.com/ubuntu-ports bionic-updates/main s39=
0x Packages
     2.4.0~beta2-6865-gec43e47e6-0ubuntu1 500
        500 http://us.ports.ubuntu.com/ubuntu-ports bionic/main s390x Packa=
ges
and:
$ apt-cache policy qemu
qemu:
  Installed: (none)
  Candidate: 1:2.11+dfsg-1ubuntu7.21
  Version table:
     1:2.11+dfsg-1ubuntu7.21 500
        500 http://us.ports.ubuntu.com/ubuntu-ports bionic-updates/universe=
 s390x Packages
     1:2.11+dfsg-1ubuntu7.20 500
        500 http://ports.ubuntu.com/ubuntu-ports bionic-security/universe s=
390x Packages
     1:2.11+dfsg-1ubuntu7 500
        500 http://us.ports.ubuntu.com/ubuntu-ports bionic/universe s390x P=
ackages
the system seems to successful commissions, similar to the latest maas 2.6.=
2 version (see above).
But then the VM ends again in state Ready / off.

virsh shows the VM as shutoff:
ubuntu@s1lp11:~$ sudo -H -u maas bash -c 'virsh -c qemu+ssh://ubuntu@192.16=
8.122.1/system list --all'
ubuntu@192.168.122.1's password: =

 Id    Name                           State
----------------------------------------------------
 -     vm1                            shut off

The os element looks like this - with the two entries:
  <os>
    <type arch=3D's390x' machine=3D's390-ccw-virtio-bionic'>hvm</type>
    <boot dev=3D'network'/>
    <boot dev=3D'hd'/>
  </os>

A manual start (with the help of virsh, console enabled) shows that it
network boots (see attachment).

Removing the network entry and booting didn't work - looks like no OS
deployed on disk yet.

To sum it up - also not working on this 2.6.0 env. that I've just
created.


** Attachment added: "boot_console.txt"
   https://bugs.launchpad.net/ubuntu-z-systems/+bug/1859656/+attachment/532=
3507/+files/boot_console.txt

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859656

Title:
  [2.6] Unable to reboot s390x KVM machine after initial deploy

Status in MAAS:
  New
Status in QEMU:
  Incomplete
Status in Ubuntu on IBM z Systems:
  Triaged

Bug description:
  MAAS version: 2.6.1 (7832-g17912cdc9-0ubuntu1~18.04.1)
  Arch: S390x

  Appears that MAAS can not find the s390x bootloader to boot from the
  disk, not sure how maas determines this.  However this was working in
  the past. I had originally thought that if the maas machine was
  deployed then it defaulted to boot from disk.

  If I force the VM to book from disk, the VM starts up as expected.

  Reproduce:

  - Deploy Disco on S390x KVM instance
  - Reboot it

  on the KVM console...

  Connected to domain s2lp6g001
  Escape character is ^]
  done
  =C2=A0=C2=A0Using IPv4 address: 10.246.75.160
  =C2=A0=C2=A0Using TFTP server: 10.246.72.3
  =C2=A0=C2=A0Bootfile name: 'boots390x.bin'
  =C2=A0=C2=A0Receiving data:  0 KBytes
  =C2=A0=C2=A0TFTP error: file not found: boots390x.bin
  Trying pxelinux.cfg files...
  =C2=A0=C2=A0Receiving data:  0 KBytes
  =C2=A0=C2=A0Receiving data:  0 KBytes
  Failed to load OS from network

  =3D=3D> /var/log/maas/rackd.log <=3D=3D
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] boots39=
0x.bin requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/6=
5a9ca43-9541-49be-b315-e2ca85936ea2 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
1-52-54-00-e5-d7-bb requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64BA0 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64BA requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64B requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF6 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
A requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/d=
efault requested by 10.246.75.160

To manage notifications about this bug go to:
https://bugs.launchpad.net/maas/+bug/1859656/+subscriptions

