Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E70160315
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 10:07:17 +0100 (CET)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3FtT-000552-Pz
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 04:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3Fsl-0004ev-3S
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:06:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3Fsj-0001Yp-Uy
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:06:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:55102)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3Fsj-0001YR-PZ
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 04:06:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3Fsi-0007jJ-3w
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 09:06:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0D0E82E8047
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 09:06:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Feb 2020 08:59:46 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ak42 rth
X-Launchpad-Bug-Reporter: Ayman Khamouma (ak42)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <158180717472.31124.817430819772209101.malonedeb@wampee.canonical.com>
Message-Id: <158184358716.29007.10452428836124437456.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1863445] Re: assertion failed at translate-all.c:2523 with
 version 3.1.1 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e41859250c0cdb40fbbe73cd2ae2168708ba7407
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
Reply-To: Bug 1863445 <1863445@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863445

Title:
  assertion failed at translate-all.c:2523 with version 3.1.1

Status in QEMU:
  Fix Released

Bug description:
  I was trying to debug a userspace binary with radare2 and met the
  following assertion in qemu:

  ```
  qemu-mipsel: /builddir/build/BUILD/qemu-3.1.1/accel/tcg/translate-all.c:2=
523: page_check_range: Assertion `start < ((target_ulong)1 << L1_MAP_ADDR_S=
PACE_BITS)' failed.
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x7fd1=
c11c5987
  ```

  ```
  # qemu-mipsel --version                                                  =
                                 =

  qemu-mipsel version 3.1.1 (qemu-3.1.1-2.fc30)
  Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers
  ```

  not much to add. seems like qemu is not properly checking for valid
  addresses

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863445/+subscriptions

