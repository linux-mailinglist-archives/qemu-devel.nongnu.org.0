Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89D9D644
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:13:00 +0200 (CEST)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2KQF-0004yI-Hn
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i2KOk-0004Wp-9o
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i2KOj-0004tr-8L
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:11:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:53064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i2KOj-0004tM-3K
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:11:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i2KOg-0003H8-6W
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 19:11:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F1C32E80CB
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 19:11:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Aug 2019 19:02:31 -0000
From: Idar Lund <1839060@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: idarlund spheenik
X-Launchpad-Bug-Reporter: Martin Schrodt (spheenik)
X-Launchpad-Bug-Modifier: Idar Lund (idarlund)
References: <156507518934.25260.15982229597694445610.malonedeb@soybean.canonical.com>
Message-Id: <156684615154.6632.11941863890978210002.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19031";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e5d1af1b9d5c8d0f82e56e72d1bdf4fa71185235
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1839060] Re: HDA device non functional in Windows
 10 1903
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
Reply-To: Bug 1839060 <1839060@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Created Windows feedback as instructed by Andre:
https://aka.ms/AA5wlk7
Please upvote this to get attention by Microsoft.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839060

Title:
  HDA device non functional in Windows 10 1903

Status in QEMU:
  New

Bug description:
  I made the update to 1903, and the HDA device stopped working.

  The driver says the device is working correctly, but it does not.
  When I try to open the Windows sound configuration, the dialog hangs and =
never shows it's content.

  Several people reported this back in May:

  https://windowsreport.com/windows-10-v1903-ich6-ich9-virtio/

  I can confirm I have exactly the same problem.

  Host is Arch Linux, current (5.2.5) kernel, QEMU 4.0.

  I enabled HDA debug output and compared an older, working Windows
  version to 1903, but could not see the difference. The driver seems to
  issue the same verbs.

  I am happy to provide additional information if needed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839060/+subscriptions

