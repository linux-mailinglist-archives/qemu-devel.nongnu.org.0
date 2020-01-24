Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D214921C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jan 2020 00:41:41 +0100 (CET)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv8a5-0004wc-1P
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 18:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iv8ZF-0004UE-Pu
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 18:40:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iv8ZE-0007vC-OM
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 18:40:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:47806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iv8ZE-0007sq-Hu
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 18:40:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iv8ZD-0005Xe-5J
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 23:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 23F7A2E804B
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 23:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jan 2020 23:33:36 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon rth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <157202549055.19422.9528970132264620058.malonedeb@wampee.canonical.com>
Message-Id: <157990881621.18726.1828040559976676570.malone@gac.canonical.com>
Subject: [Bug 1849879] Re: qemu-arm should accept vmrs apsr_nzcv,
 fpscr on M-profile
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6e202132229fde6eaa89a18479cb1c243f0b4796
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
Reply-To: Bug 1849879 <1849879@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in 2529ab43b8a05534494704e803e0332d111d8b91, which is in 4.2.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1849879

Title:
  qemu-arm should accept vmrs apsr_nzcv, fpscr on M-profile

Status in QEMU:
  Fix Released

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

