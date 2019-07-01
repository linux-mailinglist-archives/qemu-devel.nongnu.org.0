Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25832150
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jun 2019 02:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXEcD-0006wu-PB
	for lists+qemu-devel@lfdr.de; Sat, 01 Jun 2019 20:44:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXEaj-0006Lj-QM
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 20:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXEOW-0003f2-JF
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 20:30:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:56176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hXEOW-0003e9-DB
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 20:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hXEOU-00033c-5Y
	for <qemu-devel@nongnu.org>; Sun, 02 Jun 2019 00:30:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 227BF2E8076
	for <qemu-devel@nongnu.org>; Sun,  2 Jun 2019 00:30:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Jun 2019 00:20:34 -0000
From: Olie Hilt <1831354@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ohilt
X-Launchpad-Bug-Reporter: Olie Hilt (ohilt)
X-Launchpad-Bug-Modifier: Olie Hilt (ohilt)
Message-Id: <155943483504.16885.17011343834954742829.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 48a75cb54b90a7b5a0225d445a817d209a021259
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831354] [NEW] unable to read symlinks when
 mounting 9p filesystem with security_model=mapped
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
Reply-To: Bug 1831354 <1831354@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I am trying to use clang that is mounted from a 9p filesystem that has the =
options =

 -fsdev local,id=3Dvirtfs3,path=3D/clang,security_model=3Dmapped-file -devi=
ce virtio-9p-pci,fsdev=3Dvirtfs3,mount_tag=3Dclang

clang has symlinks to clang-9. eg /clang/clang/bin/clang is a symlink
that points to clang-9 in the current directory.

the clang filesystem is on a bind mount point on /clang/clang on the
host and this is mapped to the same place on the guest. If I have the
same virtfs mount point with the security_model=3Dnone I don't have this
problem.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831354

Title:
  unable to read symlinks when mounting 9p filesystem with
  security_model=3Dmapped

Status in QEMU:
  New

Bug description:
  I am trying to use clang that is mounted from a 9p filesystem that has th=
e options =

   -fsdev local,id=3Dvirtfs3,path=3D/clang,security_model=3Dmapped-file -de=
vice virtio-9p-pci,fsdev=3Dvirtfs3,mount_tag=3Dclang

  clang has symlinks to clang-9. eg /clang/clang/bin/clang is a symlink
  that points to clang-9 in the current directory.

  the clang filesystem is on a bind mount point on /clang/clang on the
  host and this is mapped to the same place on the guest. If I have the
  same virtfs mount point with the security_model=3Dnone I don't have this
  problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831354/+subscriptions

