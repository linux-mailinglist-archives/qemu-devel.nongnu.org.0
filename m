Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A73154381
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:51:52 +0100 (CET)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfhH-0006BE-FI
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1izfga-0005ce-RR
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1izfgZ-0005iX-Ck
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:51:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:52514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1izfgN-0005es-Ew
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:50:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1izfgL-0002oP-Rr
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 11:50:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA8A02E80C9
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 11:50:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Feb 2020 11:36:23 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: plugin tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee mhodog
X-Launchpad-Bug-Reporter: Robert Henry (mhodog)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <157973034496.4473.7342941286220324914.malonedeb@soybean.canonical.com>
Message-Id: <158098898335.19517.11809039421374336633.malone@wampee.canonical.com>
Subject: [Bug 1860610] Re: cap_disas_plugin leaks memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f293017d5f17c9440ba0f09632b5947c9b9d6dfc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1860610 <1860610@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What command line where you using? I've been unable to replicate the
valgrind warning with a riscv64-linux-user run of hello with the
libhowvec.so plugin. Valgrind does complain about a bunch of other stuff
though.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860610

Title:
  cap_disas_plugin leaks memory

Status in QEMU:
  New

Bug description:
  Looking at origin/master head, the function cap_disas_plugin leaks
  memory.

  per capstone's examples using their ABI, cs_free(insn, count); needs
  to called just before cs_close.

  I discovered this running qemu under valgrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860610/+subscriptions

