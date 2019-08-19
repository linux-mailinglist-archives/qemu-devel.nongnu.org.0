Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361BF922C4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 13:52:30 +0200 (CEST)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgD7-0004yT-B0
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 07:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hzgBU-0003oR-Em
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hzgBT-00012F-Ap
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:33348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hzgBT-00011V-4g
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hzgBR-0003Wm-2o
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:50:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3F2D02E80E0
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:50:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Aug 2019 11:42:00 -0000
From: dcb <1840646@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: dcb (dcb314)
Message-Id: <156621492072.26521.4536006687243884653.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: f441c7bd9dac8962fcf77be3b2b28616074034ab
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840646] [NEW]
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

Public bug reported:

qemu-4.1.0/roms/SLOF/lib/libnet/ping.c:122:16: warning: Logical
conjunction always evaluates to false: alen <=3D 0 && alen >=3D sizeof(args)
- 1. [incorrectLogicOperator]

Source code is

   if (alen <=3D 0 && alen >=3D sizeof(args) - 1) {

Maybe better code:

   if (alen <=3D 0 || alen >=3D sizeof(args) - 1) {

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840646

Title:
  qemu-4.1.0/roms/SLOF/lib/libnet/ping.c:122: logical fault

Status in QEMU:
  New

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

