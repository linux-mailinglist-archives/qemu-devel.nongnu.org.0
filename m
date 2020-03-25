Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B5192B4D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 15:37:26 +0100 (CET)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH79p-0001aZ-NN
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 10:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jH788-0000Ml-7k
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:35:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jH787-0007rF-0Y
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:35:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:45566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jH786-0007pt-RW
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:35:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jH785-0005ry-A2
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 14:35:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 38DFD2E80C8
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 14:35:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2020 14:29:31 -0000
From: Kentaro Kawakami <1863247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kawakami-k laurent-vivier rth
X-Launchpad-Bug-Reporter: Kentaro Kawakami (kawakami-k)
X-Launchpad-Bug-Modifier: Kentaro Kawakami (kawakami-k)
References: <158168561076.14835.7019812774701035317.malonedeb@soybean.canonical.com>
Message-Id: <158514657148.8200.17196560966030901652.malone@wampee.canonical.com>
Subject: [Bug 1863247] Re: AArch64 EXT instruction for V register does not
 clear MSB side bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5dc07e5c7b11f6dd61ec6f9d6af933f05317868a
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
Reply-To: Bug 1863247 <1863247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for bug fix.
I found trn1, trn2, zip1, zip2, uz1, uz2 instructions seem to have same bug.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863247

Title:
  AArch64 EXT instruction for V register does not clear MSB side bits

Status in QEMU:
  Fix Committed

Bug description:
  On AArch64 CPU with SVE register, there seems to be a bug in the
  operation when executing EXT instruction to V registers. Bits above
  the 128 bits of the SVE register must be cleared to 0, but qemu-
  aarch64 seems to hold the value.

  Example
  ext v0.16b, v1.16b v2.16b, 8

  After executing above instruction, (N-1) to 128 bits of z0 register
  must be 0, where N is SVE register width.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863247/+subscriptions

