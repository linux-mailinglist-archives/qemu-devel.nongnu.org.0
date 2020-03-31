Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9A19996B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:17:13 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJIdc-0005AS-1G
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJIcW-0004N5-Ud
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJIcV-0004SD-IJ
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:16:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:36776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJIcV-0004R5-Cl
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:16:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJIcR-0008Rm-Rx
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 15:15:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 338192E80D2
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 15:15:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 Mar 2020 15:10:34 -0000
From: carlosedp <carlosedp@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: carlosedp laurent-vivier
X-Launchpad-Bug-Reporter: carlosedp (carlosedp)
X-Launchpad-Bug-Modifier: carlosedp (carlosedp)
References: <158445595923.20060.16174990100496488911.malonedeb@wampee.canonical.com>
Message-Id: <158566743431.24030.9186298318794643830.malone@soybean.canonical.com>
Subject: [Bug 1867786] Re: Qemu PPC64 freezes with multi-core CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 76f26eb0621368e6ac9af7afde0b3f44e883440c
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
Reply-To: Bug 1867786 <1867786@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent, confirm that after changing the network adapter to the
e1000e it worked flawlessly for hours with 4 cores on Macbook Pro.

Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867786

Title:
  Qemu PPC64 freezes with multi-core CPU

Status in QEMU:
  New

Bug description:
  I installed Debian 10 on a Qemu PPC64 VM running with the following
  flags:

  qemu-system-ppc64 \
       -nographic -nodefaults -monitor pty -serial stdio \
       -M pseries -cpu POWER9 -smp cores=3D4,threads=3D1 -m 4G \
       -drive file=3Ddebian-ppc64el-qemu.qcow2,format=3Dqcow2,if=3Dvirtio \
       -netdev user,id=3Dnetwork01,$ports -device rtl8139,netdev=3Dnetwork0=
1 \

  =

  Within a couple minutes on any operation (could be a Go application or si=
mply changing the hostname with hostnamectl, the VM freezes and prints this=
 on the console:

  ```
  root@debian:~# [  950.428255] rcu: INFO: rcu_sched self-detected stall on=
 CPU
  [  950.428453] rcu:     3-....: (5318 ticks this GP) idle=3D8e2/1/0x40000=
00000000004 softirq=3D5957/5960 fqs=3D2544
  [  976.244481] watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [zsh:462]

  Message from syslogd@debian at Mar 17 11:35:24 ...
   kernel:[  976.244481] watchdog: BUG: soft lockup - CPU#3 stuck for 23s! =
[zsh:462]
  [  980.110018] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tas=
ks: { 3-... } 5276 jiffies s: 93 root: 0x8/.
  [  980.111177] rcu: blocking rcu_node structures:
  [ 1013.442268] rcu: INFO: rcu_sched self-detected stall on CPU
  [ 1013.442365] rcu:     3-....: (21071 ticks this GP) idle=3D8e2/1/0x4000=
000000000004 softirq=3D5957/5960 fqs=3D9342
  ```

  If I change to 1 core on the command line, I haven't seen these
  freezes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1867786/+subscriptions

