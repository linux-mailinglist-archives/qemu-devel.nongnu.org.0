Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D808437516D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:22:02 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaCn-000658-TU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyf-0002ff-Ae
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:58688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyV-0003Aj-UM
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZyR-0001YU-74
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 57AA82E8230
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 09:07:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:59:22 -0000
From: Thomas Huth <1860742@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bootloop xv6
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: engmrgh nametable th-huth
X-Launchpad-Bug-Reporter: Logan Bateman (nametable)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157983858012.5517.4456579868320256063.malonedeb@chaenomeles.canonical.com>
Message-Id: <162029156274.14724.3152677737957216402.malone@soybean.canonical.com>
Subject: [Bug 1860742] Re: xv6 Bootloop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: c6d864d7d8ee75f145af170e348b5f26c26be3c6
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
Reply-To: Bug 1860742 <1860742@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/192


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #192
   https://gitlab.com/qemu-project/qemu/-/issues/192

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860742

Title:
  xv6 Bootloop

Status in QEMU:
  Expired

Bug description:
  Qemu Version: 4.2.0

  Launch command:
  qemu-system-x86_64 -nographic -drive file=3Dfs.img,index=3D1,media=3Ddisk=
,format=3Draw -drive file=3Dxv6.img,index=3D0,media=3Ddisk,format=3Draw -sm=
p 2 -m 512

  How to reproduce?
  1.)  Use/install latest release of qemu (4.2.0 at time of writing)

  2.)  Download, build, and run xv6 (a simple os designed for learning
  operating systems fundamentals)

  cd /tmp
  git clone https://github.com/mit-pdos/xv6-public.git
  cd xv6-public
  make qemu-nox

  3.)  Qemu should now bootloop (seem to try to boot but then just
  repeat). This is what it looks like below before it repeats:

  SeaBIOS (version ?-20191223_100556-anatol)

  iPXE (http://ipxe.org) 00:03.0 CA00 PCI2.10 PnP PMM+1FF92A50+1FEF2A50
  CA00

  Booting from Hard Disk..

  Host: Arch Linux - Kernel version: 5.4.13
  Guest: xv6 (https://github.com/mit-pdos/xv6-public)

  Suspicion:

  When I was using qemu 2.11.1 inside an ubuntu docker container, the
  xv6 os booted with no problem. I am thinking that something changed
  between Qemu 2.11.1 and Qemu 4.2.0 which is now causing boot problems.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860742/+subscriptions

