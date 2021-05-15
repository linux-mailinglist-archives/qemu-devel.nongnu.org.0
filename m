Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20923817AA
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:34:02 +0200 (CEST)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrcP-0006Kc-PM
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZT-0004E2-2H
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:30:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZR-0006Dn-1z
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:30:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhrZN-0004OZ-Vq
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F00A02E8187
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:22:42 -0000
From: Thomas Huth <1923648@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: app-nap freezes macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nnlkcncff th-huth
X-Launchpad-Bug-Reporter: Vasiliy Nikonov (nnlkcncff)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161833605825.22256.5828075734668933155.malonedeb@soybean.canonical.com>
Message-Id: <162107416237.21524.7825721092022201029.malone@soybean.canonical.com>
Subject: [Bug 1923648] Re: macOS App Nap feature gradually freezes QEMU process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: dbaef87d59593fbd5c256af7169e85f8ec02ba7e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1923648 <1923648@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1923648

Title:
  macOS App Nap feature gradually freezes QEMU process

Status in QEMU:
  Incomplete

Bug description:
  macOS version: 10.15.2
  QEMU versions: 5.2.0 (from MacPorts)
                 5.2.92 (v6.0.0-rc2-23-g9692c7b037)

  If the QEMU window is not visible (hidden, minimized or another
  application is in full screen mode), the QEMU process gradually
  freezes: it still runs, but the VM does not respond to external
  requests such as Telnet or SSH until the QEMU window is visible on the
  desktop.

  This behavior is due to the work of the macOS App Nap function:
  https://developer.apple.com/library/archive/documentation/Performance/Con=
ceptual/power_efficiency_guidelines_osx/AppNap.html#//apple_ref/doc/uid/TP4=
0013929-CH2-SW1

  It doesn't matter how the process is started -- as a background job or
  as a foreground shell process in case QEMU has a desktop window.

  My VM does not have a display output, only a serial line, most likely
  if the VM was using OpenGL, or playing sound (or any other App Nap
  triggers), then the problem would never have been detected.

  In my case only one starting way without this problem:
  sudo qemu-system-x86_64 -nodefaults \
  -cpu host -accel hvf -smp 1 -m 384 \
  -device virtio-blk-pci,drive=3Dflash0 \
  -drive file=3D/vios-adventerprisek9-m.vmdk.SPA.156-1.T.vmdk,if=3Dnone,for=
mat=3Dvmdk,id=3Dflash0 \
  -device e1000,netdev=3Dlocal -netdev tap,id=3Dlocal,ifname=3Dtap0,script=
=3Dno,downscript=3Dno \
  -serial stdio -display none

  The typical way from the internet to disable App Nap doesn't work:
  defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923648/+subscriptions

