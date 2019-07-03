Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E645CF63
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 14:27:28 +0200 (CEST)
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiHsd-0005sf-KN
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 08:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hiHqs-0005I6-HT
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 08:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hiHqr-0001dr-3V
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 08:25:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:45134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hiHqq-0001bs-Re
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 08:25:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hiHqp-00071z-Be
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 12:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 555392E80C8
 for <qemu-devel@nongnu.org>; Tue,  2 Jul 2019 12:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jul 2019 12:17:04 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1834113@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=libvirt; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug disco
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bryce ikes73 paelzer
X-Launchpad-Bug-Reporter: Avi Eis (ikes73)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <156142437029.30985.13623507391124028236.malonedeb@soybean.canonical.com>
Message-Id: <156206982464.2402.17261779049213710222.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18991";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 76f77d318fcd2fcac8159fab5c3691c15438b783
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1834113] Re: QEMU touchpad input erratic after
 wakeup from sleep
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
Reply-To: Bug 1834113 <1834113@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Related changes are
    3   * SECURITY UPDATE: DoS via incorrect permissions check             =
            =

    4     - debian/patches/CVE-2019-3886-1.patch: disallow virDomainGetHost=
name        =

    5       for read-only connections in src/libvirt-domain.c.
    6     - debian/patches/CVE-2019-3886-2.patch: enforce ACL write permiss=
ion         =

    7       for getting guest time & hostname in src/remote/remote_protocol=
.x.         =

    8     - CVE-2019-3886                                                  =
            =

    9   * SECURITY UPDATE: privilege escalation via incorrect socket permis=
sions       =

   10     - debian/patches/CVE-2019-10132-1.patch: reject clients unless th=
eir         =

   11       UID matches the current UID in src/admin/admin_server_dispatch.=
c.          =

   12     - debian/patches/CVE-2019-10132-2.patch: restrict sockets to mode=
 0600       =

   13       in src/locking/virtlockd-admin.socket.in,                      =
            =

   14       src/locking/virtlockd.socket.in.                               =
            =

   15     - debian/patches/CVE-2019-10132-3.patch: restrict sockets to mode=
 0600       =

   16       in src/logging/virtlogd-admin.socket.in,                       =
            =

   17       src/logging/virtlogd.socket.in.                                =
            =

   18     - CVE-2019-10132  =


None of these is important for mouse integration :-/
So it might be a red herring.

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2019-10132

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2019-3886

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1834113

Title:
  QEMU touchpad input erratic after wakeup from sleep

Status in QEMU:
  New
Status in libvirt package in Ubuntu:
  New
Status in qemu package in Ubuntu:
  Incomplete

Bug description:
  Using Ubuntu host and guest. Normally the touchpad works great. Within
  the last few days, suddenly, apparently after a wake from sleep, the
  touchpad will behave erratically. For example, it will take two clicks
  to select something, and when moving the cursor it will act as though
  it is dragging even with the button not clicked.

  A reboot fixes the issue temporarily.

  ProblemType: Bug
  DistroRelease: Ubuntu 19.04
  Package: qemu 1:3.1+dfsg-2ubuntu3.1
  Uname: Linux 5.1.14-050114-generic x86_64
  ApportVersion: 2.20.10-0ubuntu27
  Architecture: amd64
  CurrentDesktop: ubuntu:GNOME
  Date: Mon Jun 24 20:55:44 2019
  Dependencies:
   =

  EcryptfsInUse: Yes
  InstallationDate: Installed on 2019-02-20 (124 days ago)
  InstallationMedia: Ubuntu 18.04 "Bionic" - Build amd64 LIVE Binary 201806=
08-09:38
  Lsusb:
   Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
   Bus 001 Device 002: ID 8087:0025 Intel Corp. =

   Bus 001 Device 003: ID 0c45:671d Microdia =

   Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
  MachineType: Dell Inc. Precision 5530
  ProcEnviron:
   TERM=3Dxterm-256color
   PATH=3D(custom, no user)
   XDG_RUNTIME_DIR=3D<set>
   LANG=3Den_US.UTF-8
   SHELL=3D/bin/bash
  ProcKernelCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-5.1.14-050114-generic root=
=3DUUID=3D18e8777c-1764-41e4-a19f-62476055de23 ro mem_sleep_default=3Ddeep =
mem_sleep_default=3Ddeep acpi_rev_override=3D1 scsi_mod.use_blk_mq=3D1 nouv=
eau.modeset=3D0 nouveau.runpm=3D0 nouveau.blacklist=3D1 acpi_backlight=3Dno=
ne acpi_osi=3DLinux acpi_osi=3D!
  SourcePackage: qemu
  UpgradeStatus: No upgrade log present (probably fresh install)
  dmi.bios.date: 04/26/2019
  dmi.bios.vendor: Dell Inc.
  dmi.bios.version: 1.10.1
  dmi.board.name: 0FP2W2
  dmi.board.vendor: Dell Inc.
  dmi.board.version: A00
  dmi.chassis.type: 10
  dmi.chassis.vendor: Dell Inc.
  dmi.modalias: dmi:bvnDellInc.:bvr1.10.1:bd04/26/2019:svnDellInc.:pnPrecis=
ion5530:pvr:rvnDellInc.:rn0FP2W2:rvrA00:cvnDellInc.:ct10:cvr:
  dmi.product.family: Precision
  dmi.product.name: Precision 5530
  dmi.product.sku: 087D
  dmi.sys.vendor: Dell Inc.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1834113/+subscriptions

