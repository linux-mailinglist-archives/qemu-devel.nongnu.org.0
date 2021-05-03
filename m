Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC19371DBB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:03:24 +0200 (CEST)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbyd-0001e4-KT
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbqB-0001QJ-HZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:35610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq5-0003YG-7R
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbq1-0004ew-6A
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:54:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E72BE2E8196
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:54:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:40:59 -0000
From: Thomas Huth <1364501@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm gdbstub
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor martin-galvan omgalvan-86 pmaydell th-huth
X-Launchpad-Bug-Reporter: martin (omgalvan-86)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140902163848.4037.99496.malonedeb@soybean.canonical.com>
Message-Id: <162006005994.13825.5339267136234894651.malone@wampee.canonical.com>
Subject: [Bug 1364501] Re: Gdb hangs when trying to single-step after an
 invalid instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d9242ce684f3d56fefa3a841c42f37e7a6fbc71c
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
Reply-To: Bug 1364501 <1364501@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/105


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #105
   https://gitlab.com/qemu-project/qemu/-/issues/105

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1364501

Title:
  Gdb hangs when trying to single-step after an invalid instruction

Status in QEMU:
  Expired

Bug description:
  When using Gdb to remote-debug a program and manually setting its PC
  to point to an address containing an invalid instruction and then
  doing a single step, Qemu will never return control to the remote Gdb.

  For instance, let's say address 0x114 contains an invalid instruction.
  On the remote Gdb, we'd do:

  (gdb) set $pc =3D 0x114
  (gdb) stepi

  After doing that we won't get the (gdb) prompt unless we do a Ctrl-C.
  If we do so we'll be left at 0x114 instead of going towards the
  exception handler as we should. This happens with stepi, step and
  next. If instead of single-stepping we used continue, the program will
  proceed into the exception handler as it should.

  The reason this is happening is that when Qemu realizes it's about to
  translate an instruction it doesn't recognize it'll generate a call to
  helper_exception_with_syndrome(), which will register the exception
  and then call cpu_loop_exit(). At the same time, because we're doing a
  single-step, Qemu will also generate a call to
  helper_exception_internal() passing it an EXCP_DEBUG, which lets the
  system know it'll give control back to the remote debugger, and it
  also ends with a call to cpu_loop_exit(). However, because the
  syndrome exception calls cpu_loop_exit() first, the call to the
  internal exception won't be reached and Qemu will be stuck in a loop
  without returning control to the remote debugger.

  What makes this a bit tricky to fix is that we must call
  cpu_loop_exit() at the end of helper_exception_with_syndrome(),
  otherwise the target exception will go undetected and its handler
  won't be excecuted.

  Tested on latest head by emulating a Stellaris lm3s6965 board and
  running RTEMS 4.11:

  $ qemu-system-arm -nographic -s -S -M lm3s6965evb -kernel my_rtems_app

  Commit hash in qemu.git: 30eaca3acdf17d7bcbd1213eb149c02037edfb0b

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1364501/+subscriptions

