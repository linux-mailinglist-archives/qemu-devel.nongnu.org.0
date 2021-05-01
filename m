Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87439370674
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:42:54 +0200 (CEST)
Received: from localhost ([::1]:54542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclDB-0003H8-0G
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclAA-0001fi-9t
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:39:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:45150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclA4-0000N7-Eg
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:39:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lclA0-0005XS-AP
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:39:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E2382E8031
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:39:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:25:46 -0000
From: Thomas Huth <304636@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Won't Fix; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: block
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey berrange bryce kirkland
 n1-notch-1 plopezr riku-voipio simon-mungewell th-huth
X-Launchpad-Bug-Reporter: mungewell (simon-mungewell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20081203025459.23099.79789.malonedeb@gangotri.canonical.com>
Message-Id: <161985754674.11641.11507613795737856097.malone@soybean.canonical.com>
Subject: [Bug 304636] Re: -hda FAT:. limited to 504MBytes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ea7c966e281d5fa80cd7b4da21c9a726c040f479
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 304636 <304636@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug report has been moved to QEMU's new bug tracker on gitlab.com
and thus gets now closed in Launchpad. Please continue with the
discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/66

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #66
   https://gitlab.com/qemu-project/qemu/-/issues/66

** Changed in: qemu
       Status: Confirmed =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/304636

Title:
  -hda FAT:. limited to 504MBytes

Status in QEMU:
  Invalid
Status in qemu package in Ubuntu:
  Won't Fix

Bug description:
  Binary package hint: qemu

  The size of the virtual FAT file system (for sharing a particular directo=
ry with Guest OS) is hard-coded to be limited to 504MBytes, in block-vvfat.c
  --
  /* 504MB disk*/
  bs->cyls=3D1024; bs->heads=3D16; bs->secs=3D63;
  --

  If the directory contents exceeds this is stops with an assert
  --
  qemu: block-vvfat.c:97: array_get: Assertion `index < array->next' failed.
  Aborted
  --

  Also the FAT16 mode (default) only uses 8KByte cluster sizes which preven=
ts the above being increased. 16KByte and 32KByte sectors can be selected w=
ith the following patch
  --
  --- block-vvfat.c_orig  2008-12-02 12:37:28.000000000 -0700
  +++ block-vvfat.c       2008-12-02 19:50:35.000000000 -0700
  @@ -1042,6 +1042,12 @@
          s->fat_type =3D 32;
       } else if (strstr(dirname, ":16:")) {
          s->fat_type =3D 16;
  +    } else if (strstr(dirname, ":16-16K:")) {
  +       s->fat_type =3D 16;
  +       s->sectors_per_cluster=3D0x20;
  +    } else if (strstr(dirname, ":16-32K:")) {
  +       s->fat_type =3D 16;
  +       s->sectors_per_cluster=3D0x40;
       } else if (strstr(dirname, ":12:")) {
          s->fat_type =3D 12;
          s->sector_count=3D2880;
  --

  Cheers,
  Mungewell

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/304636/+subscriptions

