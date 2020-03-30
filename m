Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B431983EE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 21:09:53 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIznE-0002Bh-Je
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 15:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jIzjB-0001Ti-9Y
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 15:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jIzjA-0001LI-7a
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 15:05:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:52552)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jIzjA-0001Jz-2A
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 15:05:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jIzj8-0001PO-ID
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 19:05:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 86C362E80C3
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 19:05:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Mar 2020 18:59:47 -0000
From: Manuel Reimer <manuel.reimer@gmx.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: manuel-reimer
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Manuel Reimer (manuel-reimer)
Message-Id: <158559478745.21027.13296208481863226077.malonedeb@gac.canonical.com>
Subject: [Bug 1869782] [NEW] qemu-arm-static crashes "segmentation fault" when
 running "svn checkout"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d7bbb863a234f51c0eca22d3218829ca86a522c4
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
Reply-To: Bug 1869782 <1869782@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I'm not actually sure how far I can help as I so far failed to reproduce
the issue on my local VM but I get it on Travis CI every time. I even
went through the hassle of hacking a Debian repository into their Ubuntu
Bionic VM to get qemu 4.2 as I hoped a new version could fix this.

This build runs in an armv6h chroot. I don't get the segfault if I do
the same on an armv7h chroot for some reason.

Here is where the error occured: https://travis-
ci.com/github/VDR4Arch/vdr4arch/jobs/309106220#L5420

Maybe now I'll just try to remove all uses of svn in my build scripts...

Is it actually a viable solution to cross-build with qemu? I'm starting
to doubt it...

Would it help if I manage to get this core dump out of Travis somehow
(maybe make Travis push it to some GIT or upload it to my webserver)?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869782

Title:
  qemu-arm-static crashes "segmentation fault" when running "svn
  checkout"

Status in QEMU:
  New

Bug description:
  I'm not actually sure how far I can help as I so far failed to
  reproduce the issue on my local VM but I get it on Travis CI every
  time. I even went through the hassle of hacking a Debian repository
  into their Ubuntu Bionic VM to get qemu 4.2 as I hoped a new version
  could fix this.

  This build runs in an armv6h chroot. I don't get the segfault if I do
  the same on an armv7h chroot for some reason.

  Here is where the error occured: https://travis-
  ci.com/github/VDR4Arch/vdr4arch/jobs/309106220#L5420

  Maybe now I'll just try to remove all uses of svn in my build
  scripts...

  Is it actually a viable solution to cross-build with qemu? I'm
  starting to doubt it...

  Would it help if I manage to get this core dump out of Travis somehow
  (maybe make Travis push it to some GIT or upload it to my webserver)?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869782/+subscriptions

