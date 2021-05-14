Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED185381046
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:06:16 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd8Z-0002Ea-Vq
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3c-0005v7-S7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:35320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3Q-0004sP-To
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhd3N-0005Ad-Je
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3757D2E8187
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 18:52:19 -0000
From: Thomas Huth <1920013@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161607017744.16047.7761702341537087563.malonedeb@gac.canonical.com>
Message-Id: <162101833911.20766.8002031582617324548.malone@soybean.canonical.com>
Subject: [Bug 1920013] Re: Unable to pass-through PCIe devices from a ppc64le
 host to an x86_64 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 11b1b6be5da5228c907be38ad61f81ddd1215402
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1920013 <1920013@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

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

