Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EF379F6F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:57:23 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLOU-0005QK-C4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDO-0006he-CV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:33512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDM-0006QV-Iu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgLDK-0004IB-K6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9655C2E818D
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:37:02 -0000
From: Thomas Huth <1843795@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fpu ppc testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc th-huth
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156830716414.515.16944012251535902875.malonedeb@wampee.canonical.com>
Message-Id: <162071142211.10404.5219253401624483318.malone@chaenomeles.canonical.com>
Subject: [Bug 1843795] Re: 'mtfsf' instruction can clear FI incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 18277cf600c8ee37b95eede4ff7f2f9d49bb05d6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1843795 <1843795@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/266


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #266
   https://gitlab.com/qemu-project/qemu/-/issues/266

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843795

Title:
  'mtfsf' instruction can clear FI incorrectly

Status in QEMU:
  Expired

Bug description:
  Using mtfsf instruction can clear the FPSCR FI bit incorrectly.  This cod=
e snippet exhibits the issue:
  --
    fpscr.ll =3D 0x1fffffff;
    __builtin_mtfsf (0b11111111, fpscr.d);
    fpscr.d =3D __builtin_mffs ();
  --

  On POWER9 hardware:
  mffs    : FPSCR =3D 0x000000007ffff7ff

  On qemu (git master; "-cpu POWER9"):
  --
  $ ./mtfsf
  mffs    : FPSCR =3D 0x000000007ffdffff
  --

  Two differences:
  bit 52: "reserved", so maybe a "don't care" case
  bit 46: "FI"

  $ git log -1 master
  commit 89ea03a7dc83ca36b670ba7f787802791fcb04b1
  Merge: 019217c 2531164
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Sep 9 09:48:34 2019 +0100

  I tracked the clear is coming from do_float_check_status, likely the
  one in gen_mtfsf, but then I get lost figuring out what _should_ be
  happening. :-/

  Test attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843795/+subscriptions

