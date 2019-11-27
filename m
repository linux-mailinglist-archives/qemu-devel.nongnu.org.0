Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580610B64D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:02:51 +0100 (CET)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia2aQ-0008BJ-99
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ia2YR-0007Uz-7K
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:00:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ia2YP-0007XV-UU
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:00:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:49974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ia2YP-0007Ve-O4
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:00:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ia2YO-000559-A7
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 19:00:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 48ABA2E80C3
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 19:00:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Nov 2019 18:54:28 -0000
From: Nikita Tsukanov <1854204@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: keks9n
X-Launchpad-Bug-Reporter: Nikita Tsukanov (keks9n)
X-Launchpad-Bug-Modifier: Nikita Tsukanov (keks9n)
Message-Id: <157488086829.22230.13834952580158911996.malonedeb@soybean.canonical.com>
Subject: [Bug 1854204] [NEW] Menu is not clickable on OSX Catalina
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 60d62777e07157f0d105b180e35f7d5ef3fd2580
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
Reply-To: Bug 1854204 <1854204@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

1) Run `qemu-system-x86_64`
2) Try to click on the main menu

Menu is not clickable until another window is activated and QEMU window
is activated again

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854204

Title:
  Menu is not clickable on OSX Catalina

Status in QEMU:
  New

Bug description:
  1) Run `qemu-system-x86_64`
  2) Try to click on the main menu

  Menu is not clickable until another window is activated and QEMU
  window is activated again

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854204/+subscriptions

