Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5437468E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:52:36 +0200 (CEST)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLhL-0001Pl-FY
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfX-0000bX-Iz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:51734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfV-0007jF-Az
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leLfS-0002GP-Ct
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 17:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F9772E8135
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 17:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 17:41:59 -0000
From: Thomas Huth <1821771@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: kvm numa powerpc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sathnaga th-huth
X-Launchpad-Bug-Reporter: Satheesh Rajendran (sathnaga)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155361583469.17984.11681376513113338670.malonedeb@gac.canonical.com>
Message-Id: <162023651982.3268.15567641757088072355.malone@gac.canonical.com>
Subject: [Bug 1821771] Re: KVM guest does not reflect numa distances
 configured through qemu 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: dd15452bc0cce3623fd4269246d58517f5389dd6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1821771 <1821771@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821771

Title:
  KVM guest does not reflect numa distances configured through qemu

Status in QEMU:
  Incomplete

Bug description:
  KVM guest does not reflect numa distances configured through qemu

  Env:
  Host/Guest Kernel: 5.1.0-rc1-g72999bbdc
  qemu : 3.1.90 (v2.8.0-rc0-18614-g278aebafa0-dirty) [repo: https://github.=
com/dgibson/qemu; branch:ppc-for-4.1 ]
  # git log -1
  commit 278aebafa02f699857ca082d966bcbc05dc9bffb (HEAD -> ppc-for-4.1)
  Author: Jafar Abdi <cafer.abdi@gmail.com>
  Date:   Sat Mar 23 17:26:36 2019 +0300

      tests/libqos: fix usage of bool in pci-spapr.c
      =

      Clean up wrong usage of FALSE and TRUE in places that use "bool" from=
 stdbool.h.
      =

      FALSE and TRUE (with capital letters) are the constants defined by gl=
ib for
      being used with the "gboolean" type of glib. But some parts of the co=
de also use
      TRUE and FALSE for variables that are declared as "bool" (the type fr=
om <stdbool.h>).
      =

      Signed-off-by: Jafar Abdi <cafer.abdi@gmail.com>
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Message-Id: <1553351197-14581-4-git-send-email-cafer.abdi@gmail.com>
      Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

  # libvirtd -V
  libvirtd (libvirt) 5.1.0


  Steps to reproduce:
  1. Boot attached guest xml with predefined numa distance.

  qemu-commandline:
  /usr/share/avocado-plugins-vt/bin/install_root/bin/qemu-system-ppc64 -nam=
e guest=3Dvm2,debug-threads=3Don -S -object secret,id=3DmasterKey0,format=
=3Draw,file=3D/var/lib/libvirt/qemu/domain-15-vm2/master-key.aes -machine p=
series-4.0,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -m 4096 -realtime ml=
ock=3Doff -smp 4,sockets=3D1,cores=3D4,threads=3D1 -numa node,nodeid=3D0,cp=
us=3D0-1,mem=3D2048 -numa node,nodeid=3D1,cpus=3D2-3,mem=3D2048 -uuid 1a870=
f1d-269a-4a8c-84bc-2b5bda72823a -display none -no-user-config -nodefaults -=
chardev socket,id=3Dcharmonitor,fd=3D28,server,nowait -mon chardev=3Dcharmo=
nitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shutdown -boot strict=
=3Don -kernel /home/kvmci/linux/vmlinux -append root=3D/dev/sda2 rw console=
=3Dtty0 console=3DttyS0,115200 init=3D/sbin/init  initcall_debug selinux=3D=
0 -device qemu-xhci,id=3Dusb,bus=3Dpci.0,addr=3D0x3 -device virtio-scsi-pci=
,id=3Dscsi0,bus=3Dpci.0,addr=3D0x2 -drive file=3D/var/lib/avocado/data/avoc=
ado-vt/images/jeos-27-ppc64le.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-scs=
i0-0-0-0 -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,devi=
ce_id=3Ddrive-scsi0-0-0-0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootin=
dex=3D1 -netdev tap,fd=3D30,id=3Dhostnet0,vhost=3Don,vhostfd=3D31 -device v=
irtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:f4:f5:f6,bus=3Dpci=
.0,addr=3D0x1 -chardev pty,id=3Dcharserial0 -device spapr-vty,chardev=3Dcha=
rserial0,id=3Dserial0,reg=3D0x30000000 -device virtio-balloon-pci,id=3Dball=
oon0,bus=3Dpci.0,addr=3D0x4 -msg timestamp=3Don

  =

  2. Check numa distance and other details inside guest
  # numactl -H
  available: 2 nodes (0-1)
  node 0 cpus: 0 1
  node 0 size: 2025 MB
  node 0 free: 1837 MB
  node 1 cpus: 2 3
  node 1 size: 2045 MB
  node 1 free: 1646 MB
  node distances:
  node   0   1 =

    0:  10  40 -----------------------------------NOK
    1:  40  10 =


  # lsprop /proc/device-tree/cpus/PowerPC\,POWER9\@*/ibm\,associativity =

  /proc/device-tree/cpus/PowerPC,POWER8@0/ibm,associativity
  		 00000005 00000000 00000000 00000000 00000000 00000000
  /proc/device-tree/cpus/PowerPC,POWER8@10/ibm,associativity
  		 00000005 00000000 00000000 00000000 00000001 00000010
  /proc/device-tree/cpus/PowerPC,POWER8@18/ibm,associativity
  		 00000005 00000000 00000000 00000000 00000001 00000018
  /proc/device-tree/cpus/PowerPC,POWER8@8/ibm,associativity
  		 00000005 00000000 00000000 00000000 00000000 00000008

  # lsprop /proc/device-tree/rtas/ibm,associativity-reference-points
  /proc/device-tree/rtas/ibm,associativity-reference-points
  		 00000004 00000004

  Expected numa distances:
  node distances:
  node   0   1 =

    0:  10  20
    1:  20  10

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821771/+subscriptions

