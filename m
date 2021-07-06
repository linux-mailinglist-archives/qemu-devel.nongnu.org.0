Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140923BC59C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:37:55 +0200 (CEST)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cqI-0004aj-1P
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfS-00005z-4e
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:51662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfO-0003Em-FI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfA-0004xQ-GH
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 26DC52E837E
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:49 -0000
From: Launchpad Bug Tracker <1881506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: harlydavidsen janitor th-huth
X-Launchpad-Bug-Reporter: Ethin Probst (harlydavidsen)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159095209581.29684.17955799234221982572.malonedeb@chaenomeles.canonical.com>
Message-Id: <162554506914.7821.56683318579857401.malone@loganberry.canonical.com>
Subject: [Bug 1881506] Re: TCG doesn't support a lot of features that should
 be supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 01dfdc30ce14ec06a31a275492d7d0915cf041f8
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
Reply-To: Bug 1881506 <1881506@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881506

Title:
  TCG doesn't support a lot of features that should be supported

Status in QEMU:
  Expired

Bug description:
  This is quite odd, and I'm not sure about how to get around it. I'm writi=
ng an OS in Rust and require APIC support. When I boot my kernel with qemu-=
system-x86_64, however, it dumps out a [lot] of warnings; it claims that TC=
G doesn't support FMA, X2APIC, AVX, F16C, AVX2, RDSEED, SHA-NI, FXSR-OPT, m=
isalignsse, 3dnowprefetch, osvw, topoext, perfctr-core, clzero, xsaveerptr,=
 ibpb, nrip-save, xsavec, and xsaves, but prints these warnings over 80 tim=
es before finally doing what I told it to do. Running QEMU 5.0.0 (unknown c=
ommit hash), as follows:
  qemu-system-x86_64 -drive format=3Draw,file=3Dtarget\x86_64-kernel-none\d=
ebug\bootimage-kernel.bin -serial stdio -no-reboot -hdb disk.img -s -m 4G -=
usb -rtc base=3Dutc,clock=3Dhost -cpu EPYC-v3,+acpi,+apic,+rdrand,+rdseed,+=
sse,+sse2,+sse4.1,+sse4.2,+sse4a,+ssse3,+syscall,+x2apic -smp cpus=3D8 -sou=
ndhw all
  I would run using HAXM, but my kernel requires RDRAND, and QEMU does not,=
 to my knowledge, automatically support RDRAND (and I don't know how to ena=
ble it).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881506/+subscriptions

