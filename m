Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746F37356B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:15:46 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBl3-0007qX-HM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbp-0005uO-6v
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:53142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbm-0000cN-US
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leBbl-00047c-Oy
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:06:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AFEED2E8135
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 07:06:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 06:57:07 -0000
From: Thomas Huth <1686170@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 563278383-t duanev miki4242 mkdolata th-huth
 vvaltchev
X-Launchpad-Bug-Reporter: Alain Kalker (miki4242)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170425183112.19801.4371.malonedeb@soybean.canonical.com>
Message-Id: <162019782778.32459.1952383613059753342.malone@chaenomeles.canonical.com>
Subject: [Bug 1686170] Re: qemu-system-x86_64+gdb: unable to correctly
 disassemble "real mode" (i8086) instructions after attaching to QEMU started
 with "-S -s" options
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 826b021bd33b8ce06ddc953d89c393e7bb151d5d
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
Reply-To: Bug 1686170 <1686170@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/141


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #141
   https://gitlab.com/qemu-project/qemu/-/issues/141

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1686170

Title:
  qemu-system-x86_64+gdb: unable to correctly disassemble "real mode"
  (i8086) instructions after attaching to QEMU started with "-S -s"
  options

Status in QEMU:
  Expired

Bug description:
  OS: Void Linux x86_64 (glibc)
  QEMU version: 2.9.0
  GDB version: 7.12.1

  Problem description:

  After I updated QEMU from version 2.8.1 to 2.9.0, I found that when I try=
 to connect GDB to a running QEMU and try to debug Real mode machine code, =
I can no longer set architecture to 'i8086'.
  To be able to connect to QEMU from GDB at all, I have to specify one of t=
he 64 bit architectures, which among other things leads to incorrect disass=
embly listings. This makes debugging Real mode bootloaders, bootsectors and=
 BIOS code much more difficult.

  Steps to reproduce:

  - Run QEMU
  - In another terminal, run GDB
  - In GDB, connect to QEMU
  - In GDB, disassemble some Real mode machine code.

  Expected results (from QEMU version 2.8.1):

      [terminal #1]
      $ qemu-system-x86_64 -S -s

      [terminal #2]
      (gdb) set architecture i8086
      warning: A handler for the OS ABI "GNU/Linux" is not built =

      into this configuration
      of GDB.  Attempting to continue with the default i8086 settings.

      The target architecture is assumed to be i8086
      (gdb) target remote :1234
      Remote debugging using :1234
      warning: No executable has been specified and target does not support
      determining executable automatically.  Try using the "file" command.
      0x0000fff0 in ?? ()
      (gdb) x/i $cs*16+$eip
         0xffff0:	ljmp   $0xf000,$0xe05b

  Actual results:

      [terminal #1]
      $ qemu-system-x86_64 -S -s

      [terminal #2]
      $ gdb -q
      (gdb) set architecture i8086 =

      warning: A handler for the OS ABI "GNU/Linux" is not built into this =
configuration
      of GDB.  Attempting to continue with the default i8086 settings.

      The target architecture is assumed to be i8086
      (gdb) target remote :1234
      Remote debugging using :1234
      warning: No executable has been specified and target does not support
      determining executable automatically.  Try using the "file" command.
      Remote 'g' packet reply is too long: =

      [..snip..]

  Workarounds tried:

    - Try different architecures
      (gdb) set architecture i386:intel
      The target architecture is assumed to be i386:intel
      (gdb) target remote :1234
      Remote debugging using :1234
      warning: No executable has been specified and target does not support
      determining executable automatically.  Try using the "file" command.
      Remote 'g' packet reply is too long: =

      [..snip..]
      (gdb) set architecture i386:x86-64
      The target architecture is assumed to be i386:x86-64
      (gdb) target remote :1234
      Remote debugging using :1234
      warning: No executable has been specified and target does not support
      determining executable automatically.  Try using the "file" command.
      0x000000000000fff0 in ?? ()

  The last try finally allowed me to connect to QEMU, but as can be
  expected from using an incorrect architecture setting, disassembly
  output is complete gibberish:

      (gdb) x/10i $cs*16+$rip
         0xffff0:	(bad)  =

         0xffff1:	pop    %rbx
         0xffff2:	loopne 0xffff4
         0xffff4:	lock xor %dh,(%rsi)
         0xffff7:	(bad)  =

         0xffff8:	xor    (%rbx),%dh
         0xffffa:	(bad)  =

         0xffffb:	cmp    %edi,(%rcx)
         0xffffd:	add    %bh,%ah
         0xfffff:	add    %al,(%rax)

  Discussion:

  I think I've traced the problem to the following commit: "x86: Fix x86_64=
 'g' packet response to gdb from 32-bit mode."[1].
  While I admire the effort to make life for people using GDB to debug QEMU=
 VMs, I think the problem here is with GDB and can't be fixed entirely from=
 the side of QEMU without breaking other features.

  In fact, there is a well-known workaround to this problem published on
  OSDev Wiki (Workaround #1)[2] which doesn't require patching either
  QEMU or GDB. This workaround has worked for me using several previous
  versions of QEMU.

      $ gdb -q
      (gdb) set architecture i8086
      (gdb) target remote :1234
      (gdb) break some_breakpoint_in_32_bit_or_64_bit_code
      (gdb) continue
      [...]
      Remote 'g' packet reply is too long: [...]
      (gdb) disconnect # IMPORTANT STEP #1
      (gdb) set architecture i386:x86-64
      (gdb) target remote :1234 # IMPORTANT STEP #2
      (gdb) continue

  [1]: http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De3592bc9d841c397eed=
a87f0019fab94ff71004b
  [2]: http://wiki.osdev.org/QEMU_and_GDB_in_long_mode#Workaround_1:_Reconn=
ecting

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1686170/+subscriptions

