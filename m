Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453192B7B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:27:56 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKgt-0002lA-9P
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKe3-0007k7-7a
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:24:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:36088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKe0-0004RC-Vx
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:24:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfKdw-0000Ln-W6
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:24:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E9AA12E8072
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:24:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 10:14:14 -0000
From: Thomas Huth <1243968@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: esxi hypercall vmware
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-mail-f th-huth
X-Launchpad-Bug-Reporter: Nathan Shearer (6-mail-f)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20131023225742.32032.88482.malonedeb@chaenomeles.canonical.com>
Message-Id: <160569445487.28614.17465629311250809566.malone@gac.canonical.com>
Subject: [Bug 1243968] Re: VMware ESXi on QEmu Kernel Panic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: d55bf8f15715aa2474fc25d6811564a5fa73ef57
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:01:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1243968 <1243968@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1243968

Title:
  VMware ESXi on QEmu Kernel Panic

Status in QEMU:
  Incomplete

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

