Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C137085B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:08:23 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcu2Q-0008U6-2l
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzt-0006j6-4W
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:43194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzq-0004ry-4Y
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lctzn-0004ca-Vz
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 18:05:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF7B82E8024
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 18:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 17:58:50 -0000
From: Thomas Huth <1750899@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor namelles.one th-huth
X-Launchpad-Bug-Reporter: Michael Akushsky (namelles.one)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151924508195.2772.10456724922935523718.malonedeb@soybean.canonical.com>
Message-Id: <161989193037.3863.8142098678661114292.malone@chaenomeles.canonical.com>
Subject: [Bug 1750899] Re: Mouse cursor sometimes can't pass the invisible
 border on the right side of the screen
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: b32d431040359a0c97dd6a684d89e04fd9a1d942
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
Reply-To: Bug 1750899 <1750899@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/76


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #76
   https://gitlab.com/qemu-project/qemu/-/issues/76

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1750899

Title:
  Mouse cursor sometimes can't pass the invisible border on the right
  side of the screen

Status in QEMU:
  Expired

Bug description:
  I'm using qemu 2.11 on Gentoo Linux, with configured GPU passthrough (Rad=
eon RX580) to the guest Windows 10.
  This configuration is alive for last 4 years, this time I changed a lot q=
emu, linux kernel and windows versions, changed GPU and always all was work=
ing as expected. I always used standard PS/2 mouse emulation and that was e=
nough for me.

  Now, I bought two new monitors, instead of old one, and setup them as
  one logical monitor, using technology called Eyefinity - it's a part
  of standard Radeon software. Now Windows thinks, that I have one
  monitor with resolution 2160x1920 (I bought Dell monitors with a thin
  borders and use them in portrait mode).

  Windows uses it without any problems, but mouse become crazy - sometimes =
(~3 times from each 5) I can't move cursor to the right border of the scree=
n, it looks like the invisible vertical border. I spent really huge amount =
of time to understand, which component is the root of problem and found, th=
at it's really a mouse. I tried all possible variants (standard, tablet, vi=
rtio-mouse-pci, virtio-tablet-pci), and found, that in both mouse variants =
bug is reproducing, and in both tablet variants - cursor stuck near all rea=
l borders and corners, so it's not a variant too.
  The only working variant becomes passing real USB port to my VM and inser=
t second mouse to this port. So, now it's working, but I have two mice on m=
y working place, which doesn't seems very useful.

  Here is my command line:

  QEMU_AUDIO_DRV=3Dpa QEMU_PA_SAMPLES=3D4096 qemu-system-x86_64 -enable-kvm=
 -M q35 -m 12168 -cpu host,kvm=3Doff -smp 4,sockets=3D1,cores=3D4 \
  -bios /usr/share/qemu/bios.bin -rtc base=3Dlocaltime -vga none -device se=
condary-vga \
  -drive id=3Dvirtiocd,if=3Dnone,format=3Draw,file=3D/home/akushsky/virtio-=
win-0.1.141.iso \
  -device driver=3Dide-cd,bus=3Dide.1,drive=3Dvirtiocd \
  -device ioh3420,bus=3Dpcie.0,addr=3D1c.0,multifunction=3Don,port=3D1,chas=
sis=3D1,id=3Droot.1 \
  -device vfio-pci,host=3D05:00.0,bus=3Droot.1,addr=3D00.0,multifunction=3D=
on,romfile=3D/opt/kvm/images/Sapphire.RX580.8192.170320_1.bin,x-vga=3Don \
  -device virtio-scsi-pci,id=3Dscsi \
  -drive file=3D/dev/sdb,id=3Ddisk,format=3Draw,if=3Dnone,discard=3Don,cach=
e=3Dnone,aio=3Dnative,detect-zeroes=3Dunmap -device scsi-hd,drive=3Ddisk,id=
=3Dscsi0 \
  -device ich9-intel-hda,bus=3Dpcie.0,addr=3D1b.0,id=3Dsound0 -device hda-d=
uplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 \
  -usb -usbdevice host:046d:c52b

  All in all, I checked on Windows 7 and Windows 10, and on qemu 2.10
  and 2.11 - bug is always reproducible.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1750899/+subscriptions

