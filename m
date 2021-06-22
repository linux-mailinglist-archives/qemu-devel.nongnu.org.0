Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37703AFC1F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:42:21 +0200 (CEST)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYEu-0001bh-U7
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzr-0007yo-FN
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:57378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzo-0005IW-N6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzb-000164-Dj
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A3A22E81DB
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:10 -0000
From: Launchpad Bug Tracker <1833048@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor stefan-proxmox th-huth
X-Launchpad-Bug-Reporter: Stefan (stefan-proxmox)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156076331418.27432.10852069688574998095.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433549097.20423.1795742026893055148.malone@loganberry.canonical.com>
Subject: [Bug 1833048] Re: Guest Agent get-fsinfo doesn't show ZFS volumes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 876856e39d6827712ff3f5f18ad25dcb547f7c60
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
Reply-To: Bug 1833048 <1833048@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833048

Title:
  Guest Agent get-fsinfo doesn't show ZFS volumes

Status in QEMU:
  Expired

Bug description:
  Calling get-fsinfo on a virtual machine does not include ZFS
  (zfsonlinux, debian guest tested) volumes. Calling on a system with a
  single ZFS disk (ZFS as root fs) simply returns '[]', if other disks
  exist on the guest it only shows these.

  Expected behaviour: Show file system details like with other fs
  formats.

  Tried with debian stretch default qemu-guest-agent package and v4.0.0 fro=
m git, compiled locally - result is the same.
  Host is using QEMU 3.0.1, but that shouldn't matter, right?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833048/+subscriptions

