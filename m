Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736433353C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 18:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXqBp-0008GO-NI
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 12:52:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXqAS-0007bk-Vp
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 12:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXqAR-0001So-4K
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 12:50:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:47952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hXqAP-0001GX-62
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 12:50:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hXqAK-0007DO-Cz
	for <qemu-devel@nongnu.org>; Mon, 03 Jun 2019 16:50:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 613832E80C7
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 16:50:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Jun 2019 16:41:55 -0000
From: "Laszlo Ersek \(Red Hat\)" <lersek@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
	assignee=lersek@redhat.com; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
Message-Id: <155958011528.16346.9132826883162987130.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e9c108307af2dd20098d23a75f5dccf08f1e42c3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831477] [NEW] update edk2 submodule & binaries
 to edk2-stable201905
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1831477 <1831477@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

The edk2 project will soon release edk2-stable201905. Update the edk2
submodule in QEMU, and the bundled edk2 binaries, accordingly.

https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Release-Planni=
ng#edk2-stable201905-tag-planning
https://github.com/tianocore/edk2/releases/tag/edk2-stable201905 [upcoming =
link]

** Affects: qemu
     Importance: Undecided
     Assignee: Laszlo Ersek (Red Hat) (lersek)
         Status: New


** Tags: feature-request

** Changed in: qemu
     Assignee: (unassigned) =3D> Laszlo Ersek (Red Hat) (lersek)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831477

Title:
  update edk2 submodule & binaries to edk2-stable201905

Status in QEMU:
  New

Bug description:
  The edk2 project will soon release edk2-stable201905. Update the edk2
  submodule in QEMU, and the bundled edk2 binaries, accordingly.

  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Release-Plan=
ning#edk2-stable201905-tag-planning
  https://github.com/tianocore/edk2/releases/tag/edk2-stable201905 [upcomin=
g link]

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831477/+subscriptions

