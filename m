Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FE377D7C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:52:10 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0i1-0002Bq-F2
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gZ-0007xe-81
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gX-0004qO-AL
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg0gV-0001KQ-04
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F28EC2E8136
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 07:44:39 -0000
From: Thomas Huth <1873339@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan th-huth
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158706571876.12002.5666042854910451278.malonedeb@soybean.canonical.com>
Message-Id: <162063267908.6707.1029470795638849151.malone@gac.canonical.com>
Subject: [Bug 1873339] Re: Qemu DOS Quake - 640x480 and above resolutions -
 Unable to load VESA palette in dos prompt and game crashing are not working 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ab8aeb62ab4e30a4625f5790e70d9cbe41d49459
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1873339 <1873339@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/251


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #251
   https://gitlab.com/qemu-project/qemu/-/issues/251

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873339

Title:
  Qemu DOS Quake - 640x480 and above resolutions - Unable to load VESA
  palette in dos prompt and game crashing are not working

Status in QEMU:
  Expired

Bug description:
  I have problem make Quake Demo working with 640x480+, with 320x200 workin=
g fine.
  I tried 3 virtual videocards settings: -vga cirrus 640x480 is not availab=
le, probably emulated GPU has not enough VRAM or some Vesa2 utility is need=
ed. For -vga std and -vga vmware // 640x480 is available in game menu, but =
when i tried to set it, im getting: Unable to load VESA palette in dos prom=
pt and game crashing.
  With vmware svgaII other Q2DOS 640x480 and 1024x768 its working fine, so =
it not working only with some games.

    Qemu 4.2, its same on Linux and Windows.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873339/+subscriptions

