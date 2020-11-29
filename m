Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1532C7B2E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:36:54 +0100 (CET)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTRF-0005l9-Ou
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjTPy-00059n-Vg
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:35:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjTPx-0000Aa-0j
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:35:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjTPu-0000jh-QH
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 20:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C48952E8019
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 20:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Nov 2020 20:25:53 -0000
From: johannes <1906181@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: input linux mouse
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: johannes (fghgfh832)
Message-Id: <160668155380.20995.12801548194687420676.malonedeb@gac.canonical.com>
Subject: [Bug 1906181] [NEW] Mouse starts jumping wildly on guest desktop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: b2d5dab4d11d501273747a308e6c4c4b5d59ad45
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906181 <1906181@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Sometimes mouse goes completely crazy and starts jumping around the
guest desktop by itself and becomes completely unusable.

This does not happen on every boot, only sometimes. It may be caused by
some input combination but I haven't yet found any specific cause. It
happens soon after the desktop has been loaded and rebooting seems to be
the only way to resolve the situation.


Guest: Kubuntu 20.04 64-bit (live), with KDE desktop
Host: Arch Linux, with KDE desktop
QEMU version: 5.1.0

QEMU start command:
qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubunt=
u-20.04-desktop-amd64.iso -boot d -vga virtio -soundhw hda -display sdl,gl=
=3Don

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: input linux mouse

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906181

Title:
  Mouse starts jumping wildly on guest desktop

Status in QEMU:
  New

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

