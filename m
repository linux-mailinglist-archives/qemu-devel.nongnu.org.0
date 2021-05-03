Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D9237222B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:03:10 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfie-0000TZ-EQ
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldfgT-0007T0-9j
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:00:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldfgQ-0001Du-Uu
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:00:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldfgO-0001zV-KF
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 21:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 72CBF2E8186
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 21:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 20:50:33 -0000
From: Logan Bateman <1860742@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: bootloop xv6
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: engmrgh nametable th-huth
X-Launchpad-Bug-Reporter: Logan Bateman (nametable)
X-Launchpad-Bug-Modifier: Logan Bateman (nametable)
References: <157983858012.5517.4456579868320256063.malonedeb@chaenomeles.canonical.com>
Message-Id: <162007503335.4348.7849620032855461708.malone@chaenomeles.canonical.com>
Subject: [Bug 1860742] Re: xv6 Bootloop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: dbf9bffb8cd044621ee15382dd196961475de01b
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
Reply-To: Bug 1860742 <1860742@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still seems to be an issue for me.

Qemu Version 5.2.0
Arch Linux 5.11.16-arch1-1

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860742

Title:
  xv6 Bootloop

Status in QEMU:
  New

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

