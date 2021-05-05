Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C616837393C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:22:46 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFc5-0004rT-Ri
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaN-0003Gq-CO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:20:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:48098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaL-0007gr-Iy
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:20:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFaJ-00008R-OV
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:20:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6DFA2E8136
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:10:51 -0000
From: Thomas Huth <1811543@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamespharvey20 th-huth
X-Launchpad-Bug-Reporter: James Harvey (jamespharvey20)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154733722037.9104.8291788054708984327.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021305174.4369.16471461117789449890.malone@gac.canonical.com>
Subject: [Bug 1811543] Re: virtio-scsi gives improper discard sysfs entries
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 62da76c91ca9442f426b80df4dcd01c7effa23ed
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
Reply-To: Bug 1811543 <1811543@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/161


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #161
   https://gitlab.com/qemu-project/qemu/-/issues/161

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811543

Title:
  virtio-scsi gives improper discard sysfs entries

Status in QEMU:
  Expired

Bug description:
  Apologies if this is just an inherent part of paravirtualization that
  should be expected.

  In my host, I have an LVM thin pool with chunk_size 128MB.  Within it,
  I have a thin volume "tmp".  In the host:

  # fdisk -l /dev/lvm/tmp
  Disk /dev/lvm/tmp: 256 MiB, 268435456 bytes, 524288 sectors
  Units: sectors of 1 * 512 =3D 512 bytes
  Sector size (logical/physical): 512 bytes / 4096 bytes
  I/O size (minimum/optimal): 262144 bytes / 134217728 bytes
  Disklabel type: gpt
  Disk identifier: BAE3154E-6E85-F642-8129-BAD7B58B2775

  Device        Start    End Sectors  Size Type
  /dev/lvm/tmp1  2048 524254  522207  255M Linux filesystem

  $ lsblk
  ...
        =E2=94=94=E2=94=80lvm-tmp                      254:13   0   256M  0=
 lvm
          =E2=94=94=E2=94=80lvm-tmp1                   254:14   0   255M  0=
 part

  $ cat /sys/dev/block/254:13/discard_alignment
  0
  $ cat /sys/dev/block/254:13/queue/discard_granularity
  134217728
  $ cat /sys/dev/block/254:13/queue/discard_max_bytes
  17179869184
  $ cat /sys/dev/block/254:13/queue/discard_max_hw_bytes
  0
  $ cat /sys/dev/block/254:13/queue/discard_zeroes_data
  0

  $ cat /sys/dev/block/254:14/discard_alignment
  133169152
  $ cat /sys/dev/block/254:14/queue/discard_granularity
  134217728
  $ cat /sys/dev/block/254:14/queue/discard_max_bytes
  17179869184
  $ cat /sys/dev/block/254:14/queue/discard_max_hw_bytes
  0
  $ cat /sys/dev/block/254:14/queue/discard_zeroes_data
  0

  If this is given to QEMU using virtio-scsi:

     -device virtio-scsi-pci,id=3Dscsi1 \
     -drive driver=3Draw,node-name=3Dhdb,file=3D/dev/lvm/tmp,if=3Dnone,disc=
ard=3Dunmap,id=3Dhd2 \
     -device scsi-hd,drive=3Dhd2,bootindex=3D1 \

  Then incorrect values are given:

  $ lsblk
  ...
  sdb     8:16   0   256M  0 disk
  =E2=94=94=E2=94=80sdb1  8:17   0   255M  0 part /mnt

  $ cat /sys/dev/block/8:16/discard_alignment
  0
  $ cat /sys/dev/block/8:16/queue/discard_granularity
  4096
  $ cat /sys/dev/block/8:16/queue/discard_max_bytes
  1073741824
  $ cat /sys/dev/block/8:16/queue/discard_max_hw_bytes
  1073741824
  $ cat /sys/dev/block/8:16/queue/discard_zeroes_data
  0

  $ cat /sys/dev/block/8:17/discard_alignment
  133169152

  And, there isn't even a /sys/dev/block/8:17/queue direcotry.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811543/+subscriptions

