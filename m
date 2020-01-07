Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F245132482
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:09:40 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomjx-0001v9-L7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iomgO-0003sb-6j
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:05:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iomgN-0004Si-1t
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:05:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:38614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iomgM-0004SP-SL
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:05:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iomgL-0005Hz-Ly
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 11:05:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8DDA02E80CB
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 11:05:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jan 2020 10:52:17 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1856706@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157658912470.5706.7275804988501900768.malonedeb@gac.canonical.com>
Message-Id: <157839433808.28078.8477173995897738350.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1856706] Re: target/mips/op_helper.c:971:duplicated branches ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6148c4f3e77edfae7b0fe28b9124fa90d8a05f70
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

** Tags added: mips

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

