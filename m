Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6923AC25
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 20:12:13 +0200 (CEST)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2ewV-0005XV-VH
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 14:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2evF-0004Vw-3X
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 14:10:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:42118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2evD-0001md-6Q
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 14:10:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k2evB-0005pZ-7P
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 18:10:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 35BBD2E80D2
 for <qemu-devel@nongnu.org>; Mon,  3 Aug 2020 18:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2020 17:58:23 -0000
From: Julien Freche <1879587@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jfreche pmaydell
X-Launchpad-Bug-Reporter: Julien Freche (jfreche)
X-Launchpad-Bug-Modifier: Julien Freche (jfreche)
References: <158993429952.22373.5947926664408541430.malonedeb@wampee.canonical.com>
Message-Id: <159647750372.9962.14435734492514495105.malone@chaenomeles.canonical.com>
Subject: [Bug 1879587] Re: Register number in ESR is incorrect for certain
 banked registers when switching from AA32 to AA64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 876aaec6583b763e55c289774c523eecc3cdf325
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 07:00:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1879587 <1879587@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Of course. I just tested the patch (used the branch from
https://github.com/patchew-project/qemu) and it didn't seem to help.
Could that be linked to the fact that the translation is only in the SMC
exception path? It should probably target the MSR exception path also
(and probably others too). It's just a guess as I am not very familiar
with the code. If that's enough info, do let me know how to gather more
useful information.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879587

Title:
  Register number in ESR is incorrect for certain banked registers when
  switching from AA32 to AA64

Status in QEMU:
  In Progress

Bug description:
  I am running into a situation where I have:
  - A hypervisor running in EL2, AA64
  - A guest running in EL1, AA32

  We trap certain accesses to special registers such as DACR (via
  HCR.TVM). One instruction that is trapped is:

  ee03ef10  ->    mcr     15, 0, lr, cr3, cr0, {0}

  The guest is running in SVC mode. So, LR should refer to LR_svc there.
  LR_svc is mapped to X18 in AA64. So, ESR should reflect that. However,
  the actual ESR value is: 0xfe00dc0

  If we decode the 'rt':
  >>> (0xfe00dc0 >> 5) & 0x1f
  14

  My understanding is that 14 is incorrect in the context of AA64. rt
  should be set to 18. The current mode being SVC, LR refers to LR_svc
  not LR_usr. In other words, the mapping between registers in AA64 and
  AA32 doesn't seem to be accounted for. I've tested this with Qemu
  5.0.0

  Let me know if that makes sense and if you would like more info. I am als=
o happy to test patches.
  Thanks for all the great work on Qemu!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879587/+subscriptions

