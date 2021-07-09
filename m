Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA58F3C1E50
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:31:04 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iAJ-0008Cg-VH
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5I-0005Mh-AZ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:60156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5E-00019C-TD
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5A-0005Dz-7V
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E1A1A2E8180
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1902451@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cpuid i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor qubasa th-huth
X-Launchpad-Bug-Reporter: Luis (qubasa)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160426338728.14730.2439588061093712843.malonedeb@wampee.canonical.com>
Message-Id: <162580424857.19936.9019857460584145966.malone@loganberry.canonical.com>
Subject: [Bug 1902451] Re: incorrect cpuid feature detection
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 310b5ff221baae2c978b4db6e80ef620c1975ab4
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
Reply-To: Bug 1902451 <1902451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902451

Title:
  incorrect cpuid feature detection

Status in QEMU:
  Expired

Bug description:
  Hello,

  I am currently developing a x64 kernel and I wanted to check through
  cpuid if some features are available in the guest. When I try to
  enable cpu features like vmcb_clean or constant_tsc qemu is saying
  that my host doesn't support the requested features. However cat
  /proc/cpuinfo tells a different story:

  model name:  AMD Ryzen 5 3500U
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdt=
scp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf =
pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave a=
vx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalign=
sse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext=
 perfctr_llc mwaitx cpb hw_pstate sme pti ssbd sev ibpb vmmcall fsgsbase bm=
i1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1=
 xsaves clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale=
 vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave=
_vmload vgif overflow_recov succor smca

  I also checked it myself by running cpuid and check the bits as in the
  AMD Manual. Everything checks out but qemu still fails.

  QEMU version: QEMU emulator version 4.2.0

  $ qemu-system-x86_64 -cpu host,+vmcb_clean,enforce -enable-kvm -drive for=
mat=3Draw,file=3Dtarget/x86_64-os/debug/bootimage-my_kernel.bin -serial std=
io -display none
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUI=
D.8000000AH:EDX.vmcb-clean [bit 5]
  qemu-system-x86_64: Host doesn't support requested features

  or

  $ qemu-system-x86_64 -cpu host,+constant_tsc,enforce -enable-kvm -drive f=
ormat=3Draw,file=3Dtarget/x86_64-os/debug/bootimage-my_kernel.bin -serial s=
tdio -display none
  qemu-system-x86_64: Property '.constant_tsc' not found

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902451/+subscriptions

