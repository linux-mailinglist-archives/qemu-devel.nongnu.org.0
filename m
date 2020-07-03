Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428E213CF4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 17:46:46 +0200 (CEST)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrNtl-0000eQ-9l
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 11:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jrNsh-00008J-6y
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 11:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:59626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jrNsf-0002vQ-Bv
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 11:45:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jrNse-0001Sv-8u
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 15:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 220F32E8106
 for <qemu-devel@nongnu.org>; Fri,  3 Jul 2020 15:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2020 15:37:07 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1886210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <159379062799.1332.10709414866288351762.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1886210] [NEW] [Feature request] Illumnos VM image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9738aaf24688d2fd2fe86e30861167f634af029f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 11:10:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1886210 <1886210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

We already have handy VMs to build QEMU within:

$ git grep -l basevm.BaseVM
tests/vm/centos
tests/vm/fedora
tests/vm/freebsd
tests/vm/netbsd
tests/vm/openbsd
tests/vm/ubuntu.i386

It would be useful to have a illumos VM to do build testing and avoid
regressions.

Suggested by Thomas Huth:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg719202.html

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886210

Title:
  [Feature request] Illumnos VM image

Status in QEMU:
  New

Bug description:
  We already have handy VMs to build QEMU within:

  $ git grep -l basevm.BaseVM
  tests/vm/centos
  tests/vm/fedora
  tests/vm/freebsd
  tests/vm/netbsd
  tests/vm/openbsd
  tests/vm/ubuntu.i386

  It would be useful to have a illumos VM to do build testing and avoid
  regressions.

  Suggested by Thomas Huth:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg719202.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886210/+subscriptions

