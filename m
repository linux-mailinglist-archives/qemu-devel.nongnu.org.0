Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F257B256B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 20:52:27 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8qgE-00071f-6N
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 14:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i8qeT-0006AC-7U
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 14:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i8qeS-0004h1-1u
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 14:50:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:56634)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i8qeR-0004gX-St
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 14:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i8qeQ-0000AZ-59
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 18:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0BBFD2E8080
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 18:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Sep 2019 18:42:59 -0000
From: Gregory O'Neill <1843941@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: rbd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gsoneill
X-Launchpad-Bug-Reporter: Gregory O'Neill (gsoneill)
X-Launchpad-Bug-Modifier: Gregory O'Neill (gsoneill)
Message-Id: <156840017982.27082.9691017826426087373.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4c1dc72a34e776cd17cf4a383d08c491fda77284
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1843941] [NEW] RBD Namespaces are not supported
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
Reply-To: Bug 1843941 <1843941@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Ceph Nautilus (v14.2.0) introduced the Namespaces concept for RADOS
Block Devices. This provides a logical separation within a RADOS Pool
for RBD images which enables granular access control. See
https://docs.ceph.com/docs/nautilus/releases/nautilus/ for additional
details.

librados and librbd support this, however qemu does not. The rbd man
page defines how rbd images within a namespace can be referenced.
https://docs.ceph.com/docs/nautilus/man/8/rbd/#image-snap-group-and-
journal-specs

Adding support for RBD namespaces would be beneficial for security and
reducing the impact of a hypervisor being compromised and putting an
entire Ceph pool or cluster at risk.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: rbd

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843941

Title:
  RBD Namespaces are not supported

Status in QEMU:
  New

Bug description:
  Ceph Nautilus (v14.2.0) introduced the Namespaces concept for RADOS
  Block Devices. This provides a logical separation within a RADOS Pool
  for RBD images which enables granular access control. See
  https://docs.ceph.com/docs/nautilus/releases/nautilus/ for additional
  details.

  librados and librbd support this, however qemu does not. The rbd man
  page defines how rbd images within a namespace can be referenced.
  https://docs.ceph.com/docs/nautilus/man/8/rbd/#image-snap-group-and-
  journal-specs

  Adding support for RBD namespaces would be beneficial for security and
  reducing the impact of a hypervisor being compromised and putting an
  entire Ceph pool or cluster at risk.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843941/+subscriptions

