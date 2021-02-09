Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2E315183
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:26:42 +0100 (CET)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TyT-0002IU-5G
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Twx-0001LM-LG
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:25:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:47576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Tws-00029z-H5
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:25:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9Twp-0004IO-JF
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 14:24:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8541C2E8141
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 14:24:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 14:10:50 -0000
From: Thomas Huth <304636@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Won't Fix; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey bryce kirkland n1-notch-1
 plopezr riku-voipio simon-mungewell th-huth
X-Launchpad-Bug-Reporter: mungewell (simon-mungewell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20081203025459.23099.79789.malonedeb@gangotri.canonical.com>
Message-Id: <161287985051.32649.84804766016914672.malone@gac.canonical.com>
Subject: [Bug 304636] Re: -hda FAT:. limited to 504MBytes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: bbaad0d386f3f373f10f4e86353fb5243d915f3c
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
Reply-To: Bug 304636 <304636@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pedro,
please also note that vvfat driver is general in a bad state and more or le=
ss completely unmaintaind. I can only strongly recommend to *not* use it in=
 production. If you have to share files between guest and host, please use =
something more modern like virtio-fs (or maybe virtio-9p) instead.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/304636

Title:
  -hda FAT:. limited to 504MBytes

Status in QEMU:
  Confirmed
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

