Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46235BB68C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:22:03 +0200 (CEST)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPE2-0002Hc-2l
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCPCp-0001bR-4M
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCPCn-00012V-WB
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:51472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCPCn-00011q-Qf
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCPCm-0008HN-Ee
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B2BB2E8025
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Sep 2019 14:12:55 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elouan-appere pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Elouan_App=C3=A9r=C3=A9_=28elouan-apper?=
 =?utf-8?q?e=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156496429682.24531.17468125820972523019.malonedeb@soybean.canonical.com>
Message-Id: <156924797591.27379.16445686494000360754.malone@soybean.canonical.com>
Subject: [Bug 1838913] Re: Single-step exceptions incorrectly routed to EL1
 when ELD is EL2 (TDE = 1) (qemu version 3.1)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 29b017de600f2bc67e1d9b1423c00c90365d9ff8
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
Reply-To: Bug 1838913 <1838913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is fixed in master by commit 8bd587c1066f445 which will be in the
4.2 release.


** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838913

Title:
  Single-step exceptions incorrectly routed to EL1 when ELD is EL2 (TDE
  =3D 1) (qemu version 3.1)

Status in QEMU:
  Fix Committed

Bug description:
  Hi,

  I've been encountering issues with QEMU 3.1 when trying to single-step
  EL1 code, with ELD =3D EL2 (MDCR_EL2.TDE =3D 1). I could test with latest
  commit in a few hours, if you want.

  EL1 is Aarch64.

  This happens as soon as MDSCR_EL1.SS is set to 1 and ERET is executed:

  - Single-step exceptions are routed to EL1

  Exception return from AArch64 EL2 to AArch64 EL1 PC 0x4000005c
  Taking exception 1 [Undefined Instruction]
  ...from EL1 to EL1
  ...with ESR 0x32/0xca000022
  ...with ELR 0x4000005c
  ...to EL1 PC 0x200 PSTATE 0x3c5

  EC 0x32 (0b110010) is Exception_SoftwareStepLowerEl.

  You can find enclosed minimal code (and resulting .elf) for
  reproduction.

  qemu-system-aarch64 -nographic -machine virt,virtualization=3Don -d
  unimp,int -cpu cortex-a57 -kernel test_hyp.elf

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838913/+subscriptions

