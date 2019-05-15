Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435751EC19
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 12:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQr9w-0005kD-Eu
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 06:29:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQr8G-0004u5-72
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQr8E-0007H5-W7
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:27:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:49242)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hQr8E-0007Ge-QH
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:27:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hQr8C-0001yG-Q6
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 10:27:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 6BD072E80CB
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 10:27:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 May 2019 10:11:30 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: insspir philmd pmaydell th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Dariusz_Zyza=C5=84ski_=28insspir=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <155787117310.15024.60120190997628985.malonedeb@gac.canonical.com>
Message-Id: <155791509010.15725.18273977661483049091.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: c6f2fd78b10eaa47f07e9e6fca9fa521c7018e2e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829079] Re: Can't build static on ARM (Raspbian)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1829079 <1829079@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You might find that adding --disable-tools to your configure line also
helps in not trying to statically link random binaries you don't really
want.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829079

Title:
  Can't build static on ARM (Raspbian)

Status in QEMU:
  Invalid

Bug description:
  I am trying to build static QEMU on Raspbian, chrooted into using systemd=
-nspawn with QEMU 4.0.0.
  This is how my compiling looks:
  https://pastebin.com/PYZYeRCN
  Just the problematic part:
  https://pastebin.com/7LxWPMxA
  How I do the compiling:
  https://pastebin.com/pYM17A6R (I plan to share this tutorial when it will=
 work)
  It is a coincidence, or the build fails because it cannot find lp11-kit. =
I did some symlinks:
  ln -s /usr/lib/arm-linux-gnueabihf/libp11-kit.so.0 /usr/lib/libp11-kit.so=
.0
  ln -s /usr/lib/arm-linux-gnueabihf/libp11-kit.so /usr/lib/libp11-kit.so
  (should I also symlink libp11.so and libp11.so.2? I think I have installe=
d all required p11 packages!

  Git commit hash: git rev-parse HEAD
  e329ad2ab72c43b56df88b34954c2c7d839bb373

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829079/+subscriptions

