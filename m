Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2435309C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:12:21 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSR5Y-0002pT-Hy
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSR42-00025f-QP
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:10:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:35218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSR40-0000tw-9Y
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:10:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lSR3y-0003dh-Az
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 21:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 481C42E8157
 for <qemu-devel@nongnu.org>; Fri,  2 Apr 2021 21:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Apr 2021 21:00:37 -0000
From: =?utf-8?q?H=C3=A5vard_Eidnes?= <1922391@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: he-uninett
X-Launchpad-Bug-Reporter: =?utf-8?q?H=C3=A5vard_Eidnes_=28he-uninett=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?H=C3=A5vard_Eidnes_=28he-uninett=29?=
References: <161739653585.29688.16825149829487531908.malonedeb@gac.canonical.com>
Message-Id: <161739723810.17253.18205287638559454583.launchpad@soybean.canonical.com>
Subject: [Bug 1922391] Re: qemu-system-ppc assertion "!mr->container" failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 914e1f9eb1a916290a99abf5d2de294bd02ce10c
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

** Tags added: ppc

** Description changed:

  Hi,
  =

- I'm trying to run the NetBSD/macppc 8.2 installer (which is 32-bit ppc) i=
n qemu-system-ppc
- version 5.2.0, and I'm hitting this assertion failure quite a bit into th=
e "unpacking sets" =

- part of the installation procedure, unpacking from the install iso image.
+ I'm trying to run the NetBSD/macppc 8.2 installer (which is 32-bit ppc) i=
n qemu-system-ppc version 5.2.0, and I'm hitting this assertion failure
+ quite a bit into the "unpacking sets" part of the installation procedure,
+ unpacking from the install iso image.
  =

  Qemu is run on a NetBSD/amd64 9.1 host system.  The stack backtrace from
  the core file is
  =

  Program terminated with signal SIGABRT, Aborted.
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  [Current thread is 1 (process 1)]
  (gdb) where
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  #1  0x000078859a3671ca in abort () from /usr/lib/libc.so.12
  #2  0x000078859a2a8507 in __assert13 () from /usr/lib/libc.so.12
  #3  0x000000015a3c19c0 in memory_region_finalize ()
  #4  0x000000015a3fef1c in object_unref ()
  #5  0x000000015a3feee6 in object_unref ()
  #6  0x000000015a374154 in address_space_unmap ()
  #7  0x000000015a276551 in pmac_ide_atapi_transfer_cb ()
  #8  0x000000015a150a59 in dma_blk_cb ()
  #9  0x000000015a46a1c7 in blk_aio_complete ()
  #10 0x000000015a5a617d in coroutine_trampoline ()
  #11 0x000078859a264150 in ?? () from /usr/lib/libc.so.12
  Backtrace stopped: Cannot access memory at address 0x7884894ff000
- (gdb) =

+ (gdb)
  =

  I start qemu with this small script:
  =

  ---
  #!/bin/sh
  =

  MEM=3D3g
  qemu-system-ppc \
-         -M mac99,via=3Dpmu \
-         -m $MEM  \
-         -nographic \
-         -drive id=3Dhda,format=3Draw,file=3Ddisk.img \
-         -L pc-bios \
-         -netdev user,id=3Dnet0,hostfwd=3Dtcp::2223-:22,ipv6=3Doff \
-         -net nic,model=3Drtl8139,netdev=3Dnet0 \
-         -boot d \
-         -cdrom NetBSD-8.2-macppc.iso
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-M mac99,via=3Dpmu \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m $MEM  \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-nographic \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive id=3Dhda,format=3D=
raw,file=3Ddisk.img \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-L pc-bios \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dnet0,ho=
stfwd=3Dtcp::2223-:22,ipv6=3Doff \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net nic,model=3Drtl8139,=
netdev=3Dnet0 \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-boot d \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cdrom NetBSD-8.2-macppc.=
iso
  ---
  =

  and boot the install kernel with "boot cd:ofwboot.xcf".  If someone wants
  to replicate this I can provide more detailed instructions to repeat the
  procedure I used to start the install.
  =

  Any hints about what more to look for?
  =

  Regards,
  =

  - H=C3=A5vard

** Description changed:

  Hi,
  =

  I'm trying to run the NetBSD/macppc 8.2 installer (which is 32-bit ppc) i=
n qemu-system-ppc version 5.2.0, and I'm hitting this assertion failure
  quite a bit into the "unpacking sets" part of the installation procedure,
  unpacking from the install iso image.
  =

- Qemu is run on a NetBSD/amd64 9.1 host system.  The stack backtrace from
- the core file is
+ Qemu is run on a NetBSD/amd64 9.1 host system.
+ =

+ The asert message from qemu is
+ =

+ assertion "!mr->container" failed: file "../softmmu/memory.c", line
+ 1739, function "memory_region_finalize"
+ =

+ The stack backtrace from the core file is
  =

  Program terminated with signal SIGABRT, Aborted.
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  [Current thread is 1 (process 1)]
  (gdb) where
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  #1  0x000078859a3671ca in abort () from /usr/lib/libc.so.12
  #2  0x000078859a2a8507 in __assert13 () from /usr/lib/libc.so.12
  #3  0x000000015a3c19c0 in memory_region_finalize ()
  #4  0x000000015a3fef1c in object_unref ()
  #5  0x000000015a3feee6 in object_unref ()
  #6  0x000000015a374154 in address_space_unmap ()
  #7  0x000000015a276551 in pmac_ide_atapi_transfer_cb ()
  #8  0x000000015a150a59 in dma_blk_cb ()
  #9  0x000000015a46a1c7 in blk_aio_complete ()
  #10 0x000000015a5a617d in coroutine_trampoline ()
  #11 0x000078859a264150 in ?? () from /usr/lib/libc.so.12
  Backtrace stopped: Cannot access memory at address 0x7884894ff000
  (gdb)
  =

  I start qemu with this small script:
  =

  ---
  #!/bin/sh
  =

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
  =

  and boot the install kernel with "boot cd:ofwboot.xcf".  If someone wants
  to replicate this I can provide more detailed instructions to repeat the
  procedure I used to start the install.
  =

  Any hints about what more to look for?
  =

  Regards,
  =

  - H=C3=A5vard

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922391

Title:
  qemu-system-ppc assertion "!mr->container" failed

Status in QEMU:
  New

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

  The stack backtrace from the core file is

  Program terminated with signal SIGABRT, Aborted.
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  [Current thread is 1 (process 1)]
  (gdb) where
  #0  0x000078859a36791a in _lwp_kill () from /usr/lib/libc.so.12
  #1  0x000078859a3671ca in abort () from /usr/lib/libc.so.12
  #2  0x000078859a2a8507 in __assert13 () from /usr/lib/libc.so.12
  #3  0x000000015a3c19c0 in memory_region_finalize ()
  #4  0x000000015a3fef1c in object_unref ()
  #5  0x000000015a3feee6 in object_unref ()
  #6  0x000000015a374154 in address_space_unmap ()
  #7  0x000000015a276551 in pmac_ide_atapi_transfer_cb ()
  #8  0x000000015a150a59 in dma_blk_cb ()
  #9  0x000000015a46a1c7 in blk_aio_complete ()
  #10 0x000000015a5a617d in coroutine_trampoline ()
  #11 0x000078859a264150 in ?? () from /usr/lib/libc.so.12
  Backtrace stopped: Cannot access memory at address 0x7884894ff000
  (gdb)

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

