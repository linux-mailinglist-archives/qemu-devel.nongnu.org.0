Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB9E14BD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:51:32 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNCMd-0007nc-JT
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNCIB-00064B-6d
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNCI9-0003yl-SX
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:46:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:53654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNCI5-0003yW-Tg
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:46:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNCI2-0008Rf-Tt
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:46:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DBDC42E8076
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:46:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 08:27:25 -0000
From: Thomas Huth <1575561@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth ztehypervisor
X-Launchpad-Bug-Reporter: Michael liu (ztehypervisor)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160427094249.5722.69432.malonedeb@chaenomeles.canonical.com>
Message-Id: <157181924522.22028.5342739091194654339.malone@wampee.canonical.com>
Subject: =?utf-8?q?=5BBug_1575561=5D_Re=3A_config_qemu_virtio=5Fqueue=5Fsiz?=
 =?utf-8?q?e_to_1024=EF=BC=8Ccreate_vm_boot_from_network_failed?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a03e24cd058dbf1d229cf45e78d10fd3930df3f8
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

Which version of QEMU were you using here? Can you still reproduce this
issue with the latest version of QEMU? If so, please also provide the
full command line parameters that you used to start QEMU.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1575561

Title:
  config qemu virtio_queue_size to 1024=EF=BC=8Ccreate vm boot from network
  failed

Status in QEMU:
  Incomplete

Bug description:
  config qemu virtio_queue_size to 1024=EF=BC=8Ccreate vm boot from network=
 failed=E3=80=82
  in the vm vncviewer=EF=BC=8Csee the error log=EF=BC=9A
  =E2=80=9CERROR queue size 1024 > 256
  could  not open net0: no such file or directory"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1575561/+subscriptions

