Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424B37502A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:29:12 +0200 (CEST)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYRb-0003CD-IE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOV-0008J8-WC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:54770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOR-0006OL-O5
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:25:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYOQ-0000Sk-84
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 36ED12E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:16:34 -0000
From: Thomas Huth <1867786@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: carlosedp laurent-vivier th-huth
X-Launchpad-Bug-Reporter: carlosedp (carlosedp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158445595923.20060.16174990100496488911.malonedeb@wampee.canonical.com>
Message-Id: <162028539473.14776.9613152975345527301.malone@soybean.canonical.com>
Subject: [Bug 1867786] Re: Qemu PPC64 freezes with multi-core CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 1af7d0cf71cb7a807c3cf7650fc12d5ef9abaeb7
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867786

Title:
  Qemu PPC64 freezes with multi-core CPU

Status in QEMU:
  Incomplete

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

