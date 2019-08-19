Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80989230B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:08:04 +0200 (CEST)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgSB-00006e-Q8
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hzgPo-00068h-Q2
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hzgPn-0000P8-Oq
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:36550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hzgPn-0000On-JR
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hzgPm-0005ZA-QC
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 12:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C4B572E80C7
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 12:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Aug 2019 11:58:08 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314 pmaydell
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156621492072.26521.4536006687243884653.malonedeb@soybean.canonical.com>
Message-Id: <156621588850.16980.9672837388953695671.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d8d93aad8e2b1fbe00e55065b89d6b109226ec4a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840646] Re:
 qemu-4.1.0/roms/SLOF/lib/libnet/ping.c:122: logical fault
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
Reply-To: Bug 1840646 <1840646@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isn't QEMU code -- it's just the source for third-party ROMs that
we ship with QEMU because we also ship the ROM binaries. Please report
it to the upstream project.


** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840646

Title:
  qemu-4.1.0/roms/SLOF/lib/libnet/ping.c:122: logical fault

Status in QEMU:
  Invalid

Bug description:
  qemu-4.1.0/roms/SLOF/lib/libnet/ping.c:122:16: warning: Logical
  conjunction always evaluates to false: alen <=3D 0 && alen >=3D
  sizeof(args) - 1. [incorrectLogicOperator]

  Source code is

     if (alen <=3D 0 && alen >=3D sizeof(args) - 1) {

  Maybe better code:

     if (alen <=3D 0 || alen >=3D sizeof(args) - 1) {

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840646/+subscriptions

