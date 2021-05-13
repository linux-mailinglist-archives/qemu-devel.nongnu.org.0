Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9337F73C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:57:56 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9yV-0005ji-DF
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9x2-00032R-SC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9wz-0004D5-BK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lh9wv-0000zy-M3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1F7B2E8209
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 11:45:51 -0000
From: Thomas Huth <1917940@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jrtc27 th-huth
X-Launchpad-Bug-Reporter: Jessica Clarke (jrtc27)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161497253793.31770.9218035606388599691.malonedeb@gac.canonical.com>
Message-Id: <162090635115.827.8010239730919041182.malone@wampee.canonical.com>
Subject: [Bug 1917940] Re: -bios edk2-$arch-code doesn't work for x86
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 7001b1a46cd46f92da2cc4815c3218c93edd9e27
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
Reply-To: Bug 1917940 <1917940@bugs.launchpad.net>
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

** Tags added: i386

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917940

Title:
  -bios edk2-$arch-code doesn't work for x86

Status in QEMU:
  Incomplete

Bug description:
  Whilst creating a flash device is recommended, -bios <file> is
  extremely useful in many cases as it automatically searches
  $PREFIX/share/qemu rather than requiring the caller (be it a human or
  a script) to work out where that directory is for the QEMU being
  called and prepend it to the file name.

  Currently, all the x86 EDK2 FD code files are 3653632 bytes in size,
  or 0x37c000 bytes. However, for some reason I cannot find the answer
  to (I traced the code back to
  7587cf44019d593bb12703e7046bd7738996c55c), x86's -bios only allows
  files that are multiples of 64K in size (x86_bios_rom_init), which
  would require the EDK2 ROMs to be rounded up to 0x380000 bytes. If I
  delete the check, QEMU is able to load the only-16K-multiple-sized
  EDK2 and boot an OS just fine. If I pad EDK2 with 16K of zeroes at the
  *start* (since the ROM gets mapped counting backwards), it also works
  just fine (but padding at the *end* doesn't). Please therefore either
  relax the check in x86_bios_rom_init or ensure the EDK2 binary is
  suitably padded.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917940/+subscriptions

