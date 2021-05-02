Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74F370E6A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:20:03 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGhF-0003mI-D3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGd4-00034F-OC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:15:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGcy-0003yu-Kw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGcx-0008Ra-2l
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:15:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 11F372E8023
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:10:02 -0000
From: Thomas Huth <1842530@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chenpw2088 th-huth
X-Launchpad-Bug-Reporter: cpw (chenpw2088)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156756245552.28547.15554086877936320249.malonedeb@chaenomeles.canonical.com>
Message-Id: <161997900270.10956.10327773671976579881.malone@gac.canonical.com>
Subject: =?utf-8?q?=5BBug_1842530=5D_Re=3A_ich6_and_ich9_sound_card_has_noi?=
 =?utf-8?b?c3nvvIhtdXJtdXLvvIk=?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 2a3a96e56cee82644e646460240e867dc9445272
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
Reply-To: Bug 1842530 <1842530@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842530

Title:
  ich6 and ich9 sound card has noisy=EF=BC=88murmur=EF=BC=89

Status in QEMU:
  Incomplete

Bug description:
  [root@localhost1 qemu]# lscpu
  Architecture:          x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Byte Order:            Little Endian
  CPU(s):                6
  On-line CPU(s) list:   0-5
  Thread(s) per core:    1
  Core(s) per socket:    6
  Socket(s):             1
  NUMA node(s):          1
  Vendor ID:             GenuineIntel
  CPU family:            6
  Model:                 158
  Model name:            Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
  Stepping:              10
  CPU MHz:               899.951
  CPU max MHz:           4000.0000
  CPU min MHz:           800.0000
  BogoMIPS:              5616.00
  Virtualization:        VT-x
  L1d cache:             32K
  L1i cache:             32K
  L2 cache:              256K
  L3 cache:              9216K
  NUMA node0 CPU(s):     0-5
  Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe sysca=
ll nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nop=
l xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds=
_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic mo=
vbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowpr=
efetch epb intel_pt ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept v=
pid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx sma=
p clflushopt xsaveopt xsavec xgetbv1 dtherm ida arat pln pts hwp hwp_notify=
 hwp_act_window hwp_epp spec_ctrl intel_stibp flush_l1d

  =

  [root@localhost1 qemu]# lsb_release -a
  LSB Version:    :core-4.1-amd64:core-4.1-noarch
  Distributor ID: CentOS
  Description:    CentOS Linux release 7.6.1810 (Core)
  Release:        7.6.1810
  Codename:       Core

  Installed as Virtualization Server (qemuV1.5)=EF=BC=9B
  create win7-32 or 64 GuestOS by virt-manager=EF=BC=8Cand select default s=
ound card ich6=EF=BC=9B

  <graphics type=3D'spice' autoport=3D'yes'>
        <listen type=3D'address'/>
        <image compression=3D'off'/>
      </graphics>
      <sound model=3D'ich6'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04' =
function=3D'0x0'/>
      </sound>
      <video>
        <model type=3D'qxl' ram=3D'65536' vram=3D'65536' vgamem=3D'16384' h=
eads=3D'1' primary=3D'yes'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02' =
function=3D'0x0'/>
      </video>

  =

  but obvious noise found when login guest os to play music. :(

  And the problem remains after I update qemu to 2.12.0-18 , 3.1.0 &etc.

  =

  [root@localhost1 qemu]# /usr/bin/qemu-system-x86_64 --version
  QEMU emulator version 3.1.0
  Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1842530/+subscriptions

