Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B83ADCD3
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:33:32 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup9H-0000vF-Am
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2K-0000gy-Cb
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:45910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2I-0002rm-ID
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup24-0003tv-Sr
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78D872E8215
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1808824@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bjraz janitor th-huth
X-Launchpad-Bug-Reporter: William Razgunas (bjraz)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154505934144.23344.12423865582266502170.malonedeb@soybean.canonical.com>
Message-Id: <162416264032.7948.17902640928650185761.malone@loganberry.canonical.com>
Subject: [Bug 1808824] Re: Mouse leaves VM window when Grab on Hover isn't
 selected Windows 10 and Intel HAX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: cb522b2a982eae4632049596ce250e5b9b98da47
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1808824 <1808824@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1808824

Title:
  Mouse leaves VM window when Grab on Hover isn't selected Windows 10
  and Intel HAX

Status in QEMU:
  Expired

Bug description:
  On Windows 10.0.17134 I have been having the problem that the mouse
  will leave the VM window after a short time when grab on hover isn't
  selected.  The VM will then try to grab on Hover and the mouse will
  grab in weird places and it will become very unwieldy to control the
  mouse in the VM window.

  This is exasperated by super slow response making it nearly unusable
  if the Intel=C2=AE Hardware Accelerated Execution Manager (Intel=C2=AE HA=
XM) is
  not currently installed on my machine.

  I know they are different things but they compounded on each other
  when you have a mouse that is not staying in the VM window and the
  VM's visualized cpu is acting VERY slow the system is unusable.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1808824/+subscriptions

