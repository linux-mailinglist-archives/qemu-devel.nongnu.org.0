Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFC2F270A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:28:15 +0100 (CET)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBHy-0001P6-AW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFp-0008AL-1q
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:52234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFf-0000t0-Er
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFc-0004jW-Tq
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D888E2E813A
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1792193@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: byterflame dgilbert-h janitor th-huth
X-Launchpad-Bug-Reporter: Kirill Bugaev (byterflame)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153677257295.16759.16180406339964880552.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042505424.10246.2264990829870753590.malone@loganberry.canonical.com>
Subject: [Bug 1792193] Re: AMD Athlon(tm) X2 Dual-Core QL-64 bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 35157d8bdd6780b7d15b83921c467173a7eb46cb
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
Reply-To: Bug 1792193 <1792193@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1792193

Title:
  AMD Athlon(tm) X2 Dual-Core QL-64 bug

Status in QEMU:
  Expired

Bug description:
  I upgrade my qemu 2.12.0-2 =3D> 3.0.0-1. After that I can't load virtual =
machine with "-cpu host" option. Full command line is
  qemu-system-x86_64 \
  	-monitor stdio \
  	-enable-kvm \
  	-cpu host \
  	-smp cpus=3D2 \
  	-m 1G \
  	-vga virtio \
  	-display gtk,gl=3Don \
  	-soundhw ac97 \
  	-drive file=3D/ehdd/qemu/arch_hw_12_08_2018/arch_shrinked.raw,format=3Dr=
aw,if=3Dvirtio
  I have Arch Linux on virtual machine. When I start QEMU, GRUB tries to lo=
ad initial ramdisk and stops. System doesn't load. If I try to start virtua=
l machine with "-cpu athlon" option then get the same bug.
  I downgrade back to qemu 2.12.0-2 and virtual machine works fine, system =
loads.
  My processor is AMD Athlon(tm) X2 Dual-Core QL-64.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1792193/+subscriptions

