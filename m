Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7016033B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 10:57:55 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3GgU-00083r-Kk
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 04:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3Gfb-0007G0-S5
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3Gfa-0007jo-QL
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:56:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:57092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3Gfa-0007jZ-LF
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:56:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3GfZ-0001ir-0g
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 09:56:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF1EB2E80AD
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 09:56:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Feb 2020 09:47:43 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jfreche rth
X-Launchpad-Bug-Reporter: Julien Freche (jfreche)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <157545185401.7205.1743602467950204624.malonedeb@gac.canonical.com>
Message-Id: <158184646325.15247.1855309112768635808.malone@soybean.canonical.com>
Subject: [Bug 1855072] Re: ARM: HCR.TVM traps are not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 16e93b74bd76a5ccdfb96c2033421f7c9ce57b06
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
Reply-To: Bug 1855072 <1855072@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes to both.

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
     Assignee: (unassigned) =3D> Richard Henderson (rth)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1855072

Title:
  ARM: HCR.TVM traps are not implemented

Status in QEMU:
  In Progress

Bug description:
  On AARCH64, setting HCR.TVM to 1 is supposed to trap all writes to
  CTLR_EL1, TTBR0_EL1, TTBR1_EL1, TCR_EL1, ESR_EL1, FAR_EL1, AFSR0_EL1,
  AFSR1_EL1, MAIR_EL1, AMAIR_EL1, and CONTEXTIDR_EL1. However, it
  currently has no effect (QEMU emulator version 4.1.1).

  It is also likely that TRVM will not trap, but, I didn't verify this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1855072/+subscriptions

