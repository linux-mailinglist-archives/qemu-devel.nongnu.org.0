Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B793C1E87
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:39:54 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iIr-0003z9-C8
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5p-0006DE-AA
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:32854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5d-0001Hi-LQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5N-0005E7-I3
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8A7512E81E7
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1896561@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet janitor th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160074312416.13871.13514895218862238849.malonedeb@gac.canonical.com>
Message-Id: <162580423791.19936.14211324742824103661.malone@loganberry.canonical.com>
Subject: [Bug 1896561] Re: EFI GOP Mode 1366x768
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: e85ac62f4240817a2e29e746c657aba37fc429e1
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
Reply-To: Bug 1896561 <1896561@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896561

Title:
  EFI GOP Mode 1366x768

Status in QEMU:
  Expired

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

