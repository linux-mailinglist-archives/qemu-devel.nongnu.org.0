Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2302C2D35
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:44:54 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbQz-0004gn-Ug
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbIJ-0003jL-Hq
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:35558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbID-0003QD-FB
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbIB-00077C-So
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C76F32E813C
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:20:33 -0000
From: Thomas Huth <1753186@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: t-schmittlauch+ubuntu th-huth xanclic
X-Launchpad-Bug-Reporter: schmittlauch (t-schmittlauch+ubuntu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152012131660.6957.17826936817192816521.malonedeb@gac.canonical.com>
Message-Id: <160623483341.9446.11650960071781957988.malone@gac.canonical.com>
Subject: [Bug 1753186] Re: qemu-nbd: always first snapshot loaded from VDI
 images with snapshots
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 0e0dd71fd674a4a6fcf2b0e0ceb5a17fc990a3c7
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
Reply-To: Bug 1753186 <1753186@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Closing this as WontFix since it works as expected, and keeping it open
as wishlist item does not make too much sense.

The QEMU project normally doesn't implement new features like these
external snapshots on demand; they're a lot of work to do. Instead we
simply code-review and incorporate such features as and when people
decide to write them and submit the patches. So there's not much point
in having a 'wishlist' bug in the bug tracker saying "support for
feature X would be nice", because it will likely never happen, unless by
the coincidence that somebody happened to implement and submit it to us
anyway. Sorry for the inconvenience and thanks for your understanding.


** Changed in: qemu
   Importance: Undecided =3D> Wishlist

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1753186

Title:
  qemu-nbd: always first snapshot loaded from VDI images with snapshots

Status in QEMU:
  Won't Fix

Bug description:
  When mounting a virtual box disk image of a VM with snapshots, always
  the state of the first snapshot is shown.

  How to reproduce:
  1. Create a new VirtualBox VM or use an existing one, while choosing VDI =
as the disk image format.
  2. Create a snapshot of the VM.
  3. Modify the file system from within the VM enough that differences to t=
he snapshotted version are apparent.
  4. Create another snapshot.
  5. Shut down the VM.
  6. Mount the partition from the disk image with `qemu-nbd -c /dev/nbd0 /p=
ath/to/disk.vdi; mount /dev/nbd0pX /mnt`

  Expected result: The mounted disk image shall represent the latest state =
of the VM
  Actual result: The mounted disk image represents the VM state at the firs=
t snapshot

  version information: qemu-nbd-2.11.1(openSUSE Tumbleweed)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1753186/+subscriptions

