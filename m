Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE53B9B89
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:34:44 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAt1-0005T9-FY
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAko-0000cp-Pa
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:43190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkl-0002Xk-N7
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkX-00053b-8K
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78BE82E821B
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1842925@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor maratsal th-huth
X-Launchpad-Bug-Reporter: Marat Salakhutdinov (maratsal)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156768994375.29003.5099707565404830326.malonedeb@chaenomeles.canonical.com>
Message-Id: <162519944384.31921.13987935818493322292.malone@loganberry.canonical.com>
Subject: [Bug 1842925] Re: no batmap on convertion from qcow2 to vhd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 80506fae888941ecbbc2530e9f65523f0670765b
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
Reply-To: Bug 1842925 <1842925@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842925

Title:
  no batmap on convertion from qcow2 to vhd

Status in QEMU:
  Expired

Bug description:
  we run following version of qemu-img:
  $ qemu-img --version
  qemu-img version 2.5.0 (Debian 1:2.5+dfsg-5ubuntu10.41), Copyright (c) 20=
04-2008 Fabrice Bellard
  $

  Here is os version:
  $ cat /etc/os-release =

  NAME=3D"Ubuntu"
  VERSION=3D"16.04.6 LTS (Xenial Xerus)"
  ID=3Dubuntu
  ID_LIKE=3Ddebian
  PRETTY_NAME=3D"Ubuntu 16.04.6 LTS"
  VERSION_ID=3D"16.04"
  HOME_URL=3D"http://www.ubuntu.com/"
  SUPPORT_URL=3D"http://help.ubuntu.com/"
  BUG_REPORT_URL=3D"http://bugs.launchpad.net/ubuntu/"
  VERSION_CODENAME=3Dxenial
  UBUNTU_CODENAME=3Dxenial
  $

  When we use qemu-img for conversion of qcow2 to vhd newly created file
  doesnt show batmap summary when we run:

  # vhd-util read -p -n centos76.vhd
  VHD Footer Summary:
  -------------------
  Cookie              : conectix
  Features            : (0x00000002) <RESV>
  File format version : Major: 1, Minor: 0
  Data offset         : 512
  Timestamp           : Mon Mar  4 13:21:27 2019
  Creator Application : 'qemu'
  Creator version     : Major: 5, Minor: 3
  Creator OS          : Windows
  Original disk size  : 8192 MB (8590417920 Bytes)
  Current disk size   : 8192 MB (8590417920 Bytes)
  Geometry            : Cyl: 16645, Hds: 16, Sctrs: 63
                      : =3D 8192 MB (8590417920 Bytes)
  Disk type           : Dynamic hard disk
  Checksum            : 0xfffff119|0xfffff119 (Good!)
  UUID                : 23772822-a66c-45a2-be37-8474604147c7
  Saved state         : No
  Hidden              : 0

  VHD Header Summary:
  -------------------
  Cookie              : cxsparse
  Data offset (unusd) : 18446744073709
  Table offset        : 1536
  Header version      : 0x00010000
  Max BAT size        : 4097
  Block size          : 2097152 (2 MB)
  Parent name         : =

  Parent UUID         : 00000000-0000-0000-0000-000000000000
  Parent timestamp    : Fri Dec 31 19:00:00 1999
  Checksum            : 0xfffff466|0xfffff466 (Good!)

  #

  I am not so strong in VHD format details and not exactly sure how
  batmap is needed, but when I do conversion of qcow2 image by using
  vhd-util at the end I get file with proper batmap summary.

  In our environment we use CloudStack and Citrix and we use those
  converted from qcow2 to vhd images as templates. In general there is
  no problems, but whenever we create snapshot out of VM created from
  such template vhd-util read command starts giving us error like below:

  #
  -------------------
  Cookie              : conectix
  Features            : (0x00000002) <RESV>
  File format version : Major: 1, Minor: 0
  Data offset         : 512
  Timestamp           : Thu Aug 29 16:04:30 2019
  Creator Application : 'tap'
  Creator version     : Major: 1, Minor: 3
  Creator OS          : Unknown!
  Original disk size  : 8194 MB (8592031744 Bytes)
  Current disk size   : 8194 MB (8592031744 Bytes)
  Geometry            : Cyl: 16648, Hds: 16, Sctrs: 63
                      : =3D 8193 MB (8591966208 Bytes)
  Disk type           : Dynamic hard disk
  Checksum            : 0xfffff074|0xfffff074 (Good!)
  UUID                : 2b3cac7d-16e1-4771-b8cd-bb8c7876c761
  Saved state         : No
  Hidden              : 0

  VHD Header Summary:
  -------------------
  Cookie              : cxsparse
  Data offset (unusd) : 18446744073709
  Table offset        : 1536
  Header version      : 0x00010000
  Max BAT size        : 4097
  Block size          : 2097152 (2 MB)
  Parent name         : =

  Parent UUID         : 00000000-0000-0000-0000-000000000000
  Parent timestamp    : Sat Jan  1 00:00:00 2000
  Checksum            : 0xfffff466|0xfffff466 (Good!)

  failed to get batmap header

  #

  With the templates that show correct batmap summary that are created
  by conversion of qcow2 image by vhd-util convert we don't have such
  problems.

  So I wanted to check with community if not existence of the batmap can
  cause (be the reason of) this behaviour later on snapshot creation
  stage? Should we always have batmap summary on output of vhd-util read
  command?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1842925/+subscriptions

