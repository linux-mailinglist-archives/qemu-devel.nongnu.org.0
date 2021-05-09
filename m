Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDA377793
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:27:47 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfmHS-0008I7-Qi
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfmFX-0006ki-GF
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:25:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:60432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfmFN-00071x-Ip
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:25:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfmFK-0006un-UW
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 16:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E4FE12E8136
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 16:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 16:17:52 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1792659@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd ramiro-polla rth th-huth
X-Launchpad-Bug-Reporter: Ramiro Polla (ramiro-polla)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <153697392900.9226.4246206563741650584.malonedeb@soybean.canonical.com>
Message-Id: <162057707262.16458.12842706985808598077.malone@soybean.canonical.com>
Subject: [Bug 1792659] Re: watchpoints might not properly stop execution at
 the right address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: f68e7699a564b9a1be5477f4233e9ec122eac709
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
Reply-To: Bug 1792659 <1792659@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/245


** Changed in: qemu
       Status: Confirmed =3D> Invalid

** Changed in: qemu
     Assignee: Richard Henderson (rth) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #245
   https://gitlab.com/qemu-project/qemu/-/issues/245

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1792659

Title:
  watchpoints might not properly stop execution at the right address

Status in QEMU:
  Invalid

Bug description:
  This bug has been tested with the latest development tree
  (19b599f7664b2ebfd0f405fb79c14dd241557452).

  I am using qemu-system-i386 with the gdbserver stub. I set a
  watchpoint on some address. When the watchpoint is hit, it will be
  reported by gdb, but it might happen that eip points to the wrong
  address (execution has not properly stopped when the watchpoint was
  hit).

  The setup I used to reproduce it is quite complex, but I believe I
  have found the cause of the bug, so I will describe that.

  The check_watchpoint() function sets cflags_next_tb in order to force
  the execution of only one instruction, and then exits the current tb.
  It then expects to be called again after that one instruction is
  executed, the watchpoint is hit and it is reported to gdb.

  The problem is that another interrupt might have been generated around
  the same time as the watchpoint. If the interrupt changes eip and
  execution goes on in another address, the value of cflags_next_tb will
  be spoiled. When we come back from the interrupt to the address where
  the watchpoint is hit, it is possible that a tb with multiple
  instructions is been executed, and therefore eip points to the wrong
  address, ahead of where it should be.

  In my case, the order is as follows:
  * i8259 generates an IRQ
    - cpu->interrupt_request contains both CPU_INTERRUPT_TGT_EXT_1 and CPU_=
INTERRUPT_HARD
  * cpu_handle_interrupt() -> x86_cpu_exec_interrupt() is called
    - it deals with CPU_INTERRUPT_TGT_EXT_1
    - execution continues
  * I am exactly at the instruction where the watchpoint is hit.
    - check_watchpoint() is called and cflags_next_tb is set to force the e=
xecution of only one instruction.
    - execution breaks out of the loop with siglongjmp()
  * cpu_handle_interrupt() -> x86_cpu_exec_interrupt() is called
    - it deals with the IRQ. eip is changed and cflags_next_tb is spoiled
    - execution continues at the IRQ

  [...]
  * The kernel finishes dealing with the IRQ

  * I am back at the instruction where the watchpoint is hit.
    - A tb is created and executed with two instructions instead of one
    - eip is now ahead of the instruction that hit the watchpoint
  * cpu_handle_interrupt() is called
    - it deals with CPU_INTERRUPT_DEBUG
    - the watchpoint is reported by gdb, but with the wrong eip.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1792659/+subscriptions

