Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90483734B6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:28:51 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leA5a-0000hI-WB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leA32-0008D3-UY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:26:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:32862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leA2r-0000qW-H8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:26:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leA2n-0000lh-9m
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B8A3C2E80BA
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 05:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 05:16:03 -0000
From: Thomas Huth <1759522@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: atmgnd dogbertai maro th-huth the.netadmin voltagex
X-Launchpad-Bug-Reporter: Zixuan Wang (the.netadmin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152222836105.21062.2375148895134658603.malonedeb@chaenomeles.canonical.com>
Message-Id: <162019176387.14724.4745907305001563907.malone@soybean.canonical.com>
Subject: [Bug 1759522] Re: windows qemu-img create vpc/vhdx error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 178d7603f258eb0bb79b3072208b6c1354fc36b0
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
Reply-To: Bug 1759522 <1759522@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/136


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #136
   https://gitlab.com/qemu-project/qemu/-/issues/136

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759522

Title:
  windows qemu-img create vpc/vhdx error

Status in QEMU:
  Expired

Bug description:
  On windows, using qemu-img (version 2.11.90) to create vpc/vhdx
  virtual disk tends to fail. Here's the way to reproduce:

  1. Install qemu-w64-setup-20180321.exe

  2. Use `qemu-img create -f vhdx -o subformat=3Dfixed disk.vhdx 512M` to c=
reate a vhdx:
     Formatting 'disk.vhdx', fmt=3Dvhdx size=3D536870912 log_size=3D1048576=
 block_size=3D0 subformat=3Dfixed

  3. Execute `qemu-img info disk.vhdx` gives the result, (note the `disk si=
ze` is incorrect):
     image: disk.vhdx
     file format: vhdx
     virtual size: 512M (536870912 bytes)
     disk size: 1.4M
     cluster_size: 8388608

  4. On Windows 10 (V1709), double click disk.vhdx gives an error:
     Make sure the file is in an NTFS volume and isn't in a compressed fold=
er or volume.

     Using Disk Management -> Action -> Attach VHD gives an error:
     The requested operation could not be completed due to a virtual disk s=
ystem limitation. Virtual hard disk files must be uncompressed and uneccryp=
ted and must not be sparse.

  Comparison with Windows 10 created VHDX:

  1. Using Disk Management -> Action -> Create VHD:
     File name: win.vhdx
     Virtual hard disk size: 512MB
     Virtual hard disk format: VHDX
     Virtual hard disk type: Fixed size

  2. Detach VHDX

  3. Execute `qemu-img info win.vhdx` gives the result:
     image: win.vhdx
     file format: vhdx
     virtual size: 512M (536870912 bytes)
     disk size: 516M
     cluster_size: 33554432

  Comparison with qemu-img under Ubuntu:

  1. Version: qemu-img version 2.5.0 (Debian 1:2.5+dfsg-5ubuntu10.16),
  Copyright (c) 2004-2008 Fabrice Bellard

  2. qemu-img create -f vhdx -o subformat=3Dfixed lin.vhdx 512M
     Formatting 'lin.vhdx', fmt=3Dvhdx size=3D536870912 log_size=3D1048576 =
block_size=3D0 subformat=3Dfixed

  3. qemu-img info lin.vhdx
     image: lin.vhdx
     file format: vhdx
     virtual size: 512M (536870912 bytes)
     disk size: 520M
     cluster_size: 8388608

  4. Load lin.vhdx under Windows 10 is ok

  The same thing happens on `vpc` format with or without
  `oformat=3Dfixed`, it seems that windows version of qemu-img has some
  incorrect operation? My guess is that windows version of qemu-img
  doesn't handle the description field of vpc/vhdx, which leads to an
  incorrect `disk size` field.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759522/+subscriptions

