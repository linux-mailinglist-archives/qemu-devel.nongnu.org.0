Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646178D96
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 16:16:42 +0200 (CEST)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs6S9-0003GT-Ib
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 10:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hs6RV-0002M9-6C
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hs6RU-0005tC-24
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:16:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:46368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hs6RT-0005rZ-Su
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:16:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hs6RS-00011U-5X
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 14:15:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28A972E80CD
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 14:15:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jul 2019 14:08:59 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edward-vielmetti pawel-moll pmaydell will-newton
X-Launchpad-Bug-Reporter: Will Newton (will-newton)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <149693268144.10005.16353270944603688746.malonedeb@wampee.canonical.com>
Message-Id: <156440933963.11302.2624194699322688049.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 330545bf4376d16d09c51ee55fbc89bc5637ee6b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1696773] Re: golang calls to exec crash user
 emulation
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
Reply-To: Bug 1696773 <1696773@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that this fix will be in the upcoming 4.1 release.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1696773

Title:
  golang calls to exec crash user emulation

Status in QEMU:
  Fix Committed

Bug description:
  An example program can be found here:

  https://github.com/willnewton/qemucrash

  This code starts a goroutine (thread) and calls exec repeatedly. This
  works ok natively but when run under ARM user emulation it segfaults
  (usually, there are occasionally other failures).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1696773/+subscriptions

