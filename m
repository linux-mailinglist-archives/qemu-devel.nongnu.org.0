Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD433B5856
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 06:30:33 +0200 (CEST)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxium-0006MW-6M
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 00:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lxite-0005fN-9B
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 00:29:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:41428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lxitb-00016L-Tb
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 00:29:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lxitY-0001J0-EF
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 04:29:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5DF3F2E8180
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 04:29:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Jun 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1295587@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sb16
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alvarezviu aslopes crobinso dennis123321 janitor
 milasudril th-huth volitank
X-Launchpad-Bug-Reporter: alvarez (alvarezviu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20140321093246.9788.71300.malonedeb@soybean.canonical.com>
Message-Id: <162485383834.9766.8130691962293019552.malone@loganberry.canonical.com>
Subject: [Bug 1295587] Re: Temporal freeze and slowdown while using emulated
 sb16
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="40cc6dba4163ba9ca785b26ad91f43c87d70ba4d"; Instance="production"
X-Launchpad-Hash: 07c11bb4455d214cd2df1cfee34562a24fdca568
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1295587 <1295587@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1295587

Title:
  Temporal freeze and slowdown while using emulated sb16

Status in QEMU:
  Expired

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

