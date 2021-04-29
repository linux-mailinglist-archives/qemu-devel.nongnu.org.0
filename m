Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6EA36E958
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:08:08 +0200 (CEST)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4Wd-00074w-5u
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4QE-0002e4-RF
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:01:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4QD-0005jT-1s
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:01:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc4QA-0007lp-OL
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:01:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B39BB2E815B
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 10:49:24 -0000
From: Thomas Huth <1884017@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: me-davidglover
X-Launchpad-Bug-Reporter: David Glover (me-davidglover)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159245607293.6124.18309162054825340522.malonedeb@soybean.canonical.com>
Message-Id: <161969336520.13919.18319815793622680613.launchpad@wampee.canonical.com>
Subject: [Bug 1884017] Re: Intermittently erratic mouse under Windows 95
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6601f1209d831aa56408c5b86b2e4f26b8ecea89
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
Reply-To: Bug 1884017 <1884017@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: qemu-system-i386
** Tags added: i386

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884017

Title:
  Intermittently erratic mouse under Windows 95

Status in QEMU:
  New

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

