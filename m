Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E36E72B2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 07:51:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp0ii-0005Ff-2X; Wed, 19 Apr 2023 01:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pp0iZ-0005E9-O0
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 01:51:00 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pp0iT-0005En-Ha
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 01:50:56 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 8ABA141176
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 05:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1681883439;
 bh=EoysgeBbW/988lFQbylURrT3ztfDEeW9aeWk3BrW7qc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=qN7ST6S7NifRQbNj4z/hLZn4vo0b4+wtR9gEQ8Pu90ekwkAj8z1RQG/EcRQln6A1Q
 AXfu2YDrayskSGuAh6J3HZ/zmT5Oxbd6kqrvreHeHovIDRnjZJAE/eCRn0sB8UnURW
 xyB5wFpDvywnUyNziD37HM9Lkmn+q8VYBVo/s9fkxrBwz2l/K1OkX0pCz6tMW2/tCm
 YGcHhghX7OdmdM9G52C1I6h3T9XmHN4qnBYDF4kdTK93UU1s2ButG9SjI2AQu56QNs
 Q2EB4JjSugqPJd2JR32YtgTAhY2wT0RQKyjYHOpB+AEu1v06AxFhVb0xA9lW3Dv8n7
 oN+2OH5H/e2EQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id EA80B41C14
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 05:50:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Apr 2023 05:43:58 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1769053@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=libvirt; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=libvirt; component=main;
 status=Fix Released; importance=High; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug bionic
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange daxtens ddstreet dgilbert-h
 ehabkost-redhat-bugs kraxel-redhat paelzer paelzer-redhat-bugs
 raistlin-redhat-bugs sirswa-redhat-bugs
X-Launchpad-Bug-Reporter: Daniel Axtens (daxtens)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer=29?=
References: <152541524728.557.4600864098110042577.malonedeb@gac.canonical.com>
Message-Id: <168188303899.2938881.18058613319214082044.malone@juju-98d295-prod-launchpad-4>
Subject: [Bug 1769053] Re: Ability to control phys-bits through libvirt
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="473868c1cc6b58a9bc722c23840374c93a7a274b"; Instance="production"
X-Launchpad-Hash: 68b7457137ea4fd1a9ccc713b2a0c33f4f2810e4
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1769053 <1769053@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While the bugzilla case wasn't updated this landed in v8.7.0 via a series a=
round
https://gitlab.com/libvirt/libvirt/-/commit/e6c29f09e5b75d7a8d79ae670407060=
446282c78

v9.0.0 of libvirt is in Ubuntu Lunar, due to that - from now on - one
can control the physical bit settings in a defined way through libvirt.

See maxphysaddr in [1] for how to use that.

Mid term Ubuntu will consider no more adding further variants of the
workaround, that was providing machine types with the -hpb suffix to
allow larger guests.

[1]: https://libvirt.org/formatdomain.html#cpu-model-and-topology

** Changed in: libvirt (Ubuntu)
       Status: Triaged =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1769053

Title:
  Ability to control phys-bits through libvirt

Status in libvirt:
  Confirmed
Status in QEMU:
  Invalid
Status in libvirt package in Ubuntu:
  Fix Released
Status in qemu package in Ubuntu:
  Invalid

Bug description:
  Attempting to start a KVM guest with more than 1TB of RAM fails.

  It looks like we might need some extra patches:
  https://lists.gnu.org/archive/html/qemu-discuss/2017-12/msg00005.html

  ProblemType: Bug
  DistroRelease: Ubuntu 18.04
  Package: qemu-system-x86 1:2.11+dfsg-1ubuntu7
  ProcVersionSignature: Ubuntu 4.15.0-20.21-generic 4.15.17
  Uname: Linux 4.15.0-20-generic x86_64
  ApportVersion: 2.20.9-0ubuntu7
  Architecture: amd64
  CurrentDesktop: Unity:Unity7:ubuntu
  Date: Fri May  4 16:21:14 2018
  InstallationDate: Installed on 2017-04-05 (393 days ago)
  InstallationMedia: Ubuntu 16.10 "Yakkety Yak" - Release amd64 (20161012.2)
  MachineType: Dell Inc. XPS 13 9360
  ProcKernelCmdLine: BOOT_IMAGE=3D/vmlinuz-4.15.0-20-generic root=3D/dev/ma=
pper/ubuntu--vg-root ro quiet splash transparent_hugepage=3Dmadvise vt.hand=
off=3D1
  SourcePackage: qemu
  UpgradeStatus: Upgraded to bionic on 2018-04-30 (3 days ago)
  dmi.bios.date: 02/26/2018
  dmi.bios.vendor: Dell Inc.
  dmi.bios.version: 2.6.2
  dmi.board.name: 0PF86Y
  dmi.board.vendor: Dell Inc.
  dmi.board.version: A00
  dmi.chassis.type: 9
  dmi.chassis.vendor: Dell Inc.
  dmi.modalias: dmi:bvnDellInc.:bvr2.6.2:bd02/26/2018:svnDellInc.:pnXPS1393=
60:pvr:rvnDellInc.:rn0PF86Y:rvrA00:cvnDellInc.:ct9:cvr:
  dmi.product.family: XPS
  dmi.product.name: XPS 13 9360
  dmi.sys.vendor: Dell Inc.

To manage notifications about this bug go to:
https://bugs.launchpad.net/libvirt/+bug/1769053/+subscriptions


