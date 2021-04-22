Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270B3679A0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:02:59 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSQU-0008QC-37
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSOq-0007Uj-FS
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:01:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:55044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSOo-00013B-GT
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:01:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZSOn-0005uI-Eb
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:01:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B4392E815C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:01:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:53:20 -0000
From: Thomas Huth <1774605@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sathnaga th-huth
X-Launchpad-Bug-Reporter: Satheesh Rajendran (sathnaga)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152784273656.31479.153660947051184788.malonedeb@soybean.canonical.com>
Message-Id: <161907080069.6097.15805808432168639768.malone@chaenomeles.canonical.com>
Subject: [Bug 1774605] Re: PowerPC guest does not emulate L2 and L3 cache for
 KVM vCPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 9a025fc270e4a3a6b78ba84505e9a5ab477c7c5b
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
Reply-To: Bug 1774605 <1774605@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1774605

Title:
  PowerPC guest does not emulate L2 and L3 cache for KVM vCPUs

Status in QEMU:
  Incomplete

Bug description:
  PowerPC KVM guest does not emulate L2 and L2 caches for vCPU, it would
  be good to have them emulated to guest if not any known
  issues/limitation already with PowerPC.

  Host Env:
  kernel: 4.17.0-rc7-00045-g0512e0134582
  qemu: v2.12.0-923-gc181ddaa17-dirty
  #libvirtd -V
  libvirtd (libvirt) 4.4.0

  Guest Kernel:
  # uname -a
  Linux atest-guest 4.17.0-rc7-00045-g0512e0134582 #9 SMP Fri Jun 1 02:55:5=
0 EDT 2018 ppc64le ppc64le ppc64le GNU/Linux

  Guest:
  # lscpu
  Architecture:        ppc64le
  Byte Order:          Little Endian
  CPU(s):              16
  On-line CPU(s) list: 0-15
  Thread(s) per core:  8
  Core(s) per socket:  2
  Socket(s):           1
  NUMA node(s):        1
  Model:               2.1 (pvr 004b 0201)
  Model name:          POWER8 (architected), altivec supported
  Hypervisor vendor:   KVM
  Virtualization type: para
  L1d cache:           64K
  L1i cache:           32K
  NUMA node0 CPU(s):   0-15

  background: x86 enabling cpu L2 cache bydefault and L3 cache on demand fo=
r kvm guest
  and claims performance improvement as vcpus can be
  benefited with lesser `vmexits due to guest send IPIs.` with L3 cache ena=
bled, below was patch for same.

  https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D14c985cffa6cb177fc01a16=
3d8bcf227c104718c

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774605/+subscriptions

