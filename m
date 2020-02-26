Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB1E1708F4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 20:32:39 +0100 (CET)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j72QA-00029S-Iw
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 14:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j72Om-0001f7-0D
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 14:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j72Ok-0003eH-Hv
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 14:31:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:34898)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j72Ok-0003dR-Ba
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 14:31:10 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j72Oh-0000ZW-W4
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 19:31:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EFD9E2E80CC
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 19:31:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Feb 2020 19:23:27 -0000
From: Marco <jermy.07@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jermy-07 rth
X-Launchpad-Bug-Reporter: Marco (jermy-07)
X-Launchpad-Bug-Modifier: Marco (jermy-07)
References: <158152698766.24807.871332888169155245.malonedeb@gac.canonical.com>
Message-Id: <158274500769.14403.9474963416061479208.malone@soybean.canonical.com>
Subject: [Bug 1862986] Re: qemu-s390x crashes when run on aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cbd08e35da6cd6d0cf8bb313d0381e2e35c98e78
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1862986 <1862986@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Attachment added: "A smaller test binary that also crashes"
   https://bugs.launchpad.net/qemu/+bug/1862986/+attachment/5331362/+files/=
hello_world.exe

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862986

Title:
  qemu-s390x crashes when run on aarch64

Status in QEMU:
  Incomplete

Bug description:
  All tested versions (2.11 and 4.2) qemu-s390x crashes with a segfault
  when run on an aarch64 odroid Ubuntu.


  Steps to reproduce:

  root@odroid:~/workspace/bitcoin-core# /usr/local/bin/qemu-s390x "/root/wo=
rkspace/bitcoin-core/build/bitcoin-s390x-linux-gnu/src/test/test_bitcoin_or=
ig"
  Segmentation fault (core dumped)
  root@odroid:~/workspace/bitcoin-core# /usr/local/bin/qemu-s390x --version
  qemu-s390x version 4.2.0
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
  root@odroid:~/workspace/bitcoin-core# /usr/bin/qemu-s390x "/root/workspac=
e/bitcoin-core/build/bitcoin-s390x-linux-gnu/src/test/test_bitcoin_orig"
  Segmentation fault (core dumped)
  root@odroid:~/workspace/bitcoin-core# /usr/bin/qemu-s390x --version
  qemu-s390x version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.22)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  qemu-arm does work on the same machine:

  root@odroid:~/workspace/bitcoin-core# /usr/bin/qemu-arm bitcoin-0.19.0.1-=
armhf/bin/test_bitcoin -t amount_tests
  Running 4 test cases...

  *** No errors detected
  root@odroid:~/workspace/bitcoin-core# /usr/local/bin/qemu-arm bitcoin-0.1=
9.0.1-armhf/bin/test_bitcoin -t amount_tests
  Running 4 test cases...

  *** No errors detected


  =

  What kind of debug information would be helpful for this issue report?
  GDB for the self-compiled latest release is not particularly helpful:

  (gdb) run
  Starting program: /usr/local/bin/qemu-s390x /root/workspace/bitcoin-core/=
build/bitcoin-s390x-linux-gnu/src/test/test_bitcoin_orig
  [Thread debugging using libthread_db enabled]
  Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1=
".
  [New Thread 0x7fb7a2a140 (LWP 28264)]

  Thread 1 "qemu-s390x" received signal SIGSEGV, Segmentation fault.
  0x000000555596b218 in __bss_start__ ()
  (gdb) bt
  #0  0x000000555596b218 in __bss_start__ ()
  #1  0x00000055556120a8 in ?? ()
  #2  0x00000055579904b0 in ?? ()
  Backtrace stopped: previous frame inner to this frame (corrupt stack?)


  =

  A bit more information is available in the version shipped by Ubuntu:

  (gdb) run
  Starting program: /usr/bin/qemu-s390x /root/workspace/bitcoin-core/build/=
bitcoin-s390x-linux-gnu/src/test/test_bitcoin_orig
  [Thread debugging using libthread_db enabled]
  Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1=
".
  [New Thread 0x7fb7a01180 (LWP 28271)]

  Thread 1 "qemu-s390x" received signal SIGSEGV, Segmentation fault.
  0x0000005555738f98 in code_gen_buffer ()
  (gdb) bt
  #0  0x0000005555738f98 in code_gen_buffer ()
  #1  0x00000055555e96c8 in cpu_exec ()
  #2  0x00000055555ee430 in cpu_loop ()
  #3  0x00000055555c3328 in main ()

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862986/+subscriptions

