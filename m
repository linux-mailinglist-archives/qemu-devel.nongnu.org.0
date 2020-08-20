Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBF24C21A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:24:13 +0200 (CEST)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mQG-0002V3-1R
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mDq-0006M8-Qi
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:11:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:50702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mDj-0006vZ-7X
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:11:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mDh-0000EJ-36
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:11:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 150742E80D2
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:11:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 14:58:07 -0000
From: Thomas Huth <1881450@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=Laurent@vivier.eu; 
X-Launchpad-Bug-Tags: m68k
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn laurent-vivier th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159088695339.29529.1797786788240960646.malonedeb@chaenomeles.canonical.com>
Message-Id: <159793548717.4954.5027443453856698011.malone@gac.canonical.com>
Subject: [Bug 1881450] Re: Emulation of a math function fails for m68k Linux
 user mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 0fbfee90ae7b9134a78d1d31afa43551f4f8adaf
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
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
Reply-To: Bug 1881450 <1881450@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D250b1da35d579f423

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881450

Title:
  Emulation of a math function fails for m68k Linux user mode

Status in QEMU:
  Fix Released

Bug description:
  Please check the attached math-example.c file.
  When running the m68k executable under QEMU, it results in an =

  "Illegal instruction" error.
  Other targets don't produce this error.

  Steps to reproduce the bug:

  1. Download the math-example.c attached file.
  2. Compile it by running:
  =C2=A0=C2=A0=C2=A0m68k-linux-gnu-gcc -O2 -static math-example.c -o math-e=
xample-m68k -lm
  3. Run the executable with QEMU:
  =C2=A0=C2=A0=C2=A0/build/qemu-5.0.0/build-gcc/m68k-linux-user/qemu-m68k m=
ath-example-m68k

  The output of execution is:
  =C2=A0=C2=A0=C2=A0Profiling function expm1f():
  =C2=A0=C2=A0=C2=A0qemu: uncaught target signal 4 (Illegal instruction) - =
core dumped
  =C2=A0=C2=A0=C2=A0Illegal instruction (core dumped)

  Output when running on other targets:
  =C2=A0=C2=A0=C2=A0Profiling function expm1f():
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Elapsed time: 47 ms
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Control result: 71804.953125

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881450/+subscriptions

