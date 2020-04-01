Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FB19A760
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 10:37:00 +0200 (CEST)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJYrr-0003fZ-JF
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 04:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJYr7-0003Fk-Tl
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJYr6-0000t1-OT
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:36:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:38138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJYr6-0000sO-Iw
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:36:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJYr5-0008Fm-Cs
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 08:36:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C6832E804C
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 08:36:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Apr 2020 08:28:18 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h djdatte h-sieger vkuznets zaltysz
X-Launchpad-Bug-Reporter: =?utf-8?q?=C5=BDilvinas_=C5=BDaltiena_=28zaltysz?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <154731859474.20612.3794172498936114295.malonedeb@soybean.canonical.com>
Message-Id: <158572969880.11818.5663722677078222660.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1811533] Re: Unstable Win10 guest with qemu 3.1 + huge pages +
 hv_stimer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ddbdf4861259194c71da49bd3fb36e01ff957a21
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811533

Title:
  Unstable Win10 guest with qemu 3.1 + huge pages + hv_stimer

Status in QEMU:
  Fix Committed

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

