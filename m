Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A730130E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 05:27:44 +0100 (CET)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3AWV-0003yZ-Ig
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 23:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3AUt-000392-Gr
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:26:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3AUr-0000Ar-Av
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:26:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3AUn-0007hz-Uy
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 04:25:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5414A2E8152
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 Jan 2021 04:18:32 -0000
From: Launchpad Bug Tracker <1745895@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mchapman th-huth
X-Launchpad-Bug-Reporter: Michael Chapman (mchapman)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151719171489.17422.7852330772200128264.malonedeb@chaenomeles.canonical.com>
Message-Id: <161137551221.11899.9943121412213043132.malone@loganberry.canonical.com>
Subject: [Bug 1745895] Re: Unable to migrate vhost-net to virtio-1.0-capable
 kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 875b9b793249d46fb264131660c524b7bc0170eb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1745895 <1745895@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1745895

Title:
  Unable to migrate vhost-net to virtio-1.0-capable kernel

Status in QEMU:
  Expired

Bug description:
  I am running QEMU 2.11 (from upstream source, not Red Hat package) on
  stock RHEL 6 and RHEL 7 kernels. Only the RHEL 7 kernel supports
  VIRTIO_F_VERSION_1 in its vhost-net driver.

  When migrating a guest using vhost-net from the RHEL 6 host to RHEL 7,
  the PCI config is rejected by QEMU on the target machine.

  A simple test case:

  1. On the RHEL 7 host, prepare for an incoming migration:

    rhel7# qemu-system-x86_64 -S -accel kvm -nographic -monitor stdio
  -nodefaults -netdev tap,id=3Dnet0,vhost=3Don,script=3Dno,downscript=3Dno
  -device virtio-net-pci,netdev=3Dnet0,mac=3D54:52:00:ff:ff:ff -incoming
  tcp:0.0.0.0:12345

  2. On the RHEL 6 host, start a guest and migrate it to the RHEL 7
  host:

    rhel6# qemu-system-x86_64 -S -accel kvm -nographic -monitor stdio -node=
faults -netdev tap,id=3Dnet0,vhost=3Don,script=3Dno,downscript=3Dno -device=
 virtio-net-pci,netdev=3Dnet0,mac=3D54:52:00:ff:ff:ff
  QEMU 2.11.0 monitor - type 'help' for more information
    (qemu) migrate tcp:rhel7:12345

  The RHEL 7 QEMU errors out:

    qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x20 re=
ad: 0 device: c cmask: ff wmask: 0 w1cmask:0
    qemu-system-x86_64: Failed to load PCIDevice:config
    qemu-system-x86_64: Failed to load virtio-net:virtio
    qemu-system-x86_64: error while loading state for instance 0x0 of devic=
e '0000:00:02.0/virtio-net'
    qemu-system-x86_64: load of migration failed: Invalid argument

  If I start the source QEMU with vhost=3Doff, or the target QEMU with
  disable-modern=3Dtrue, the migration is successful.

  My hunch here is that the target QEMU prepares the PCI device to
  support VIRTIO_F_VERSION_1, as that's available in the kernel there,
  but then fails to (or does not know to) disable this during the
  migration.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1745895/+subscriptions

