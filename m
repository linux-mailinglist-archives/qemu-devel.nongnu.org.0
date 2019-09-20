Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2858B8C84
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 10:22:05 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBEB2-0006RD-Hm
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 04:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iBE9s-0005ex-V7
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iBE9r-0003Vx-JR
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:20:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:54060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iBE9r-0003VB-Dj
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:20:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iBE9p-0006FV-Es
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 08:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F9782E80CD
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 08:20:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Sep 2019 08:08:13 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h jamespharvey20
X-Launchpad-Bug-Reporter: James Harvey (jamespharvey20)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <156790812963.29382.11232177290822294099.malonedeb@chaenomeles.canonical.com>
Message-Id: <156896689342.5029.8017679812124695504.malone@chaenomeles.canonical.com>
Subject: [Bug 1843151] Re: Regression: QEMU 4.1.0 qxl and KMS resoluiton only
 4x10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 31f46d9c1dcc0326a8bcc2ee445f8f0f96dca681
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
Reply-To: Bug 1843151 <1843151@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi James,
  The change in QEMU in 4.1 is that it's using a newer spice interface;  Fr=
eddy is on our spice team and we chatted about whether to change QEMU but t=
hey thought it best to fix Spice to be more tolerant; so I'm happy to go wi=
th that recommendation.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843151

Title:
  Regression: QEMU 4.1.0 qxl and KMS resoluiton only 4x10

Status in QEMU:
  New

Bug description:
  Host is Arch Linux.  linux 5.2.13, qemu 4.1.0.  virt-viewer 8.0.

  Guest is Arch Linux Sept 2019 ISO.  linux 5.2.11.

  Have replicated this both on a system using amdgpu and one using
  integrated ASPEED graphics.

  Downgrading from 4.1.0 to 4.0.0 works as usual, see:
  https://www.youtube.com/watch?v=3DNyMdcYwOCvY

  Going back to 4.1.0 reproduces, see:
  https://www.youtube.com/watch?v=3DH3nGG2Mk6i0

  4.1.0 displays fine until KMS kicks in.

  Using 4.1.0 with virtio-vga doesn't cause this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843151/+subscriptions

