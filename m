Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC6365D34
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:23:46 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtA9-0003R6-1q
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYt8p-0002cZ-P1
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:22:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYt8n-0004uE-PZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:22:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYt8l-0008LU-23
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 16:22:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E3232E816A
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 16:22:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 16:00:59 -0000
From: Thomas Huth <304636@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Wishlist;
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
Message-Id: <161893446027.31576.8212779211318539010.launchpad@soybean.canonical.com>
Subject: [Bug 304636] Re: -hda FAT:. limited to 504MBytes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1311e3fa8493078fafc79a5b8f5b09dbdbdac283
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

** Tags added: block

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

