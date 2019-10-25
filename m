Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0865FE5293
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 19:52:07 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO3kr-0002Rv-Hz
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 13:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iO3jV-0006hD-PO
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 13:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iO3jU-0002pC-H6
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 13:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:54296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iO3jU-0002m7-BT
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 13:50:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iO3jR-0003CP-N4
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 17:50:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A49D02E80C7
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 17:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Oct 2019 17:44:50 -0000
From: Christophe Lyon <christophe.lyon+launchpad@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Christophe Lyon (christophe-lyon)
Message-Id: <157202549055.19422.9528970132264620058.malonedeb@wampee.canonical.com>
Subject: [Bug 1849879] [NEW] qemu-arm should accept vmrs apsr_nzcv,
 fpscr on M-profile
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4eb4d326b34da28511cf36ef34ad4344cb194344
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
Reply-To: Bug 1849879 <1849879@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I've noticed that qemu-arm for cortex-M considers
vmrs apsr_nzcv, fpscr
as an illegal instruction.

In this case, rt=3D=3D15 means APSR, and the instruction should be accepted
and executed like for A-profile.

I posted a small patch:
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg06978.html

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1849879

Title:
  qemu-arm should accept vmrs apsr_nzcv, fpscr on M-profile

Status in QEMU:
  New

Bug description:
  I've noticed that qemu-arm for cortex-M considers
  vmrs apsr_nzcv, fpscr
  as an illegal instruction.

  In this case, rt=3D=3D15 means APSR, and the instruction should be
  accepted and executed like for A-profile.

  I posted a small patch:
  https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg06978.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1849879/+subscriptions

