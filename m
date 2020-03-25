Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FFB192BAC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 16:02:00 +0100 (CET)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH7Xa-0002iy-PK
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 11:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jH7WZ-0002FC-Cz
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jH7WX-0005T7-S6
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:00:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:54394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jH7WX-0005Rk-MJ
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:00:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jH7WV-00025P-J9
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 15:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8AAC22E80C8
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 15:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2020 14:55:02 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kawakami-k laurent-vivier rth
X-Launchpad-Bug-Reporter: Kentaro Kawakami (kawakami-k)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <158168561076.14835.7019812774701035317.malonedeb@soybean.canonical.com>
Message-Id: <158514810304.16634.7342804291295003813.malone@gac.canonical.com>
Subject: [Bug 1863247] Re: AArch64 EXT instruction for V register does not
 clear MSB side bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1af576b5ca854489035b2cb75c718b28268a2c11
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

All of those, and tbl, tbx, ins, are fixed in the three subsequent
commits.

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

