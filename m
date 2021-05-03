Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B95371251
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:13:49 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldTi9-0002dp-1k
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldTfS-0001VX-5w
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:50394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldTfP-0001mM-Dq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:11:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldTfN-0003yC-B8
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F1362E815D
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 08:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 08:05:09 -0000
From: Ravishankar <1920752@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: passthrough usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kraxel-redhat philmd rreddy78
X-Launchpad-Bug-Reporter: Ravishankar (rreddy78)
X-Launchpad-Bug-Modifier: Ravishankar (rreddy78)
References: <161641534336.27708.1507547188965412298.malonedeb@gac.canonical.com>
Message-Id: <162002910952.13621.16504276001301839652.malone@wampee.canonical.com>
Subject: [Bug 1920752] Re: USB SoundCard Passthrough not working on arm64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 187c14779544cb337ff05f636e2b99073bf83c9b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1920752 <1920752@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more point. The solution above is not usb passthrough.
I just noticed that qemu needs to be configured for usb passthrough. I am t=
rying that out now

Configure with --enable-libusb
  libusb          libusb (for usb passthrough)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920752

Title:
  USB SoundCard Passthrough not working on arm64

Status in QEMU:
  New

Bug description:
  Hello,

  I am virtualizing a armhf guest on a aarch64 host and was to use my
  Sound Blaster USB Soundcard as passthrough.

  armhf Guest is: Debian Buster =

  aarch64 host is a jetson nano. KVM is enabled.

  Latest qemu is built from sources.
  The command I use for running is as follows:

  ../qemu/build/qemu-system-aarch64 -M virt -m 2048 -smp 2 -cpu host,aarch6=
4=3Doff -enable-kvm  \
  -kernel vmlinuz-4.19.0-14-armmp-lpae  -initrd initrd.img-4.19.0-14-armmp-=
lpae -append 'root=3D/dev/vda2' \
  -device nec-usb-xhci -device usb-kbd  -device usb-mouse -device usb-host,=
hostbus=3D1,hostport=3D2.3  -serial stdio  \
  -device virtio-gpu-pci,virgl=3Don,xres=3D1600,yres=3D900 -display sdl,gl=
=3Don \
  -drive if=3Dnone,file=3Dhda2.qcow2,format=3Dqcow2,id=3Dhd   -device virti=
o-blk-device,drive=3Dhd   \
  -netdev user,id=3Dmynet   -device virtio-net-device,netdev=3Dmynet \
  -bios edk2-arm-code.fd -no-reboot

  =

  Where are my lsusb -t shows:

  rreddy78@jetson-nano:~/Downloads$ lsusb -t
  /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dtegra-xusb/4p, 5000M
      |__ Port 1: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
  /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dtegra-xusb/5p, 480M
      |__ Port 2: Dev 6, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
          |__ Port 1: Dev 7, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
          |__ Port 1: Dev 7, If 1, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
          |__ Port 3: Dev 8, If 3, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 12M
          |__ Port 3: Dev 8, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
          |__ Port 3: Dev 8, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
          |__ Port 3: Dev 8, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
          |__ Port 4: Dev 9, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M

  Within the VM I can see the usb as follows

  rreddy78@debian:~$ lsusb -t
  /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 5000M
  /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
      |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusb=
hid, 480M
      |__ Port 2: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Dusb=
hid, 480M

  =

  Its looks like some passthrough as but it seems like only for

   _ Port 3: Dev 8, If 3, Class=3DHuman Interface Device, Driver=3Dusbhid,
  12M

  I am not sure if passthrough  even works because this post I saw

  https://community.arm.com/developer/ip-products/system/f/embedded-
  forum/48031/usb-pass-through-in-qemu-command-line-for-arm-
  machines/168764#168764

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920752/+subscriptions

