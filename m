Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6311BD6EA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 10:14:43 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThre-0005LM-Be
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 04:14:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jThqK-00041B-1h
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jThop-0002Mb-UW
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:13:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:42486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jThop-0002Jl-GC
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:11:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jThon-0000uw-T2
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 08:11:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D1C9D2E8010
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 08:11:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2020 08:02:01 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1875819@bugs.launchpad.net>
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
Message-Id: <158814732162.12781.3296645308588365531.malonedeb@gac.canonical.com>
Subject: [Bug 1875819] [NEW] [Feature request] prebuilt testing docker images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d1105341713c5be348effe2a5142c4a210ce4cde";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 72ee07cd96474f071b7fa3ebf0ae91b755f0eaf1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 04:11:46
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
Reply-To: Bug 1875819 <1875819@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Instead of building qemu:docker images locally, we should pull the one
built from Travis/Shippable/GitLab by default, and build it only when
manually requested.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875819

Title:
  [Feature request] prebuilt testing docker images

Status in QEMU:
  New

Bug description:
  Instead of building qemu:docker images locally, we should pull the one
  built from Travis/Shippable/GitLab by default, and build it only when
  manually requested.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875819/+subscriptions

