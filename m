Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC537774F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:28:25 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflM0-00022x-IG
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflEb-00066f-Fl
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:56196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflET-0007cY-Rj
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflES-0001bR-1Z
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0630A2E8186
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:12:27 -0000
From: Thomas Huth <1859254@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157870296945.2981.16734744521304733139.malonedeb@soybean.canonical.com>
Message-Id: <162057314763.16458.6279394213936105737.malone@soybean.canonical.com>
Subject: [Bug 1859254] Re: host window size does not change when guest video
 screen size changes while moving host window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ba04c14767b571d5ed0eb0f01780dfc365c335b3
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
Reply-To: Bug 1859254 <1859254@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/226


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #226
   https://gitlab.com/qemu-project/qemu/-/issues/226

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859254

Title:
  host window size does not change when guest video screen size changes
  while moving host window

Status in QEMU:
  Expired

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

