Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27602B9C89
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:10:23 +0100 (CET)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrCA-0004An-PR
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfr7b-0007dt-NJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:05:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:51732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfr7V-0002wl-29
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:05:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfr7U-0004DG-0v
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 21:05:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 004322E813B
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 21:05:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 20:51:15 -0000
From: Thomas Huth <1518969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhorban th-huth ztehypervisor
X-Launchpad-Bug-Reporter: Marian Horban (mhorban)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151123131945.18364.72616.malonedeb@soybean.canonical.com>
Message-Id: <160581907532.18379.11927667507742457897.malone@gac.canonical.com>
Subject: [Bug 1518969] Re: Instance of QEMU doesn't unplug virtio scsi disk
 after device_del and drive_del commands
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: b1f68ca61b38465980e30bd18e18b167758f91ac
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1518969 <1518969@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1518969

Title:
  Instance of QEMU doesn't unplug virtio scsi disk after device_del and
  drive_del commands

Status in QEMU:
  Incomplete

Bug description:
  device_del and drive_del commands don't cause virtio disk detaching

  Steps to reproduce:
  1. Run instance

  2. Attach virtio scsi disk

  3. Reboot instance

  4. Immediately after reboot detach disk with QEMU commands:
  device_del
  drive_del

  Expected result:
  Disk should be detached anyway

  Actual:
  Domain info contains attached disk even after waiting long period of time=
(5 min in my case).

  Additional info:
  QEMU process:
  root     29010 42.6  1.9 562036 61272 ?        Rl   03:42   0:01 /usr/bin=
/qemu-system-x86_64 -name instance-00000069 -S -machine pc-i440fx-trusty,ac=
cel=3Dtcg,usb=3Doff -m 64 -realtime mlock=3Doff -smp 1,sockets=3D1,cores=3D=
1,threads=3D1 -uuid d2418536-2547-4740-96b5-0d4f1d74b9f3 -smbios type=3D1,m=
anufacturer=3DOpenStack Foundation,product=3DOpenStack Nova,version=3D13.0.=
0,serial=3D1fd8f69a-909b-4ed1-aae9-4fc9318fc622,uuid=3Dd2418536-2547-4740-9=
6b5-0d4f1d74b9f3,family=3DVirtual Machine -no-user-config -nodefaults -char=
dev socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/instance-00000069.=
monitor,server,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontro=
l -rtc base=3Dutc -no-shutdown -boot strict=3Don -kernel /opt/stack/data/no=
va/instances/d2418536-2547-4740-96b5-0d4f1d74b9f3/kernel -initrd /opt/stack=
/data/nova/instances/d2418536-2547-4740-96b5-0d4f1d74b9f3/ramdisk -append r=
oot=3D/dev/vda console=3Dtty0 console=3DttyS0 no_timer_check -device piix3-=
usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 -drive file=3D/opt/stack/data/=
nova/instances/d2418536-2547-4740-96b5-0d4f1d74b9f3/disk,if=3Dnone,id=3Ddri=
ve-virtio-disk0,format=3Dqcow2,cache=3Dnone -device virtio-blk-pci,scsi=3Do=
ff,bus=3Dpci.0,addr=3D0x4,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,boot=
index=3D1 -drive file=3D/opt/stack/data/nova/instances/d2418536-2547-4740-9=
6b5-0d4f1d74b9f3/disk.config,if=3Dnone,id=3Ddrive-ide0-1-1,readonly=3Don,fo=
rmat=3Draw,cache=3Dnone -device ide-cd,bus=3Dide.1,unit=3D1,drive=3Ddrive-i=
de0-1-1,id=3Dide0-1-1 -netdev tap,fd=3D18,id=3Dhostnet0 -device virtio-net-=
pci,netdev=3Dhostnet0,id=3Dnet0,mac=3Dfa:16:3e:1a:10:3d,bus=3Dpci.0,addr=3D=
0x3 -chardev file,id=3Dcharserial0,path=3D/opt/stack/data/nova/instances/d2=
418536-2547-4740-96b5-0d4f1d74b9f3/console.log -device isa-serial,chardev=
=3Dcharserial0,id=3Dserial0 -chardev pty,id=3Dcharserial1 -device isa-seria=
l,chardev=3Dcharserial1,id=3Dserial1 -vnc 127.0.0.1:1 -k en-us -device cirr=
us-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 -device virtio-balloon-pci,id=3Db=
alloon0,bus=3Dpci.0,addr=3D0x5

  QEMU version:
  qemu-system-x86_64 --version
  QEMU emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.19), Copyright (c=
) 2003-2008 Fabrice Bellard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1518969/+subscriptions

