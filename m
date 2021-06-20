Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA163ADCDF
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:40:03 +0200 (CEST)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupFa-00064d-Ab
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2P-00010k-Ih
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2M-0002vg-Fc
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup28-0003tm-LY
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7B8752E8206
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1806114@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bios disk floppy interrupt
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow mrjjot pmaydell th-huth
X-Launchpad-Bug-Reporter: Jacek Wieczorek (mrjjot)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154360750589.15722.2632161476309150045.malonedeb@soybean.canonical.com>
Message-Id: <162416263752.7948.14300433287335940948.malone@loganberry.canonical.com>
Subject: [Bug 1806114] Re: Reading sectors from floppy with BIOS INT 13h is
 broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: afcf97106fa882540f27cd3a6b9a0cc277de2454
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
Reply-To: Bug 1806114 <1806114@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1806114

Title:
  Reading sectors from floppy with BIOS INT 13h is broken

Status in QEMU:
  Expired

Bug description:
  I'm developing a game bootable from a floppy disk, written in i386
  assembly. I found out it doesn't work on newer QEMU versions. I
  managed to isolate the issue and it seems that there's a problem with
  handling of BIOS interrupt 13h when it comes to reading disk sectors
  (AH=3D02).

  I've written a simple test in assembly. It simply accesses four
  different floppy disk sectors and prints out the strings they contain.
  The problem is, the two latter strings don't show up at all nor the
  BIOS interrupt returns an error (CF set). I've attached the code to
  this bug report. I use following commands to compile it and run:

  $ nasm disk-test.asm -o disk-test.bin
  $ qemu-system-i386 -boot a -fda disk-test.bin

  After running, the expected output is:

      I am a test string from boot sector
      C:H:S 0:0:2 - Hello
      C:H:S 0:0:3 - there!
      C:H:S 0:1:4 - In QEMU you can't
      C:H:S 1:0:5 - see these two lines! :(

  while the actual output is:

      I am a test string from boot sector
      C:H:S 0:0:2 - Hello
      C:H:S 0:0:3 - there!

  =

  So far, I found this problem in the current QEMU version for Ubuntu 18.04=
 (Debian 1:2.11+dfsg-1ubuntu7.8), as well as in the 3.1.0-rc3 and 2.12.1 ve=
rsions, available on the www.qemu.org website. Thus, the issue doesn't seem=
 to be very recent.

  To be sure, I ran the program on my other machine with older QEMU
  version (Debian 2.0.0+dfsg-2ubuntu1.43) and on my RaspberryPi 2
  (Debian 1.1.2+dfsg-6+deb7u25) and everything works as expected there.
  It also works well in VirtualBox.

  I hope these information are useful to you, however, I feel like this
  bug may be more related to Seabios. If so, please let me know and I
  will report it somewhere else.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1806114/+subscriptions

