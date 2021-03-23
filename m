Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D48345C9D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:17:40 +0100 (CET)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOf2Z-0005aq-Fd
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOf0v-0004If-9u
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:15:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOf0k-0007qo-EE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:15:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOf0g-0005um-5Z
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E61D2E816A
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Mar 2021 11:04:42 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1920784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=ubuntu-power-systems; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=glibc; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apport-bug glibc hirsute ppc64el qemu uec-images
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor paelzer sadoonalbader
X-Launchpad-Bug-Reporter: sadoon albader (sadoonalbader)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <161642496871.32717.8520198452991245606.malonedeb@soybean.canonical.com>
Message-Id: <161649748240.28473.7410771144002205570.malone@gac.canonical.com>
Subject: [Bug 1920784] Re: qemu-system-ppc64le fails with kvm acceleration
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 7262af4031b5fde55e97ae55612c381d943ba7b1
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
Reply-To: Bug 1920784 <1920784@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sadoon,
thanks for the report!
There isn't much to find about this issue yet.
One automatic syscaller crash report [1].
On the emulation side there is [2][3].

On the glibc side we have [4][5] adding the use of it with [6] being a fix.
All those seem to be in glibc 2.33 - so I'd expect with [6] it should only
be issued on power9 which in turn should HW-support the instruction.

I was trying to recreate this on power8 and power9 machines.
As expected on power8 just nothing happens (the instruction isn't used due =
to [6]).
TBH I first wondered if these Sforza chips [7][8][9] you mentioned are
fully identical to a classic IBM p9 box - but I was indeed able to reproduce
the issue just fine on an IBM-sold P9
dmesg:
[ 1516.438442] Facility 'SCV' unavailable (12), exception at 0x76c9f84c49a0=
, MSR=3D900000000280f033
[ 1516.438472] qemu-system-ppc[42884]: illegal instruction (4) at 76c9f84c4=
9a0 nip 76c9f84c49a0 lr 1f12839d9f0 code 1 in libc-2.33.so[76c9f8380000+220=
000]
[ 1516.438489] qemu-system-ppc[42884]: code: e8010010 7c0803a6 4e800020 604=
20000 7ca42b78 4bffed65 60000000 38210020 =

[ 1516.438493] qemu-system-ppc[42884]: code: e8010010 7c0803a6 4e800020 604=
20000 <44000001> 4bffffb8 60000000 60420000

The chip I used for this test is:
Model:                           2.2 (pvr 004e 1202)
Model name:                      POWER9, altivec supported

The syscall this crashes in belongs to the ioctl
(gdb) bt
#0  __GI___ioctl (fd=3D<optimized out>, request=3D536915584) at ../sysdeps/=
unix/sysv/linux/powerpc/ioctl.c:56
#1  0x00000cb63ef7d9f0 in kvm_vcpu_ioctl (cpu=3Dcpu@entry=3D0x7d0f48010010,=
 type=3Dtype@entry=3D536915584) at ../../accel/kvm/kvm-all.c:2654
#2  0x00000cb63ef7dbdc in kvm_cpu_exec (cpu=3D0x7d0f48010010) at ../../acce=
l/kvm/kvm-all.c:2491
#3  0x00000cb63ee78344 in kvm_vcpu_thread_fn (arg=3D0x7d0f48010010) at ../.=
./accel/kvm/kvm-cpus.c:49
#4  0x00000cb63f1d14bc in qemu_thread_start (args=3D<optimized out>) at ../=
../util/qemu-thread-posix.c:521
#5  0x00007d0f4ac69114 in start_thread (arg=3D0x7d0f23dfe720) at pthread_cr=
eate.c:473
#6  0x00007d0f4ab755c0 in clone () at ../sysdeps/unix/sysv/linux/powerpc/po=
werpc64/clone.S:103

And jumping into the code of the  __GI___ioctl we can clearly see
the scv instruction is indeed there in the executed code path:

   0x7ffff66c4984 <__GI___ioctl+292>       bl      0x7ffff66c36e8 <__GI___t=
cgetattr+8>
   0x7ffff66c4988 <__GI___ioctl+296>       nop
   0x7ffff66c498c <__GI___ioctl+300>       addi    r1,r1,32
   0x7ffff66c4990 <__GI___ioctl+304>       ld      r0,16(r1)
   0x7ffff66c4994 <__GI___ioctl+308>       mtlr    r0
   0x7ffff66c4998 <__GI___ioctl+312>       blr
   0x7ffff66c499c <__GI___ioctl+316>       ori     r2,r2,0
  >0x7ffff66c49a0 <__GI___ioctl+320>       scv     0


[1]: https://webcache.googleusercontent.com/search?q=3Dcache:uS0jhPekyqMJ:h=
ttps://syzkaller-ppc64.appspot.com/text%3Ftag%3DCrashReport%26x%3D17d998830=
00000+&cd=3D2&hl=3Dde&ct=3Dclnk&gl=3Duk
[2]: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D3c89b8d6ac5b8728cd76=
20f9885bd953edd18a11
[3]: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05425.html
[4]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D68ab82f56690a=
da86ac1e0c46bad06ba189a10ef
[5]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D41f013cef2488=
4604c303435dd1915be2ea5c0e0
[6]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D527c89cd32f85=
22859f58343be3d3dc8f754b783
[7]: https://wiki.raptorcs.com/wiki/Sforza
[8]: https://wiki.raptorcs.com/wiki/Talos_II
[9]: https://wiki.raptorcs.com/wiki/POWER9
[10]: https://lwn.net/Articles/822867/

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920784

Title:
  qemu-system-ppc64le fails with kvm acceleration

Status in QEMU:
  New
Status in The Ubuntu-power-systems project:
  New
Status in glibc package in Ubuntu:
  New
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  (Suspected glibc issue!)

  qemu-system-ppc64(le) fails when invoked with kvm acceleration with
  error "illegal instruction"

  > qemu-system-ppc64(le) -M pseries,accel=3Dkvm

  Illegal instruction (core dumped)

  In dmesg:

  Facility 'SCV' unavailable (12), exception at 0x7624f8134c0c,
  MSR=3D900000000280f033

  =

  Version-Release number of selected component (if applicable):
  qemu 5.2.0 =

  Linux kernel 5.11
  glibc 2.33
  all latest updates as of submitting the bug report

  How reproducible:
  Always

  Steps to Reproduce:
  1. Run qemu with kvm acceleration

  Actual results:
  Illegal instruction

  Expected results:
  Normal VM execution

  Additional info:
  The machine is a Raptor Talos II Lite with a Sforza V1 8-core, but was al=
so observed on a Raptor Blackbird with the same processor.

  This was also observed on Fedora 34 beta, which uses glibc 2.33
  Also tested on ArchPOWER (unofficial port of Arch Linux for ppc64le) with=
 glibc 2.33
  Fedora 33 and Ubuntu 20.10, both using glibc 2.32 do not have this issue,=
 and downgrading the Linux kernel from 5.11 to 5.4 LTS on ArchPOWER solved =
the problem. Kernel 5.9 and 5.10 have the same issue when combined with gli=
bc2.33

  ProblemType: Bug
  DistroRelease: Ubuntu 21.04
  Package: qemu-system 1:5.2+dfsg-6ubuntu2
  ProcVersionSignature: Ubuntu 5.11.0-11.12-generic 5.11.0
  Uname: Linux 5.11.0-11-generic ppc64le
  .sys.firmware.opal.msglog: Error: [Errno 13] Permission denied: '/sys/fir=
mware/opal/msglog'
  ApportVersion: 2.20.11-0ubuntu60
  Architecture: ppc64el
  CasperMD5CheckResult: pass
  CurrentDesktop: Unity:Unity7:ubuntu
  Date: Mon Mar 22 14:48:39 2021
  InstallationDate: Installed on 2021-03-22 (0 days ago)
  InstallationMedia: Ubuntu-Server 21.04 "Hirsute Hippo" - Alpha ppc64el (2=
0210321)
  KvmCmdLine: COMMAND         STAT  EUID  RUID     PID    PPID %CPU COMMAND
  ProcKernelCmdLine: root=3DUUID=3Df3d03315-0944-4a02-9c87-09c00eba9fa1 ro
  ProcLoadAvg: 1.20 0.73 0.46 1/1054 6071
  ProcSwaps:
   Filename				Type		Size		Used		Priority
   /swap.img                               file		8388544		0		-2
  ProcVersion: Linux version 5.11.0-11-generic (buildd@bos02-ppc64el-002) (=
gcc (Ubuntu 10.2.1-20ubuntu1) 10.2.1 20210220, GNU ld (GNU Binutils for Ubu=
ntu) 2.36.1) #12-Ubuntu SMP Mon Mar 1 19:26:20 UTC 2021
  SourcePackage: qemu
  UpgradeStatus: No upgrade log present (probably fresh install)
  VarLogDump_list: total 0
  acpidump:
   =

  cpu_cores: Number of cores present =3D 8
  cpu_coreson: Number of cores online =3D 8
  cpu_smt: SMT=3D4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920784/+subscriptions

