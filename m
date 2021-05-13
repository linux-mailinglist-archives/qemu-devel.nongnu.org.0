Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF937F823
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:48:05 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAl2-0007OR-IW
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAUY-0006p7-EI
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:31:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAUS-0007CN-1P
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:31:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAUN-00088w-VV
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:30:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 336962E8189
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:30:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:22:47 -0000
From: Thomas Huth <1908416@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm uefi windows windows10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: raspiduino th-huth
X-Launchpad-Bug-Reporter: A user (raspiduino)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160813009293.16281.11756114510615914668.malonedeb@soybean.canonical.com>
Message-Id: <162090856710.16631.13386921984493401931.malone@soybean.canonical.com>
Subject: [Bug 1908416] Re: qemu-system-aarch64 can't run Windows 10 for ARM
 version 2004
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: ac2c07289c3ff12faeffa0892e008b241d975ccb
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
Reply-To: Bug 1908416 <1908416@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1908416

Title:
  qemu-system-aarch64 can't run Windows 10 for ARM version 2004

Status in QEMU:
  Incomplete

Bug description:
  Problem: qemu-system-aarch64 can't run Windows 10 for ARM version 2004
  (20H2) or newer

  Host OS: Windows 10 x64 version 20H2
  CPU    : Intel Pentium Dual-core T4300 (no vt-x)
  QEMU   : QEMU version 5.1.0 from qemu.org

  cmdline: qemu-system-aarch64.exe -M virt -cpu cortex-a72 -smp 3
  --accel tcg,thread=3Dmulti -m 2048 -pflash QEMU_EFI.img -pflash
  QEMU_VARS.img -device VGA -device nec-usb-xhci -device usb-kbd -device
  usb-mouse -device usb-storage,drive=3Dcdrom -drive
  file=3D"isofile.iso",media=3Dcdrom,if=3Dnone,id=3Dcdrom

  Note: QEMU_VARS and QEMU_EFI are taken from edk2

  Details: From this post (https://kitsunemimi.pw/notes/posts/running-
  windows-10-for-arm64-in-a-qemu-virtual-machine.html) and from what I
  have tried, QEMU can't run Windows ARM newer or equal to the 2004
  version. When we boot a 2004 iso (made from uupdump.ml), it stuck as
  the boot screen with the Windows ARM logo and nothing else. When I
  check the machine state and registers through the QEMU monitor, it
  shows that the VM is still running, but the registers are completely
  frozen! But if I try the older version, like 19H2, it works! Please
  help!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908416/+subscriptions

