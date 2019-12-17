Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3615122D01
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 14:36:34 +0100 (CET)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihD1d-00011V-PE
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ihD0d-0000PV-GC
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 08:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ihD0c-0006gX-Es
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 08:35:31 -0500
Received: from indium.canonical.com ([91.189.90.7]:44690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ihD0c-0006er-93
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 08:35:30 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ihD0a-0001T5-O9
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 13:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A172A2E80C0
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 13:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Dec 2019 13:25:24 -0000
From: dcb <1856706@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: dcb (dcb314)
Message-Id: <157658912470.5706.7275804988501900768.malonedeb@gac.canonical.com>
Subject: [Bug 1856706] [NEW] target/mips/op_helper.c:971:duplicated branches ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ae0e103bfceb315fa26b6ca6ebbbf11756359e23
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
Reply-To: Bug 1856706 <1856706@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qemu-4.2.0/target/mips/op_helper.c:971:8: warning: this condition has
identical branches [-Wduplicated-branches]

Source code is

   if (other_tc =3D=3D other->current_tc) {
        tccause =3D other->CP0_Cause;
    } else {
        tccause =3D other->CP0_Cause;
    }

Possible cut'n'paste error ?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856706

Title:
  target/mips/op_helper.c:971:duplicated branches ?

Status in QEMU:
  New

Bug description:
  qemu-4.2.0/target/mips/op_helper.c:971:8: warning: this condition has
  identical branches [-Wduplicated-branches]

  Source code is

     if (other_tc =3D=3D other->current_tc) {
          tccause =3D other->CP0_Cause;
      } else {
          tccause =3D other->CP0_Cause;
      }

  Possible cut'n'paste error ?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856706/+subscriptions

