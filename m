Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C924377EA3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:53:04 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1ex-0006e5-GX
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dE-00040C-4r
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:33946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dB-0008Pp-ID
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg1d5-0002eb-U7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7741F2E81BD
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 08:42:25 -0000
From: Thomas Huth <1873542@bugs.launchpad.net>
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
References: <158717713918.5647.12840248269223799215.malonedeb@chaenomeles.canonical.com>
Message-Id: <162063614557.10101.12241289094940089028.malone@chaenomeles.canonical.com>
Subject: [Bug 1873542] Re: Windows 98 videocard passthrough - unable to load
 higher resolution -Desktop, after some games crashes,
 without whole physical machine reset..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4f1308e37d4eaab8e520c10eafd8ab82f9021dcf
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
Reply-To: Bug 1873542 <1873542@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/254


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #254
   https://gitlab.com/qemu-project/qemu/-/issues/254

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873542

Title:
  Windows 98 videocard passthrough - unable to load higher resolution
  -Desktop, after some games crashes, without whole physical machine
  reset..

Status in QEMU:
  Expired

Bug description:
  When you are using games which are using fullscreen switching
  resolutions (some old games are 640x480 or 800x600 max), videocard is
  often stuck after crash and whole Linux machine has to be rebooted, to
  fix it.. VM reboot is not enough.

    That stuck is strange one, after restart of machine, text mode is
  working fine, but graphical mode should be set to higher resolution
  (Load Windows 98 desktop) there is only black screen and screen input
  blinking.

    I simulated it with multiple videocards, graphical drivers, its
  quite often, full Linux reboot is always safe it. Im using right roms
  for my cards, because otherwise i get often even boot machine twice in
  one Linux boot session.

    Some there is need for some better card reset.

    Also some videocard reset on Linux level workaround would be nice.

    Simulated on Qemu 2.11 and 4.2 and Linux Mint 19.3, but my guess its
  whole KVM videocard passthrough problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873542/+subscriptions

