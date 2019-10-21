Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399ADDE3FD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 07:42:36 +0200 (CEST)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMQSg-0007dw-O3
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 01:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iMQRA-0007Ap-D8
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 01:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iMQR8-0004a2-Bh
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 01:41:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:58916)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iMQR8-0004Za-3h
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 01:40:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iMQR6-0003sJ-IK
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 05:40:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 898D12E80C7
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 05:40:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Oct 2019 05:35:25 -0000
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: kvm powerpcm qemu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aik-ozlabs dwg sathnaga
X-Launchpad-Bug-Reporter: Satheesh Rajendran (sathnaga)
X-Launchpad-Bug-Modifier: Satheesh Rajendran (sathnaga)
References: <157061153044.21976.18153238088035049329.malonedeb@gac.canonical.com>
Message-Id: <157163612550.19689.3698871930027214627.malone@gac.canonical.com>
Subject: [Bug 1847440] Re: ppc64le: KVM guest fails to boot with an error
 `virtio_scsi: probe of virtio1 failed with error -22` on master
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5e2632d718897b4af5751503979d78ead8b61a94
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1847440 <1847440@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same observation with smp 1 even.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847440

Title:
  ppc64le: KVM guest fails to boot with an error `virtio_scsi: probe of
  virtio1 failed with error -22` on master

Status in QEMU:
  New

Bug description:
  PowerPC KVM Guest fails to boot on current qemu master, bad commit:
  e68cd0cb5cf49d334abe17231a1d2c28b846afa2

  Env:
  HW: IBM Power9
  Host Kernel: 5.4.0-rc2-00038-ge3280b54afed
  Guest Kernel: 4.13.9-300.fc27.ppc64le
  Qemu: https://github.com/qemu/qemu.git (master)
  Libvirt: 5.4.0

  Guest boot gets stuck:
  ...
  [  OK  ] Mounted Kernel Configuration File System.
  [    7.598740] virtio-pci 0000:00:01.0: enabling device (0000 -> 0003)
  [    7.598828] virtio-pci 0000:00:01.0: virtio_pci: leaving for legacy dr=
iver
  [    7.598957] virtio-pci 0000:00:02.0: enabling device (0000 -> 0003)
  [    7.599017] virtio-pci 0000:00:02.0: virtio_pci: leaving for legacy dr=
iver
  [    7.599123] virtio-pci 0000:00:04.0: enabling device (0000 -> 0003)
  [    7.599182] virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy dr=
iver
  [    7.620620] synth uevent: /devices/vio: failed to send uevent
  [    7.620624] vio vio: uevent: failed to send synthetic uevent
  [  OK  ] Started udev Coldplug all Devices.
  [    7.624559] audit: type=3D1130 audit(1570610300.990:5): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-ud=
ev-trigger comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
  [  OK  ] Reached target System Initialization.
  [  OK  ] Reached target Basic System.
  [  OK  ] Reached target Remote File Systems (Pre).
  [  OK  ] Reached target Remote File Systems.
  [    7.642961] virtio_scsi: probe of virtio1 failed with error -22
  [ ***  ] A start job is running for dev-disk=E2=80=A621b3519a80.device (1=
4s / no limit)
  ...

  git bisect, yielded a bad commit
  [e68cd0cb5cf49d334abe17231a1d2c28b846afa2] spapr: Render full FDT on
  ibm,client-architecture-support, reverting this commit boot the guest
  properly.

  git bisect start
  # good: [9e06029aea3b2eca1d5261352e695edc1e7d7b8b] Update version for v4.=
1.0 release
  git bisect good 9e06029aea3b2eca1d5261352e695edc1e7d7b8b
  # bad: [98b2e3c9ab3abfe476a2b02f8f51813edb90e72d] Merge remote-tracking b=
ranch 'remotes/stefanha/tags/block-pull-request' into staging
  git bisect bad 98b2e3c9ab3abfe476a2b02f8f51813edb90e72d
  # good: [56e6250ede81b4e4b4ddb623874d6c3cdad4a96d] target/arm: Convert T1=
6, nop hints
  git bisect good 56e6250ede81b4e4b4ddb623874d6c3cdad4a96d
  # good: [5d69cbdfdd5cd6dadc9f0c986899844a0e4de703] tests/tcg: target/s390=
x: Test MVC
  git bisect good 5d69cbdfdd5cd6dadc9f0c986899844a0e4de703
  # good: [88112488cf228df8b7588c8aa38e16ecd0dff48e] qapi: Make check_type(=
)'s array case a bit more obvious
  git bisect good 88112488cf228df8b7588c8aa38e16ecd0dff48e
  # good: [972bd57689f1e11311d86b290134ea2ed9c7c11e] ppc/kvm: Skip writing =
DPDES back when in run time state
  git bisect good 972bd57689f1e11311d86b290134ea2ed9c7c11e
  # bad: [1aba8716c8335e88b8c358002a6e1ac89f7dd258] ppc/pnv: Remove the XIC=
SFabric Interface from the POWER9 machine
  git bisect bad 1aba8716c8335e88b8c358002a6e1ac89f7dd258
  # bad: [00ed3da9b5c2e66e796a172df3e19545462b9c90] xics: Minor fixes for X=
ICSFabric interface
  git bisect bad 00ed3da9b5c2e66e796a172df3e19545462b9c90
  # good: [33432d7737b53c92791f90ece5dbe3b7bb1c79f5] target/ppc: introduce =
set_dfp{64,128}() helper functions
  git bisect good 33432d7737b53c92791f90ece5dbe3b7bb1c79f5
  # good: [f6d4c423a222f02bfa84a49c3d306d7341ec9bab] target/ppc: remove unn=
ecessary if() around calls to set_dfp{64,128}() in DFP macros
  git bisect good f6d4c423a222f02bfa84a49c3d306d7341ec9bab
  # bad: [e68cd0cb5cf49d334abe17231a1d2c28b846afa2] spapr: Render full FDT =
on ibm,client-architecture-support
  git bisect bad e68cd0cb5cf49d334abe17231a1d2c28b846afa2
  # good: [c4ec08ab70bab90685d1443d6da47293e3aa312a] spapr-pci: Stop provid=
ing assigned-addresses
  git bisect good c4ec08ab70bab90685d1443d6da47293e3aa312a
  # first bad commit: [e68cd0cb5cf49d334abe17231a1d2c28b846afa2] spapr: Ren=
der full FDT on ibm,client-architecture-support

  attached vmxml.

  qemu commandline:
  /home/sath/qemu/ppc64-softmmu/qemu-system-ppc64 -name guest=3Dvm1,debug-t=
hreads=3Don -S -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/=
libvirt/qemu/domain-19-vm1/master-key.aes -machine pseries-4.2,accel=3Dkvm,=
usb=3Doff,dump-guest-core=3Doff -m 81920 -overcommit mem-lock=3Doff -smp 51=
2,sockets=3D1,cores=3D128,threads=3D4 -uuid fd4a5d54-0216-490e-82d2-1d4e896=
83b3d -display none -no-user-config -nodefaults -chardev socket,id=3Dcharmo=
nitor,fd=3D24,server,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3D=
control -rtc base=3Dutc -no-shutdown -boot strict=3Don -device qemu-xhci,id=
=3Dusb,bus=3Dpci.0,addr=3D0x3 -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.=
0,addr=3D0x2 -drive file=3D/home/sath/tests/data/avocado-vt/images/jeos-27-=
ppc64le_vm1.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 -device s=
csi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=3Ddrive-scsi=
0-0-0-0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 -netdev ta=
p,fd=3D26,id=3Dhostnet0,vhost=3Don,vhostfd=3D27 -device virtio-net-pci,netd=
ev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:e6:df:24,bus=3Dpci.0,addr=3D0x1 -cha=
rdev pty,id=3Dcharserial0 -device spapr-vty,chardev=3Dcharserial0,id=3Dseri=
al0,reg=3D0x30000000 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,a=
ddr=3D0x4 -M pseries,ic-mode=3Dxics -msg timestamp=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847440/+subscriptions

