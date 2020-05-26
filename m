Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5B1B71A8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 12:12:21 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRvJk-0000Kr-2l
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jRvIS-0007T7-Gg
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jRvIQ-0002Sl-Rm
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:11:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jRvIQ-0002Il-D3
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 06:10:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jRvIO-0001hh-F9
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 10:10:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F8782E8079
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 10:10:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2020 09:59:20 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1874678@bugs.launchpad.net>
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
Message-Id: <158772236083.23646.1538920873771593848.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1874678] [NEW] [Feature request] python-qemu package
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="486bbbd6cb608f8eb468ed0d08689a349dfabe49";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c2e8fadc4693ea3d6943aacf6252925daa2a64be
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 06:00:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1874678 <1874678@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

It would be useful to have the python/qemu/ files published as a Python
pip package, so users from distribution can also use the QEMU python
methods (in particular for testing) without having to clone the full
repository.

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

- It would be useful to have the python/qemu/ files publish as a Python
+ It would be useful to have the python/qemu/ files published as a Python
  pip package, so users from distribution can also use the QEMU python
  methods (in particular for testing) without having to clone the full
  repository.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874678

Title:
  [Feature request] python-qemu package

Status in QEMU:
  New

Bug description:
  It would be useful to have the python/qemu/ files published as a
  Python pip package, so users from distribution can also use the QEMU
  python methods (in particular for testing) without having to clone the
  full repository.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874678/+subscriptions

