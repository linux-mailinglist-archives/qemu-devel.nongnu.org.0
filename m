Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3536541A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:29:01 +0200 (CEST)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlkh-0006k6-Qh
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlj5-00052L-UZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlj0-0002dZ-8G
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlin-00028P-T4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 90BB22E8177
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:08:42 -0000
From: Thomas Huth <1799766@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth xanclic yannick-duchene
X-Launchpad-Bug-Reporter: =?utf-8?b?SGlib3U1N8KgKFlhbm5pY2vCoER1Y2jDqm5l?=
 =?utf-8?q?=29_=28yannick-duchene=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154040720342.20108.15765705817940864119.malonedeb@gac.canonical.com>
Message-Id: <161890612275.26427.1077892836135246142.malone@gac.canonical.com>
Subject: [Bug 1799766] Re: -device does not work as -drive do
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 15d15ea201d38590bd88761ca3692f32bde57ccf
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
Reply-To: Bug 1799766 <1799766@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1799766

Title:
  -device does not work as -drive do

Status in QEMU:
  Incomplete

Bug description:
  Copy/paste of https://stackoverflow.com/questions/52929723/qemu-eject-
  complains-device-is-not-found-while-it-is-there , since I found this
  bug trying to find an answer to an own question on Stack Overflow.

  Below, what was my question the answer I wrote, all exposes the bug.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  =

  I need to eject a floppy from QEmu=E2=80=AF3.0 monitor, but the command s=
urprisingly fails complaining the device is not found, while it is really t=
here.

  Listing of devices:

      (qemu) info block
      fda: dos-6-22/Dos622-1.img (raw)
          Attached to:      /machine/unattached/device[11]
          Removable device: not locked, tray closed
          Cache mode:       writeback

      hda: hda.img (raw)
          Attached to:      /machine/peripheral-anon/device[1]
          Cache mode:       writeback

  Eject command result:

      (qemu) eject fda
      Device 'fda' not found

  This is so although this documentation says this is how I have to do:
  https://www.linux-kvm.org/page/Change_cdrom (just that I want to eject
  the floppy instead of the CD=E2=80=91ROM).

  The `change` command complains the same:

      (qemu) change fda dos-6-22/Dos622-2.img raw
      Device 'fda' not found

  Is this a bug or me doing something wrong?

  I tried using different node names, with always the same result.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  I=E2=80=99m posting as an answer, but I=E2=80=99m not strictly sure. I ca=
n just say,
  if I understand correctly, this is a bug.

  The answer comes in two parts.

  First part, is a stripped down failing invocation:

      qemu-system-i386 \
         -monitor stdio \
         -machine type=3Disapc,vmport=3Doff \
         -blockdev driver=3Dfile,node-name=3Dfda-img,filename=3Dfda.img \
         -blockdev driver=3Draw,node-name=3Dfda,file=3Dfda-img \
         -global isa-fdc.driveA=3Dfda

      (qemu) info block
      ide1-cd0: [not inserted]
          Attached to:      /machine/unattached/device[19]
          Removable device: not locked, tray closed

      sd0: [not inserted]
          Removable device: not locked, tray closed

      fda: fda.img (raw)
          Attached to:      /machine/unattached/device[13]
          Removable device: not locked, tray closed
          Cache mode:       writeback
      (qemu) eject fda
      Device 'fda' not found

  Second part, is the same without the last argument `-global isa-
  fdc.driveA=3Dfda`:

      qemu-system-i386 \
         -monitor stdio \
         -machine type=3Disapc,vmport=3Doff \
         -blockdev driver=3Dfile,node-name=3Dfda-img,filename=3Dfda.img \
         -blockdev driver=3Draw,node-name=3Dfda,file=3Dfda-img

      (qemu) info block
      ide1-cd0: [not inserted]
          Attached to:      /machine/unattached/device[19]
          Removable device: not locked, tray closed

      floppy0: [not inserted]
          Attached to:      /machine/unattached/device[13]
          Removable device: not locked, tray closed

      sd0: [not inserted]
          Removable device: not locked, tray closed
      (qemu) eject floppy0

  There is more error when `-global isa-fdc.driveA=3Dfda` is removed.
  However, the documentation says:

  > -global driver=3Ddriver,property=3Dproperty,value=3Dvalue
  > Set default value of driver=E2=80=99s property prop to value, e.g.:

  > qemu-system-i386 -global ide-hd.physical_block_size=3D4096 disk-image.i=
mg
  > In particular, you can **use this to set driver properties for devices =
which are created automatically by the machine model**. To create a device =
which is not created automatically and set properties on it, use -device.

  > -global driver.prop=3Dvalue is shorthand for -global
  driver=3Ddriver,property=3Dprop,value=3Dvalue. The longhand syntax works
  even when driver contains a dot.

  What I put a stress on in the quote, suggest I=E2=80=99m not misusing
  `-global` and that=E2=80=99s most probably a bug.

  **Update for more details:**

  It seems using `-drive` instead of `-device` and `driveA` assignment,
  the result is not the same, although RedHat documentation recommands
  using `-device` instead of `-drive` and QEmu=E2=80=AF3.0 documentation sa=
ys
  `-drive` is essentially a shortcut for `-device` (=E2=80=9Cessentially=E2=
=80=9D, not
  telling about the difference).

  Below, two cases, with an except of `info block` and an excerpt of
  `info qtree`.

  With this one, `eject floppy0` works:

      qemu-system-i386 \
         -monitor stdio \
         -machine type=3Disapc,vmport=3Doff \
         -drive format=3Draw,if=3Dfloppy,media=3Ddisk,file=3Dfda.img \
         -device isa-vga,vgamem_mb=3D1 \
         -serial msmouse

      [=E2=80=A6]

      floppy0 (#block156): fda.img (raw)
          Attached to:      /machine/unattached/device[12]
          Removable device: not locked, tray closed
          Cache mode:       writeback

      [=E2=80=A6]

        dev: isa-fdc, id ""
          iobase =3D 1008 (0x3f0)
          irq =3D 6 (0x6)
          dma =3D 2 (0x2)
          driveA =3D ""
          driveB =3D ""
          check_media_rate =3D true
          fdtypeA =3D "auto"
          fdtypeB =3D "auto"
          fallback =3D "288"
          isa irq 6
          bus: floppy-bus.0
            type floppy-bus
            dev: floppy, id ""
              unit =3D 0 (0x0)
              drive =3D "floppy0"
              logical_block_size =3D 512 (0x200)
              physical_block_size =3D 512 (0x200)
              min_io_size =3D 0 (0x0)
              opt_io_size =3D 0 (0x0)
              discard_granularity =3D 4294967295 (0xffffffff)
              write-cache =3D "auto"
              share-rw =3D false
              drive-type =3D "144"

  With this one, `eject fda` does not work:

      qemu-system-i386 \
         -monitor stdio \
         -machine type=3Disapc,vmport=3Doff \
         -blockdev driver=3Dfile,node-name=3Dfda-img,filename=3Dfda.img \
         -blockdev driver=3Draw,node-name=3Dfda,file=3Dfda-img \
         -global isa-fdc.driveA=3Dfda \
         -device isa-vga,vgamem_mb=3D1 \
         -serial msmouse

      [=E2=80=A6]

      fda: fda.img (raw)
          Attached to:      /machine/unattached/device[12]
          Removable device: not locked, tray closed
          Cache mode:       writeback

      [=E2=80=A6]

        dev: isa-fdc, id ""
          iobase =3D 1008 (0x3f0)
          irq =3D 6 (0x6)
          dma =3D 2 (0x2)
          driveA =3D ""
          driveB =3D ""
          check_media_rate =3D true
          fdtypeA =3D "auto"
          fdtypeB =3D "auto"
          fallback =3D "288"
          isa irq 6
          bus: floppy-bus.0
            type floppy-bus
            dev: floppy, id ""
              unit =3D 0 (0x0)
              drive =3D "fda"
              logical_block_size =3D 512 (0x200)
              physical_block_size =3D 512 (0x200)
              min_io_size =3D 0 (0x0)
              opt_io_size =3D 0 (0x0)
              discard_granularity =3D 4294967295 (0xffffffff)
              write-cache =3D "auto"
              share-rw =3D false
              drive-type =3D "144"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1799766/+subscriptions

