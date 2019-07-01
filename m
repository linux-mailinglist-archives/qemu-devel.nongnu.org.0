Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952546C47
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 00:21:48 +0200 (CEST)
Received: from localhost ([::1]:55624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbuZv-0002CL-Am
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 18:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52399)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hbuYr-0001nD-Aa
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 18:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hbuYq-0008Kj-78
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 18:20:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:57548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hbuYq-0008I3-1U
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 18:20:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hbuYn-00032S-S9
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 22:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B90512E80CE
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 22:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2019 22:12:26 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rth
X-Launchpad-Bug-Reporter: Richard Henderson (rth)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
Message-Id: <156055034616.22882.34472617820287855.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 186eed1c45d0e36518e9987431eee19f7327b801
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832916] [NEW] linux-user does not check PROT_EXEC
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
Reply-To: Bug 1832916 <1832916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

At no point do we actually verify that a page is PROT_EXEC before
translating.  All we end up verifying is that the page is readable.  Not
the same thing, obviously.

The following test case should work for any architecture, though I've
only validated it for x86_64 and aarch64.

** Affects: qemu
     Importance: Undecided
     Assignee: Richard Henderson (rth)
         Status: New

** Attachment added: "z.c"
   https://bugs.launchpad.net/bugs/1832916/+attachment/5270854/+files/z.c

** Changed in: qemu
     Assignee: (unassigned) =3D> Richard Henderson (rth)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832916

Title:
  linux-user does not check PROT_EXEC

Status in QEMU:
  New

Bug description:
  At no point do we actually verify that a page is PROT_EXEC before
  translating.  All we end up verifying is that the page is readable.
  Not the same thing, obviously.

  The following test case should work for any architecture, though I've
  only validated it for x86_64 and aarch64.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832916/+subscriptions

