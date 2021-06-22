Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282923AFC44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:55:07 +0200 (CEST)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYRG-0000qm-5a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY07-0008Qz-Jg
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:58182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY00-0005Ut-LA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzo-00016M-3T
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3F1D2E819D
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:49 -0000
From: Launchpad Bug Tracker <1691379@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips64el netbsd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth uanand009-gmail
X-Launchpad-Bug-Reporter: Utkarsh Anand (uanand009-gmail)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <149500755798.25192.15465936284699398425.malonedeb@gac.canonical.com>
Message-Id: <162433546923.20423.5287033583841260057.malone@loganberry.canonical.com>
Subject: [Bug 1691379] Re: NetBSD evbmips64el port installation doesn't work
 with qemu-system-mips64el.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 6522e7f042ebbad583601abe1e66848f969cb1bc
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
Reply-To: Bug 1691379 <1691379@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1691379

Title:
  NetBSD evbmips64el port installation doesn't work with qemu-system-
  mips64el.

Status in QEMU:
  Expired

Bug description:
  I successfully installed the NetBSD evbmips64el port on gxemul but was
  unable to install it on qemu. Trying to boot it on qemu takes me to
  the 'db>' prompt. Here's the output and backtrace:

  panic: pcib_isa_intr_string: bogus isa irq 0x0
  kernel: breakpoint trap
  Stopped in pid 0.1 (system) at  netbsd:cpu_Debugger+0x4:        jr      ra
                  bdslot: nop
  db> bt
  0xffffffff805977f0: cpu_Debugger+4 (63061,90000000180003f8,6,ffffffff804c=
2290) ra ffffffff8030acd0 sz 0
  0xffffffff805977f0: vpanic+158 (63061,90000000180003f8,6,ffffffff804c2290=
) ra ffffffff8030ad7c sz 64
  0xffffffff80597830: panic+34 (63061,ffffffff803d65b0,0,40) ra ffffffff801=
09784 sz 96
  0xffffffff80597890: pcib_isa_intr_string+6c (63061,ffffffff803d65b0,0,40)=
 ra ffffffff80149bfc sz 16
  0xffffffff805978a0: uhci_pci_attach+16c (63061,ffffffff803d65b0,0,40) ra =
ffffffff802f0400 sz 176
  0xffffffff80597950: config_attach_loc+1c8 (63061,ffffffff803d65b0,0,40) r=
a ffffffff802f053c sz 64
  0xffffffff80597990: config_found_sm_loc+5c (63061,ffffffff803d65b0,0,40) =
ra ffffffff80121354 sz 64
  0xffffffff805979d0: pci_probe_device+524 (63061,ffffffff803d65b0,0,0) ra =
ffffffff80121548 sz 288
  0xffffffff80597af0: pci_enumerate_bus+1d0 (63061,ffffffff803d65b0,0,0) ra=
 ffffffff8012167c sz 160
  0xffffffff80597b90: pcirescan+5c (63061,ffffffff803d65b0,0,0) ra ffffffff=
801218c4 sz 32
  0xffffffff80597bb0: pciattach+19c (63061,ffffffff803d65b0,0,0) ra fffffff=
f802f0400 sz 80
  0xffffffff80597c00: config_attach_loc+1c8 (63061,ffffffff803d65b0,0,0) ra=
 ffffffff802f053c sz 64
  0xffffffff80597c40: config_found_sm_loc+5c (63061,ffffffff803d65b0,0,0) r=
a ffffffff80108934 sz 64
  0xffffffff80597c80: gt_attach+7c (63061,ffffffff803d65b0,0,0) ra ffffffff=
802f0400 sz 112   =

  0xffffffff80597cf0: config_attach_loc+1c8 (63061,ffffffff803d65b0,0,0) ra=
 ffffffff802f053c sz 64
  0xffffffff80597d30: config_found_sm_loc+5c (63061,ffffffff803d65b0,0,0) r=
a ffffffff801086ac sz 64
  0xffffffff80597d70: mainbus_attach+dc (63061,ffffffff803d65b0,0,0) ra fff=
fffff802f0400 sz 96
  0xffffffff80597dd0: config_attach_loc+1c8 (63061,ffffffff803d65b0,0,0) ra=
 ffffffff80104bf8 sz 64
  0xffffffff80597e10: cpu_configure+28 (63061,ffffffff803d65b0,0,0) ra ffff=
ffff803d5f30 sz 16
  0xffffffff80597e20: main+3a0 (63061,ffffffff803d65b0,0,0) ra ffffffff8010=
00dc sz 128       =

  0xffffffff80597ea0: kernel_text+dc (63061,ffffffff803d65b0,0,0) ra 0 sz 0
  User-level: pid 0.1

  Here's the command that I used:

  Build evbmips64el from source and then launch it from qemu (replace
  the paths relative to your system):

  qemu-system-mips64el -cdrom
  /extra/evbmips64/distrib/evbmips/cdroms/installcd/NetBSD-7.99.71
  -evbmips-mips64el.iso -hda /extra/evbmips64.img -kernel
  /extra/evbmips64/releasedir/evbmips/installation/netbsd-
  INSTALL_MALTA64 -nographic -M malta

  (I've decompressed the kernel)

  Here's the output for qemu-system-mips64el --version :

  QEMU emulator version 2.7.1(qemu-2.7.1-6.fc25), Copyright (c)
  2003-2016 Fabrice Bellard and the QEMU Project developers

  This doesn't look like a NetBSD bug. I've attached a screenshot of the
  working installation using gxemul in the attachments.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1691379/+subscriptions

