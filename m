Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F27EFA2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 10:51:18 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htTHR-0006GB-MM
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 04:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45897)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1htTGo-0005qE-E0
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1htTGm-0005az-Ti
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:52566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1htTGm-0005ae-Np
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1htTGl-0001LR-4Y
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 08:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 203732E80CC
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 08:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Aug 2019 08:42:39 -0000
From: Daniel Berrange <1838658@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange prlw1
X-Launchpad-Bug-Reporter: Patrick Welche (prlw1)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <156467368424.6955.5535032657029646608.malonedeb@soybean.canonical.com>
Message-Id: <156473535914.1550.7199110908807397458.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19014";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 42446db08e171591d8dd17f6293a074924df7da7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838658] Re: qemu 4.0.0 broken by glib update
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
Reply-To: Bug 1838658 <1838658@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test image that the netbsd bug points to no longer exists.

If I pick the image currently available:

  http://nycdn.netbsd.org/pub/NetBSD-
daily/HEAD/latest/images/NetBSD-9.99.2-sparc.iso

And launch it in a QEMU built from today's GIT master, on Fedora 30 with
glib2 2.60.5, NetBSD successfully boots and launches the installer...


$ ~/usr/qemu-git/bin/qemu-system-sparc -drive file=3DNetBSD-9.99.2-sparc.im=
g,format=3Draw,media=3Ddisk,snapshot=3Doff  -cdrom  /var/lib/libvirt/images=
/NetBSD-9.99.2-sparc.iso -boot d -nographic
Configuration device id QEMU version 1 machine id 32
Probing SBus slot 0 offset 0
Probing SBus slot 1 offset 0
Probing SBus slot 2 offset 0
Probing SBus slot 3 offset 0
Probing SBus slot 4 offset 0
Probing SBus slot 5 offset 0
Invalid FCode start byte
CPUs: 1 x FMI,MB86904
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Jul 1 2019 17:08
  Type 'help' for detailed information
Trying cdrom:d...
Not a bootable ELF image
Loading a.out image...
Loaded 65536 bytes
entry point is 0x4000
bootpath: /iommu@0,10000000/sbus@0,10001000/espdma@5,8400000/esp@5,8800000/=
sd@2,0:d
switching to new context:
>> NetBSD/sparc Secondary Boot, Revision 1.15 (Thu Aug  1 22:23:16 UTC 2019)
Booting netbsd
3375564+96668=3D0x34ffe0
OBP version 3, revision 2.25 (plugin rev 2)
[   1.0000000] Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003=
, 2004, 2005,
[   1.0000000]     2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 20=
15, 2016, 2017,
[   1.0000000]     2018, 2019 The NetBSD Foundation, Inc.  All rights reser=
ved.
[   1.0000000] Copyright (c) 1982, 1986, 1989, 1991, 1993
[   1.0000000]     The Regents of the University of California.  All rights=
 reserved.

[   1.0000000] NetBSD 9.99.2 (INSTALL) #0: Thu Aug  1 22:23:16 UTC 2019
[   1.0000000] 	mkrepro@mkrepro.NetBSD.org:/usr/src/sys/arch/sparc/compile/=
INSTALL
[   1.0000000] total memory =3D 111 MB
[   1.0000000] avail memory =3D 106 MB
[   1.0000000] bootpath: /iommu@0,10000000/sbus@0,10001000/espdma@5,8400000=
/esp@5,8800000/sd@2,0:d
[   1.0000000] mainbus0 (root): SUNW,SPARCstation-5: hostid 80123456
[   1.0000000] cpu0 at mainbus0: FMI,MB86904 @ 170 MHz, MB86910 or WTL1164/=
5 FPU
[   1.0000000] cpu0: 16K instruction (32 b/l), 8K data (16 b/l), 512K exter=
nal (32 b/l): cache enabled
[   1.0000000] obio0 at mainbus0
[   1.0000000] clock0 at obio0 slot 0 offset 0x200000: mk48t08
[   1.0000000] timer0 at obio0 slot 0 offset 0xd00000: delay constant 201, =
frequency =3D 2000000 Hz
[   1.0000050] zs0 at obio0 slot 0 offset 0x100000 level 12 softpri 6
[   1.0000050] zstty0 at zs0 channel 0 (console i/o)
[   1.0000050] zstty1 at zs0 channel 1
[   1.0000050] zs1 at obio0 slot 0 offset 0x0 level 12 softpri 6
[   1.0000050] zstty2 at zs1 channel 0
[   1.0000050] kbd0 at zstty2
[   1.0000050] zstty3 at zs1 channel 1
[   1.0000050] ms0 at zstty3
[   1.0000050] wsmouse0 at ms0 mux 0
[   1.0000050] fdc0 at obio0 slot 0 offset 0x400000 level 11 softpri 4: chi=
p 82077
[   1.0000050] fd0 at fdc0 drive 0: 1.44MB 80 cyl, 2 head, 18 sec
[   1.0000050] auxreg0 at obio0 slot 0 offset 0x900000
[   1.0000050] power0 at obio0 slot 0 offset 0x910000 level 2
[   1.0000050] slavioconfig at obio0 slot 0 offset 0x800000 not configured
[   1.0000050] iommu0 at mainbus0 addr 0x10000000: version 0x5/0x0, page-si=
ze 4096, range 64MB
[   1.0000050] sbus0 at iommu0: clock =3D 21.250 MHz
[   1.0000050] dma0 at sbus0 slot 5 offset 0x8400000: DMA rev 2
[   1.0000050] esp0 at dma0 slot 5 offset 0x8800000 level 4: ESP200, 40MHz,=
 SCSI ID 7
[   1.0000050] scsibus0 at esp0: 8 targets, 8 luns per target
[   1.0000050] ledma0 at sbus0 slot 5 offset 0x8400010: DMA rev 2
[   1.0000050] le0 at ledma0 slot 5 offset 0x8c00000 level 6: address 52:54=
:00:12:34:56
[   1.0000050] le0: 8 receive buffers, 2 transmit buffers
[   1.0000050] tcx0 at sbus0 slot 3 offset 0x800000 level 5 (ipl 9) (8-bit =
only TCX)
[   1.0000050] tcx0: SUNW,tcx, 1024 x 768
[   1.0000050] tcx0: id 0, rev 0, sense 0
[   1.0000050] tcx0: attached to /dev/fb0
[   1.0000050] wsdisplay1 at tcx0 kbdmux 1
[   1.0000050] SUNW,CS4231 at sbus0 slot 4 offset 0xc000000 level 5 (ipl 9)=
 not configured
[   1.0000050] power-management at sbus0 slot 4 offset 0xa000000 not config=
ured
[   1.0000050] scsibus0: waiting 2 seconds for devices to settle...
[   1.0000050] wskbd0 at kbd0 mux 1
[   3.4705415] sd0 at scsibus0 target 0 lun 0: <QEMU, QEMU HARDDISK, 2.5+> =
disk fixed
[   3.4805320] sd0: 2048 MB, 4161 cyl, 16 head, 63 sec, 512 bytes/sect x 41=
94304 sectors
[   3.4805320] cd0 at scsibus0 target 2 lun 0: <QEMU, QEMU CD-ROM, 2.5+> cd=
rom removable
[   4.4805570] kbd0: reset failed
[   4.5705505] root on md0a dumps on md0b
[   4.5805965] root file system type: ffs
[   4.5805965] kern.module.path=3D/stand/sparc/9.99.2/modules
Welcome to the NetBSD/sparc microroot setup utility.

We've just completed the first stage of a two-stage procedure to load a
fully functional NetBSD installation environment on your machine.  In the
second stage which is to follow now, a set of additional installation
utilities must be load from your NetBSD/sparc installation medium.

This procedure supports one of the following media:

1) cdrom
2) tape
3) floppy

Installation medium to load the additional utilities from:


Can you confirm that you can still reproduce the original problem using QEM=
U git master, and latest NetBSD ISO image.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838658

Title:
  qemu 4.0.0 broken by glib update

Status in QEMU:
  New

Bug description:
  In brief, an install CD will successfully boot with qemu 4.0.0 built with=
 glib 2.58.3, but freeze during boot with qemu 4.0.0 built with glib 2.60.0=
. I tracked it down to glib's GHashTable improvements. qemu is happy with a=
 glib built from
  ```
   git checkout -f 2.60.4
   git revert --no-edit 86c6f7e2b..3bed8a13b
   git revert --no-edit 75f8ec1df9b48b0c3a13a9125f2c7d7c5adf5159
   git revert --no-edit 603fb5958..d3074a748
   git revert --no-edit 0b45ddc55..0600dd322
  ```
  When the GHashTable improvements were committed, there was already a pree=
mptive note about any breakage being due to using private implementation de=
tails, hence mentioning it here rather than with glib.

  For the full saga, see: http://gnats.netbsd.org/54310

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838658/+subscriptions

