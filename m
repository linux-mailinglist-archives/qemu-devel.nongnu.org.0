Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458F374F0B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:52:18 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leWvp-0000rF-21
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWue-00082Y-2e
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWub-00052r-P9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leWuZ-0005pj-Rl
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:50:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CFAB82E8189
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 05:50:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:38:15 -0000
From: Thomas Huth <1864536@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexandre-becholey bonzini th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Alexandre_B=C3=A9choley_=28alexandre-be?=
 =?utf-8?q?choley=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158257353920.30257.1886439598745813406.malonedeb@wampee.canonical.com>
Message-Id: <162027949599.6519.11247163377551789172.malone@wampee.canonical.com>
Subject: [Bug 1864536] Re: Support for XSAVES intel instructions in QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: f20a36e050a4b1d33445224f31835135e11a99b6
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
Reply-To: Bug 1864536 <1864536@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
https://bugs.launchpad.net/bugs/1864536

Title:
  Support for XSAVES intel instructions in QEMU

Status in QEMU:
  Incomplete

Bug description:
  Dear QEMU developers,

  I am running Hyper-V on qemu+kvm. During it initialization, it checks
  for XSAVES support: first it executes CPUID with EAX =3D 0xd and ECX =3D 1
  and looks at bit 3 in the returned value of EAX (Supports
  XSAVES/XRSTORS and IA32_XSS [1]), and then it reads the MSR
  IA32_VMX_PROCBASED_CTLS2 (index 0x48B) and looks at bit 20 (Enable
  XSAVES/XSTORS [2]). If CPUID shows that XSAVES is supported and the
  bit is not enabled in the MSR, Hyper-V decides to fail and stops its
  initialization. It used to work until last spring/summer where
  something might have changed in either KVM or QEMU.

  It seems that KVM sets the correct flags (in CPUID and the MSR) when the =
host CPU supports XSAVES. In QEMU, based on comments in target/i386/cpu.c i=
t seems that XSAVES is not added in
  builtin_x86_defs[].features[FEAT_VMX_SECONDARY_CTLS] because it might bre=
ak live migration. Therefore, when setting the MSR for the vcpu, QEMU is ma=
sking off the feature.

  I have tested two possible solutions:
  - adding the flag in .features[FEAT_VMX_SECONDARY_CTLS]
  - removing the support of the instruction in feature_word_info[FEAT_XSAVE=
].feat_names

  Both solutions work and Hyper-v is happily running. I can provide a
  patch for the solution you might consider applying. Otherwise, is
  there a better way to fix the issue?

  Qemu version: 4.2.0
  Kernel version: 5.5.4
  Qemu command: https://gist.github.com/0xabe-io/b4d797538e2160252addc1d1d6=
4738e2

  =

  Many thanks,
  Alexandre

  Ref:
  [1] Intel SDM Volume 2A, chapter 3, page 196
  [2] Intel SDM Volume 3C, chapter 24, page 11

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864536/+subscriptions

