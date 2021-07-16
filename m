Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4C3CB19C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 06:27:05 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4FRH-00089G-L9
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 00:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m4FQ6-0007SM-71
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 00:25:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:60030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m4FQ4-0007RZ-0E
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 00:25:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m4FPy-00018K-PA
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 04:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BD0892E8085
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Jul 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1926996@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee janitor paleozogt th-huth
X-Launchpad-Bug-Reporter: Aaron Simmons (paleozogt)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <162006855194.4732.10860890446320255541.malonedeb@chaenomeles.canonical.com>
Message-Id: <162640903617.27986.4445864556834325122.malone@loganberry.canonical.com>
Subject: [Bug 1926996] Re: qemu-user clone syscall fails
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: fc348c3de662a40843fea90955352c479c778076
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926996 <1926996@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926996

Title:
  qemu-user clone syscall fails

Status in QEMU:
  Expired

Bug description:
  qemu-user fails to emulate clone()
  (https://linux.die.net/man/2/clone).  The architecture doesn't seem to
  matter, tho I've mostly been testing aarch64.

  Attached is clone_test.c that demonstrates the problem.  Running it nativ=
ely looks like this:
  $ bin/x86_64/clone_test
  The variable was 9
  clone returned 4177: 0 Success
  The variable is now 42

  However, running it via qemu looks like:
  $ qemu-aarch64-static --version
  qemu-aarch64 version 5.2.0 (v5.2.0)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  $ qemu-aarch64-static bin/aarch64/clone_test
  The variable was 9
  clone returned -1: 22 Invalid argument
  The variable is now 9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926996/+subscriptions


