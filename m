Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E122D421
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 05:10:33 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzAa0-00042E-Dl
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 23:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jzAZG-0003dE-VH
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 23:09:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:54230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jzAZF-000235-AJ
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 23:09:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jzAZE-0001gW-0F
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 03:09:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E9F132E8055
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 03:09:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2020 02:56:52 -0000
From: Matthieu Bucchianeri <1611394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: embedded floating-point ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andreas-rasmusson matthieu-bucchianeri
X-Launchpad-Bug-Reporter: Andreas Rasmusson (andreas-rasmusson)
X-Launchpad-Bug-Modifier: Matthieu Bucchianeri (matthieu-bucchianeri)
References: <20160809142016.20365.3095.malonedeb@wampee.canonical.com>
Message-Id: <159564581281.17363.6507994143080726573.malone@soybean.canonical.com>
Subject: [Bug 1611394] Re: qemu-ppc: Scalar Single-Precision Floating-Point
 instructions should not test MSR[SPV]
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e85d0ab92e2924d39b8285aeae075a01d25eff06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f6b52a84ff8efbc757e131e9c81eb16a0518de5d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 22:40:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1611394 <1611394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have filed a broader ticket, Bug #1888918, reporting a very similar
issue that leads to corruption/bad arithmetic when using double-
precision & vector instructions.

I will be submitting a patch in the next few days that will also address
this ticket.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1611394

Title:
  qemu-ppc: Scalar Single-Precision Floating-Point instructions should
  not test  MSR[SPV]

Status in QEMU:
  New

Bug description:
  According to "Signal Processing Engine (SPE) Programming Environments Man=
ual" at
  http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf?fsrch=3D1&sr=
=3D1&pageNum=3D1

  c.f section 4.2.3  and also Figure 2-2.

  When MSR[SPV] is _NOT_ set, then the embedded scalar single-precision flo=
ating-point instructions
  should _NOT_ generate an Embedded Floating-Point Unavailable Interrupt.

  =

  Hence, some tests for MSR[SPV] in file target-ppc/translate.c need to be =
removed.
  Namely, in the definitions of =

  1. GEN_SPEFPUOP_ARITH2_32_32
  2. gen_efsabs
  3. gen_efsnabs
  4. gen_efsneg
  5. GEN_SPEFPUOP_COMP_32

  Note, the macro GEN_SPEFPUOP_CONV_32_32 is already correct.

  One more thing, afaict the macro GEN_SPEFPUOP_CONV_32_64 is used by both
  efs- and efd- instructions, and will need to be split in two versions.
  The efs-use (i.e for efscfd) should be as it is today, but the use by efd=
-instructions =

  (e.g efdctui) will need to add a test for MSR[SPV].


  (I've looked at today's HEAD-revision of target-ppc/translate.c).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1611394/+subscriptions

