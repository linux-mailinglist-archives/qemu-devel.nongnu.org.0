Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDB672B3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 17:46:02 +0200 (CEST)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlxkG-00071Y-7O
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 11:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37885)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hlxk1-0006dT-HP
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:45:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hlxk0-0006Mm-DZ
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:45:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:40086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hlxk0-0006J5-3r
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:45:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hlxjy-0000NX-AP
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 15:45:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D8CE2E80C7
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 15:45:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jul 2019 15:40:20 -0000
From: =?utf-8?q?=C5=BDilvinas_=C5=BDaltiena?= <1811533@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: zaltysz
X-Launchpad-Bug-Reporter: =?utf-8?q?=C5=BDilvinas_=C5=BDaltiena_=28zaltysz?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?=C5=BDilvinas_=C5=BDaltiena_=28zaltysz?=
 =?utf-8?q?=29?=
References: <154731859474.20612.3794172498936114295.malonedeb@soybean.canonical.com>
Message-Id: <156294602091.24465.4179817646201130475.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: ed3c5dc33f4646981bf240b3e6e1a189135e29ec
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1811533] Re: Unstable Win10 guest with qemu 3.1 +
 huge pages + hv_stimer
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
Reply-To: Bug 1811533 <1811533@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refresh: still happening with Qemu 4.0 and Kernel 5.2.

One additional observation:
4) problem disappears when vhost is disabled.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811533

Title:
  Unstable Win10 guest with qemu 3.1 + huge pages + hv_stimer

Status in QEMU:
  New

Bug description:
  Host:
  Gentoo linux x86_64, kernel 4.20.1
  Qemu 3.1.0 =

  CPU: Intel i7 6850K
  Chipset: X99

  Guest:
  Windows 10 Pro 64bit (1809)
  Machine type: pc-q35_3.1
  Hyper-V enlightenments: hv_stimer,hv_reenlightenment,hv_frequencies,hv_va=
pic,hv_reset,hv_synic,hv_runtime,hv_vpindex,hv_time,hv_relaxed,hv_spinlocks=
=3D0x1fff
  Memory: 16GB backed by 2MB huge pages

  Issue:
  Once guest is started, log gets flooded with:

  qemu-system-x86_64: vhost_region_add_section: Overlapping but not
  coherent sections at 103000

  or

  qemu-system-x86_64: vhost_region_add_section:Section rounded to 0
  prior to previous 1f000

  (line endings change)

  and as time goes guest loses network access (virtio-net-pci) and
  general performance diminishes to extent of freezing applications.

  Observations:
  1) problem disappears when hv_stimer is removed
  2) problem disappears when memory backing with huge pages is disabled
  3) problem disappears when machine type is downgraded to pc-q35_3.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811533/+subscriptions

