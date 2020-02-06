Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC31544A5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:12:37 +0100 (CET)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izgxQ-00032F-GB
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1izgvh-00009O-Su
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1izgvg-0006hJ-M1
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:10:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:48212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1izgvg-0006dH-GG
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:10:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1izgve-0008VW-LL
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 13:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 998BC2E8042
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 13:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Feb 2020 13:02:04 -0000
From: Kentaro Kawakami <1862167@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kawakami-k
X-Launchpad-Bug-Reporter: Kentaro Kawakami (kawakami-k)
X-Launchpad-Bug-Modifier: Kentaro Kawakami (kawakami-k)
Message-Id: <158099412478.8645.15882160651412694280.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1862167] [NEW] Variation of SVE register size (qemu-user-aarch64)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1fca38d0ba4a92b987082129d3fd05f0bbff72bb
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
Reply-To: Bug 1862167 <1862167@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Specification of ARMv8-A SVE extention allows various values =E2=80=8B=E2=
=80=8Bfor the
size of the SVE register. On the other hand, it seems that the current
qemu-aarch64 supports only the maximum length of 2048 bits as the SVE
register size. I am writing an assembler program for a CPU that is
compliant with ARMv8-A + SVE and has a 512-bit SVE register, but when
this is run with qemu-user-aarch64, a 2048-bit load / store instruction
is executed This causes a segmentation fault. Shouldn't qeum-user-
aarch64 have an option to specify the SVE register size?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862167

Title:
  Variation of SVE register size (qemu-user-aarch64)

Status in QEMU:
  New

Bug description:
  Specification of ARMv8-A SVE extention allows various values =E2=80=8B=E2=
=80=8Bfor the
  size of the SVE register. On the other hand, it seems that the current
  qemu-aarch64 supports only the maximum length of 2048 bits as the SVE
  register size. I am writing an assembler program for a CPU that is
  compliant with ARMv8-A + SVE and has a 512-bit SVE register, but when
  this is run with qemu-user-aarch64, a 2048-bit load / store
  instruction is executed This causes a segmentation fault. Shouldn't
  qeum-user-aarch64 have an option to specify the SVE register size?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862167/+subscriptions

