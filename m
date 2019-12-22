Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3512906D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 01:06:32 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijBF1-0006WE-9Q
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 19:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ijBEB-00065F-N0
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 19:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ijBEA-0005Hb-7a
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 19:05:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:57678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ijBEA-0005CC-05
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 19:05:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ijBE6-0006js-RK
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 00:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C3BC52E80C0
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 00:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Dec 2019 23:57:14 -0000
From: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano?=
 <1857269@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: untio
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano_=28un?=
 =?utf-8?q?tio=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano_=28un?=
 =?utf-8?q?tio=29?=
Message-Id: <157705903476.27888.2879696880940848378.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1857269] [NEW] Spanish keyboard from Spain (Europe) not found
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7cfb88ac2d1c68cfa3cc56c89ce58397499f5c95
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1857269 <1857269@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

I am working with windows qemu version:

qemu-w64-setup-20190815

I have installed a msdos virtual machine on qemu with sp keyboard layout
(Spain at Europe). I have found that some keys do not work in the way
they should. I believe that the problem is that es qemu spanish keyboard
layout is the latin one, la in msdos sysytem.

I ask you to create the Spain layout.


Thanks in advance.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857269

Title:
  Spanish keyboard from Spain (Europe) not found

Status in QEMU:
  New

Bug description:
  Hello,

  I am working with windows qemu version:

  qemu-w64-setup-20190815

  I have installed a msdos virtual machine on qemu with sp keyboard
  layout (Spain at Europe). I have found that some keys do not work in
  the way they should. I believe that the problem is that es qemu
  spanish keyboard layout is the latin one, la in msdos sysytem.

  I ask you to create the Spain layout.


  Thanks in advance.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857269/+subscriptions

