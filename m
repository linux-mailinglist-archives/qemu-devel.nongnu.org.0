Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57931997B1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 15:40:23 +0200 (CEST)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJH7u-00011c-8Q
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 09:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJH3L-00058o-22
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJH3J-0003j0-LN
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:35:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:36050)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJH3J-0003hC-FM
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:35:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJH3H-0000ZY-Nl
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 13:35:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA4632E8076
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 13:35:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 Mar 2020 13:29:06 -0000
From: Manuel Reimer <manuel.reimer@gmx.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: manuel-reimer pmaydell
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Manuel Reimer (manuel-reimer)
References: <158559478745.21027.13296208481863226077.malonedeb@gac.canonical.com>
Message-Id: <158566134617.11461.12971375517728098619.malone@chaenomeles.canonical.com>
Subject: [Bug 1869782] Re: qemu-arm-static crashes "segmentation fault" when
 running "svn checkout"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4184842c02aef322bc4bc11ef5b81ad693a91193
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

This is a "Ubuntu Bionic" thing.

I've tried again on a VM with up-to-date Ubuntu Bionic and get the same
segfault.

For comparison I've placed the Debian build of qemu-user-static version
4.2 to my Arch Linux VM and have no crash there.

So either the kernel version or some kernel configuration. Now I'm
trying to get a coredump on my VM.

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

