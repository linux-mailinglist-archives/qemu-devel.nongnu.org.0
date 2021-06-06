Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224539D089
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 20:56:53 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpxx6-00045l-3U
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 14:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lpxw3-0003JX-7k
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:55:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lpxvx-0001px-T4
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:55:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lpxvu-0007CM-Sk
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 18:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D6CF22E8135
 for <qemu-devel@nongnu.org>; Sun,  6 Jun 2021 18:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Jun 2021 18:46:24 -0000
From: cyrozap <1920013@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyrozap laurent-vivier th-huth
X-Launchpad-Bug-Reporter: cyrozap (cyrozap)
X-Launchpad-Bug-Modifier: cyrozap (cyrozap)
References: <161607017744.16047.7761702341537087563.malonedeb@gac.canonical.com>
Message-Id: <162300518453.14291.1168449455334561957.malone@gac.canonical.com>
Subject: [Bug 1920013] Re: Unable to pass-through PCIe devices from a ppc64le
 host to an x86_64 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 5f3eb6a563c56c7549b45b4dc0fc459fa2e7a566
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1920013 <1920013@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've moved this bug over to GitLab here: https://gitlab.com/qemu-
project/qemu/-/issues/391

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #391
   https://gitlab.com/qemu-project/qemu/-/issues/391

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920013

Title:
  Unable to pass-through PCIe devices from a ppc64le host to an x86_64
  guest

Status in QEMU:
  Incomplete

Bug description:
  Attempting to pass through a PCIe device from a ppc64le host to an
  x86_64 guest with QEMU v5.2.0-3031-g571d413b5d (built from git master)
  fails with the following error:

      include/exec/memory.h:43:IOMMU_MEMORY_REGION: Object 0x10438eb00
  is not an instance of type qemu:iommu-memory-region

  To reproduce this issue, simply run the following command on a POWER9
  system:

      qemu-system-x86_64 -machine q35 -device vfio-pci,host=3D$DBSF

  Where $DBSF is a domain:bus:slot.function PCIe device address.

  This also fails with QEMU 3.1.0 (from Debian Buster), so I assume this
  has never worked. Helpfully, the error message it prints seems to
  indicate where the problem is:

      hw/vfio/spapr.c:147:vfio_spapr_create_window: Object 0x164473510
  is not an instance of type qemu:iommu-memory-region

  My kernel (Linux v5.8.0 plus some small unrelated patches) is built
  with the page size set to 4k, so this issue shouldn't be due to a page
  size mismatch. And as I stated earlier, my host arch is ppc64le, so it
  shouldn't be an endianness issue, either.

  I assume this should be possible (in theory) since I've seen reports
  of others getting PCIe passthrough working with aarch64 guests on
  x86_64 hosts, but of course that (passthrough to weird guest arch on
  x86) is somewhat the opposite of what I'm trying to do (passthrough to
  x86 on weird host arch) so I don't know for sure. If it is possible,
  I'm willing to develop a fix myself, but I'm almost completely
  unfamiliar with QEMU's internals so if anyone has any advice on where
  to start I'd greatly appreciate it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920013/+subscriptions

