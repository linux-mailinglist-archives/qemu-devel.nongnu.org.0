Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC919047A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 05:27:35 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGbA5-0006sb-Oe
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 00:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jGb8Z-0005KG-9u
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 00:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jGb8Y-0005lo-6P
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 00:25:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:36970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jGb8Y-0005lQ-1G
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 00:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jGb8V-0001hN-1M
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 04:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BEC5F2E80C7
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Mar 2020 04:17:17 -0000
From: Launchpad Bug Tracker <1661176@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth uqbar
X-Launchpad-Bug-Reporter: Uqbar (uqbar)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170202083419.1225.82778.malonedeb@wampee.canonical.com>
Message-Id: <158502343981.22792.5886095619049387880.malone@loganberry.canonical.com>
Subject: [Bug 1661176] Re: [2.8.0] Under VNC CTRL-ALT-2 doesn't get to the
 monitor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fe3c3458e5e8d75e5d4854ccb7b0b7b099432686
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1661176

Title:
  [2.8.0] Under VNC CTRL-ALT-2 doesn't get to the monitor

Status in QEMU:
  Expired

Bug description:
  With version 2.6.2 I could access the monitor via VNC by pressing CTRL-AL=
T-2, while CTRL-ALT-3 brought me to the "serial0 console". CTRL-ALT-1 broug=
ht me back to the VGA console.
  Since 2.8.0 CTRL-ALT-2 brings me to the "serial0 console" and CTRL-ALT-3 =
to the "parallel0 console". The monitor is not available any more, to any C=
TRL-ALT-1stROW.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1661176/+subscriptions

