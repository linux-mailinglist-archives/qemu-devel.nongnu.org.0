Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A11461E9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 07:13:59 +0100 (CET)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuVkc-0006wJ-My
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 01:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iuVhg-0003VB-5F
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iuVhe-0007pw-Sh
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:53704)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iuVhe-0007p5-Nn
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iuVhe-0001Y9-0R
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:10:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F06592E8042
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:10:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2020 06:02:15 -0000
From: Thomas Huth <1661176@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth uqbar
X-Launchpad-Bug-Reporter: Uqbar (uqbar)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170202083419.1225.82778.malonedeb@wampee.canonical.com>
Message-Id: <157975933508.4803.14438173345251188786.malone@soybean.canonical.com>
Subject: [Bug 1661176] Re: [2.8.0] Under VNC CTRL-ALT-2 doesn't get to the
 monitor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c196ee5262afb8f9a2fad284c9ca85b264a69567
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1661176 <1661176@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you still reproduce your issue with the latest version of QEMU
(currently v4.2.0)? Please also always add the way how you launched QEMU
(ie. the command line parameters)

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1661176

Title:
  [2.8.0] Under VNC CTRL-ALT-2 doesn't get to the monitor

Status in QEMU:
  Incomplete

Bug description:
  With version 2.6.2 I could access the monitor via VNC by pressing CTRL-AL=
T-2, while CTRL-ALT-3 brought me to the "serial0 console". CTRL-ALT-1 broug=
ht me back to the VGA console.
  Since 2.8.0 CTRL-ALT-2 brings me to the "serial0 console" and CTRL-ALT-3 =
to the "parallel0 console". The monitor is not available any more, to any C=
TRL-ALT-1stROW.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1661176/+subscriptions

