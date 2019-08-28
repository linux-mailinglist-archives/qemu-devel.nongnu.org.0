Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A9435C63
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:49:10 +0200 (CEST)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSp3-0006Gy-P7
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdSm6-0002WC-Vt
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:08 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:47902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdSlz-00025W-Dg
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:06 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id BEFB13F656
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1634802347;
 bh=O55kF+q08O30jPvZ384XxrTFETFn5vFtVgBVbEy2Vrc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=hwn7+AbBd5wFVhq1qxRseiMDv1hIX2BaPGlZWm+LE5z3BxUplVxGdLwbXukHGFb63
 rUBRA/CA9h5VbN6Qkq5PV0ATdcRYtAk9lyAWdJtan7keVlvoKbeBT0tJZno6ICW+28
 hp+MShUjzuyFDuWBVYRr8DYVsQgXJlQHG/yMf8vwl0mrk6u8QqTkFdbdrhfNymJUM3
 +4U4B1qu4khu1maaTOPBh6WgkkNnP/RbEOxoQwY5rEpO2dYFPXIe8vvNT42dZQYbTz
 YlE/Z+lYCQ5OSs64kiPkXe/BEQx4yNeBfYQvqsVTTAS3JRRu6TjjsP8hyzww7+Jjzn
 COGDj36ayYJSQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E22582E8196
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:45:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Aug 2019 14:16:31 -0000
From: ehabkost <1769053@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=libvirt; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=libvirt; component=main;
 status=Triaged; importance=High; assignee=None; 
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
X-Launchpad-Bug-Modifier: ehabkost (ehabkost-redhat-bugs)
References: <152541524728.557.4600864098110042577.malonedeb@gac.canonical.com>
Message-Id: <163480218302.25993.8312046571390461613.launchpad@loganberry.canonical.com>
Subject: [Bug 1769053] 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: 0201198ba981f656d7fd64a9cbacc9a3edb2beed
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1769053 <1769053@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(In reply to sirswa@gmail.com from comment #1)
> Hi
>=20
> We are hitting this bug. We have specialist hardwares including hi-memory
> hypervisors to run HPC workload on virtualised environment. This bug is
> affecting us at the machines which has more than 1TB of memory.

This bz# is not a bug, but a feature planned to make live migration
ability more flexible.  The option might be useful to work around bugs
or other limitations, though.

If you are seeing a bug related to large guests or large hosts, please
send more details so we can investigate it.

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
  Triaged
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


