Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60B3C975C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:27:18 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3sxx-0007b5-W4
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swV-0004r9-Fv
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swT-0000Hs-MP
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swR-0007Wf-RG
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC7062E8058
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1926497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: m68k q800
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cat-7 janitor jrmuizel laurent-vivier th-huth
X-Launchpad-Bug-Reporter: Jeff (jrmuizel)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161963801251.13717.437360863998468941.malonedeb@wampee.canonical.com>
Message-Id: <162632264192.31721.756924680230252508.malone@loganberry.canonical.com>
Subject: [Bug 1926497] Re: dp83932 stops working after a short while
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: ed6cdafb334853bae1100b9273c0b2d285297821
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926497 <1926497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926497

Title:
  dp83932 stops working after a short while

Status in QEMU:
  Expired

Bug description:
  Following the instructions here
  https://wiki.qemu.org/Documentation/Platforms/m68k I was able to
  successfully install debian. However, running apt-get update stalls
  after the first 1-2MB.

  root@debian:~# apt-get update
  Get:1 http://ftp.ports.debian.org/debian-ports sid InRelease [55.3 kB]
  Ign:1 http://ftp.ports.debian.org/debian-ports sid InRelease
  Get:2 http://ftp.ports.debian.org/debian-ports sid/main all Packages [8,7=
35 kB]
  18% [2 Packages 2,155 kB/8,735 kB 25%]

  After running apt-get update. I don't seem to be able to send any
  packets anymore. ping host lookups fail and a subsequent apt-get
  update makes no progress.

  I'm launching qemu with:

    qemu-system-m68k -boot c \
   -M q800 -serial none -serial mon:stdio -m 1000M \
   -net nic,model=3Ddp83932 -net user \
   -append "root=3D/dev/sda2 rw console=3DttyS0 console=3Dtty" \
   -kernel vmlinux-4.16.0-1-m68k \
   -initrd initrd.img-4.16.0-1-m68k \
   -drive file=3Dm68k-deb10.qcow2,format=3Dqcow2 \
   -nographic

  I see this with qemu v6.0.0-rc5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926497/+subscriptions


