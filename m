Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81E8FA0B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 06:51:59 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyUDW-0003nF-BC
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 00:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyUCH-0002va-Cm
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyUCG-0003o1-BP
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:50628)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyUCG-0003nU-4w
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:50:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyUCE-0002Do-T9
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 04:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C79B32E80D3
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 04:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 04:44:42 -0000
From: Thomas Huth <1834496@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee christophe-lyon
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156164884976.17804.15592866928864750515.malonedeb@wampee.canonical.com>
Message-Id: <156593068260.26490.13925036360188652172.launchpad@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d1ee5bc6b41a5f1ce3e490d579d3303481287ee2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1834496] Re: Regressions on arm target with some
 GCC tests
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
Reply-To: Bug 1834496 <1834496@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1834496

Title:
  Regressions on arm target with some GCC tests

Status in QEMU:
  Fix Released

Bug description:
  Hi,

  After trying qemu master:
  commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde
  Merge: 68d7ff0 14f5d87
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Fri Jun 21 15:40:50 2019 +0100

  I found several regressions compared to qemu-3.1 when running the GCC tes=
tsuite.
  I'm attaching a tarball containing several GCC tests (binaries), needed s=
hared libs, and a short script to run all the tests.

  All tests used to pass w/o error (one of them is verbose), but with a
  recent qemu, all of them make qemu crash:

  qemu: uncaught target signal 6 (Aborted) - core dumped

  This was noticed with GCC master configured with
  --target arm-none-linux-gnueabi
  --with-mode arm
  --with-cpu cortex-a9

  and calling qemu with --cpu cortex-a9 (the script uses "any", this
  makes no difference).

  I have noticed other failures with arm-v8 code, but this is probably
  the same root cause. Since it's a bit tedious to manually rebuild &
  extract the testcases, I'd prefer to start with this subset, and I can
  extract more if needed later.

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1834496/+subscriptions

