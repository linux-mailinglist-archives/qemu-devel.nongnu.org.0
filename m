Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BD379F26
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:29:40 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKxf-0005Hy-Gm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKu5-00081r-4y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:59178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKtx-0003Eb-12
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKtu-0002Ko-Io
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CC722E813A
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:19:27 -0000
From: Thomas Huth <1862986@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jermy-07 laurent-vivier rth th-huth
X-Launchpad-Bug-Reporter: Marco (jermy-07)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158152698766.24807.871332888169155245.malonedeb@gac.canonical.com>
Message-Id: <162071036718.17080.16848585752596591498.malone@soybean.canonical.com>
Subject: [Bug 1862986] Re: qemu-s390x segfaults
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4c330b2bc837919783d388a2d7143bbc83165a44
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
Reply-To: Bug 1862986 <1862986@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: s390x

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862986

Title:
  qemu-s390x segfaults

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

