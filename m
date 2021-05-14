Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0423809F0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:55:18 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXLZ-00086U-Uh
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhX8R-0000FU-Hv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:41:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:56316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhX8P-0003DU-Bk
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:41:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhX8K-0006gx-08
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 12:41:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BCA742E8193
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 12:41:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 12:33:18 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1910586@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth ubi-one-kenubi
X-Launchpad-Bug-Reporter: - (ubi-one-kenubi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161004745358.28900.17773103786496139692.malonedeb@chaenomeles.canonical.com>
Message-Id: <162099559858.21152.2801917621766788977.malone@soybean.canonical.com>
Subject: [Bug 1910586] Re: SD card size constraint conceptually wrong
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 8303d6fde14d353917dc4a58ef07850bdd6877bb
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
Reply-To: Bug 1910586 <1910586@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/297


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

** Changed in: qemu
       Status: Confirmed =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #297
   https://gitlab.com/qemu-project/qemu/-/issues/297

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910586

Title:
  SD card size constraint conceptually wrong

Status in QEMU:
  Invalid

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

