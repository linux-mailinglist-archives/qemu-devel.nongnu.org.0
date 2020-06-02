Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548731EC1EA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 20:36:42 +0200 (CEST)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgBmC-0000Xq-QK
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 14:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jgBl9-0008E2-B1
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 14:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:57612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jgBl6-0003Jo-PX
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 14:35:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jgBl3-0005O1-Bf
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 398B12E810B
 for <qemu-devel@nongnu.org>; Tue,  2 Jun 2020 18:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2020 18:27:48 -0000
From: Laurent Vivier <1881450@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=Laurent@vivier.eu; 
X-Launchpad-Bug-Tags: m68k
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn laurent-vivier
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <159088695339.29529.1797786788240960646.malonedeb@chaenomeles.canonical.com>
Message-Id: <159112246955.5999.5418709614180687282.launchpad@wampee.canonical.com>
Subject: [Bug 1881450] Re: Emulation of a math function fails for m68k Linux
 user mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="275d46a24253e557e4403d52832837e4bfa425b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0c8971c1bf087c6d5929c789b163d3c38754afba
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 11:35:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881450

Title:
  Emulation of a math function fails for m68k Linux user mode

Status in QEMU:
  Fix Committed

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

