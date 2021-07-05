Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA93BB653
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:27:38 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GCm-0006Rz-2E
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBT-0003hs-PG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:48954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBP-0002qi-CU
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBL-0004Rz-9R
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2D152E82A4
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1861884@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mvgijssel th-huth
X-Launchpad-Bug-Reporter: Maarten (mvgijssel)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158083099190.20144.2427615447806299744.malonedeb@wampee.canonical.com>
Message-Id: <162545864465.12677.1368813344442742932.malone@loganberry.canonical.com>
Subject: [Bug 1861884] Re: qemu socket multicast not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 944b38eb8510e34467cd0b5707ffc9538015527f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1861884 <1861884@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861884

Title:
  qemu socket multicast not working

Status in QEMU:
  Expired

Bug description:
  Running two qemu vms on the same socket multicast address:

  =C2=A0=C2=A0qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio
  =C2=A0=C2=A0=C2=A0=C2=A0-display none -vga none
  =C2=A0=C2=A0=C2=A0=C2=A0-nodefaults -accel hax
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet0
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dmynet0
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev socket,id=3Dvlan,mcast=3D239.192.0.1:1235
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dvlan
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-pci
  =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dworker.qcow2,if=3Dvirtio
  =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dcloud-init.iso,format=3Draw,if=3Dvi=
rtio

  The two machines have a static ip on the socket network interface,
  192.168.100.11 and 192.168.100.12, but are unable to reach each other.

  Result when using ping command

    PING 192.168.100.11 (192.168.100.11) 56(84) bytes of data.
    From 192.168.100.12 icmp_seq=3D1 Destination Host Unreachable
    From 192.168.100.12 icmp_seq=3D2 Destination Host Unreachable
    From 192.168.100.12 icmp_seq=3D3 Destination Host Unreachable

  Is there additional configuration necessary on macos? Does this only
  work on Linux? Is there additional configuration required inside of
  the guest OS?

  guest OS: Debian 10 (Buster)
  host OS: macOS 10.15.2
  qemu: 4.2.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861884/+subscriptions

