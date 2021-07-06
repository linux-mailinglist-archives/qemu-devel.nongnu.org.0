Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF33BC591
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:34:29 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cmy-0001iM-Pc
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfA-0007k5-2H
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:51216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf7-0003AU-W2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cf3-0004xO-Jt
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ABE422E826C
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:53 -0000
From: Launchpad Bug Tracker <1884017@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor me-davidglover th-huth
X-Launchpad-Bug-Reporter: David Glover (me-davidglover)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159245607293.6124.18309162054825340522.malonedeb@soybean.canonical.com>
Message-Id: <162554507339.7821.8152068991347908632.malone@loganberry.canonical.com>
Subject: [Bug 1884017] Re: Intermittently erratic mouse under Windows 95
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 97d40fbdc76cf989f3c2417410d1df39520ab2cf
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
Reply-To: Bug 1884017 <1884017@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884017

Title:
  Intermittently erratic mouse under Windows 95

Status in QEMU:
  Expired

Bug description:
  The mouse works fine maybe 75-80% of the time, but intermittently
  (every 20-30 seconds or so), moving the mouse will cause the pointer
  to fly around the screen at high speed, usually colliding with the
  edges, and much more problematically, click all the mouse buttons at
  random, even if you are not clicking. This causes random objects on
  the screen to be clicked and dragged around, rendering the system
  generally unusable.

  I don't know if this is related to #1785485 - it happens even if you
  never use the scroll wheel.

  qemu version: 5.0.0 (openSUSE Tumbleweed)

  Launch command line: qemu-system-i386 -hda win95.qcow2 -cpu pentium2
  -m 16 -vga cirrus -soundhw sb16 -nic user,model=3Dpcnet -rtc
  base=3Dlocaltime

  OS version: Windows 95 4.00.950 C

  I have made the disk image available here:
  https://home.gloveraoki.me/share/win95.qcow2.lz

  Setup notes: In order to make Windows 95 detect the system devices
  correctly, after first install you must change the driver for "Plug
  and Play BIOS" to "PCI bus". I have already done this in the above
  image.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884017/+subscriptions

