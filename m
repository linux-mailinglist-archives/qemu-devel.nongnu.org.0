Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56898379F52
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:49:13 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLGa-0000Mx-DT
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8b-0002j3-Au
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:40:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:60670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8Y-00041v-05
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:40:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgL8W-0003jK-N3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AD7842E8136
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:35:10 -0000
From: Thomas Huth <1791763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell sandra.codesourcery th-huth
X-Launchpad-Bug-Reporter: Sandra Loosemore (sandra.codesourcery)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153659924985.31926.8442483749515675177.malonedeb@soybean.canonical.com>
Message-Id: <162071131106.3040.3953926798177646178.malone@wampee.canonical.com>
Subject: [Bug 1791763] Re: broken signal handling in nios2 user-mode emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ed19659002b26e559ad9ac7a8b65be4ba099fc8c
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
Reply-To: Bug 1791763 <1791763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/261


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #261
   https://gitlab.com/qemu-project/qemu/-/issues/261

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1791763

Title:
  broken signal handling in nios2 user-mode emulation

Status in QEMU:
  Expired

Bug description:
  This bug is against the 3.0 release.

  It appears that the signal handling parts of the nios2 user-mode
  emulation have never really been completed or tested.  Some examples
  of failing tests from the GCC testsuite are gcc.dg/pr78185.c and
  gcc.dg/cleanup-10.c.

  Some problems I've identified and tried to fix with the attached patch
  are:

  - Code copied from the Linux kernel wasn't adjusted to differentiate
  between host and target data types and address spaces.

  - The sigaltstack() system call returns EINVAL because fields are
  listed in the wrong order in struct target_sigaltstack.

  With this patch, the system calls to set up the signal handler are
  returning successfully, but the handler isn't being invoked, so
  something is still wrong.  I think I need another pair of eyes to look
  over this code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1791763/+subscriptions

