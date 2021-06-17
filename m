Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E63AAE63
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 10:03:20 +0200 (CEST)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltmzf-0008TW-Eh
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 04:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmyB-0007mE-TU
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:01:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:48896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmy8-0004y9-Vx
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:01:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltmy4-0006hl-Pv
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:01:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0AAAF2E8196
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:01:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 07:45:55 -0000
From: Thomas Huth <1665789@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phol th-huth
X-Launchpad-Bug-Reporter: Phil Troy (phol)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1022023
References: <20170217213527.4184.5367.malonedeb@chaenomeles.canonical.com>
Message-Id: <162391595600.13384.7860314021289734569.malone@wampee.canonical.com>
Subject: [Bug 1665789] Re: More resolutions for vga displays
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: a9e8c59dca04a0e23cdb5b2192610c4f1a7b04a0
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
Reply-To: Bug 1665789 <1665789@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1022023 ***
    https://bugs.launchpad.net/bugs/1022023


This is an automated cleanup. This bug report got closed because it
is a duplicate.


** Changed in: qemu
   Importance: Wishlist =3D> Undecided

** Changed in: qemu
       Status: New =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1665789

Title:
  More resolutions for vga displays

Status in QEMU:
  Expired

Bug description:
  Would it be possible to add more resolutions for vga displays (which I
  am accessing via vnc instead of spice)?  In particular:

  - 1080 wide x 1920 high (rotate 1920 x 1080 screen)

  - 1920 wide x 1080 + 1980 high (1920 x 1080 screen on top of 1600 x
  900 screen)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1665789/+subscriptions

