Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F95367925
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:16:54 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRht-0000dd-O8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRgB-0007kS-4V
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:15:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:48674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRg1-0006y8-Pm
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:15:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRfy-0001sj-VF
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:14:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DE5F02E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:14:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:05:27 -0000
From: Thomas Huth <1568621@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: billcoder th-huth
X-Launchpad-Bug-Reporter: William (billcoder)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160410222330.32588.14949.malonedeb@soybean.canonical.com>
Message-Id: <161906792762.22647.9640237685556504269.malone@gac.canonical.com>
Subject: [Bug 1568621] Re: input-linux misdetects Logitech keyboard as a mouse
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 9957a7ffd653767e9f1706799ab287e5222b2b13
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
Reply-To: Bug 1568621 <1568621@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1568621

Title:
  input-linux misdetects Logitech keyboard as a mouse

Status in QEMU:
  Incomplete

Bug description:
  The new input-linux.c code misdetects my Logitech K350 keyboard as a
  mouse.  The bug is in the input_linux_complete function.  The evdev
  for this keyboard returns an "evtmap" with the EV_REL bit set.  Full
  evtmap is 0x0012001F.  Using a different keyboard everything works as
  intended, so my configuration and setup are correct otherwise.

  =

  Suggestion:

  I suggest adding an object property called something like "type" where
  the user can specify what the device type is manually.  This K350
  keyboard shows that "evtmap" cannot be used to reliably detect the
  device type.  Since specifying the device type manually is not an
  undue burden, perhaps it should be a required option and there should
  be no autodetection?

  =

  System:

  Arch linux, using qemu-git AUR package installed 20160409.

  =

  Command line:

  LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
  QEMU_AUDIO_DRV=3Dnone /usr/sbin/qemu-system-x86_64 -name win10,debug-
  threads=3Don -S -machine pc-i440fx-2.4,accel=3Dkvm,usb=3Doff,vmport=3Doff=
 -cpu
  host,kvm=3Doff -drive file=3D/usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-
  efi.fd,if=3Dpflash,format=3Draw,unit=3D0,readonly=3Don -drive
  file=3D/var/lib/libvirt/qemu/nvram/win10_VARS.fd,if=3Dpflash,format=3Draw=
,unit=3D1
  -m 8196 -realtime mlock=3Doff -smp 8,sockets=3D1,cores=3D4,threads=3D2 -u=
uid
  58623778-9d9d-4d30-8ec0-b37e12a30fdc -nographic -no-user-config
  -nodefaults -chardev
  socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-17-win10/moni=
tor.sock,server,nowait
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc
  base=3Dlocaltime,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddisca=
rd
  -no-hpet -no-shutdown -global PIIX4_PM.disable_s3=3D1 -global
  PIIX4_PM.disable_s4=3D1 -boot strict=3Don -device ich9-usb-
  ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0x6.0x7 -device ich9-usb-
  uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpci.0,multifunction=3Don,addr=
=3D0x6
  -device ich9-usb-
  uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpci.0,addr=3D0x6.0x1 -device =
ich9
  -usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpci.0,addr=3D0x6.0x2 -dr=
ive
  file=3D/var/lib/libvirt/images/ISOs/Win10_1511_English_x64.iso,format=3Dr=
aw,if=3Dnone,id
  =3Ddrive-ide0-0-1,readonly=3Don -device ide-cd,bus=3Dide.0,unit=3D1,drive
  =3Ddrive-ide0-0-1,id=3Dide0-0-1 -drive file=3D/var/lib/libvirt/images/ISOs
  /virtio-win-0.1.112.iso,format=3Draw,if=3Dnone,id=3Ddrive-
  ide0-1-0,readonly=3Don -device ide-cd,bus=3Dide.1,unit=3D0,drive=3Ddrive-
  ide0-1-0,id=3Dide0-1-0 -drive file=3D/dev/sda,format=3Draw,if=3Dnone,id=
=3Ddrive-
  virtio-disk1 -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x8,dri=
ve
  =3Ddrive-virtio-disk1,id=3Dvirtio-disk1,bootindex=3D1 -netdev
  tap,fd=3D26,id=3Dhostnet0 -device
  rtl8139,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:70:8a:db,bus=3Dpci.0,a=
ddr=3D0x3
  -netdev tap,fd=3D28,id=3Dhostnet1 -device
  rtl8139,netdev=3Dhostnet1,id=3Dnet1,mac=3Dd4:be:d9:56:2e:35,bus=3Dpci.0,a=
ddr=3D0x9
  -device intel-hda,id=3Dsound0,bus=3Dpci.0,addr=3D0x4 -device hda-
  duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -device vfio-
  pci,host=3D04:00.0,id=3Dhostdev0,bus=3Dpci.0,addr=3D0x2 -device virtio-
  balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x7 -object input-
  linux,id=3Dkbd1,evdev=3D/dev/input/event19,grab_all=3Don -object input-
  linux,id=3Dkbb2,evdev=3D/dev/input/event2 -msg timestamp=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1568621/+subscriptions

