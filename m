Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15E36D227
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 08:23:22 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdbV-00047q-5t
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 02:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbdY7-0002nX-2d
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 02:19:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbdY2-0004h5-2D
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 02:19:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbdY0-0003n7-2y
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:19:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0FA022E815A
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:19:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Apr 2021 06:01:04 -0000
From: Thomas Huth <1295587@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sb16
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alvarezviu aslopes crobinso dennis123321
 milasudril th-huth volitank
X-Launchpad-Bug-Reporter: alvarez (alvarezviu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140321093246.9788.71300.malonedeb@soybean.canonical.com>
Message-Id: <161958966487.16689.12997137092074185475.malone@chaenomeles.canonical.com>
Subject: [Bug 1295587] Re: Temporal freeze and slowdown while using emulated
 sb16
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 0a7fbc53b2a0914758368d027e01aad12fadac41
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
Reply-To: Bug 1295587 <1295587@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1295587

Title:
  Temporal freeze and slowdown while using emulated sb16

Status in QEMU:
  Incomplete

Bug description:
  I have been carrying around this bug since previous versions and on
  different machines: When I use the -soundhw sb16 option, while playing
  any sound on the virtual machine it temporally freezes the emulated
  machine and loops the last bit of such sound effect for 1-2 minutes,
  then goes back to normal speed (until a new sound is played).

  Console shows:

  =C2=A0sb16: warning: command 0xf9,1 is not truly understood yet
  =C2=A0sb16: warning: command 0xf9,1 is not truly understood yet
  (...)
  main-loop: WARNING: I/O thread spun for 1000 iterations

  -One of my emulated machines is Windows 3.11: I managed to overrun
  this bug by switching from the local 1.5 version of the sound blaster
  driver to the 1.0, although since I updated qemu it freezes that
  machine, so I can't test if it still works.

  I am using the 1.7.90 version, but I suffered this bug for over one
  year (confirmed in version 2.0.0-rc0 too)

  this bug happens anytime I use the -soundhw sb16 switch, but the full
  command I am using in this specific case is:

  qemu-system-i386 -localtime -cpu pentium -m 32 -display sdl -vga
  cirrus -hda c.img -cdrom win95stuff.iso -net nic,model=3Dne2k_pci -net
  user -soundhw sb16

  This bug appears on all my machines: Pentium III running Slackware
  13.0 and freeBSD 10; Dual core T2400, both in Arch, Gentoo and
  Slackware 14.1 (all 32 bits), and a Dual core T4400 64 bits with
  Gentoo and Slackware. Same problem in all of those systems after
  compiling instead of using the distro packages....

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1295587/+subscriptions

