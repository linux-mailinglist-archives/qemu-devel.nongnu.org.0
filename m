Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3536F7AD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:18:28 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPI3-0000yl-UF
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBj-0004RN-7p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:11:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBb-0003ng-UH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:11:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPBZ-00024s-TH
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC48E2E815C
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:02:10 -0000
From: Thomas Huth <1912846@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: iommu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eperezma th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Eugenio_P=C3=A9rez_=28eperezma=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161134565058.20216.456048884922676547.malonedeb@wampee.canonical.com>
Message-Id: <161977333033.4255.3694041294416100830.malone@chaenomeles.canonical.com>
Subject: [Bug 1912846] Re: Assertion hit on hot-unplugging virtio iommu
 enabled device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 4e4225207991e4c8e2f0002ab2a9a4e679c8d260
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1912846 <1912846@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://gitlab.com/qemu-project/qemu/-/commit/f6ab64c05f8a6229bf6

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912846

Title:
  Assertion hit on hot-unplugging virtio iommu enabled device

Status in QEMU:
  Fix Released

Bug description:
  From commit ("2d24a646 device-core: use RCU for
  list of children of a bus") an assertion is hit when
  removing a iommu aware virtio device, since as->listeners
  are not properly removed. To reproduce:

  /home/qemu/build/x86_64-softmmu/qemu-system-x86_64 -qmp tcp:0:4444,server=
,nowait ... \
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=
=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet=
0,mac=3D52:54:00:14:18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3D=
on

  In QMP:
  {'execute': 'qmp_capabilities'}
  {"execute": "device_del", "arguments": {"id": "net0"} }

  And crash:
  ../softmmu/memory.c:2818: do_address_space_destroy: Assertion `QTAILQ_EMP=
TY(&as->listeners)' failed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912846/+subscriptions

