Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6665637508B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:08:12 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZ3L-0000Ln-76
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZ1F-0007S4-9z
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:06:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZ1B-0007ia-OP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:06:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZ19-0006dp-8p
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:05:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4068C2E805D
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 08:05:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:59:06 -0000
From: Thomas Huth <1871842@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: babumoger e-philipp ehabkost imammedo th-huth
X-Launchpad-Bug-Reporter: Philipp Eppelt (e-philipp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158643709116.17430.15995069125716778943.malonedeb@wampee.canonical.com>
Message-Id: <162028794655.6953.443854334828648768.malone@wampee.canonical.com>
Subject: [Bug 1871842] Re: AMD CPUID leaf 0x8000'0008 reported number of cores
 inconsistent with ACPI.MADT
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 2031c55453ae98e02b46a02bb06dbdb64be63b86
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
Reply-To: Bug 1871842 <1871842@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If I got that right, there were some patches proposed for this bug ...
has this been fixed already? Or is there still anything left to do?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871842

Title:
  AMD CPUID leaf 0x8000'0008 reported number of cores  inconsistent with
  ACPI.MADT

Status in QEMU:
  Incomplete

Bug description:
  Setup:
  CPU: AMD EPYC-v2 or host's EPYC cpu
  Linux 64-bit fedora host; Kernel version 5.5.15-200.fc31
  qemu version: self build
  git-head: f3bac27cc1e303e1860cc55b9b6889ba39dee587
  config: Configured with: '../configure' '--target-list=3Dx86_64-softmmu,m=
ips64el-softmmu,mips64-softmmu,mipsel-softmmu,mips-softmmu,i386-softmmu,aar=
ch64-softmmu,arm-softmmu' '--prefix=3D/opt/qemu-master'

  Cmdline: =

  qemu-system-x86_64 -kernel /home/peppelt/code/l4/internal/.build-x86_64/b=
in/amd64_gen/bootstrap -append "" -initrd "./fiasco/.build-x86_64/fiasco , =
... " -serial stdio -nographic -monitor none -nographic -monitor none -cpu =
EPYC-v2 -m 4G -smp 4 =


  Issue:
  We are developing an microkernel operating system called L4Re. We recentl=
y got an AMD EPYC server for testing and we couldn't execute SMP tests of o=
ur system when running Linux + qemu + VM w/ L4Re.
  In fact, the kernel did not recognize any APs at all. On AMD CPUs the ker=
nel checks for the number of cores reported in CPUID leaf 0x8000_0008.ECX[N=
C] or [ApicIdSize].  [0][1]

  The physical machine reports for leaf 0x8000_0008:  EAX: 0x3030 EBX: 0x18=
cf757 ECX: 0x703f EDX: 0x1000
  The lower four bits of ECX are the [NC] field and all set.

  When querying inside qemu with -enable-kvm -cpu host -smp 4 (basically as=
 replacement and addition to the above cmdline) the CPUID leaf shows: EAX: =
0x3024, EBX: 0x1001000, ECX: 0x0, EDX: 0x0
  Note, ECX is zero. Indicating that this is no SMP capabale CPU.

  I'm debugging it using my local machine and the QEMU provided EPYC-v2
  CPU model and it is reproducible there as well and reports:  EAX:
  0x3028, EBX: 0x0, ECX: 0x0, EDX: 0x0

  I checked other AMD based CPU models (phenom, opteron_g3/g5) and they beh=
ave the same. [2] shows the CPUID 0x8000'0008 handling in the QEMU source.
  I believe that behavior here is wrong as ECX[NC] should report the number=
 of cores per processor, as stated in the AMD manual [2] p.584. In my under=
standing -smp 4 should then lead to ECX[NC] =3D 0x3.

  The following table shows my findings with the -smp option:
  Option | Qemu guest observed ECX value
  -smp 4 | 0x0
  -smp 4,cores=3D4  | 0x3
  -smp 4,cores=3D2,thread=3D2 | 0x3
  -smp 4,cores=3D4,threads=3D2 | QEMU boot error: topology false.

  Now, I'm asking myself how the terminology of the AMD manual maps to QEMU=
's -smp option.
  Obviously, nr_cores and nr_threads correspond to the cores and threads op=
tions on the cmdline and cores * threads <=3D 4 (in this example), but what=
 corresponds the X in -smp X to?

  Querying 0x8000'0008 on the physical processor results in different
  reports than quering QEMU's model as does it with -enable-kvm -cpu
  host.

  Furthermore, the ACPI.MADT shows 4 local APICs to be present while the
  CPU leave reports a single core processor.

  This leads me to the conclusion that CPUID 0x8000'0008.ECX reports the
  wrong number.

  =

  Please let me know, if you need more information from my side.

  =

  [0] https://github.com/kernkonzept/fiasco/blob/522ccc5f29ab120213cf02d713=
28e2b879cbbd19/src/kern/ia32/kernel_thread-ia32.cpp#L109
  [1] https://github.com/kernkonzept/fiasco/blob/522ccc5f29ab120213cf02d713=
28e2b879cbbd19/src/kern/ia32/cpu-ia32.cpp#L1120
  [2] https://github.com/qemu/qemu/blob/f2a8261110c32c4dccd84e774d8dd7a0524=
e00fb/target/i386/cpu.c#L5835
  [3] https://www.amd.com/system/files/TechDocs/24594.pdf

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871842/+subscriptions

