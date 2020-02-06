Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECEA154B13
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 19:27:24 +0100 (CET)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izls3-00058G-F0
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 13:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1izlqN-0003eB-GW
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 13:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1izlqM-0001IT-3l
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 13:25:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:53750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1izlqL-0001IF-UB
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 13:25:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1izlqJ-0004nb-1o
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 18:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F32F82E80C7
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 18:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Feb 2020 18:20:13 -0000
From: Chris Hoy <1862110@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrs-hoy
X-Launchpad-Bug-Reporter: Chris Hoy (chrs-hoy)
X-Launchpad-Bug-Modifier: Chris Hoy (chrs-hoy)
References: <158096626936.9041.17441916407484515612.malonedeb@chaenomeles.canonical.com>
Message-Id: <158101321405.8518.10145910469180108963.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1862110] Re: qemu in script is not parsing properly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f2da5c9b569258d4af573fcd52363fef7463a416
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
Reply-To: Bug 1862110 <1862110@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

- Bug Report: =

+ Bug Report:
  >>qemu-system-x86_64 --version: QEMU emulator version 4.2.0
  >>Arch-linux version 2020.02.01
  I was following a tutorial on how to make a windows vm and i have encount=
ered and issue in the settings of my script I have listed below.
  =

  The commented code directly above the uncommented qemu instance would
  boot the Windows screen but the issue arises when I try to reach the
  same code block under the commented setting lines which takes me to the
  default SeaBIOS loader.
  =

-  =

  #!/bin/bash
  =

  vmname=3D"windows10vm"
  =

  if ps -ef | grep qemu-system-x86_64 | grep -q multifunction=3Don; then
  echo "A passthrough VM is already running." &
  exit 1
  =

  else
  =

  # use pulseaudio
  =

  export QEMU_AUDIO_DRV=3Dpa
  export QEMU_PA_SAMPLES=3D8192
  export QEMU_AUDIO_TIMER_PERIOD=3D99
  export QEMU_PA_SERVER=3D/run/user/1000/pulse/native
  =

  cp /usr/share/ovmf/x64/OVMF_VARS.fd /tmp/my_vars.fd
  =

  #qemu-system-x86_64 \
  #-drive id=3Ddisk0,if=3Dvirtio,cache=3Dnone,format=3Draw,file=3D.../IMGs/=
win.img \
  #-drive file=3D.../ISOs/Win10_1909_English_x64.iso,index=3D1,media=3Dcdro=
m \
  =

  qemu-system-x86_64 \
  =

  #-name $vmname,process=3D$vmname \
  #-machine type=3Dq35,accel=3Dkvm \
  #-cpu host,kvm=3Doff \
  #-smp 4,sockets=3D1,cores=3D3,threads=3D1 \
  #-m 8G \
  #-balloon none \
  #-rtc clock=3Dhost,base=3Dlocaltime \
  #-vga none \
  #-nographic \
  #-serial none \
  #-parallel none \
  #-soundhw hda \
  #-usb \
  #-device usb-host,vendorid=3D...,productid=3D... \
  #-device usb-host,vendorid=3D...,productid=3D... \
  #-device vfio-pci,host=3D...,multifunction=3Don \
  #-device vfio-pci,host=3D... \
  #-drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/ovmf/x64/OVMF=
_VARS.fd \
  #-drive if=3Dpflash,format=3Draw,file=3D/tmp/my_vars.fd \
  #-boot order=3D dc \
  =

  -drive id=3Ddisk0,if=3Dvirtio,cache=3Dnone,format=3Draw,file=3D.../IMGs/w=
in.img \
  -drive file=3D.../ISOs/Win10_1909_English_x64.iso,index=3D1,media=3Dcdrom=
 \
  -drive file=3D.../ISOs/virtio-0.1.171.iso,index=3D2,media=3Dcdrom \
  =

  #-netdev type=3Dtap,id=3Dnet0,ifname=3Dvmtap0,vhost=3Don \
  #-device virtio-net-pci,netdev=3Dnet0,mac=3D... \
  =

  exit 0
  =

  fi

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862110

Title:
  qemu in script is not parsing properly

Status in QEMU:
  New

Bug description:
  Bug Report:
  >>qemu-system-x86_64 --version: QEMU emulator version 4.2.0
  >>Arch-linux version 2020.02.01
  I was following a tutorial on how to make a windows vm and i have encount=
ered and issue in the settings of my script I have listed below.

  The commented code directly above the uncommented qemu instance would
  boot the Windows screen but the issue arises when I try to reach the
  same code block under the commented setting lines which takes me to
  the default SeaBIOS loader.

  #!/bin/bash

  vmname=3D"windows10vm"

  if ps -ef | grep qemu-system-x86_64 | grep -q multifunction=3Don; then
  echo "A passthrough VM is already running." &
  exit 1

  else

  # use pulseaudio

  export QEMU_AUDIO_DRV=3Dpa
  export QEMU_PA_SAMPLES=3D8192
  export QEMU_AUDIO_TIMER_PERIOD=3D99
  export QEMU_PA_SERVER=3D/run/user/1000/pulse/native

  cp /usr/share/ovmf/x64/OVMF_VARS.fd /tmp/my_vars.fd

  #qemu-system-x86_64 \
  #-drive id=3Ddisk0,if=3Dvirtio,cache=3Dnone,format=3Draw,file=3D.../IMGs/=
win.img \
  #-drive file=3D.../ISOs/Win10_1909_English_x64.iso,index=3D1,media=3Dcdro=
m \

  qemu-system-x86_64 \

  #-name $vmname,process=3D$vmname \
  #-machine type=3Dq35,accel=3Dkvm \
  #-cpu host,kvm=3Doff \
  #-smp 4,sockets=3D1,cores=3D3,threads=3D1 \
  #-m 8G \
  #-balloon none \
  #-rtc clock=3Dhost,base=3Dlocaltime \
  #-vga none \
  #-nographic \
  #-serial none \
  #-parallel none \
  #-soundhw hda \
  #-usb \
  #-device usb-host,vendorid=3D...,productid=3D... \
  #-device usb-host,vendorid=3D...,productid=3D... \
  #-device vfio-pci,host=3D...,multifunction=3Don \
  #-device vfio-pci,host=3D... \
  #-drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/ovmf/x64/OVMF=
_VARS.fd \
  #-drive if=3Dpflash,format=3Draw,file=3D/tmp/my_vars.fd \
  #-boot order=3D dc \

  -drive id=3Ddisk0,if=3Dvirtio,cache=3Dnone,format=3Draw,file=3D.../IMGs/w=
in.img \
  -drive file=3D.../ISOs/Win10_1909_English_x64.iso,index=3D1,media=3Dcdrom=
 \
  -drive file=3D.../ISOs/virtio-0.1.171.iso,index=3D2,media=3Dcdrom \

  #-netdev type=3Dtap,id=3Dnet0,ifname=3Dvmtap0,vhost=3Don \
  #-device virtio-net-pci,netdev=3Dnet0,mac=3D... \

  exit 0

  fi

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862110/+subscriptions

