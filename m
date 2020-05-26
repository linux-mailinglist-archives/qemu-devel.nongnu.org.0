Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5631B71AD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 12:12:51 +0200 (CEST)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRvKE-0000w5-Ge
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 06:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jRvIV-0007WN-Iy
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jRvIV-0002er-5W
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jRvIU-0002Y5-LS
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:11:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jRvIS-0001t4-KH
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 10:11:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 91EDE2E80E7
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 10:11:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2020 09:55:42 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1874676@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <158772214298.26171.14045550676291595233.malonedeb@soybean.canonical.com>
Subject: [Bug 1874676] [NEW] [Feature request] MDIO bus
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="486bbbd6cb608f8eb468ed0d08689a349dfabe49";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dadaed40bee9ae7aa3af9204e81c0df0eb5f941f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 06:00:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1874676 <1874676@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Various network devices open-code a MDIO bus with a dedicated PHY.
Introduce a new MDIO subsystem to
- reuse various duplicated components
- be able to interchange PHYs
- have common tracing
- use libqos to test all the PHYs from different NICs

** Affects: qemu
     Importance: Undecided
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd)
         Status: New

** Changed in: qemu
     Assignee: (unassigned) =3D> Philippe Mathieu-Daud=C3=A9 (philmd)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874676

Title:
  [Feature request] MDIO bus

Status in QEMU:
  New

Bug description:
  Various network devices open-code a MDIO bus with a dedicated PHY.
  Introduce a new MDIO subsystem to
  - reuse various duplicated components
  - be able to interchange PHYs
  - have common tracing
  - use libqos to test all the PHYs from different NICs

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874676/+subscriptions

