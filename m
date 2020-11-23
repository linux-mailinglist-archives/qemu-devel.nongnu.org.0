Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9C2C0239
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:24:34 +0100 (CET)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh85J-0004p5-Ot
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh81u-00036R-J3
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:21:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh81r-0008PV-HR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:21:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kh81o-0005Hs-G6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 09:20:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D73E2E813F
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 09:20:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 09:08:29 -0000
From: Thomas Huth <1745895@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mchapman th-huth
X-Launchpad-Bug-Reporter: Michael Chapman (mchapman)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151719171489.17422.7852330772200128264.malonedeb@chaenomeles.canonical.com>
Message-Id: <160612250987.22402.742461516472751673.malone@gac.canonical.com>
Subject: [Bug 1745895] Re: Unable to migrate vhost-net to virtio-1.0-capable
 kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 4b4569139c979c1b6ac6747c4d1c4cc2374bc0bc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1745895 <1745895@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1745895

Title:
  Unable to migrate vhost-net to virtio-1.0-capable kernel

Status in QEMU:
  Incomplete

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

