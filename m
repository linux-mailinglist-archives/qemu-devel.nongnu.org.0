Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC62EE84B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:21:59 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdfK-0005z1-1i
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxdeD-0005QN-Oc
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:20:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:51568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxde9-0003qi-T4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:20:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxde5-0003yf-GH
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 22:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D7902E813B
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 22:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Jan 2021 22:13:12 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1910586@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd ubi-one-kenubi
X-Launchpad-Bug-Reporter: - (ubi-one-kenubi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161004745358.28900.17773103786496139692.malonedeb@chaenomeles.canonical.com>
Message-Id: <f4c6b358-ce79-73d8-8a92-eb474ab1a5ee@amsat.org>
Subject: Re: [Bug 1910586] [NEW] SD card size constraint conceptually wrong
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: e86ab2d26faa7db334c272facde9b1d98e2195bd
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

On 1/7/21 8:24 PM, - wrote:
> Public bug reported:
> =

> The patch discussed here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720833.html
> introduces an artificial size constraint for SD cards
> that has no relation to reality.
> =

> I'm trying to use an _actual_ **physical** SD card,
> and qemu tells me its size is "invalid".
> =

> Something here appears to be conceptually wrong.
> =

> --------------------------------------------------
> # fdisk -l /dev/sdg
> Disk /dev/sdg: 14.84 GiB, 15931539456 bytes, 31116288 sectors
> Disk model: USB  SD Reader  =

> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x7a0c8bb0
> =

> Device     Boot  Start      End  Sectors  Size Id Type
> /dev/sdg1         2048   524287   522240  255M  c W95 FAT32 (LBA)
> /dev/sdg2       524288 31116287 30592000 14.6G 83 Linux
> # qemu-system-aarch64 -M raspi3 -m 1G -kernel vmlinuz-5.4.79-v8 -dtb bcm2=
837-rpi-3-b-plus.dtb -append console=3DttyAMA0\ root=3D/dev/mmcblk0p2\ rw -=
nographic -serial mon:stdio -drive file=3D/dev/sdg,format=3Draw
> qemu-system-aarch64: Invalid SD card size: 14.8 GiB
> SD card size has to be a power of 2, e.g. 16 GiB.

Your physical card likely is 16GiB. The firmware running
on it is free to reserve some amount to replace broken
blocks. In your case ~7%.

We choose to restrict the model to the physical layer to
simplify the design and avoid to deal with security issues.

Patches to improve the model by better matching the real
world are always welcomed!

> You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
> (note that this will lose data if you make the image smaller than it curr=
ently is).

Indeed, we can remove this warning for block devices.

> --------------------------------------------------
> =

> The same invocation with a dump of the actual image
> resized to match qemu's odd expectations works fine.
> =

> =

> This is on QEMU 5.2.0, as evidenced by the following:
> --------------------------------------------------
> # qemu-system-aarch64 -version
> QEMU emulator version 5.2.0
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
> --------------------------------------------------
> =

> Is there a simple workaround that disables this rather
> arbitrary constraint?

No, but you can send a patch :)

Regards,

Phil.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910586

Title:
  SD card size constraint conceptually wrong

Status in QEMU:
  New

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

