Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBBF62C99
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 01:21:44 +0200 (CEST)
Received: from localhost ([::1]:45586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkcx4-0005Ab-Qf
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 19:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkcw1-0004Ue-Vv
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 19:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkcw0-00042K-Ue
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 19:20:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:39738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkcw0-00041s-PK
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 19:20:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkcvz-0003SF-GX
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 23:20:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 69D262E802D
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 23:20:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jul 2019 23:11:39 -0000
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 shacknetisp
X-Launchpad-Bug-Reporter: shacknetisp (shacknetisp)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <156261335686.24679.15455554757536791509.malonedeb@soybean.canonical.com>
Message-Id: <156262749963.2308.13837101469597760290.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 89d0979c32999029f8bc2375fb4a503ef2407ba6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835827] Re: HTIF symbols no longer recognized by
 RISC-V spike board
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
Reply-To: Bug 1835827 <1835827@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, I'll add it to my to do list then

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835827

Title:
  HTIF symbols no longer recognized by RISC-V spike board

Status in QEMU:
  New

Bug description:
  Tested commit: f34edbc760b0f689deddd175fc08732ecb46665f

  I belive this was introduced in
  0ac24d56c5e7d32423ea78ac58a06b444d1df04d when the spike's
  load_kernel() was moved to riscv_load_kernel() which no longer
  included htif_symbol_callback().

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835827/+subscriptions

