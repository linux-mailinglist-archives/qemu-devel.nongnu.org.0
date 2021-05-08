Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C96376FD4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:48:47 +0200 (CEST)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFpW-0006L7-93
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFma-0002bP-5L
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:45:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:52046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFmX-0006YS-QE
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfFmV-0003li-VD
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 05:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DE5902E802E
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 05:45:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:37:26 -0000
From: Thomas Huth <1668041@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nyh pmaydell rokuyama th-huth
X-Launchpad-Bug-Reporter: Nadav Har'El (nyh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170226112349.20229.38263.malonedeb@gac.canonical.com>
Message-Id: <162045224609.6759.11016428924903302968.malone@gac.canonical.com>
Subject: [Bug 1668041] Re: x86 Floating point exceptions - incorrect support?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: d68286bb9449947ecf286d9d08cbe7f509ed4983
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
Reply-To: Bug 1668041 <1668041@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/215


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #215
   https://gitlab.com/qemu-project/qemu/-/issues/215

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1668041

Title:
  x86 Floating point exceptions - incorrect support?

Status in QEMU:
  Expired

Bug description:
  It seems that qemu does not correctly emulate the x86 support for
  optionally causing a floating-point exception (#FP) when, for example,
  dividing by zero. Reports such as:

  https://github.com/cloudius-systems/osv/issues/855
  http://stackoverflow.com/questions/15134189/qemu-div-by-zero-mxcsr-regist=
er

  suggest that setting the exception mask in the fpu cw or mxcsr (e.g.,
  using a function like feenableexcept() in the guest OS) does not
  generate floating point exceptions on divide by zero. The problem only
  happens on pure QEMU - when a QEMU/KVM combination is used, the actual
  hardware does the floating point work, and does throw the exception on
  divide by zero if so requested.

  Looking at the qemu (2.8.0) source code, it seems to me it really
  lacks support for generating fpu exceptions: For example,
  helper_fdiv() in target-i386/fpu_helper.c, when it notices the divisor
  is zero, seems to set the divide-by-zero exception bit, but doesn't
  seem to check whether it needs to trigger an exception (when the right
  bits on the x87 or SSE control words are enabled).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1668041/+subscriptions

