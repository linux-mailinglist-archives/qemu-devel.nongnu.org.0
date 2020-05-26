Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507281AB08F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 20:23:05 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOmgi-0006Bb-46
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 14:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jOmet-0004zx-AJ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jOmem-00037K-3K
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:21:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:56092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jOmel-00036O-Sw
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:21:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jOmei-00046d-B8
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 18:21:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 232162E8109
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 18:21:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2020 18:08:15 -0000
From: Babu Moger <1871842@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: babumoger e-philipp imammedo
X-Launchpad-Bug-Reporter: Philipp Eppelt (e-philipp)
X-Launchpad-Bug-Modifier: Babu Moger (babumoger)
References: <158643709116.17430.15995069125716778943.malonedeb@wampee.canonical.com>
Message-Id: <884b4dcd-5ff2-2834-e73f-f88b868dca56@amd.com>
Subject: Re: [Bug 1871842] [NEW] AMD CPUID leaf 0x8000'0008 reported number of
 cores inconsistent with ACPI.MADT
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: edd018d12b4fc452a945a6043f095f57c1e3f29a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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

Thanks. I saw the update in the thread.
https://lore.kernel.org/qemu-devel/42f0624d-b0fb-5d96-2921-8994c28b9937@ker=
nkonzept.com/
Looks like you have found a way to take care of your problem.
But We need to fix the CPUID leaf 0x8000'0008 anyways.
Will send the patch to review later this week. Thanks


On 4/9/20 12:48 PM, Babu Moger wrote:
> =

> =

> On 4/9/20 9:00 AM, Igor Mammedov wrote:
>> On Thu, 09 Apr 2020 12:58:11 -0000
>> Philipp Eppelt <1871842@bugs.launchpad.net> wrote:
>>
>>> Public bug reported:
>>>
>>> Setup:
>>> CPU: AMD EPYC-v2 or host's EPYC cpu
>>> Linux 64-bit fedora host; Kernel version 5.5.15-200.fc31
>>> qemu version: self build
>>> git-head: f3bac27cc1e303e1860cc55b9b6889ba39dee587
>>> config: Configured with: '../configure' '--target-list=3Dx86_64-softmmu=
,mips64el-softmmu,mips64-softmmu,mipsel-softmmu,mips-softmmu,i386-softmmu,a=
arch64-softmmu,arm-softmmu' '--prefix=3D/opt/qemu-master'
>>>
>>> Cmdline: =

>>> qemu-system-x86_64 -kernel /home/peppelt/code/l4/internal/.build-x86_64=
/bin/amd64_gen/bootstrap -append "" -initrd "./fiasco/.build-x86_64/fiasco =
, ... " -serial stdio -nographic -monitor none -nographic -monitor none -cp=
u EPYC-v2 -m 4G -smp 4 =

>>>
>>> Issue:
>>> We are developing an microkernel operating system called L4Re. We recen=
tly got an AMD EPYC server for testing and we couldn't execute SMP tests of=
 our system when running Linux + qemu + VM w/ L4Re.
>>> In fact, the kernel did not recognize any APs at all. On AMD CPUs the k=
ernel checks for the number of cores reported in CPUID leaf 0x8000_0008.ECX=
[NC] or [ApicIdSize].  [0][1]
>>>
>>> The physical machine reports for leaf 0x8000_0008:  EAX: 0x3030 EBX: 0x=
18cf757 ECX: 0x703f EDX: 0x1000
>>> The lower four bits of ECX are the [NC] field and all set.
>>>
>>> When querying inside qemu with -enable-kvm -cpu host -smp 4 (basically =
as replacement and addition to the above cmdline) the CPUID leaf shows: EAX=
: 0x3024, EBX: 0x1001000, ECX: 0x0, EDX: 0x0
>>> Note, ECX is zero. Indicating that this is no SMP capabale CPU.
>>>
>>> I'm debugging it using my local machine and the QEMU provided EPYC-v2
>>> CPU model and it is reproducible there as well and reports:  EAX:
>>> 0x3028, EBX: 0x0, ECX: 0x0, EDX: 0x0
>>>
>>> I checked other AMD based CPU models (phenom, opteron_g3/g5) and they b=
ehave the same. [2] shows the CPUID 0x8000'0008 handling in the QEMU source.
>>> I believe that behavior here is wrong as ECX[NC] should report the numb=
er of cores per processor, as stated in the AMD manual [2] p.584. In my und=
erstanding -smp 4 should then lead to ECX[NC] =3D 0x3.
>>>
>>> The following table shows my findings with the -smp option:
>>> Option | Qemu guest observed ECX value
>>> -smp 4 | 0x0
>>> -smp 4,cores=3D4  | 0x3
>>> -smp 4,cores=3D2,thread=3D2 | 0x3
>>> -smp 4,cores=3D4,threads=3D2 | QEMU boot error: topology false.
>>>
>>> Now, I'm asking myself how the terminology of the AMD manual maps to QE=
MU's -smp option.
>>> Obviously, nr_cores and nr_threads correspond to the cores and threads =
options on the cmdline and cores * threads <=3D 4 (in this example), but wh=
at corresponds the X in -smp X to?
>> I'd say X corresponds to number of logical CPUs.
>> Depending on presence of other options these are distributed among them =
in magical manner
>> (see pc_smp_parse() for starters)
>>
>>> Querying 0x8000'0008 on the physical processor results in different
>>> reports than quering QEMU's model as does it with -enable-kvm -cpu host.
>>>
>>> Furthermore, the ACPI.MADT shows 4 local APICs to be present while the
>>> CPU leave reports a single core processor.
>> it matches -smp X as it should be.
>>
>>>
>>> This leads me to the conclusion that CPUID 0x8000'0008.ECX reports the
>>> wrong number.
>> CCed author of recent epyc patches who might know how AMD should work be=
tter than me.
> =

> Hmm.. Interesting.. Not sure why this did not come up during my testing.
> Probably this cpuid information is not widely used.
> =

> Yes. I am looking at it right now. I see that EPYC model is reporting
> wrong. Not sure why -cpu host is reporting wrong. I thought -cpu host gets
> the information directly from the host. Will investigate.
> =

>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871842

Title:
  AMD CPUID leaf 0x8000'0008 reported number of cores  inconsistent with
  ACPI.MADT

Status in QEMU:
  New

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

