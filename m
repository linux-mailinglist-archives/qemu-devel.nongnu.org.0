Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FC435C67
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:51:13 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSr2-0001c8-N2
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdSm7-0002Wi-SF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:08 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:48020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdSlz-000271-Cr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:07 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 10E6540465
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1634802350;
 bh=Z/xlIY2g9cMRQhS/peQNY/sKphS9Y/X389QC7eThnfM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Gd8o82b3NGPkUUx+TzPTHNCWvxcXRSHCwrnL2ftlWrdDP1l7SPPzGB4VwaHPtMOHv
 oIfaZ4GMhiiKYzRdzuz+vGVJKborXfbfQ67RRzUNM0gAhJyHPK6+JqTm6YNxoVrxvG
 oWp4rJMMAXzho6ENeeI901vUPz+RoumrpNS9j8IeZBcPx4F52Q1843+9rASPp08PdW
 jF8ETYfLM0QLr1tBY5ivt9pRyoGI39Ck8/cyMy2ouwR+VOll+e97HaHd179pMhBAnM
 FnsLf2g9nyjAfS+pljctQMMuoO7F5qz+SAvDsYHsDFvhm1DD58SEYO0zZGda1zT48f
 b1GP+UrbrrhWg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 850A82E819D
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:45:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2020 15:30:25 -0000
From: raistlin <1769053@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: raistlin (raistlin-redhat-bugs)
References: <152541524728.557.4600864098110042577.malonedeb@gac.canonical.com>
Message-Id: <163480218309.25993.17258849993308709105.launchpad@loganberry.canonical.com>
Subject: [Bug 1769053] 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: 825c338835df5a13ea2e52dfcb0bd615d11e4075
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

Hello.

Recently I had to deal with a VM with ~2.7 TB of RAM. The [open]SUSE
QEMU package carries a patch for bumping the default maximum virtual
address bits to 42 (from 40). Now, the last entry of the VM's e820 was
this one:

    BIOS-e820: [mem 0x0000000100000000-0x000002b57fffffff] usable

Which, if I have computed correctly, is representable on 42 bits, so
things should be fine. However, during boot, the VM shows this:

    L1TF: System has more than MAX_PA/2 memory. L1TF mitigation not
effective

And if I look in /sys/devices/system/cpu/vulnerabilities/l1tf, I see
this:

    l1tf: Vulnerable

This is because, while the RAM fits in MAX_PA=3D42, as soon as we take 1
bit off for PTE inversion, it does not fit any longer (in MAX_PA/2).

I understand that this is not critical per-se, but I think it's rather
annoying for a user to see messages like the ones above, especially
considering they're about vulnerabilities and security. And it's not
necessarily easy for everyone to realize that L1TF is reported as
vulnerable because QEMU is making the VM think that physical addresses
are on 42 (or 40) bits.

So, I also think we need to be able to tweak this part of the VM
configuration more easily, from libvirt. It's doable either by using
specially modified CPU-models, or doing things like this, which are
rather inconvenient:

    <qemu:commandline>
      <qemu:arg value=3D'-cpu'/>
      <qemu:arg value=3D'host,host-phys-bits=3Don'/>
    </qemu:commandline>

I also believe that host-phys-bits=3Don should be QEMU's default when the
user chooses host as CPU model, but that's for another bugzilla. :-)

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


