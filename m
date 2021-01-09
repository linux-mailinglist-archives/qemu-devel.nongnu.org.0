Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA62EFDBC
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:35:51 +0100 (CET)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5yg-00039d-Dh
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pz-0000B4-8L
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:47300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5px-00070b-GD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pj-0007QW-Vl
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1F4A2E817D
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:48 -0000
From: Launchpad Bug Tracker <1702621@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h janitor pork-prince th-huth zhangckid
X-Launchpad-Bug-Reporter: junchi (pork-prince)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <149932544038.24380.387410318124517933.malonedeb@soybean.canonical.com>
Message-Id: <161016586874.8490.8200839905124330735.malone@loganberry.canonical.com>
Subject: [Bug 1702621] Re: colo: secondary vm crash during loadvm
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 420011a0552d317a9ea67adf2b59a4caed4b5099
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1702621 <1702621@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1702621

Title:
  colo: secondary vm crash during loadvm

Status in QEMU:
  Expired

Bug description:
  Following document 'COLO-FT.txt', I test colo feature on my hosts. It see=
ms goes well. But after a while the secondary vm crash.  The stack is as fo=
llows:
  #0  0x00007f191456dc37 in raise () from /lib/x86_64-linux-gnu/libc.so.6
  #1  0x00007f1914571028 in abort () from /lib/x86_64-linux-gnu/libc.so.6
  #2  0x00007f1914566bf6 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
  #3  0x00007f1914566ca2 in __assert_fail () from /lib/x86_64-linux-gnu/lib=
c.so.6
  #4  0x0000564154ad9147 in pcibus_reset (qbus=3D0x564156760d10) at ../hw/p=
ci/pci.c:311
  #5  0x0000564154a07cdb in qbus_reset_one (bus=3D0x564156760d10, opaque=3D=
0x0) at hw/core/qdev.c:319
  #6  0x0000564154a0d721 in qbus_walk_children (bus=3D0x564156760d10, pre_d=
evfn=3D0, pre_busfn=3D0, =

      post_devfn=3D0x564154a07c26 <qdev_reset_one>, post_busfn=3D0x564154a0=
7c6c <qbus_reset_one>, opaque=3D0x0)
      at hw/core/bus.c:68
  #7  0x0000564154a08b4d in qdev_walk_children (dev=3D0x56415675f2b0, pre_d=
evfn=3D0, pre_busfn=3D0, =

      post_devfn=3D0x564154a07c26 <qdev_reset_one>, post_busfn=3D0x564154a0=
7c6c <qbus_reset_one>, opaque=3D0x0)
      at hw/core/qdev.c:617
  #8  0x0000564154a0d6e5 in qbus_walk_children (bus=3D0x564156594d30, pre_d=
evfn=3D0, pre_busfn=3D0, =

      post_devfn=3D0x564154a07c26 <qdev_reset_one>, post_busfn=3D0x564154a0=
7c6c <qbus_reset_one>, opaque=3D0x0)
      at hw/core/bus.c:59
  #9  0x0000564154a07df5 in qbus_reset_all (bus=3D0x564156594d30) at hw/cor=
e/qdev.c:336
  #10 0x0000564154a07e3a in qbus_reset_all_fn (opaque=3D0x564156594d30) at =
hw/core/qdev.c:342
  #11 0x0000564154a0e222 in qemu_devices_reset () at hw/core/reset.c:69
  #12 0x00005641548b3b47 in pc_machine_reset () at /vms/git/qemu/hw/i386/pc=
.c:2234
  #13 0x0000564154972ca7 in qemu_system_reset (report=3Dfalse) at vl.c:1697
  #14 0x0000564154b9d007 in colo_process_incoming_thread (opaque=3D0x564155=
3c1280) at migration/colo.c:617
  #15 0x00007f1914907184 in start_thread () from /lib/x86_64-linux-gnu/libp=
thread.so.0
  #16 0x00007f1914634bed in clone () from /lib/x86_64-linux-gnu/libc.so.6

  (gdb) frame 4
  #4  0x0000564154ad9147 in pcibus_reset (qbus=3D0x564156760d10) at ../hw/p=
ci/pci.c:311
  warning: Source file is more recent than executable.
  311             assert(bus->irq_count[i] =3D=3D 0);
  (gdb) ^CQuit
  (gdb) p bus->irq_count[i]
  $1 =3D -1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1702621/+subscriptions

