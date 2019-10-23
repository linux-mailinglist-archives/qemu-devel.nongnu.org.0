Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C1E1E89
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:48:31 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHw6-000672-68
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNHqz-0003sl-Uv
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNHqy-0006iO-Qk
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:43:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:32886)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNHqy-0006hR-LI
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:43:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNHqx-0004AT-0M
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 14:43:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DAC862E8085
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 14:43:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 14:34:30 -0000
From: Thomas Huth <1656676@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: medicineyeh th-huth
X-Launchpad-Bug-Reporter: Medicine Yeh (medicineyeh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170115173336.27164.62843.malonedeb@chaenomeles.canonical.com>
Message-Id: <157184127102.18794.8531940037498553067.malone@wampee.canonical.com>
Subject: =?utf-8?q?=5BBug_1656676=5D_Re=3A_nvram/fw=5Fcfg=2Ec_=E2=80=98read?=
 =?utf-8?q?=E2=80=99_may_be_used_uninitialized?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 75cc85bb7581cb94e7c41a2f8d89463e82aced2d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1656676 <1656676@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has been fixed here already:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dbaf2d5bfbac#patch6

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1656676

Title:
  nvram/fw_cfg.c =E2=80=98read=E2=80=99 may be used uninitialized

Status in QEMU:
  Fix Released

Bug description:
  Commit Number: b6af8ea60282df514f87d32e36afd1c9aeee28c8

  The gcc version version 6.3.1 catches a new uninitialized variable in the=
 master branch of QEMU on the Github. After looking through the function, i=
t is really not properly assigned to a value in a certain path (the else co=
ndition of assigning read value in the code).
  Here is the snippet of the condition assigning value:
      if (dma.control & FW_CFG_DMA_CTL_READ) {
          read =3D 1;
      } else if (dma.control & FW_CFG_DMA_CTL_SKIP) {
          read =3D 0;
      } else {
          dma.length =3D 0;
      }

  Error (Warning) message is as following:
  hw/nvram/fw_cfg.c: In function =E2=80=98fw_cfg_dma_transfer=E2=80=99:
  hw/nvram/fw_cfg.c:372:16: error: =E2=80=98read=E2=80=99 may be used unini=
tialized in this function [-Werror=3Dmaybe-uninitialized]

  Solution:
  You can fix this by either assign a proper initial value when defining it=
, or give a proper value in the else condition. =

  Sorry that I don't have a patch for this. I'm not sure whether to assign =
1 or 0 in the else condition.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1656676/+subscriptions

