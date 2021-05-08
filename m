Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B10377479
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 00:56:44 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfVsJ-0008Q8-Ao
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 18:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfVrH-0007lL-TJ
 for qemu-devel@nongnu.org; Sat, 08 May 2021 18:55:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfVrF-0000qj-US
 for qemu-devel@nongnu.org; Sat, 08 May 2021 18:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfVrD-0007KH-3B
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 22:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B0462E8047
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 22:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 22:47:31 -0000
From: Benjamin David Lunt <1859254@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Benjamin David Lunt (fysnet)
References: <157870296945.2981.16734744521304733139.malonedeb@soybean.canonical.com>
Message-Id: <162051405205.11000.3702874803842779563.malone@chaenomeles.canonical.com>
Subject: [Bug 1859254] Re: host window size does not change when guest video
 screen size changes while moving host window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 85129380a4b51924c1808702b7c7d521ef6057f1
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
Reply-To: Bug 1859254 <1859254@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bug still exists, therefore I have marked as 'new' per your request.

Using latest version of QEMU for Windows (from
https://qemu.weilnetz.de/) still does not adjust the host window size if
a quest size changes while the host window is being moved.

Thank you,
Ben

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859254

Title:
  host window size does not change when guest video screen size changes
  while moving host window

Status in QEMU:
  New

Bug description:
  When QEMU is emulating a legacy text mode, then switches to a VESA
  mode, if you happen to be moving the host window while the switch is
  made, the host window never changes size.  The emulated size does, but
  the host window doesn't.

  For example, at Legacy boot up, the screen mode is mode 03 at 80x25.
  Then when the GUEST OS changes the screen to a VESA mode, say
  1024x768x16, normally the host window will change to that size to
  accommodate the new emulated screen size.

  However, if you happen to be moving the host window at the time of the
  screen mode change, the host window doesn't change in size to
  accommodate the new screen size.

  I am using:
    QEMU for Windows, version 4.1.0-11789
    Host: Windows 10 (latest updates)
    Emulating: Intel x64, Legacy BIOS
  Command line:
  "c:\program files\qemu\qemu-system-x86_64.exe" -m 256 -drive file=3DC:\fy=
sos64.img,format=3Draw,if=3Dide,media=3Ddisk,index=3D0 -parallel file:para.=
txt -boot c -d guest_errors -vga std -smp cpus=3D4 -rtc base=3Dlocaltime,cl=
ock=3Dhost,driftfix=3Dslew -net none -monitor stdio

  I tried different -vga settings:
     -vga std
     -vga cirrus
     -vga vmware
  Each did the same thing.

  [ Side note (possible error in documentation):
  [  at: https://qemu.weilnetz.de/doc/qemu-doc.html#SVGA-graphic-modes-supp=
ort
  [  end of 2.16.2.1
  [  (option -std-vga)
  [    possibly should be
  [  (option -vga std)

  If you need an image to test with, I have been using
  www.fysnet.net/temp/fysos64.zip (2meg zipped/10meg raw).  It starts in
  Legacy BIOS/Hardware mode 3, then switches to VESA 1024x768x16 within
  a few seconds, so be ready to move the HOST window when the mode
  changes.

  I do not have a Linux box to test with, so unknown if this is only an
  issue with the Windows version or not.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859254/+subscriptions

