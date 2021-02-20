Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AD320240
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:32:32 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDGCF-0000wW-Su
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDFw5-0004Xd-L3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:15:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:53486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDFw2-0006Oh-0w
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:15:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lDFvz-0003Is-MU
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 00:15:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 91AC12E8101
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 00:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Feb 2021 00:07:57 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1910586@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd ubi-one-kenubi
X-Launchpad-Bug-Reporter: - (ubi-one-kenubi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161004745358.28900.17773103786496139692.malonedeb@chaenomeles.canonical.com>
Message-Id: <161377967829.11992.1920969926927167307.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1910586] Re: SD card size constraint conceptually wrong
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: deecd6ee51427c305658d750fc30e98d593ed203
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
Reply-To: Bug 1910586 <1910586@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910586

Title:
  SD card size constraint conceptually wrong

Status in QEMU:
  Confirmed

Bug description:
  The patch discussed here:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg720833.html
  introduces an artificial size constraint for SD cards
  that has no relation to reality.

  I'm trying to use an _actual_ **physical** SD card,
  and qemu tells me its size is "invalid".

  Something here appears to be conceptually wrong.

  --------------------------------------------------
  # fdisk -l /dev/sdg
  Disk /dev/sdg: 14.84 GiB, 15931539456 bytes, 31116288 sectors
  Disk model: USB  SD Reader  =

  Units: sectors of 1 * 512 =3D 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disklabel type: dos
  Disk identifier: 0x7a0c8bb0

  Device     Boot  Start      End  Sectors  Size Id Type
  /dev/sdg1         2048   524287   522240  255M  c W95 FAT32 (LBA)
  /dev/sdg2       524288 31116287 30592000 14.6G 83 Linux
  # qemu-system-aarch64 -M raspi3 -m 1G -kernel vmlinuz-5.4.79-v8 -dtb bcm2=
837-rpi-3-b-plus.dtb -append console=3DttyAMA0\ root=3D/dev/mmcblk0p2\ rw -=
nographic -serial mon:stdio -drive file=3D/dev/sdg,format=3Draw
  qemu-system-aarch64: Invalid SD card size: 14.8 GiB
  SD card size has to be a power of 2, e.g. 16 GiB.
  You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
  (note that this will lose data if you make the image smaller than it curr=
ently is).
  --------------------------------------------------

  The same invocation with a dump of the actual image
  resized to match qemu's odd expectations works fine.

  =

  This is on QEMU 5.2.0, as evidenced by the following:
  --------------------------------------------------
  # qemu-system-aarch64 -version
  QEMU emulator version 5.2.0
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
  --------------------------------------------------

  Is there a simple workaround that disables this rather
  arbitrary constraint?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910586/+subscriptions

