Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0847E79
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 11:32:19 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcnzu-0003Rx-0m
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 05:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56565)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hcnyR-0002pp-Gs
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 05:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hcnyQ-0004Vm-Ch
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 05:30:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hcnyQ-0004Uf-5w
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 05:30:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hcnyN-0004o3-AD
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 47FCA2E807B
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2019 09:21:54 -0000
From: Stefan <1833048@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefan-proxmox
X-Launchpad-Bug-Reporter: Stefan (stefan-proxmox)
X-Launchpad-Bug-Modifier: Stefan (stefan-proxmox)
Message-Id: <156076331418.27432.10852069688574998095.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 777df570cc3787404f2c45ceedfb9b9e5518f706
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1833048] [NEW] Guest Agent get-fsinfo doesn't
 show ZFS volumes
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

Public bug reported:

Calling get-fsinfo on a virtual machine does not include ZFS
(zfsonlinux, debian guest tested) volumes. Calling on a system with a
single ZFS disk (ZFS as root fs) simply returns '[]', if other disks
exist on the guest it only shows these.

Expected behaviour: Show file system details like with other fs formats.

Tried with debian stretch default qemu-guest-agent package and v4.0.0 from =
git, compiled locally - result is the same.
Host is using QEMU 3.0.1, but that shouldn't matter, right?

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

- Calling get-fsinfo on a virtual machine does not include ZFS volumes.
- Calling on a system with a single ZFS disk (ZFS as root fs) simply
- returns '[]', if other disks exist on the guest it only shows these.
+ Calling get-fsinfo on a virtual machine does not include ZFS
+ (zfsonlinux, debian guest tested) volumes. Calling on a system with a
+ single ZFS disk (ZFS as root fs) simply returns '[]', if other disks
+ exist on the guest it only shows these.
  =

  Expected behaviour: Show file system details like with other fs formats.
  =

  Tried with debian stretch default qemu-guest-agent package and v4.0.0 fro=
m git, compiled locally - result is the same.
  Host is using QEMU 3.0.1, but that shouldn't matter, right?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833048

Title:
  Guest Agent get-fsinfo doesn't show ZFS volumes

Status in QEMU:
  New

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

