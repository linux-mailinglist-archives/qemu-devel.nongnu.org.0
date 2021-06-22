Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FA3AFC65
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:04:36 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYaR-0003XN-Cp
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4D-0002vH-DN
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:58722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4B-0000Rv-6b
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY49-0003kk-54
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F16402E805B
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:39 -0000
From: Launchpad Bug Tracker <1596832@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andree182 ecsdn janitor th-huth
X-Launchpad-Bug-Reporter: Andrej Krutak (andree182)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160628075027.23593.17849.malonedeb@gac.canonical.com>
Message-Id: <162433546014.20423.887240255658140427.malone@loganberry.canonical.com>
Subject: [Bug 1596832] Re: e500 -bios/-kernel broken with big images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 81e510b0642974d4daf6df2b626dea092fbde142
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
Reply-To: Bug 1596832 <1596832@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1596832

Title:
  e500 -bios/-kernel broken with big images

Status in QEMU:
  Expired

Bug description:
  This is tested using qemu 2.4.1, but it looks like the code
  qemu/hw/ppc/e500.c has not changed since. This looks like the source
  of the problem:
  http://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D3812c71ffaa2cf733c30=
87792b859fef30b7545f

  =

  What works:
  ----------

  Basic invocation qemu-system-ppc -machine ppce500  -monitor stdio
  -bios u-boot.e500 works, I get the uboot prompt and this:

  (qemu) info roms
  addr=3D0000000000f00000 size=3D0x044b8c mem=3Dram name=3D"phdr #0: .../qe=
mu/share/qemu/u-boot.e500"
  addr=3D0000000000f81000 size=3D0x006b00 mem=3Dram name=3D"phdr #1: .../qe=
mu/share/qemu/u-boot.e500"

  =

  Passing u-boot.e500 image as kernel (-bios u-boot.e500 -kernel u-boot.e50=
0) appears to work, $qemu_kernel_addr is filled in, though (as expected) ub=
oot complains about the image format.

  (qemu) info roms
  addr=3D0000000000f00000 size=3D0x044b8c mem=3Dram name=3D"phdr #0: .../qe=
mu/share/qemu/u-boot.e500"
  addr=3D0000000000f81000 size=3D0x006b00 mem=3Dram name=3D"phdr #1: .../qe=
mu/share/qemu/u-boot.e500"
  addr=3D0000000002000000 size=3D0x054e8c mem=3Dram name=3D".../qemu/share/=
qemu/u-boot.e500


  What doesn't work:
  -----------------

  However, once I try to load a big image (>=3D32 MiB), uboot doesn't even
  show anything:

  qemu-system-ppc -machine ppce500  -monitor stdio -bios u-boot.e500
  -kernel boot/vmlinux -m 1024

  (qemu) info roms
  addr=3D0000000000f00000 size=3D0x044b8c mem=3Dram name=3D"phdr #0: .../qe=
mu/share/qemu/u-boot.e500"
  addr=3D0000000000f81000 size=3D0x006b00 mem=3Dram name=3D"phdr #1: .../qe=
mu/share/qemu/u-boot.e500"
  addr=3D0000000002000000 size=3D0x27aeedc mem=3Dram name=3D"boot/vmlinux"

  ...
  (gdb) bt
  #0  0x00f2efcc in ?? ()
  #1  0x00f31554 in ?? ()
  #2  0x00f03f4c in ?? ()
  #3  0x00f04458 in ?? ()
  #4  0x00f028dc in ?? ()
  #5  0x00f01080 in ?? ()


  The thing is, this used to work +- before the commit, where I'd just
  pass the image as -kernel option, and it booted.

  =

  If I do that now (w/o the -bios option, using the exact same image), the =
kernel gets loaded twice, only at different addresses (the cause is obvious=
 from the commit), causing overlap error:

  qemu-system-ppc -machine ppce500  -monitor stdio  -kernel boot/vmlinux -m=
 1024
  QEMU 2.4.1 monitor - type 'help' for more information
  (qemu) rom: requested regions overlap (rom boot/vmlinux. free=3D0x0000000=
0027492fc, addr=3D0x0000000002000000)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1596832/+subscriptions

