Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A515617150F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:34:33 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7GUy-0008CI-OM
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7GRO-0004po-KC
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:30:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7GRN-0003H5-0s
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:30:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:37132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7GRM-0003D8-Rc
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:30:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7GRK-0005E1-4s
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 10:30:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1CC792E80AD
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 10:30:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Feb 2020 10:20:58 -0000
From: Valentin David <1864984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: valentin.david
X-Launchpad-Bug-Reporter: Valentin David (valentin.david)
X-Launchpad-Bug-Modifier: Valentin David (valentin.david)
Message-Id: <158279885836.19592.16795975857735049927.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1864984] [NEW] "nr_entries is too big" when using virgl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7d571a56d783bc360fdc364a2c8a1bd872267f6e
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
Reply-To: Bug 1864984 <1864984@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I have a bootable image where GNOME Shell fails because it hits a limit
in virtio-gpu.

In `hw/display/virtio-gpu.c`, there is a limit for `nr_entries` at
16384. There is no explanation for that limit. But there does not seem
to be any limit on the kernel side.

Raising this limit with a patch to 262144 solves the issue.

Could there be an explanation why this limit is needed? And why this
value? Or could this limit be just removed?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864984

Title:
  "nr_entries is too big" when using virgl

Status in QEMU:
  New

Bug description:
  I have a bootable image where GNOME Shell fails because it hits a
  limit in virtio-gpu.

  In `hw/display/virtio-gpu.c`, there is a limit for `nr_entries` at
  16384. There is no explanation for that limit. But there does not seem
  to be any limit on the kernel side.

  Raising this limit with a patch to 262144 solves the issue.

  Could there be an explanation why this limit is needed? And why this
  value? Or could this limit be just removed?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864984/+subscriptions

