Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C7370E90
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:39:46 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldH0L-0004wn-Ff
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGwK-0000qI-Cn
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:35:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGwF-0005WN-Bl
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:35:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGwE-0001VD-26
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C6D532E815D
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:25:47 -0000
From: Thomas Huth <1860742@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bootloop xv6
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: engmrgh nametable th-huth
X-Launchpad-Bug-Reporter: Logan Bateman (nametable)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157983858012.5517.4456579868320256063.malonedeb@chaenomeles.canonical.com>
Message-Id: <161997994751.10149.664801066884050424.malone@gac.canonical.com>
Subject: [Bug 1860742] Re: xv6 Bootloop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: fe13fd0c710b5a86b373ba02c3bad5d85eab1301
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860742

Title:
  xv6 Bootloop

Status in QEMU:
  Incomplete

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

