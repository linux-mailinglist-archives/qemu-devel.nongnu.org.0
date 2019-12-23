Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86F129151
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 05:32:24 +0100 (CET)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijFOI-000443-Pp
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 23:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ijFM0-0002MT-JI
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:30:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ijFLz-0000xR-Bv
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:30:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:45548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ijFLz-0000uq-5Y
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:29:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ijFLx-0006mC-FM
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 04:29:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 64C5A2E80D2
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 04:29:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Dec 2019 04:17:24 -0000
From: Launchpad Bug Tracker <1575561@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth ztehypervisor
X-Launchpad-Bug-Reporter: Michael liu (ztehypervisor)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160427094249.5722.69432.malonedeb@chaenomeles.canonical.com>
Message-Id: <157707464450.29966.5694911582942296640.malone@loganberry.canonical.com>
Subject: =?utf-8?q?=5BBug_1575561=5D_Re=3A_config_qemu_virtio=5Fqueue=5Fsiz?=
 =?utf-8?q?e_to_1024=EF=BC=8Ccreate_vm_boot_from_network_failed?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3a22766c07db32a1dac1554d2e03a4cd9fe73217
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1575561 <1575561@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1575561

Title:
  config qemu virtio_queue_size to 1024=EF=BC=8Ccreate vm boot from network
  failed

Status in QEMU:
  Expired

Bug description:
  config qemu virtio_queue_size to 1024=EF=BC=8Ccreate vm boot from network=
 failed=E3=80=82
  in the vm vncviewer=EF=BC=8Csee the error log=EF=BC=9A
  =E2=80=9CERROR queue size 1024 > 256
  could  not open net0: no such file or directory"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1575561/+subscriptions

