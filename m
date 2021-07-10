Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B13C32E1
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:37:43 +0200 (CEST)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24kI-0007zG-Og
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Za-0000Ws-KB
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZT-0000f2-C3
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24ZF-0003r6-59
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EDEDD2E81E3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:15 -0000
From: Launchpad Bug Tracker <1904315@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chapuni janitor th-huth
X-Launchpad-Bug-Reporter: Takumi Nakamura (chapuni)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160542909340.674.17512745365232880697.malonedeb@gac.canonical.com>
Message-Id: <162589063630.5654.14270714030907251729.malone@loganberry.canonical.com>
Subject: [Bug 1904315] Re: CTRL+ALT is ignored on gtk window (configured with
 gtk and sdl)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 737a8a2072872676c7f09e6806b853b26f73b538
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1904315 <1904315@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904315

Title:
  CTRL+ALT is ignored on gtk window (configured with gtk and sdl)

Status in QEMU:
  Expired

Bug description:
  I am building and using qemu on Windows 10 via git.
  Building for targeting windows, on debian.

  Since meson is introduced, my executable, qemu-system-x86_64.exe, tends t=
o ignore hotkeys
  (like CTRL+ATL+G, CTRL+ALT+2)

  As far as I have been investigating the issue, I am suspicious that gtk a=
nd sdl might be incompatible.
  With configure --disable-sdl, my executable works fine.
  My application doesn't require sdl.

  Possibly due to link order, especially SDLmain, I guess.

  I suggest;
  - Clarify that gtk and sdl are incompatible.
  - Tweak built script or startup not to prevent gtk and sdl each other.

  Excuse me, the issue has not been reproduced at home yet. I met it at wor=
k.
  (My manager said it's fine to report issues by me at home)
  I will construct reproducible environment at home, if my further investig=
ation would be required.

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904315/+subscriptions

