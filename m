Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC8698BE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 18:00:48 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn3PB-000062-LK
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 12:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55211)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hn3OU-0007RD-Lu
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 12:00:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hn3OS-0003Xf-QF
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 12:00:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:42270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hn3OS-0003We-EB
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 12:00:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hn3OR-0008Nw-9E
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 15:59:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 451A02E8055
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 15:59:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jul 2019 15:49:46 -0000
From: Thomas Huth <1606708@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: josem11200 th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Miguel_=28josem11200=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160726215226.16940.44257.malonedeb@wampee.canonical.com>
Message-Id: <156320578666.15671.5318504744964181470.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 119407b4fb552c547c505f07f947bd94342a29e6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1606708] Re: QEMU crashes when switching consoles
 using SDL
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
Reply-To: Bug 1606708 <1606708@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this should be fixed with the latest version of QEMU ... or can
you still reproduce this issue with the latest version?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1606708

Title:
  QEMU crashes when switching consoles using SDL

Status in QEMU:
  Incomplete

Bug description:
  I've trying to use QEMU with SDL, and I noticed that it doesn't behave
  well, specially when switching from VGA to any console. Resuming,
  switching is erratic when using SDL, and its effects go from creating
  a new window, doing nothing, showing a window that disappears
  inmediately or even crash.

  Tested with:
  Arch Linux with all packages updated (2016/7/26)
  TWM as window manager
  QEMU (both stable 2.6.0-1 and latest git commit f49ee63)
  Command: qemu-system-x86_64 -display sdl

  sdl2 version 2.0.4-2

  How to reproduce:
  1. Open QEMU with the given command
  2. Try to switch console (Ctrl-Alt-2 for example)

  Expected behaviour:
  As in GTK, the window should now show the desired console

  Actual behaviour:
  Here I have to say I can't explain it very well. Almost always it just cr=
eates a new window that shows the desired console, but it is closed inmedia=
tley. If not, it opens a new window that keeps open, and it sometimes is re=
sponsive, but further attempts to switch consoles end causing a crash, and =
QEMU has to be SIGKILLed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1606708/+subscriptions

