Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1CC37623A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:38:48 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lew0V-0003cr-Sv
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levtC-0006MK-Ab
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:36310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt6-0007of-Gt
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1levt4-00012F-Ju
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:31:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B5A062E8199
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 08:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 08:21:28 -0000
From: ruthan <1873339@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan th-huth
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: ruthan (ruthan)
References: <158706571876.12002.5666042854910451278.malonedeb@soybean.canonical.com>
Message-Id: <162037568932.4018.18055904652433204020.launchpad@gac.canonical.com>
Subject: [Bug 1873339] Re: Qemu DOS Quake - 640x480 and above resolutions -
 Unable to load VESA palette in dos prompt and game crashing are not working 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7f2d75d0c6dcca72ebf6d00058c9a53545459367
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
Reply-To: Bug 1873339 <1873339@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873339

Title:
  Qemu DOS Quake - 640x480 and above resolutions - Unable to load VESA
  palette in dos prompt and game crashing are not working

Status in QEMU:
  New

Bug description:
  I have problem make Quake Demo working with 640x480+, with 320x200 workin=
g fine.
  I tried 3 virtual videocards settings: -vga cirrus 640x480 is not availab=
le, probably emulated GPU has not enough VRAM or some Vesa2 utility is need=
ed. For -vga std and -vga vmware // 640x480 is available in game menu, but =
when i tried to set it, im getting: Unable to load VESA palette in dos prom=
pt and game crashing.
  With vmware svgaII other Q2DOS 640x480 and 1024x768 its working fine, so =
it not working only with some games.

    Qemu 4.2, its same on Linux and Windows.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873339/+subscriptions

