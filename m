Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C52F432C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:33:14 +0100 (CET)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXqK-0002kz-Vt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXoA-0001Qk-PU
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo7-0001Xn-R5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo6-0006g9-8U
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 250262E8147
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1788275@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ehabkost janitor th-huth
X-Launchpad-Bug-Reporter: Eduardo Habkost (ehabkost)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153488040782.4713.14154400799820003858.malonedeb@chaenomeles.canonical.com>
Message-Id: <161051143758.21184.13453186617758418870.malone@loganberry.canonical.com>
Subject: [Bug 1788275] Re: -cpu ...,+topoext works only with EPYC CPU model
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 427bad4606e2a7f906868fc52354a8fdb3666584
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
Reply-To: Bug 1788275 <1788275@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1788275

Title:
  -cpu ...,+topoext works only with EPYC CPU model

Status in QEMU:
  Expired

Bug description:
  See bug report at:
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1615682

  Probably this is caused by the inconsistent legacy cache information
  on all CPU models except EPYC.

  ---------------------------------------------
  Description of problem:
  Guest should get 2 threads per core and all of them should be on-line whe=
n booting guest with old amd cpu model + smt

  Steps to Reproduce:
  1.Boot rhel7.6 guest with cli:
  /usr/libexec/qemu-kvm -name rhel7.6 -m 16G -machine pc,accel=3Dkvm \
          -S \
          -cpu Opteron_G3,+topoext,xlevel=3D0x8000001e,enforce \
          -smp 2,threads=3D2 \
          -monitor stdio \
          -qmp unix:/tmp/qmp2,server,nowait \
          -device VGA \
          -vnc :0 \
          -serial unix:/tmp/console2,server,nowait \
          -uuid 115e11b2-a869-41b5-91cd-6a32a907be7f \
          -drive file=3Drhel7.6-20180812.qcow2,if=3Dnone,id=3Ddrive-scsi-di=
sk0,format=3Dqcow2,cache=3Dnone,werror=3Dstop,rerror=3Dstop -device ide-hd,=
drive=3Ddrive-scsi-disk0,id=3Dscsi-disk0 \
          -netdev tap,id=3DidinWyYY,vhost=3Don -device virtio-net-pci,mac=
=3D2e:39:fa:ff:88:a1,id=3Didlbq7eA,netdev=3DidinWyYY \

  2.check cpu info inside guest
  3.

  Actual results:
  Guest gets one online cpu, one offline cpu and one thread per core:
  # lscpu
  lscpu
  Architecture:          x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Byte Order:            Little Endian
  CPU(s):                2
  On-line CPU(s) list:   0
  Off-line CPU(s) list:  1
  Thread(s) per core:    1
  Core(s) per socket:    1
  Socket(s):             1
  NUMA node(s):          1
  Vendor ID:             AuthenticAMD
  CPU family:            16
  Model:                 2
  Model name:            AMD Opteron 23xx (Gen 3 Class Opteron)
  Stepping:              3
  CPU MHz:               2096.060
  BogoMIPS:              4192.12
  Hypervisor vendor:     KVM
  Virtualization type:   full
  L1d cache:             64K
  L1i cache:             64K
  L2 cache:              512K
  L3 cache:              16384K
  NUMA node0 CPU(s):     0
  Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx lm art rep_go=
od nopl extd_apicid pni cx16 x2apic popcnt hypervisor lahf_lm cmp_legacy ab=
m sse4a misalignsse topoext retpoline_amd ibp_disable vmmcall

  =

  Expected results:
  Guest should get 2 threads per core and all of them should be on-line

  ---------------------------------------------

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1788275/+subscriptions

