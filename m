Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6836E867
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:08:23 +0200 (CEST)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3ao-0000eR-PY
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3To-0002ZN-PJ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:01:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:57842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3Tl-0003ow-1x
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:01:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc3Tj-00015J-Vq
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:01:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF4AB2E8144
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:01:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 09:53:11 -0000
From: Thomas Huth <1745316@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mouse sdl
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asmqb7 th-huth
X-Launchpad-Bug-Reporter: David Lindsay (asmqb7)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151686617659.10193.11767183978354971795.malonedeb@gac.canonical.com>
Message-Id: <161968999246.14105.13414196023675162573.launchpad@wampee.canonical.com>
Subject: [Bug 1745316] Re: SDL1.x>SDL2 regressions: non-usbtablet mouse
 position reporting is broken,
 and VGA/compatmonitor/serial/etc view switching is unusable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f2ed44b2d36474de3ec351c1100a75bf873d3cf8
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
Reply-To: Bug 1745316 <1745316@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1745316

Title:
  SDL1.x>SDL2 regressions: non-usbtablet mouse position reporting is
  broken, and VGA/compatmonitor/serial/etc view switching is unusable

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  I almost exclusively use -sdl when I use QEMU. The GTK UI (I'm on
  Linux) distinctly takes a few extra seconds to start on every boot,
  and I don't really ever use the extra controls it provides. I hope the
  SDL-based UI never goes away :)

  The SDL 1.2 > SDL 2.0 update (committed between June 8-20 2017)
  introduced the following two regressions:

  - PS/2 and serial mouse position reporting became completely broken
  (only usbtablet works)

  - The compatmonitor/serial/parallel "views" try to open new windows,
  which does not play well on my system at all

  First of all, here are the bisection details:

  https://github.com/qemu/qemu/commit/269c20b2bbd2aa8531e0cdc741fb166f290d7=
a2b
    (June 8 2017): the last version that works

  https://github.com/qemu/qemu/commit/7e56accdaf35234b69c33c85e4a44a5d56325=
e53
    (June 20 2017): the first version that fails

  Here are the changelists between these two revisions:

  https://github.com/qemu/qemu/compare/269c20b...7e56acc
  (compare direction: OLD to NEW) (Commits: 60   Files changed: 85)

  https://github.com/qemu/qemu/compare/7e56acc...269c20b
  (compare direction: NEW to OLD) (Commits: 41   Files changed: 108)

  (Someone else more familiar with Git might know why GitHub returns
  results for both compare directions. I'm including both links just in
  case.)

  I've found that configuring commit 7e56acc using --with-sdlapi=3D1.2
  completely remedies all issues. Thus, I think the issue is with SDL 2.

  =3D=3D #1: Broken mouse position reporting =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  This surfaces immediately with older operating systems. I first
  experienced it when trying to install OS/2 for the first time, and
  thought there was something wrong with OS/2. Then I experienced the
  same issues in Windows 3.1 and MS-DOS applications and I knew
  something was up with QEMU.

  In a nice coincidence, I've recently been playing around with
  prehistorically ancient Linux systems, and while looking around a
  Linux 0.99-based SLS system from 1992 I discovered a low-level
  (console) mouse-testing utility buried in /usr/X386. This utility only
  works when I configure QEMU to use a serial mouse, but it reveals some
  very interesing data: the dx and dy values ("d" =3D "delta", right?)
  received by the kernel do not contain relative values such as -1, -10,
  2, 5, etc, but instead absolute values such as 0, 12, 37, 112, 329,
  etc.

  Similarly, if I configure Windows 3.1 to use a serial mouse, the mouse
  position jumps exponentially around the screen relative to my mouse
  movements (it's very hard to control), consistent with delta values
  being reported as absolute instead of relative.

  I found that the DOS CuteMouse driver comes with a mouse-testing
  program. CuteMouse absolutely refuses to detect QEMU's serial mouse
  for some reason (?!), but when QEMU is running in PS/2 mode, the mouse
  tester that comes with CuteMouse reports that the mouse at 632,192 no
  matter how much I move the mouse around the window. If I look
  carefully I can see the DOS cursor flickering back and forth as I move
  the mouse and the tester rewrites the line showing the position info,
  so I don't think the test program is broken.

  I got curious and wondered if this was actually an internal SDL bug.
  However, the following test program reports perfect values for me:

  --8<--------------------------------------------------------

  #include <stdio.h>
  #include "SDL2/SDL.h"
  int main(void) {
  	SDL_Init(SDL_INIT_VIDEO);
  	SDL_Window *window =3D SDL_CreateWindow("Mouse test", =

  		SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
  		640, 480, SDL_WINDOW_RESIZABLE
  	);
  	if (window =3D=3D NULL) {
  		perror(SDL_GetError());
  		exit(1);
  	}
  	for (;;) {
  		SDL_Event event;
  		while (SDL_PollEvent(&event)) {
  			if (event.type =3D=3D SDL_MOUSEMOTION) {
  				printf(
  					"x=3D%d y=3D%d xrel=3D%d yrel=3D%d\n",
  					event.motion.x, event.motion.y,
  					event.motion.xrel, event.motion.yrel
  				);
  			}
  			if (
  				event.type =3D=3D SDL_KEYDOWN ||
  				event.type =3D=3D SDL_QUIT
  			) {
  				SDL_DestroyWindow(window);
  				SDL_Quit();
  				exit(0);
  			}
  		}
  	}
  }

  (gcc ... -lSDL2)

  ------------------------------------------------------------

  Unfortunately it would seem the issue is QEMU-specific.

  ---

  Finding modern test targets to verify mouse functionality with was
  actually a small challenge. I tested Ubuntu, Lubuntu and even GParted,
  but the recent Linux kernels in all three systems automatically loaded
  the usbtablet module early in the boot process, completely hiding the
  bug.

  I've found two actively-maintained somewhat-mainstream platforms that
  make for good tests. These are both ISOs:

  - ReactOS:
    - http://www.reactos.org/download
    - pick "Download LiveCD" and then "proceed with the download" at
      bottom-right of popup

  - Tiny Core Linux:
    - http://distro.ibiblio.org/tinycorelinux/downloads.html
    - pick TinyCore (16MB)

  ReactOS is a very good example, as it's actively maintained and is
  probably heavily tested in QEMU (albeit apparently without SDL(2)).

  Tiny Core is a bit of a mixed bag. It's actively maintained and uses a
  recent kernel (without usbdevice). It also uses a resurrected low-
  memory XFree86 target that was officially dropped decades ago for its
  graphics (and mouse input). It could be argued that Tiny Core's mild
  obscurity makes it an even better test target.

  ---

  I've attached to this report the mouse test utilities I've played
  with. Both are faster to iterate with than waiting for Tiny Core or
  ReactOS to boot.

  ----- FreeDOS + CuteMouse + mousetst -----

  This boots completely and is ready to look at the mouse position in
  around a second. It automatically starts the mouse tester on startup
  and APM-shuts-down QEMU when you exit the mouse tester with ESC. I can
  highly recommend this version for iteration/verification.

  $ qemu-system-i386 -fda freedos-mousetest.img
  $ qemu-system-i386 -fda freedos-mousetest.img -sdl

  =

  ----- Linux-0.99 (SLS) + 'mouse.c' -----

  This is a heavily stripped-down SLS configuration containing just the
  mouse testing utility.

  $ qemu-system-i386 -boot a -fda sls-boot.img -hda sls-mousetest.img \
    -serial msmouse

  $ qemu-system-i386 -boot a -fda sls-boot.img -hda sls-mousetest.img \
    -serial msmouse -sdl

  Login as root (no password), and then

  # ./mouse Microsoft /dev/ttyS0

  Also, the following produces junk results, but I'm including it
  because it may be interesting anyway:

  $ qemu-system-i386 -boot a -fda sls-boot.img -hda sls-mousetest.img
  -sdl

  and

  # ./mouse Microsoft /dev/ps2aux

  The reason I think this is noteworthy is that the button state affects
  the reported values (incorrectly, but they do still change), but
  moving the mouse does not. So while the interpretation is wrong, the
  behavior seems to be similar to that reported by CuteMouse's mouse
  tester. (Unless the position fields are being perfectly skipped over.)

  When you're done with this image - `halt` takes several seconds and
  there's really no point. Just closing QEMU manually is faster. (This
  is also why I used the shorter -[hf]da syntax - writes to the disk
  images are not relevant.)

  (Also - since I can't possibly leave this info out :) -
  http://www.oldlinux.org/Linux.old/distributions/SLS/,
  `sls-1.0.tar.bz2`. This is a turnkey disk image that Just Works(TM).
  `boot.img` attached below is in fact the same as `a.img` in this
  archive.)

  ---

  In case it's useful, I included a Windows 3.1 test image when I
  reported https://bugs.launchpad.net/qemu/+bug/1745312. This image
  (which happens to be configured for PS/2) can be found in this folder:
  https://drive.google.com/drive/folders/1WdZVBh5Trs9HLC186-nHyKeqaSxfyM2c

  For reference: this image includes a lot of cruft as it's an active
  test image I've used for a lot of different things. It contains a full
  copy of the contents of the Win3.1 installation disks in W31INST. You
  can `deltree c:\windows` and reinstall by running `setup` in that
  directory (takes 3-5 minutes), or `subst a: c:\w31inst` before
  starting Windows and you'll be able to use Windows Setup to switch to
  a serial mouse.

  =3D=3D #2: SDL view switching unusability =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  This issue is (somewhat) more straightforward to demonstrate. Simply

  $ qemu-system-i386 -sdl

  and then hit CTRL+ALT+2 (or 3 or 4).

  On my system, when I do this, QEMU creates and destroys new windows in
  an infinite loop for as long as I have CTRL+ALT+n held down. I have to
  hit `2` really quickly!

  I've also observed that some internal contention can frequently cause
  the compatmonitor window to become blind to the Enter key. It seems to
  be that this occurs most often when the windowmanager I'm using
  (tested using i3 and openbox) has focus-follows-mouse enabled and the
  mouse is over the area of the screen where the compatmonitor window
  opens itself. Perhaps this is caused by the CTRL+ALT capture code
  interacting badly with window focus state? (I'm very very interested
  to hear if you cannot reproduce this.)

  I initially thought all of these changes/glitches were due to some
  kind of messed-up "upgrade" / deliberate feature that happened to be
  broken on my system. But the only (obviously-)UI-related tasks I found
  in the changelist above just mention upgrading SDL, with no particular
  UI work (that I can see). It looks like this is actually an SDL thing
  - unless some (preparatory?) changes occurred in QEMU before the
  commit window I discovered. I have no idea.

  A couple things about fixing this that I want to mention:

  The way the GTK UI does things, views can be switched inside the same
  window, or they can be detached into new windows. This provides the
  best of both worlds - and there are situations where I do want both
  behaviors.

  If QEMU is not averse to burying an obscure option somewhere that lets
  me pick whether SDL will open views in new windows or the same window,
  that could be very nice - and it would bring the SDL UI to perfect
  feature parity with the GTK UI, too. But I'm not sure what QEMU's
  stance on obscure options is.

  That said, my preference for the SDL 1.x way of doing things is
  admittedly very probably biased by the usability issues created by
  this bug. Incidentally, I've taken to using `-serial null -monitor
  stdio`. But for that to work I have to remember to add it ahead of
  time, and I do often forget, heh.

  I'll be very interested to play with QEMU view switching once this is
  less glitchy. If the fixed implementation still opens new windows,
  I'll see what I think of that once it works stably. :)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1745316/+subscriptions

