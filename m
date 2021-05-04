Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7F3730C8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:27:48 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0hv-0005Uk-Qt
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0fx-00045y-C0
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:25:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:42190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0fs-000516-FC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:25:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1le0fq-00030x-MS
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 19:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A73EB2E8081
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 19:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 19:20:16 -0000
From: Thomas Huth <1658141@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aldelaro5 fgouget janitor th-huth
X-Launchpad-Bug-Reporter: Francois Gouget (fgouget)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170120163946.25029.76236.malonedeb@wampee.canonical.com>
Message-Id: <162015601630.4065.15791859529886338989.malone@gac.canonical.com>
Subject: [Bug 1658141] Re: QEMU's default msrs handling causes Windows 10 64
 bit to crash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 077185b22bbd4bf5f81cbdd8b82c2bf9377002f5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1658141 <1658141@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/131


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #131
   https://gitlab.com/qemu-project/qemu/-/issues/131

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1658141

Title:
  QEMU's default msrs handling causes Windows 10 64 bit to crash

Status in QEMU:
  Expired

Bug description:
  Wine uses QEMU to run its conformance test suite on Windows virtual
  machines. Wine's conformance tests check the behavior of various
  Windows APIs and verify that they behave as expected.

  One such test checks handling of exceptions down. When run on Windows 10 =
64 bit in QEMU it triggers a "KMOD_EXCEPTION_NOT_HANDLED" BSOD in the VM. S=
ee:
  https://bugs.winehq.org/show_bug.cgi?id=3D40240

  =

  To reproduce this bug:
  * Pick a Windows 10 64 bit VM on an Intel host.

  * Start the VM. I'm pretty sure any qemu command will do but here's what =
I used:
    qemu-system-x86_64 -machine pc-i440fx-2.1,accel=3Dkvm -cpu core2duo,+nx=
 -m 2048 -hda /var/lib/libvirt/images/wtbw1064.qcow2

  * Grab the attached source code. The tar file is a bit big at 85KB
  because I had to include some Wine headers. However the source file
  proper, exception.c, is only 85 lines, including the LGPL header.

  * Compile the source code with MinGW by typing 'make'. This produces a
  32 bit exception.exe executable. I'll attach it for good measure.

  * Put exception.exe on the VM and run it.

  =

  After investigation it turns out this happens:
   * Only for Windows 10 64 bit guests. Windows 10 32 bit and older Windows=
 versions are unaffected.

   * Only on Intel hosts. At least both my Xeon E3-1226 v3 and i7-4790K
  hosts are impacted but not my Opteron 6128 one.

   * It does not seem to depend on the emulated CPU type: on the Intel host=
s this happened with both =

  core2duo,nx and 'copy the host configuration' and did not depend on the n=
umber of emulated cpus/cores.

   * This happened with both QEMU 2.1 and 2.7, and both the 3.16.0 and
  4.8.11 Linux kernels, both on Debian 8.6 and Debian Testing.

  =

  After searching for quite some time I discovered that the kvm kernel modu=
le was sneaking the following messages into /var/log/syslog precisely when =
the BSOD happens:

  Dec 16 13:43:48 vm3 kernel: [  191.624802] kvm [2064]: vcpu0, guest rIP: =
0xfffff803cb3c0bf3 kvm_set_msr_common: MSR_IA32_DEBUGCTLMSR 0x1, nop
  Dec 16 13:43:48 vm3 kernel: [  191.624835] kvm [2064]: vcpu0, guest rIP: =
0xfffff803cb3c0c5c unhandled rdmsr: 0x1c9

  A search on the Internet turned up a post suggesting to change kvm's
  ignore_msrs setting:

     echo 1 >/sys/module/kvm/parameters/ignore_msrs

  https://www.reddit.com/r/VFIO/comments/42dj7n/some_games_crash_to_biosboo=
t_on_launch/

  This does actually work and provides a workaround at least.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1658141/+subscriptions

