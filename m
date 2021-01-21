Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E632FE818
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:53:01 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XaF-00080p-KY
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2XYs-0007To-Ui
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:51:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:56964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2XYp-00082O-1S
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:51:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l2XYl-0006LP-Jx
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:51:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 94C9B2E8144
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:51:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Jan 2021 10:37:36 -0000
From: Michael Akushsky <1750899@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor namelles.one th-huth
X-Launchpad-Bug-Reporter: Michael Akushsky (namelles.one)
X-Launchpad-Bug-Modifier: Michael Akushsky (namelles.one)
References: <151924508195.2772.10456724922935523718.malonedeb@soybean.canonical.com>
Message-Id: <161122545816.19640.8333070723607504262.launchpad@wampee.canonical.com>
Subject: [Bug 1750899] Re: Mouse cursor sometimes can't pass the invisible
 border on the right side of the screen
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 3d6921f6cbc9ffb269705cc1234fa7c9a287824f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

** Changed in: qemu
       Status: Expired =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1750899

Title:
  Mouse cursor sometimes can't pass the invisible border on the right
  side of the screen

Status in QEMU:
  New

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

