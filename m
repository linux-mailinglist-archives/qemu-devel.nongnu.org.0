Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657F3776EA
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:08:50 +0200 (CEST)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfk6z-0007fh-2l
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk40-0003rv-SW
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:52056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk3u-0005js-34
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfk3r-0003JL-RN
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CDB442E813A
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 13:59:23 -0000
From: Thomas Huth <1896561@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160074312416.13871.13514895218862238849.malonedeb@gac.canonical.com>
Message-Id: <162056876380.6163.1392976825115500128.malone@gac.canonical.com>
Subject: [Bug 1896561] Re: EFI GOP Mode 1366x768
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4400bb74a1660b8405f05f90f0789e266d51c786
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
Reply-To: Bug 1896561 <1896561@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896561

Title:
  EFI GOP Mode 1366x768

Status in QEMU:
  Incomplete

Bug description:
  When using the EFI firmware from
  https://www.kraxel.org/repos/jenkins/edk2/
  (https://www.kraxel.org/repos/jenkins/edk2/edk2.git-
  ovmf-x64-0-20200919.1453.g7faece6985.noarch.rpm) (OVMF-pure-efi.fd and
  OVMF_VARS-pure-efi.fd) then using the GOP, setting the mode to
  1366x768, QEMU uses a width of 1360 instead.

  I am using QEMU for windows (https://qemu.weilnetz.de/) on a Windows
  10 machine.

  To verify, while in the EFI firmware loaded code (within BOOTx64.EFI)
  and before ExitBootServices(), I choose the 1360x768 mode.  I then
  took notice of where the host window was and how many pixels it
  occupied.  I then reset the emulation (without quitting) and chose the
  1366x768 mode.  QEMU set the host window to the exact same width as
  the 1360 mode.  i.e.: The same exact pixels where shown in the host
  background.  The window did not expand the extra 6 pixels.

  I allowed the firmware to run its course to my test environment when
  using mode 1366x768, all pixels are 6 pixels off to the right.  i.e.:
  6 pixels down the Frame Buffer.  If my test environment changes its
  HORZ WIDTH and PIXELS PER SCANLINE to 1360 while using this (1366x768)
  mode, the display is correct.

  This told me that it could be a few things.
  1) Since most (I didn't check them all) of the other modes have the width=
 value's bits 2:0 clear, mode 1366x768 is the only mode the EDK2 firmware h=
as with a width where bits 2:0 are not zero.  Could EDK2 or QEMU (which for=
 the Windows version may use SDL2 so it must be considered here) be clearin=
g these bits?  The value of 1366 when clearing bits 2:0 is 1360.

  2) Could there be a typo in the code EDK2 where the width should have bee=
n 1366?
  (I went looking at both QEMU (for Windows) and EDK2 and after looking at =
many lines of code, I could not find anywhere where this might happen. =


  By the way, in /ui/sdl2-2d.c (QEMU Windows version only?), there is a
  typo in a comment, missing the second 'e':

  Line 156:  * the native ones. Thes are the ones I have tested.

  3) Could EDK2 be sending 1360 instead of 1366?
  4) Could QEMU (passing it on to SDL2 in SDL_SetWindowSize()?) be destroyi=
ng the value (bottom three bits)?

  Anyway, using the latest version of the EDK2 from the URL listed
  above, choosing the 1366x768 mode, does not set QEMU (for Windows) to
  1366 pixels in width.

  Ben

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896561/+subscriptions

