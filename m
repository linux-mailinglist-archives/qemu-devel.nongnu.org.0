Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F06347CD5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:43:43 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5fa-00030Q-83
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP5d2-0001ua-4L
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:41:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:50694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP5cz-00070H-N4
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:41:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lP5cw-00006g-UY
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:40:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E45C02E816A
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:40:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 15:32:46 -0000
From: Tim Gardner <1920784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntu-power-systems; status=In Progress;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=glibc; component=main;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=In Progress; importance=Undecided; assignee=frank.heimes@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=hirsute; sourcepackage=glibc;
 component=main; status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=hirsute; sourcepackage=linux;
 component=main; status=In Progress; importance=Undecided;
 assignee=frank.heimes@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=hirsute; sourcepackage=qemu;
 component=main; status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apport-bug glibc hirsute ppc64el qemu uec-images
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fheimes janitor laurent-vivier paelzer
 sadoonalbader ubuntu-kernel-bot
X-Launchpad-Bug-Reporter: sadoon albader (sadoonalbader)
X-Launchpad-Bug-Modifier: Tim Gardner (timg-tpi)
References: <161642496871.32717.8520198452991245606.malonedeb@soybean.canonical.com>
Message-Id: <161659996691.27375.70887616550935240.launchpad@gac.canonical.com>
Subject: [Bug 1920784] Re: qemu-system-ppc64le fails with kvm acceleration
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 7319a6917002800e5ca7b9ad5f5734839a0093cf
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

** Also affects: glibc (Ubuntu Hirsute)
   Importance: Undecided
       Status: Invalid

** Also affects: qemu (Ubuntu Hirsute)
   Importance: Undecided
       Status: Invalid

** Also affects: linux (Ubuntu Hirsute)
   Importance: Undecided
     Assignee: Frank Heimes (fheimes)
       Status: In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920784

Title:
  qemu-system-ppc64le fails with kvm acceleration

Status in QEMU:
  Invalid
Status in The Ubuntu-power-systems project:
  In Progress
Status in glibc package in Ubuntu:
  Invalid
Status in linux package in Ubuntu:
  In Progress
Status in qemu package in Ubuntu:
  Invalid
Status in glibc source package in Hirsute:
  Invalid
Status in linux source package in Hirsute:
  In Progress
Status in qemu source package in Hirsute:
  Invalid

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

