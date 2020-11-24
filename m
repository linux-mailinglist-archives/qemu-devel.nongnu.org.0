Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B32C2D33
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:44:30 +0100 (CET)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbQb-0003dF-Qa
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbIH-0003iT-H9
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbIC-0003Pp-VA
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbI9-00074Q-GW
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 655682E813E
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:29:48 -0000
From: Thomas Huth <1774605@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sathnaga
X-Launchpad-Bug-Reporter: Satheesh Rajendran (sathnaga)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152784273656.31479.153660947051184788.malonedeb@soybean.canonical.com>
Message-Id: <160623538921.4877.2201606595485842664.launchpad@soybean.canonical.com>
Subject: [Bug 1774605] Re: PowerPC guest does not emulate L2 and L3 cache for
 KVM vCPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: df49d6099f4f12c186f5b5c17debd805171db359
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

** Tags added: ppc

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774605

Title:
  PowerPC guest does not emulate L2 and L3 cache for KVM vCPUs

Status in QEMU:
  New

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

