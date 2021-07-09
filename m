Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C213C1E70
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:32:22 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iBZ-00038Y-FQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5X-0005yr-08
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:60634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5V-0001DD-9M
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5G-0005EO-8X
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BEE152E8198
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1900919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bwidawsk janitor th-huth
X-Launchpad-Bug-Reporter: bwidawsk (bwidawsk)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160331877993.30496.14778848047318719784.malonedeb@chaenomeles.canonical.com>
Message-Id: <162580424582.19936.3904166426976106968.malone@loganberry.canonical.com>
Subject: [Bug 1900919] Re: PXB selected as root bus incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 76ee438e56cde813a87f90d0f2d5079cd3fbd9ea
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1900919 <1900919@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900919

Title:
  PXB selected as root bus incorrectly

Status in QEMU:
  Expired

Bug description:
  release: 4c41341af76cfc85b5a6c0f87de4838672ab9f89

  qdev_device_add() will search for the "closest" bus possible, and bail ou=
t early if that bus is a root bus. pxb devices are considered root buses an=
d so if you either
  1. Add a PCI device on the QEMU command line *after* a pxb device, or
  2. Add an integrated PCI device (like a watchdog)

  #1: -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 -device ahci,id=
=3Dsata0,addr=3D0x8
  #2: -watchdog i6300esb -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D=
52

  The PXB will get selected as the bus (instead of the real root bus)
  and this will cause an assertion failure with the message like "qemu-
  system-x86_64: -device ahci,id=3Dsata0,addr=3D0x8: PCI: Only PCI/PCIe
  bridges can be plugged into pxb-pcie"

  I think this is relatively solvable in the code base by determining if
  a bus is an expander, and skipping it if so. However, I wonder if it
  makes more sense to just allow expanders to have endpoint devices.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900919/+subscriptions

