Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E42A1267B0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:07:25 +0100 (CET)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzGl-0000FQ-IT
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ihzB3-0004DX-ST
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ihzB2-0004yC-CE
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:01:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:45024)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ihzB1-0004w9-HP
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:01:28 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ihzAz-00015s-AX
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 17:01:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4E99B2E80C8
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 17:01:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Dec 2019 16:46:41 -0000
From: Nikita Tsukanov <1854204@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: keks9n pmaydell
X-Launchpad-Bug-Reporter: Nikita Tsukanov (keks9n)
X-Launchpad-Bug-Modifier: Nikita Tsukanov (keks9n)
References: <157488086829.22230.13834952580158911996.malonedeb@soybean.canonical.com>
Message-Id: <157677400186.5393.7088149627296359801.malone@gac.canonical.com>
Subject: [Bug 1854204] Re: Menu is not clickable on OSX Catalina
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1eba3d5f8baded0b2cafd5140cc4141a879cafa7
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

Catalina-specific. It also affects several UI toolkits. This workaround
https://stackoverflow.com/a/7602677 seems to help.

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

