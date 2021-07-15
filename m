Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE33C978C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:35:32 +0200 (CEST)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3t5v-0007kS-MY
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swq-0006B0-3J
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:26:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swn-0000Q0-4w
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:26:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swa-00082N-1y
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E775E2E8167
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1924914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola janitor th-huth
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161875281831.22652.8172907256269796216.malonedeb@wampee.canonical.com>
Message-Id: <162632264772.31721.1937543893316571045.malone@loganberry.canonical.com>
Subject: [Bug 1924914] Re: Running sway in a QEMU VM results in a GPU hang of
 the guest (virtio-gpu driver)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: da02a59c2325a20a1433b739b47b5ce97092682e
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
Reply-To: Bug 1924914 <1924914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924914

Title:
  Running sway in a QEMU VM results in a GPU hang of the guest (virtio-
  gpu driver)

Status in QEMU:
  Expired

Bug description:
  System is Arch Linux (guest and host OS).

  Problem:

  Basically, when using sway on a guest and running certain applications
  via Xwayland (on the guest), the GUI will freeze and won't be usable
  anymore, I can still ssh to the guest and run commands.

  This is the command I use to run my guest:

  qemu-system-x86_64 -enable-kvm -cdrom
  ~/Downloads/linux/archlinux/archlinux-2021.04.01-x86_64.iso -m 4G -vga
  virtio -nic user,hostfwd=3Dtcp::10022-:22

  This doesn't happen when I use X with i3-wm.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924914/+subscriptions


