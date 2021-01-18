Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4A2F98B1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 05:33:45 +0100 (CET)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1MEa-0000i1-Ah
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 23:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MC1-0007Pm-OE
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:51424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MBz-00065W-R8
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:05 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1MBy-0003mf-5Y
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2909C2E8138
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jan 2021 04:17:14 -0000
From: Launchpad Bug Tracker <1243968@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: esxi hypercall vmware
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-mail-f janitor th-huth
X-Launchpad-Bug-Reporter: Nathan Shearer (6-mail-f)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20131023225742.32032.88482.malonedeb@chaenomeles.canonical.com>
Message-Id: <161094343537.15998.14235784962816397762.malone@loganberry.canonical.com>
Subject: [Bug 1243968] Re: VMware ESXi on QEmu Kernel Panic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 81a4d88bc5f6b8486b56c183f51d5e6590710672
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1243968 <1243968@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1243968

Title:
  VMware ESXi on QEmu Kernel Panic

Status in QEMU:
  Expired

Bug description:
  I attempted to install ESXi 5.5 (the free version) into a QEmu 1.6.1
  VM. The guest OS does have the svm capabilities, but it appears VMware
  is trying to do some kind of hypercall that crashes the guest.

  There is more information here:
  https://communities.vmware.com/message/2297382

  It seems to me that this stubbed feature should just be disabled if it
  is unusable. Or at the very least I should be able to disable it at
  run-time with a command-line argument.

  Is there some way to disable all the hypervisor features that makes it
  very obvious to a guest os that it is running inside a VM? It would be
  great if I could install a software and it would actually work (even
  if it's slow with those features disabled).

  FYI, my guest OS capabilities are:

  # cat /proc/cpuinfo
  processor       : 0
  vendor_id       : AuthenticAMD
  cpu family      : 6
  model           : 2
  model name      : QEMU Virtual CPU version 1.5.3
  stepping        : 3
  microcode       : 0x1000065
  cpu MHz         : 1999.999
  cache size      : 512 KB
  fpu             : yes
  fpu_exception   : yes
  cpuid level     : 4
  wp              : yes
  flags           : fpu de pse tsc msr pae mce cx8 apic sep mtrr pge mca cm=
ov pat pse36 clflush mmx fxsr sse sse2 syscall nx lm nopl pni cx16 popcnt h=
ypervisor lahf_lm svm abm sse4a
  bogomips        : 3999.99
  TLB size        : 1024 4K pages
  clflush size    : 64
  cache_alignment : 64
  address sizes   : 40 bits physical, 48 bits virtual
  power management:

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1243968/+subscriptions

