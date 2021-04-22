Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF7367974
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:46:42 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSAj-00058p-PJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS5P-0001tj-8j
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:41:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS5H-0005ro-Ox
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:41:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZS5F-0004Nt-U4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:41:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CFC182E8169
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:41:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:33:47 -0000
From: Thomas Huth <1748296@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgreenaway doug16k th-huth
X-Launchpad-Bug-Reporter: Doug Gale (doug16k)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151812332204.10331.17425660234309724521.malonedeb@wampee.canonical.com>
Message-Id: <161906962764.10328.13994938549841291143.malone@wampee.canonical.com>
Subject: [Bug 1748296] Re: TCG throws Invalid Opcode when executing x86 BMI
 shlx instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 9154842691dc737b52692253352ce61b43983b67
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
Reply-To: Bug 1748296 <1748296@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1748296

Title:
  TCG throws Invalid Opcode when executing x86 BMI shlx instruction

Status in QEMU:
  New

Bug description:
  I am unable to use BMI in my project when running under TCG. I
  narrowed the problem down to incorrect instruction decoding for BMI
  instructions (which have a 2 byte VEX prefix). The gen_sse function in
  translate.c reaches the goto label do_0f_38_fx, but b does not equal
  0x1f7, 0x2f7, or 0x3f7, so the switch takes the default path and
  raises an invalid opcode exception.

  The code executes correctly and passes the test under KVM.

  I have created a complete repro here: https://github.com/doug65536
  /qemu-bmibug

  The makefile has the following utility targets:

  debug-kvm: Build and run the VM using KVM and wait for gdbstub attach

  run: Run the test case with TCG, make fails if the test fails. (It
  will fail)

  run-kvm: Run the test case with KVM, make fails if the test fails. (It
  will succeed)

  debug: Build and run the VM with TCG and wait for GDB attach

  attach-gdb: Run GDB and attach to QEMU gdbstub

  The VM runs with -cpu max. CPUID reports support for BMI, BMI2, and
  ABM.

  You can quickly verify the issue by executing `make run-kvm` to
  confirm that KVM passes, then `make run` to confirm that TCG fails.

  I believe the bug affects other BMI, BMI2, and ABM instructions, but I
  have only completely verified incorrect execution of SHLX.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1748296/+subscriptions

