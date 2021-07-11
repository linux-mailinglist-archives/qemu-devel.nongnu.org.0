Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E43C3A61
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 06:29:41 +0200 (CEST)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2R65-0008OX-0u
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 00:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R38-0000hE-2q
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R36-0000cO-ER
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2R32-00064x-3B
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A47AB2E82AE
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1870331@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor r-volkmer th-huth
X-Launchpad-Bug-Reporter: Ruben (r-volkmer)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158582730148.12209.12098183760358013098.malonedeb@chaenomeles.canonical.com>
Message-Id: <162597703993.19787.18037094377031166439.malone@loganberry.canonical.com>
Subject: [Bug 1870331] Re: default nic device created even though supplied by
 configfile
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 5a33dd1f7186ce62292f43d034a9c77205e99bb7
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
Reply-To: Bug 1870331 <1870331@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870331

Title:
  default nic device created even though supplied by configfile

Status in QEMU:
  Expired

Bug description:
  QEMU emulator version 4.1.94

  Documentation states that qemu will create a default nic as long as
  not explicitly forbidden (-nic none) or defined ( e.g. -nic
  <options>).

  Observation:
  Even though qemu-system-ppc is started with "-readconfig" (which defines =
a nic), another nic gets created. When additionally suppling "-nic none", o=
nly the nic of the config file is created.
  As matter of fact, if all items that are defined in config file are suppl=
ied as command line arguments, no further nic is created. =


  Expectation:
  When a nic is defined in config file, the default guest-nic should not ge=
t created.
  That would match behavior when all items, defined in config file are supp=
lied as command line arguments.

  =

  Attached config file.

  (qemu) info pci
   Bus 0, device 0, function 0:
   Host bridge: PCI device 1057:0002
   PCI subsystem 1af4:1100
   id ""
   Bus 0, device 1, function 0:
   VGA controller: PCI device 1234:1111
   PCI subsystem 1af4:1100
   BAR0: 32 bit prefetchable memory at 0x80000000 [0x80ffffff].
   BAR2: 32 bit memory at 0x81000000 [0x81000fff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].
   id ""
   Bus 0, device 2, function 0:
   Ethernet controller: PCI device 10ec:8029
   PCI subsystem 1af4:1100
   IRQ 23.
   BAR0: I/O at 0x1000 [0x10ff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0007fffe].
   id ""
   Bus 0, device 3, function 0:
   Ethernet controller: PCI device 10ec:8029
   PCI subsystem 1af4:1100
   IRQ 24.
   BAR0: I/O at 0x1100 [0x11ff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0007fffe].
   id ""

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870331/+subscriptions

