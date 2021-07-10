Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFEB3C32E0
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:36:56 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24jX-0006sl-Fo
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZD-0007wj-8d
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:45540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZB-0000Zk-Kz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Z7-0003r6-Dm
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D0EBE2E825C
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1906181@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: input linux mouse
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832 janitor th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160668155380.20995.12801548194687420676.malonedeb@gac.canonical.com>
Message-Id: <162589064233.5654.6970267708798173686.malone@loganberry.canonical.com>
Subject: [Bug 1906181] Re: Mouse starts jumping wildly on guest desktop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: d6f5e45b36c185f2d1d144a4a2ea1a6900f0992a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906181 <1906181@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906181

Title:
  Mouse starts jumping wildly on guest desktop

Status in QEMU:
  Expired

Bug description:
  Sometimes mouse goes completely crazy and starts jumping around the
  guest desktop by itself and becomes completely unusable.

  This does not happen on every boot, only sometimes. It may be caused
  by some input combination but I haven't yet found any specific cause.
  It happens soon after the desktop has been loaded and rebooting seems
  to be the only way to resolve the situation.

  =

  Guest: Kubuntu 20.04 64-bit (live), with KDE desktop
  Host: Arch Linux, with KDE desktop
  QEMU version: 5.1.0

  QEMU start command:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -vga virtio -soundhw hda -display sdl,g=
l=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906181/+subscriptions

