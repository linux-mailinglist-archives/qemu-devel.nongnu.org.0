Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E8379F04
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:11:57 +0200 (CEST)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKgV-0005KY-Uw
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKfQ-0004Z7-Gw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:10:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:56138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKfO-0002wY-Dm
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:10:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKfL-0007lR-92
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:10:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 41E3B2E8135
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:10:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 04:58:24 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1886210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159379062799.1332.10709414866288351762.malonedeb@chaenomeles.canonical.com>
Message-Id: <162070910485.16779.238736048432955966.malone@soybean.canonical.com>
Subject: [Bug 1886210] Re: [Feature request] Illumnos VM image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6939cb684a3f9b84e166beaf82dd58836431e60a
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
Reply-To: Bug 1886210 <1886210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/258


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #258
   https://gitlab.com/qemu-project/qemu/-/issues/258

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886210

Title:
  [Feature request] Illumnos VM image

Status in QEMU:
  Invalid

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

