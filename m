Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E661619A0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:17:38 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kxd-0007cp-P4
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3krT-0004a7-VK
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3krQ-0006ha-8i
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:11:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:41200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3krQ-0006dZ-2S
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:11:12 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3krN-0001v3-Vl
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 18:11:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E00E82E80C8
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 18:11:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Feb 2020 18:00:10 -0000
From: Julien Freche <1855072@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jfreche rth
X-Launchpad-Bug-Reporter: Julien Freche (jfreche)
X-Launchpad-Bug-Modifier: Julien Freche (jfreche)
References: <157545185401.7205.1743602467950204624.malonedeb@gac.canonical.com>
Message-Id: <158196241021.14619.12333475902236894136.malone@soybean.canonical.com>
Subject: [Bug 1855072] Re: ARM: HCR.TVM traps are not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: adf74bac7d4f5ef51821da63c7bc0cd43658448f
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

Thank you for the patch! I am happy to test this for you. I will apply
the patch/compile/test and get back to you.

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

