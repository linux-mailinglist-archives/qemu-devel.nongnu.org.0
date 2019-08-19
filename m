Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1EF951A8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 01:27:39 +0200 (CEST)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzr3q-0003xC-Ne
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 19:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hzr1u-0002bh-N2
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 19:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hzr1t-0005rs-HY
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 19:25:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:59782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hzr1t-0005rA-Bw
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 19:25:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hzr1s-00027s-M6
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 23:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A2F702E804E
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 23:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Aug 2019 23:16:36 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1840719@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: bios floppy x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156625651066.23088.12772675524876649281.malonedeb@chaenomeles.canonical.com>
Message-Id: <156625659644.22883.7424574144332167350.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e7f6cb401878d2ac8fc5bb1d8e46c53489bb09b8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840719] Re: win98se floppy fails to boot with
 isapc machine
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
Reply-To: Bug 1840719 <1840719@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bisected following note from http://gunkies.org/wiki/I386-softmmu:

the isapc configuration no longer works... So legacy systems must resort
to Qemu 0.9.0 or Qemu 0.10.0

I get:

fd646122418ecefcde228d43821d07da79dd99bb is the first bad commit
commit fd646122418ecefcde228d43821d07da79dd99bb
Author: Anthony Liguori <aliguori@us.ibm.com>
Date:   Fri Oct 30 09:06:09 2009 -0500

    Switch pc bios from pc-bios to seabios
    =

    SeaBIOS is a port of pc-bios to GCC.  Besides using a more modern tool =
chain,
    SeaBIOS introduces a number of new features including PMM support, bett=
er
    BEV and BCV support, and better PnP support.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840719

Title:
  win98se floppy fails to boot with isapc machine

Status in QEMU:
  New

Bug description:
  QEMU emulator version 4.1.50 (commit 50d69ee0d)

  floppy image from:
  https://winworldpc.com/download/417d71c2-ae18-c39a-11c3-a4e284a2c3a5

  $ qemu-system-i386 -M isapc -fda Windows\ 98\ Second\ Edition\ Boot.img
  SeaBIOS (version rel-1.12.1-0...)
  Booting from Floppy...
  Boot failed: could not read the boot disk

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840719/+subscriptions

