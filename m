Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB443B4CA3
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 06:30:13 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwzxL-00045L-Q9
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 00:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lwzwa-0003Pq-4x
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 00:29:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:52260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lwzwX-0004dj-Ei
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 00:29:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lwzwS-0007Ob-QF
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 04:29:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C41542E8167
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 04:29:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Jun 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1437970@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lpnow th-huth
X-Launchpad-Bug-Reporter: LPNow (lpnow)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20150330002404.7943.25110.malonedeb@soybean.canonical.com>
Message-Id: <162468103919.29166.18318142003840683715.malone@loganberry.canonical.com>
Subject: [Bug 1437970] Re: qemu-system-x86_64 - two mouse pointers & fast
 scrolling problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="40cc6dba4163ba9ca785b26ad91f43c87d70ba4d"; Instance="production"
X-Launchpad-Hash: 2e36ba25f4dc0307a87813e398ae615926a97c6f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1437970 <1437970@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1437970

Title:
  qemu-system-x86_64 - two mouse pointers & fast scrolling problem

Status in QEMU:
  Expired

Bug description:
  Hello,

  System Specs

  Host:
  --------
  Slackware 14.1 x86_64
  Openbox 3.5.2
  tint2 panel (svn version)
  Nvidia GTX660M
  nvidia-driver-346.35
  Screen: 17" @1920x1080@60Hz
  Logitech USB mouse

  Guest
  ---------
  Slackware 14.1 x86_64
  XFce 4.10
  Screen 17" @1920x1080
  xf86-video-vmware 13.0.1

  *** I am not using an xorg.conf file in the guest ***

  QEMU 2.2.1

  I start Slackware in QEMU using 'Zoom To Fit' when it first boots up
  and I log into X, at this point I notice the mouse shows with 2
  pointers and when I move the mouse around, shows as trails, but it's
  actually a second pointer that appears under the first.

  If I use 'Ctrl Alt F' and go into full screen mode the mouse gets
  corrected and only appears as one pointer and no pointer under the
  second one when moving around. So this mouse problem only appears the
  first time I log into X with 'Zoom To Fit'.

  Also if log in instead as 'Full Screen' I do not see the issue, as
  well as if I log in 'Full Screen' and change back to 'Zoom To Fit' it
  does not happen.

  I also noticed using '-usbdevice tablet', the mouse wheel scrolling in an=
y application, the mouse ends up moving me instead to another virtual deskt=
op, XFce by default uses 4. Sometimes it moves me to another desktop if I m=
ove the mouse wheel slowly, and sometimes I need to move
  it quickly, but in Firefox it doesn't take much movement of the mousewhee=
l and I get moved to another desktop. Browsing with Firefox
  using '-usbdevice tablet' is not easy.

  Command line options:
  --------------------------------
  qemu-system-x86_64 -rtc base=3Dlocaltime Slackware\ 14.1\ x64.img -m 4096=
 --enable-kvm -smp 2 -vga vmware -usbdevice tablet

  I wanted to use -usbdevice tablet to have seamless mouse movement back
  and forth from Host to Guest without having to Grab...

  If I remove '-usbdevice tablet' and log into X the frst time as 'Zoom
  To Fit' I see two mouse pointers, but as soon as I click the desktop
  and the mouse is grabbed the second one goes away and when I move the
  mouse there is only one pointer.

  Also without the option '-usbdevice tablet' and I move the scroll
  wheel quickly the mouse stays focused on the application and it
  doesn't move the desktop.

  Please see the attached screen shots, qemu_1.jpg shows 2 mouse
  pointers when I first log into X as 'Zoom To Fit', and qemu_2.jpg
  shows when I'm staying in 'Zoom To Fit' mode and moving the mouse
  around, with a pointer under the pointer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1437970/+subscriptions

