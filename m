Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C257888A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 11:36:19 +0200 (CEST)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs24o-0001MP-NC
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 05:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58973)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hs24H-0000kY-Ah
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hs24G-0001hw-7V
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:46596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hs24G-0001hR-1Q
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hs24E-0000ra-1j
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:35:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A0452E80CC
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:35:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jul 2019 09:26:32 -0000
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
Message-Id: <156439239287.24243.11754744511111378719.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a4f976f55a8b8c51299211915a1c285ac25777c3
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

The sigaltstack fix is now in master (commit 5bfce0b74fbd5d530) and at
least in my test environment this also fixes the "can't build hello.go
reliably" example. So I'm marking this as 'fix committed'. If there are
still problems with running Go binaries, these are likely to be
independent bugs, so please open fresh LP issues for them.


** Changed in: qemu
       Status: In Progress =3D> Fix Committed

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

