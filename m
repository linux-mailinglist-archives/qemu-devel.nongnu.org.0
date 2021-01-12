Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFAD2F2708
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:28:11 +0100 (CET)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBHt-0001GI-Ch
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFY-00084r-05
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:51512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFU-0000pX-1n
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFQ-0004Nv-VS
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CF1732E813B
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:37 -0000
From: Launchpad Bug Tracker <1903833@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rth ulasevich
X-Launchpad-Bug-Reporter: Boris (ulasevich)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160508996361.28374.9424687449463676251.malonedeb@gac.canonical.com>
Message-Id: <161042505811.10246.10284699805695023572.malone@loganberry.canonical.com>
Subject: [Bug 1903833] Re: User mode qemu-aarch: SIGGSEGV signal handler works
 wrong
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: c97081e8683a6b7bc99d0c46fa9f9938c5b2ab8d
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
Reply-To: Bug 1903833 <1903833@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903833

Title:
  User mode qemu-aarch: SIGGSEGV signal handler works wrong

Status in QEMU:
  Expired

Bug description:
  I have a user mode qemu-aarch issue. Program with SIGSEGV signal handler =
works wrong under qemu-aarch: =

  once the progam handles the SEGV signal, qemu marks the program's page pr=
otected, and signal handler gets SEGV on each subsequent memory access inst=
ruction within a program.

  The issue is reproduced on WSL Ubuntu 20.04 under Windows 10, qemu-aarch6=
4 version 5.1.50
  The issue is also reproducible on the latest upstream qemu-aarch build.

  The following workaround disables mprotect call and fixes the issue:
  https://github.com/BorisUlasevich/qemu/commit/3063d9a64f8395185d65c6b6710=
d28ee92cd8be5

  The issue can be reproduced on OpenJDK which reports SIGSEGV
  immediately after start. The small reproducer program is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903833/+subscriptions

