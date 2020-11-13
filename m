Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90292B1F64
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:59:06 +0100 (CET)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbTd-0007WT-Pp
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQZ-0004B8-04
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:43338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQW-0000Rs-CI
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbQV-0003At-8j
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 408702E80E9
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 15:46:12 -0000
From: Thomas Huth <1787070@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: furretuber kraxel-redhat th-huth
X-Launchpad-Bug-Reporter: FurretUber (furretuber)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153429832178.24411.17323780348611441441.malonedeb@soybean.canonical.com>
Message-Id: <160528237207.29443.13726940277667126566.malone@wampee.canonical.com>
Subject: [Bug 1787070] Re: Guests using the qxl-vga are freezing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: e09ce9b0f79e91e969c824129344310bc4c1a933
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1787070 <1787070@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1787070

Title:
  Guests using the qxl-vga are freezing

Status in QEMU:
  Incomplete

Bug description:
  I have noticed that guests using qxl-vga are freezing. They may freeze
  after a few minutes or after many hours. The freeze consists of the
  entire system hanging, except the cursor, but the cursor animation
  stops too. Changing to tty is not possible after this. There are three
  things noticed in common on the guests when they freeze:

  -The guest is using the QXL VGA (freezes weren't observed with other VGAs=
);
  -A new workload is starting;
  -The mouse cursor is the animated as the one of loading. For example, htt=
ps://i.imgur.com/raQFteG.png
   =

  The host is Xubuntu 18.04 amd64, QEMU version is 3.0.0-dirty. The guests =
tested were:

  -openSUSE Tumbleweed;
  -openSUSE Leap 15;
  -Xubuntu 18.04 Bionic Beaver;
  -CentOS 7.

  With openSUSE guests, the install process couldn't even be finished,
  as the installer would freeze. There were 2 GB of available memory
  (checked in a tty before the freeze) and netconsole was enabled.
  Unfortunately, it was impossible to obtain any information from them.
  This is an image of one openSUSE guest frozen:
  https://i.imgur.com/ZP0eQKq.png

  The command line used was:

  qemu-system-x86_64 -nodefaults -m 3072 -M pc,usb=3Dtrue -accel kvm -cpu
  host -smp cores=3D2,threads=3D2 -device qemu-xhci -drive
  id=3Dcentusb,if=3Dnone,file=3Dleap.qcow2 -device usb-
  storage,id=3Dcentusb,drive=3Dcentusb -netdev user,id=3Dn0 -device usb-
  tablet,id=3Dusbtablet -device e1000,netdev=3Dn0 -device usb-
  audio,id=3Dusbaudio -device qxl-vga,xres=3D1366,yres=3D768 -display gtk
  -monitor vc -serial vc  -cdrom "openSUSE-Leap-15.0-DVD-x86_64.iso"
  -boot d

  With CentOS guests, the install process fail sometimes, but sometimes
  it's able to install. However, on the yum update, it would freeze too.
  In one instance it froze while updating glibc, which made the guest
  unbootable. https://i.imgur.com/B3WhSDX.png

  The command line used was:

  qemu-system-x86_64 -nodefaults -m 2048 -M pc,usb=3Dtrue -accel kvm -cpu
  host -smp cores=3D2,threads=3D2 -device qemu-xhci -drive
  id=3Dcentusb,if=3Dnone,file=3Dcentos.qcow2 -device usb-
  storage,id=3Dcentusb,drive=3Dcentusb -netdev user,id=3Dn0 -device usb-
  tablet,id=3Dusbtablet -device e1000,netdev=3Dn0 -device usb-
  audio,id=3Dusbaudio -device virtio-vga,virgl=3Dtrue -display gtk -monitor
  vc -serial vc -cdrom "CentOS-7-livecd-GNOME-x86_64.iso" -bios
  /usr/share/ovmf/OVMF.fd

  With Xubuntu 18.04 guests, the system worked for many hours until the
  freeze happened. On this case it happened when opening Audacious.
  Fortunately, the logging services worked for some time, which allowed
  me to get a relevant message which can be seen at
  http://termbin.com/nuof . It repeated a few times, but then the
  logging stopped. https://i.imgur.com/2zckqj5.png shows the guest
  screen in the moment it froze.

  The command line used was:

  qemu-system-x86_64 -nodefaults -m 1024 -M pc,usb=3Dtrue -accel kvm -cpu
  host -smp cores=3D2,threads=3D2 -device qemu-xhci -drive
  id=3Dcentusb,if=3Dnone,file=3Dxubmini -device usb-
  storage,id=3Dcentusb,drive=3Dcentusb -netdev user,id=3Dn0 -device usb-
  tablet,id=3Dusbtablet -device e1000,netdev=3Dn0 -device usb-
  audio,id=3Dusbaudio -device qxl-vga,xres=3D1366,yres=3D768 -display gtk
  -monitor vc -serial vc

  I'm sorry for not having more detailed information but, even setting
  netconsole, openSUSE and CentOS guests were unable to print any
  information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1787070/+subscriptions

