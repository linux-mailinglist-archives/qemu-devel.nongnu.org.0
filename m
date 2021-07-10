Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8483C32CE
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:31:54 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24ef-0003Xf-2m
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z9-0007o1-EN
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:45076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z6-0000TI-0V
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Yz-0003gS-Js
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 519902E8209
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:38 -0000
From: Launchpad Bug Tracker <1907061@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: keyboard lag laggy minimize slow window
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: evren320 janitor th-huth
X-Launchpad-Bug-Reporter: Evren (evren320)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160733469549.5156.11028511366608269661.malonedeb@gac.canonical.com>
Message-Id: <162589065857.5654.15030291935169146269.malone@loganberry.canonical.com>
Subject: [Bug 1907061] Re: qemu-system-x86_64 minimizing window causes
 keyboard input lag globally
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 212bcedfe8891763b3fb2036f7fecc5278c37678
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
Reply-To: Bug 1907061 <1907061@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907061

Title:
  qemu-system-x86_64 minimizing window causes keyboard input lag
  globally

Status in QEMU:
  Expired

Bug description:
  After qemu window is minimized, it causes keyboard lag on the host for al=
l applications, pressed keys will be delayed and very laggy, typing to note=
pad or any other text extremely slowly appear on the screen, queue is slowl=
y processed.
  If qemu window is open back to normal size, keyboard is back to normal, e=
verything is back to normal and stable, this behavior i have been testing s=
ince several months of qemu releases, i am reporting a bit late here, not b=
reaking but it seems important and everytime i accidently minimize qemu, i =
remember it later and take qemu window to normal size back always, i try ne=
ver minimize it anymore.
  This problem does not occur if using -display none
  Guest OS doesn't matter for this behavior, result is always same
  I am using:
  qemu 5.1.0.0
  qemu-system-x86_64w.exe
  Windows 10 build 2004
  4K screen dpi scaling set to 150%

  If requested, i can record a video to see the problem clearly, but i
  think all information i give already clear now.

  Thanks for making quality software, hope all bugs fixed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907061/+subscriptions

