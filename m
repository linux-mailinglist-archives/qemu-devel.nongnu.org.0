Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6C3652B0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 08:58:11 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkKo-0004yN-Br
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 02:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIj-0003FI-1w
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:56:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:44496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIa-0005a9-Tq
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:56:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYkIZ-0001z6-1v
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0D5812E8052
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 06:48:48 -0000
From: Thomas Huth <1806114@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bios disk floppy interrupt
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow mrjjot pmaydell th-huth
X-Launchpad-Bug-Reporter: Jacek Wieczorek (mrjjot)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154360750589.15722.2632161476309150045.malonedeb@soybean.canonical.com>
Message-Id: <161890132847.10123.1150940590220573521.malone@chaenomeles.canonical.com>
Subject: [Bug 1806114] Re: Reading sectors from floppy with BIOS INT 13h is
 broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: fd243a2a691e8254291f5b36fe0d79568ba2991d
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

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1806114

Title:
  Reading sectors from floppy with BIOS INT 13h is broken

Status in QEMU:
  Incomplete

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

