Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0158FA4B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 07:18:24 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyUd5-0000T2-8b
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 01:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyUaZ-0007ZZ-4L
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyUaY-0004LN-0N
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:15:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:53322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyUaX-0004Ke-Qz
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:15:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyUaW-0004Bv-KQ
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:15:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 996E82E80C8
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:15:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 05:02:57 -0000
From: Thomas Huth <1836192@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon pmaydell th-huth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156284637398.20784.534354445818037577.malonedeb@gac.canonical.com>
Message-Id: <156593177746.26262.13174979458168222300.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 50bcd7a7eca07449c5df4ab8444cf9610b2ef2e7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836192] Re: Regressions on arm926 target with
 some GCC tests
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
Reply-To: Bug 1836192 <1836192@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dcb7cef8b32033f6284a47=
d797

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836192

Title:
  Regressions on arm926 target with some GCC tests

Status in QEMU:
  Fix Released

Bug description:
  Hi,

  After trying qemu master:
  commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde
  Merge: 68d7ff0 14f5d87
  Author: Peter Maydell <email address hidden>
  Date: Fri Jun 21 15:40:50 2019 +0100

  even with the fix for https://bugs.launchpad.net/qemu/+bug/1834496,
  I've noticed several regressions compared to qemu-3.1 when running the GC=
C testsuite, with GCC configured to generate arm10tdmi code by default, and=
 using qemu's --cpu arm926.

  I'm attaching a tarball containing one of the GCC tests (binaries),
  needed shared libs, and a short script to run the test.

  This was noticed with GCC master configured with
  --target arm-none-linux-gnueabi
  --with-cpu arm10tdmi
  --with-fpu vfp

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836192/+subscriptions

