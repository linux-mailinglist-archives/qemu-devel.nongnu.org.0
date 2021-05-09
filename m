Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F626377781
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:08:58 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflzF-00026Y-Ef
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflwA-0004F9-SQ
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:05:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:59282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflw0-0001cO-Js
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:05:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflvz-00054m-4K
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 16:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 16E012E8189
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 16:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:57:24 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1804678@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aortega philmd
X-Launchpad-Bug-Reporter: Alberto Ortega (aortega)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <154290401870.17569.13384923487355075536.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057584471.2679.5587259612556900101.malone@wampee.canonical.com>
Subject: [Bug 1804678] Re: qemu-3.1.0-rc0: mips emulation hangs when executing
 invalid instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: b29474003927a5eb1949ef2b10d27ed34b00da1f
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
Reply-To: Bug 1804678 <1804678@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/240


** Changed in: qemu
       Status: Confirmed =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #240
   https://gitlab.com/qemu-project/qemu/-/issues/240

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1804678

Title:
  qemu-3.1.0-rc0: mips emulation hangs when executing invalid
  instructions

Status in QEMU:
  Invalid

Bug description:
  QEMU version:
  -------------

  qemu-3.1.0-rc0 compiled from sources (earlier versions also affected)

  Summary:
  --------

  QEMU MIPS system emulation hangs when trying to execute the following
  invalid instructions:

  71c5a9bf       sdbbp 0x716a6
  2c4745aa       sltiu a3, v0, 0x45aa
  f47539fb       sdc1 f21, 0x39fb(v1)
  5fa5e284       invalid

  qemu-system-mips falls under an infinite loop condition and it needs
  to be ended.

  The issue has been reproduced in Ubuntu x64 host running Debian MIPS
  32-bits guest with the following command line:

  qemu-system-mips -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
  debian_wheezy_mips_standard.qcow2 -append "root=3D/dev/sda1
  console=3Dtty0"

  It can also be reproduced using mips-linux-user, in which case throws
  the following exception:

  qemu-mips mips_loop_static.elf
  qemu: unhandled CPU exception 0x10 - aborting
  pc=3D0x004a9da0 HI=3D0x00000003 LO=3D0x00000002 ds 00e2 004a9da0 0
  GPR00: r0 00000000 at fffffff8 v0 004a9da0 v1 004ad000
  GPR04: a0 00000001 a1 7fffefc4 a2 7fffefcc a3 00000000
  GPR08: t0 004ab854 t1 0ffffffe t2 81010100 t3 2f2f2f2f
  GPR12: t4 7ffff1ad t5 004ab090 t6 004ab06c t7 004ab07c
  GPR16: s0 00000000 s1 452ac505 s2 00400db4 s3 00400d38
  GPR20: s4 00000000 s5 00000000 s6 00000000 s7 00000000
  GPR24: t8 004ab0a8 t9 004a9da0 k0 00000000 k1 00000000
  GPR28: gp 004b25a0 sp 7fffeec0 s8 7fffeec0 ra 0040041c
  CP0 Status  0x24000010 Cause   0x00000000 EPC    0x00000000
      Config0 0x80008482 Config1 0x9e190c8f LLAddr 0xffffffffffffffff
      Config2 0x80000000 Config3 0x00000000
      Config4 0x00000000 Config5 0x00000000
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x602d=
bad8

  Testcase:
  ---------

  C program to reproduce the problem:

  unsigned char code[] =3D "\x71\xC5\xA9\xBF\x2C\x47\x45\xAA\xF4\x75\x39\xF=
B\x5F\xA5\xE2\x84";
  main()
  {
    int (*ret)() =3D (int(*)())code;
    ret();
  }

  Also, find a statically compiled ELF attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1804678/+subscriptions

