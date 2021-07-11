Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D4E3C3A63
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 06:30:27 +0200 (CEST)
Received: from localhost ([::1]:45188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2R6o-0001Vy-94
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 00:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R39-0000kr-J9
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R37-0000dR-TO
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2R33-00064R-U9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78DD42E82BF
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1862874@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor joshuazhu stefanha th-huth
X-Launchpad-Bug-Reporter: JZ (joshuazhu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158147969798.15014.16243548781914826913.malonedeb@soybean.canonical.com>
Message-Id: <162597704149.19787.8315890722480237248.malone@loganberry.canonical.com>
Subject: [Bug 1862874] Re: java may stuck for a long time in system mode with
 "-cpu max"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 1737a14cc6aca9d2baa6d8899fdb3a38672ba00f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1862874 <1862874@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862874

Title:
  java may stuck for a long time in system mode with "-cpu max"

Status in QEMU:
  Expired

Bug description:
  Bug Description:
  Run "java -version" in guest VM, java may stuck for a long time (several =
hours) and then recover.

  Steps to reproduce:
  1. Launch VM by attached simple script: launch.sh
  2. Execute "java -version" and then print "date" in a loop
      while :
      do
        /home/bot/jdk/bin/java -version
        date
      done
  3. A long time gap will be observed: may > 24 hours.

  Technical details:
  * host: x86_64 Linux 4.15.0-70-generic
  * qemu v4.2.0
  * java: tried two versions: openjdk-11-jre-headless or compiled java-13 =

  * command-line: (See details in launch.sh)
  /home/bot/qemu/qemu-build/qemu-4.2.0/binaries/bin/qemu-system-x86_64 \
    -drive "file=3D${img},format=3Dqcow2" \
    -drive "file=3D${user_data},format=3Draw" \
    -cpu max \
    -m 24G \
    -serial mon:stdio \
    -smp 8 \
    -nographic \
  ;

  * Observed by java core dump generated by "kill -SIGSEGV" when java stuck=
ed:
  Different pthreads are blocked on their own condition variables:

    Id   Target Id         Frame
    1    Thread 0x7f48a041a080 (LWP 22470) __GI_raise (sig=3Dsig@entry=3D6)
      at ../sysdeps/unix/sysv/linux/raise.c:51
    2    Thread 0x7f487197d700 (LWP 22473) 0x00007f489f5c49f3 in futex_wait=
_cancelable (private=3D<optimized out>, expected=3D0, futex_word=3D0x7f4898=
0197c0)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:88
    3    Thread 0x7f4861b89700 (LWP 22483) 0x00007f489f5c4ed9 in futex_relt=
imed_wait_cancelable (private=3D<optimized out>, reltime=3D0x7f4861b88960, =
expected=3D0,
      futex_word=3D0x7f489801b084)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:142
    4    Thread 0x7f4861e8c700 (LWP 22480) 0x00007f489f5c76d6 in futex_abst=
imed_wait_cancelable (private=3D0, abstime=3D0x0, expected=3D0, futex_word=
=3D0x7f48980107c0)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
    5    Thread 0x7f4861c8a700 (LWP 22482) 0x00007f489f5c4ed9 in futex_relt=
imed_wait_cancelable (private=3D<optimized out>, reltime=3D0x7f4861c89800, =
expected=3D0,
      futex_word=3D0x7f489801ed44)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:142
    6    Thread 0x7f48a0418700 (LWP 22471) 0x00007f4880b13200 in ?? ()
    7    Thread 0x7f48703ea700 (LWP 22478) 0x00007f489f5c49f3 in futex_wait=
_cancelable (private=3D<optimized out>, expected=3D0, futex_word=3D0x7f4898=
01dfc0)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:88
    8    Thread 0x7f48702e9700 (LWP 22479) 0x00007f489f5c49f3 in futex_wait=
_cancelable (private=3D<optimized out>, expected=3D0, futex_word=3D0x7f4898=
38cd84)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:88
    9    Thread 0x7f4870f71700 (LWP 22475) 0x00007f489f5c49f3 in futex_wait=
_cancelable (private=3D<optimized out>, expected=3D0, futex_word=3D0x7f4898=
01a300)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:88
    10   Thread 0x7f487187b700 (LWP 22474) 0x00007f489f5c76d6 in futex_abst=
imed_wait_cancelable (private=3D0, abstime=3D0x0, expected=3D0, futex_word=
=3D0x7f48980cf770)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
    11   Thread 0x7f4871a7f700 (LWP 22472) 0x00007f489f5c76d6 in futex_abst=
imed_wait_cancelable (private=3D0, abstime=3D0x0, expected=3D0, futex_word=
=3D0x7f489809ba30)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
    12   Thread 0x7f4861d8b700 (LWP 22481) 0x00007f489f5c4ed9 in futex_relt=
imed_wait_cancelable (private=3D<optimized out>, reltime=3D0x7f4861d8a680, =
expected=3D0,
      futex_word=3D0x7f489801ed44)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:142
    13   Thread 0x7f48704ec700 (LWP 22477) 0x00007f489f5c4ed9 in futex_relt=
imed_wait_cancelable (private=3D<optimized out>, reltime=3D0x7f48704eb910, =
expected=3D0,
      futex_word=3D0x7f489801d120)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:142
    14   Thread 0x7f4870e6f700 (LWP 22476) 0x00007f489f5c4ed9 in futex_relt=
imed_wait_cancelable (private=3D<optimized out>, reltime=3D0x7f4870e6eb20, =
expected=3D0,
      futex_word=3D0x7f489828abd0)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:142

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862874/+subscriptions

