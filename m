Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CE37771E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:07:24 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfl1f-0004mF-32
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkzz-0003Cr-6h
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:05:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkzx-0000hD-As
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:05:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkzv-0008Ep-ER
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61C2B2E813A
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:56:09 -0000
From: Thomas Huth <1902451@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cpuid i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qubasa th-huth
X-Launchpad-Bug-Reporter: Luis (qubasa)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160426338728.14730.2439588061093712843.malonedeb@wampee.canonical.com>
Message-Id: <162057216916.16126.5333833489938775787.malone@soybean.canonical.com>
Subject: [Bug 1902451] Re: incorrect cpuid feature detection
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: a8805928d4eff84657762c09ee5325824a405aa5
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
Reply-To: Bug 1902451 <1902451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: i386

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902451

Title:
  incorrect cpuid feature detection

Status in QEMU:
  Incomplete

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

