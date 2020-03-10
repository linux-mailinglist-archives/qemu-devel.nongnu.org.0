Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED617F34B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 10:17:47 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBb1G-00071I-AP
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 05:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jBazb-0005Z6-O1
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 05:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jBaza-00051Z-IZ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 05:16:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:40074)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jBaza-0004zG-Bo
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 05:16:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jBazZ-0003sa-By
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:16:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FD0E2E80C9
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:16:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Mar 2020 09:03:35 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jfreche laurent-vivier rth
X-Launchpad-Bug-Reporter: Julien Freche (jfreche)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <157545185401.7205.1743602467950204624.malonedeb@gac.canonical.com>
Message-Id: <158383101512.7585.172209500082684740.malone@chaenomeles.canonical.com>
Subject: [Bug 1855072] Re: ARM: HCR.TVM traps are not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 98cf61355d932fe63088f54c675bcac0d80272d7
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

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D84929218512c

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1855072

Title:
  ARM: HCR.TVM traps are not implemented

Status in QEMU:
  Fix Committed

Bug description:
  On AARCH64, setting HCR.TVM to 1 is supposed to trap all writes to
  CTLR_EL1, TTBR0_EL1, TTBR1_EL1, TCR_EL1, ESR_EL1, FAR_EL1, AFSR0_EL1,
  AFSR1_EL1, MAIR_EL1, AMAIR_EL1, and CONTEXTIDR_EL1. However, it
  currently has no effect (QEMU emulator version 4.1.1).

  It is also likely that TRVM will not trap, but, I didn't verify this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1855072/+subscriptions

