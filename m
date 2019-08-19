Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C19392306
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:06:53 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgR2-0007Da-4h
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hzgPp-00068i-Hj
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hzgPo-0000PH-DK
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:36578)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hzgPo-0000P4-7u
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:05:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hzgPn-0005ZA-Hr
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 12:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 841FC2E80C7
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 12:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Aug 2019 11:58:58 -0000
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
Message-Id: <156621593819.16299.6495588145514292929.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 228c3d5cc7d2a8d850ea89e5a1720fe8367bafe5
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

(Anything in a git submodule will be third-party code that's not part of
QEMU.)

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

