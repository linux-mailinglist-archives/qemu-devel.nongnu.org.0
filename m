Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFE3BC5B5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:47:59 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d02-00085d-3M
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfj-0000an-7C
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfh-0003Tu-Cw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfT-0004xC-Pp
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 49A9D2E822D
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1867786@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: carlosedp janitor laurent-vivier th-huth
X-Launchpad-Bug-Reporter: carlosedp (carlosedp)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158445595923.20060.16174990100496488911.malonedeb@wampee.canonical.com>
Message-Id: <162554504596.7821.11955567064359819091.malone@loganberry.canonical.com>
Subject: [Bug 1867786] Re: Qemu PPC64 freezes with multi-core CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: d859df9b3d2c807a8e14189926a6a09df04e753c
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
Reply-To: Bug 1867786 <1867786@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867786

Title:
  Qemu PPC64 freezes with multi-core CPU

Status in QEMU:
  Expired

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

