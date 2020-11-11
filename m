Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FF2AF4AA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:23:58 +0100 (CET)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcryX-0008LM-Cj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrvf-00066B-MP
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:20:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:43024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrvV-0004Gv-NN
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:20:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcrvU-0006m0-CK
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:20:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B0822E8042
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:20:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2020 15:07:44 -0000
From: Thomas Huth <1777301@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: haldun-alimli th-huth
X-Launchpad-Bug-Reporter: Haldun ALIMLI (haldun-alimli)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152921973161.6894.5433227514724824372.malonedeb@wampee.canonical.com>
Message-Id: <160510726453.19012.8247431634481122260.malone@soybean.canonical.com>
Subject: [Bug 1777301] Re: Boot failed after installing Checkpoint Pointsec FDE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11d702c7d7f4a497cdcc277027f1662d395603f"; Instance="production"
X-Launchpad-Hash: 2bbac1ec124c13ca467946bd770afbb9d6e6de46
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 10:11:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1777301 <1777301@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1777301

Title:
  Boot failed after installing Checkpoint Pointsec FDE

Status in QEMU:
  Incomplete

Bug description:
  Boot failed after installing Checkpoint Pointsec FDE

  =

  Hi,
  I installed Windows 10 64-bit guest on CentOS 7. Everything works great a=
s expected.
  However after installing CheckPoint AlertSec full disk encryption, the gu=
est failed to boot.

  The following error is displayed in qemu log file.
  KVM internal error. Suberror: 1
  emulation failure



  Installed Software
  [root@sesamvmh01 qemu]# yum list installed | grep qemu
  ipxe-roms-qemu.noarch                   20170123-1.git4e85b27.el7_4.1  @b=
ase    =

  libvirt-daemon-driver-qemu.x86_64       3.9.0-14.el7_5.5               @u=
pdates =

  qemu-guest-agent.x86_64                 10:2.8.0-2.el7                 @b=
ase    =

  qemu-img-ev.x86_64                      10:2.3.0-29.1.el7              @q=
emu-kvm-rhev
  qemu-kvm-common-ev.x86_64               10:2.3.0-29.1.el7              @q=
emu-kvm-rhev
  qemu-kvm-ev.x86_64                      10:2.3.0-29.1.el7              @q=
emu-kvm-rhev

  # uname -r
  3.10.0-862.3.2.el7.x86_64

  CPU info:
  processor	: 0..3
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 30
  model name	: Intel(R) Xeon(R) CPU           X3430  @ 2.40GHz
  stepping	: 5
  microcode	: 0x7
  cpu MHz		: 1200.000
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 0
  cpu cores	: 4
  apicid		: 0
  initial apicid	: 0
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 11
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp l=
m constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc ap=
erfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse=
4_1 sse4_2 popcnt lahf_lm tpr_shadow vnmi flexpriority ept vpid dtherm ida
  bogomips	: 4799.98
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:

  Please also check attached logs. I am new to qemu-kvm so please don't
  hesitate to ask missing info.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777301/+subscriptions

