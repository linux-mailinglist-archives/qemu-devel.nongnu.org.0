Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B3339FCD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 19:17:14 +0100 (CET)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8p7-00046J-6l
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 13:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lL8nc-0003eD-2W
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:15:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lL8nZ-0004AT-4C
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:15:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lL8nX-0000rt-9b
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 18:15:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3B2852E815D
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 18:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Mar 2021 18:06:49 -0000
From: Chin <1846816@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: aix ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chin21 gkurz leohori philmd th-huth
X-Launchpad-Bug-Reporter: Leonardo (leohori)
X-Launchpad-Bug-Modifier: Chin (chin21)
References: <157021536568.1047.12130451733202459497.malonedeb@chaenomeles.canonical.com>
Message-Id: <161565880929.15147.4241331100299426430.malone@gac.canonical.com>
Subject: [Bug 1846816] Re: Booting error on AIX 6.1 "Illegal Trap Instruction
 Interrupt in Kernel""
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: bc3cffaaeda15018f2cc15c2d33027b4d6b00dcd
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
Reply-To: Bug 1846816 <1846816@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I saw comments about support for virtio devices on AIX 7.2, was it not avai=
lable on AIX 7.1?
With AIX 7.1 also, I am getting similar issue as faced by other users with =
AIX 6.1.


qemu-system-ppc64 -cpu POWER8 -machine pseries -m 2048 -d unimp -serial std=
io -drive file=3Ddisk.img,if=3Dnone,id=3Ddrive-virtio-disk0 -device virtio-=
scsi-pci,id=3Dscsi -device scsi-hd,drive=3Ddrive-virtio-disk0 -cdrom AIX_7.=
1.iso -prom-env "boot-command=3Dboot cdrom:"
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=
=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=
=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=
=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-=
assist=3Don
VNC server running on 127.0.0.1:5900


SLOF **********************************************************************
QEMU Starting
 Build Date =3D Jul 17 2020 11:15:24
 FW Version =3D git-e18ddad8516ff2cf
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /vdevice/l-lan@71000002
Populating /vdevice/v-scsi@71000003
       SCSI: Looking for devices
          8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
Populating /pci@800000020000000
                     00 0000 (D) : 1234 1111    qemu vga
                     00 0800 (D) : 1033 0194    serial bus [ usb-xhci ]
                     00 1000 (D) : 1af4 1004    virtio [ scsi ]
Populating /pci@800000020000000/scsi@2
       SCSI: Looking for devices
          100000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
Installing QEMU fb


Scanning USB =

  XHCI: Initializing
    USB Keyboard =

    USB mouse =

No console specified using screen & keyboard
     =

  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php


Trying to load:  from: /vdevice/v-scsi@71000003/disk@8200000000000000: ... =
  Successfully loaded

AIX =

    StarUnimplemented SPAPR hcall 0x00000000000000ec

AIX Version 7.1
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Unimplemented SPAPR hcall 0x00000000000002b8
Illegal Trap Instruction Interrupt in Kernel
05861AAC      tweqi    r0,0                r0=3D0
KDB(0)>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1846816

Title:
  Booting error on AIX 6.1 "Illegal Trap Instruction Interrupt in
  Kernel""

Status in QEMU:
  New

Bug description:
  # ls -ltr
  total 8750584
  -rw-rw-r--  1 linux linux 4274997248 Oct  4 18:33 AIX.vol1.iso
  -rw-rw-r--  1 linux linux 4293888000 Oct  4 18:45 AIX.vol2.iso
  -rw-rw-r--  1 linux linux  391485440 Oct  4 18:50 AIX.vol3.iso
  -rw-r--r--  1 root  root      204608 Oct  4 19:00 AIX61.img

  # qemu-system-ppc64 -cpu POWER8,compat=3Dpower7 -machine pseries -m 8192 =
-serial mon:stdio \
  > -drive file=3D/qemu/AIX61.img,if=3Dnone,id=3Ddrive-virtio-disk0 \
  > -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Ddrive-virtio-=
disk0 \
  > -cdrom /qemu/AIX.vol1.iso \
  > -prom-env boot-command=3D'boot cdrom: -s verbose'

  VNC server running on ::1:5900
  qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ib=
s=3Dworkaround

  SLOF ********************************************************************=
**
  QEMU Starting
  =C2=A0Build Date =3D Jul  3 2019 12:26:14
  =C2=A0FW Version =3D git-ba1ab360eebe6338
  =C2=A0Press "s" to enter Open Firmware.

  Populating /vdevice methods
  Populating /vdevice/vty@71000000
  Populating /vdevice/nvram@71000001
  Populating /vdevice/l-lan@71000002
  Populating /vdevice/v-scsi@71000003
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCSI: Looking for devices
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08200000000000=
000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
  Populating /pci@800000020000000
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 0000 (D) : 1234 11=
11    qemu vga
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 0800 (D) : 1033 01=
94    serial bus [ usb-xhci ]
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 1000 (D) : 1af4 10=
04    virtio [ scsi ]
  Populating /pci@800000020000000/scsi@2
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCSI: Looking for devices
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01000000000000=
00 DISK     : "QEMU     QEMU HARDDISK    2.5+"
  Installing QEMU fb

  Scanning USB
  =C2=A0=C2=A0XHCI: Initializing
  =C2=A0=C2=A0=C2=A0=C2=A0USB Keyboard
  =C2=A0=C2=A0=C2=A0=C2=A0USB mouse
  No console specified using screen & keyboard

  =C2=A0=C2=A0Welcome to Open Firmware

  =C2=A0=C2=A0Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  =C2=A0=C2=A0This program and the accompanying materials are made available
  =C2=A0=C2=A0under the terms of the BSD License available at
  =C2=A0=C2=A0http://www.opensource.org/licenses/bsd-license.php

  Trying to load: -s verbose from: /vdevice/v-scsi@71000003/disk@8200000000=
000000: ...   Successfully loaded
  qemu-system-ppc64: Couldn't negotiate a suitable PVR during CAS
  AIX
  StarLED{814}

  AIX Version 6.1
  exec(/etc/init){1,0}

  INIT: EXECUTING /sbin/rc.boot 1
  exec(/usr/bin/sh,-c,/sbin/rc.boot 1){1114146,1}
  exec(/sbin/rc.boot,/sbin/rc.boot,1){1114146,1}
  + PHASE=3D1
  + + bootinfo -p
  exec(/usr/sbin/bootinfo,-p){1179684,1114146}
  PLATFORM=3Dchrp
  + [ ! -x /usr/lib/boot/bin/bootinfo_chrp ]
  + [ 1 -eq 1 ]
  + 1> /usr/lib/libc.a
  + init -c unlink /usr/lib/boot/bin/!(*_chrp)
  exec(/etc/init,-c,unlink /usr/lib/boot/bin/!(*_chrp)){1179686,1114146}
  + chramfs -t
  exec(/usr/sbin/chramfs,-t){1179688,1114146}
  + init -c unlink /usr/sbin/chramfs
  + 1> /dev/null
  exec(/etc/init,-c,unlink /usr/sbin/chramfs){1179690,1114146}
  + + bootinfo -t
  exec(/usr/sbin/bootinfo,-t){1179692,1114146}
  BOOTYPE=3D3
  + [ 0 -ne 0 ]
  + [ -z 3 ]
  + unset pdev_to_ldev undolt native_netboot_cfg
  + unset disknet_odm_init config_ATM
  + /usr/lib/methods/showled 0x510 DEV CFG 1 START
  exec(/usr/lib/methods/showled,0x510,DEV CFG 1 START){1179694,1114146}
  + cfgmgr -f -v
  exec(/usr/sbin/cfgmgr,-f,-v){1179696,1114146}
  cfgmgr is running in phase 1
  ----------------
  Time: 0 LEDS: 0x538
  Invoking top level program -- "/etc/methods/defsys"
  exec(/bin/sh,-c,/etc/methods/defsys ){1245222,1179696}
  exec(/etc/methods/defsys){1245222,1179696}
  exec(/bin/sh,-c,/usr/lib/methods/define_rspc -n -c sys -s node -t chrp){1=
310760,1245222}
  exec(/usr/lib/methods/define_rspc,-n,-c,sys,-s,node,-t,chrp){1310760,1245=
222}
  Time: 0 LEDS: 0x539
  Return code =3D 0
  ***** stdout *****
  sys0

  *** no stderr ****
  ----------------
  Attempting to configure device 'sys0'
  Time: 0 LEDS: 0x811
  Invoking /usr/lib/methods/cfgsys_chrp -1 -l sys0
  exec(/bin/sh,-c,/usr/lib/methods/cfgsys_chrp -1 -l sys0){1245224,1179696}
  Number of running methods: 1
  exec(/usr/lib/methods/cfgsys_chrp,-1,-l,sys0){1245224,1179696}
  LED{A20}
  Illegal Trap Instruction Interrupt in Kernel
  04151A74      tweqi    r0,0                r0=3D0
  KDB(0)>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1846816/+subscriptions

