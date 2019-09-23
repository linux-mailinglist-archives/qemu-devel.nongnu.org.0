Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F228BB645
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:12:41 +0200 (CEST)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCP4y-000416-7E
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCP3b-00035v-84
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCP3a-0004iw-7T
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:11:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:50806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCP3a-0004ii-1Z
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:11:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCP3Z-0007l3-23
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:11:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A2C62E8048
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:11:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Sep 2019 13:58:21 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: farosas pmaydell ss22ever
X-Launchpad-Bug-Reporter: Suramya (ss22ever)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20170410105209.1613.42620.malonedeb@chaenomeles.canonical.com>
Message-Id: <156924710120.13328.11164947391355009890.malone@gac.canonical.com>
Subject: [Bug 1681404] Re: hw/ppc: Aborted (core dumped)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 30771c09b54ae08f170c1186573d6e94e74ec710
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
Reply-To: Bug 1681404 <1681404@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted in the previous comment, this bug was fixed in the 2.11
release.


** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681404

Title:
  hw/ppc: Aborted (core dumped)

Status in QEMU:
  Fix Released

Bug description:
  Reproducable:
  $ ./ppc64-softmmu/qemu-system-ppc64 -S -machine ppce500,accel=3Dtcg -devi=
ce spapr-pci-host-bridge

  =

  qemu/hw/ppc/spapr_pci.c:1567:spapr_phb_realize: Object 0x55bda99744a0 is =
not an instance of type spapr-machine
  Aborted (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681404/+subscriptions

