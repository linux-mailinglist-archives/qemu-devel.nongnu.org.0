Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10A4E14F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 09:38:41 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heE88-0006x9-3y
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 03:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40567)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1heE5n-0005qs-0i
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1heE54-0004Qs-4S
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:35:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:43106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1heE53-0004KI-U2
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:35:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1heE52-0006jT-DX
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 07:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 627372E8055
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 07:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Jun 2019 07:26:30 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1833661@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Tags: mips pflash
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156110193683.18432.8339006487274258755.malonedeb@chaenomeles.canonical.com>
Message-Id: <156110199080.19316.14676829907730298597.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18989";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 6882b5da1f605f16304e3b61bf1a842a4571619a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1833661] Re: Linux kernel oops on Malta board
 while accessing pflash
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
Reply-To: Bug 1833661 <1833661@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Relevant 32-bit output:

tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32eb_kerne=
l3_2_0

[   34.968000] Using buffer write method
[   38.324000] Searching for RedBoot partition table in physmap-flash.0 at =
offset 0x3f0000
[   38.328000] No RedBoot partition table detected in physmap-flash.0
[   39.032000] Creating 3 MTD partitions on "physmap-flash.0":
[   39.032000] 0x000000000000-0x000000100000 : "YAMON"
[   39.052000] 0x000000100000-0x0000003e0000 : "User FS"
[   39.068000] 0x0000003e0000-0x000000400000 : "Board Config"
[   40.924000] CPU 0 Unable to handle kernel paging request at virtual addr=
ess 00000014, epc =3D=3D c0203278, ra =3D=3D c0203254
[   40.932000] Oops[#1]:
[   40.932000] Cpu 0
[   40.932000] $ 0   : 00000000 1000a400 00000000 00000001
[   40.932000] $ 4   : c012f590 00000001 00000000 7fffffff
[   40.932000] $ 8   : 8fbcbfe0 0000a400 00000000 8fae0000
[   40.932000] $12   : 74646368 00000001 806c0078 61720053
[   40.932000] $16   : 8fb38000 8fba63c0 c0200000 00000001
[   40.932000] $20   : 00000000 c0205074 8020953c 7fac45e4
[   40.932000] $24   : 00000003 80338058                  =

[   40.932000] $28   : 8fbca000 8fbcbcd0 00000008 c0203254
[   40.932000] Hi    : 00000009
[   40.932000] Lo    : 85d47900
[   40.932000] epc   : c0203278 mtd_open+0x94/0x1d0 [mtdchar]
[   40.932000]     Not tainted
[   40.932000] ra    : c0203254 mtd_open+0x70/0x1d0 [mtdchar]
[   40.932000] Status: 1000a403    KERNEL EXL IE =

[   40.932000] Cause : 10800008
[   40.932000] BadVA : 00000014
[   40.932000] PrId  : 00019300 (MIPS 24Kc)
[   40.932000] Modules linked in: mtdchar(+) redboot cfi_cmdset_0001 cfi_pr=
obe cfi_util gen_probe sg evdev uhci_hcd ehci_hcd physmap map_funcs chipreg=
 usbcore mtd psmouse sr_mod i2c_piix4 i2c_core cdrom serio_raw usb_common
[   40.932000] Process mtd_probe (pid: 268, threadinfo=3D8fbca000, task=3D8=
fbbda88, tls=3D774b0490)
[   40.932000] Stack : 00000000 8e9b9470 8fba63c0 8e9b9470 802094b0 8e9ad98=
0 8e9b9470 8fba63c0
[   40.932000]         8e9ad980 802095d4 00000000 00000000 00000000 7fac45e=
4 00000003 8033768c
[   40.932000]         8fba63c0 8f5a7518 8f811c80 8e9b9470 802094b0 0000000=
0 00000000 7fac45e4
[   40.932000]         00000008 80202bb4 8fbcbe14 8fbcbe68 8fbcbdc0 8f4f449=
8 8f811c80 8fbcbe70
[   40.932000]         8fa29140 8fbcbe68 8e9b9470 00000024 00000000 0000000=
0 00000005 7fac45e4
[   40.932000]         ...
[   40.932000] Call Trace:
[   40.932000] [<c0203278>] mtd_open+0x94/0x1d0 [mtdchar]
[   40.932000] [<802095d4>] chrdev_open+0x124/0x250
[   40.932000] [<80202bb4>] __dentry_open+0x27c/0x3d8
[   40.932000] [<8020400c>] nameidata_to_filp+0x64/0x78
[   40.932000] [<80214160>] do_last.isra.17+0x3a4/0x81c
[   40.932000] [<802146d4>] path_openat+0xc0/0x4c4
[   40.932000] [<80214bf0>] do_filp_open+0x3c/0xac
[   40.932000] [<80204134>] do_sys_open+0x114/0x200
[   40.932000] [<8010a9d0>] stack_done+0x20/0x40
[   40.932000] =

[   40.932000] =

[   40.932000] Code: 3c02c013  3c02c020  8c425070 <8c440014> 3c028022  2442=
eef4  0040f809  02602821  10400043 =

[   40.956000] ---[ end trace e666aa8cbfdf5c7f ]---
udevd[192]: 'mtd_probe /dev/.tmp-char-90:3'
[hang]

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833661

Title:
  Linux kernel oops on Malta board while accessing pflash

Status in QEMU:
  New

Bug description:
  commit 33d609990621dea6c7d056c86f707b8811320ac1

  While running tests/acceptance/linux_ssh_mips_malta.py, the big-endian
  tests fail:

    physmap-flash.0: Found 1 x32 devices at 0x0 in 32-bit bank. Manufacture=
r ID 0x000000 Chip ID 0x000000
    Intel/Sharp Extended Query Table at 0x0031
    Using buffer write method
    Searching for RedBoot partition table in physmap-flash.0 at offset 0x10=
03f0000
    Creating 3 MTD partitions on "physmap-flash.0":
    0x000000000000-0x000000100000 : "YAMON"
    0x000000100000-0x0000003e0000 : "User FS"
    0x0000003e0000-0x000000400000 : "Board Config"
    CPU 0 Unable to handle kernel paging request at virtual address 00000014

  The 64-bit test fails with:

    CPU 0 Unable to handle kernel paging request at virtual address
  0000000000000028

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833661/+subscriptions

