Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399AE354733
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 21:47:20 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTVBu-0002zX-Me
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 15:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTVAT-0002Ri-W9
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 15:45:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:59484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTVAR-00078S-KW
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 15:45:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTVAO-0006Io-JY
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 19:45:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 92CD42E8162
 for <qemu-devel@nongnu.org>; Mon,  5 Apr 2021 19:45:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Apr 2021 19:40:14 -0000
From: =?utf-8?q?H=C3=A5vard_Eidnes?= <1922391@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: he-uninett
X-Launchpad-Bug-Reporter: =?utf-8?q?H=C3=A5vard_Eidnes_=28he-uninett=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?H=C3=A5vard_Eidnes_=28he-uninett=29?=
References: <161739653585.29688.16825149829487531908.malonedeb@gac.canonical.com>
Message-Id: <161765161437.27460.16052827470923557472.malone@wampee.canonical.com>
Subject: [Bug 1922391] Re: qemu-system-ppc assertion "!mr->container" failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: df23c99cc144e68fb6cf2b224e5c7ede821bcfc7
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
Reply-To: Bug 1922391 <1922391@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hmm,

it seems I need to retract this bug.  It turns out that the 32-bit macppc p=
ort
of NetBSD only supports a maximum of 2GB of memory.  As a NetBSD developer =
said it:

> The physical memory map on G4 Macs doesn't have room for more than 2G
of RAM.

So, I've set the status of this bug report to "Invalid", as that seemed to =
be the
best fit.

Regards,

- H=C3=A5vard


** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922391

Title:
  qemu-system-ppc assertion "!mr->container" failed

Status in QEMU:
  Invalid

Bug description:
  Hi,

  I'm trying to run the NetBSD/macppc 8.2 installer (which is 32-bit ppc) i=
n qemu-system-ppc version 5.2.0, and I'm hitting this assertion failure
  quite a bit into the "unpacking sets" part of the installation procedure,
  unpacking from the install iso image.

  Qemu is run on a NetBSD/amd64 9.1 host system.

  The asert message from qemu is

  assertion "!mr->container" failed: file "../softmmu/memory.c", line
  1739, function "memory_region_finalize"

  The stack backtrace from the core file (when built with debug symbols)
  is

  Core was generated by `qemu-system-ppc'.
  Program terminated with signal SIGABRT, Aborted.
  #0  0x00007a8f2596791a in _lwp_kill () from /usr/lib/libc.so.12
  [Current thread is 1 (process 1)]
  (gdb) where
  #0  0x00007a8f2596791a in _lwp_kill () from /usr/lib/libc.so.12
  #1  0x00007a8f259671ca in abort () from /usr/lib/libc.so.12
  #2  0x00007a8f258a8507 in __assert13 () from /usr/lib/libc.so.12
  #3  0x000000003e79d8a0 in memory_region_finalize (obj=3D<optimized out>)
      at ../softmmu/memory.c:1739
  #4  0x000000003e87aacc in object_deinit (type=3D0x7a8f2c280780, =

      obj=3D<optimized out>) at ../qom/object.c:671
  #5  object_finalize (data=3D0x7a8f2b62baa0) at ../qom/object.c:685
  #6  object_unref (objptr=3D0x7a8f2b62baa0) at ../qom/object.c:1183
  #7  0x000000003e87aa96 in object_property_del_all (obj=3D0x7a8f2b629000)
      at ../qom/object.c:623
  #8  object_finalize (data=3D0x7a8f2b629000) at ../qom/object.c:684
  #9  object_unref (objptr=3D0x7a8f2b629000) at ../qom/object.c:1183
  #10 0x000000003e79ab6b in memory_region_unref (mr=3D<optimized out>)
      at ../softmmu/memory.c:1787
  #11 0x000000003e7d8eb4 in address_space_unmap (
      as=3Das@entry=3D0x3f4731a0 <address_space_memory>, buffer=3D<optimize=
d out>, =

      len=3D<optimized out>, is_write=3D<optimized out>, access_len=3D<opti=
mized out>)
      at ../softmmu/physmem.c:3222
  #12 0x000000003e66389a in dma_memory_unmap (access_len=3D<optimized out>, =

      dir=3D<optimized out>, len=3D<optimized out>, buffer=3D<optimized out=
>, =

      as=3D<optimized out>)
      at /usr/pkgsrc/emulators/qemu/work/qemu-5.2.0/include/sysemu/dma.h:145
  #13 pmac_ide_atapi_transfer_cb (opaque=3D0x7a8f2ab4aef0, ret=3D<optimized=
 out>)
      at ../hw/ide/macio.c:122
  #14 0x000000003e5b22a0 in dma_complete (ret=3D0, dbs=3D0x7a8f2bb4d380)
      at ../softmmu/dma-helpers.c:120
  #15 dma_blk_cb (opaque=3D0x7a8f2bb4d380, ret=3D0) at ../softmmu/dma-helpe=
rs.c:138
  #16 0x000000003e864ef7 in blk_aio_complete (acb=3D0x7a8f2af2be90)
      at ../block/block-backend.c:1412
  #17 0x000000003e9a9be1 in coroutine_trampoline (i0=3D<optimized out>, =

      i1=3D<optimized out>) at ../util/coroutine-ucontext.c:173
  #18 0x00007a8f25864150 in ?? () from /usr/lib/libc.so.12
  Backtrace stopped: Cannot access memory at address 0x7a8e137ec000
  (gdb) =


  =

  I start qemu with this small script:

  ---
  #!/bin/sh

  MEM=3D3g
  qemu-system-ppc \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-M mac99,via=3Dpmu \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m $MEM  \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-nographic \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive id=3Dhda,format=3D=
raw,file=3Ddisk.img \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-L pc-bios \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dnet0,ho=
stfwd=3Dtcp::2223-:22,ipv6=3Doff \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net nic,model=3Drtl8139,=
netdev=3Dnet0 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-boot d \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cdrom NetBSD-8.2-macppc.=
iso
  ---

  and boot the install kernel with "boot cd:ofwboot.xcf".  If someone wants
  to replicate this I can provide more detailed instructions to repeat the
  procedure I used to start the install.

  Any hints about what more to look for?

  Regards,

  - H=C3=A5vard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922391/+subscriptions

