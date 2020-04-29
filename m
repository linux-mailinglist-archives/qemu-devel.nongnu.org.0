Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012241BD7E3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 11:06:05 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTifM-0006AE-1p
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 05:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jTibA-0001Ip-Eh
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jTiaf-0002KI-TY
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:01:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jTiaf-0002Jp-Dq
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:01:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jTiad-0003u1-6B
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 09:01:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2C2A92E804A
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 09:01:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2020 08:46:50 -0000
From: Daniel Berrange <1875819@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <158814732162.12781.3296645308588365531.malonedeb@gac.canonical.com>
Message-Id: <158815001070.12246.16054372341682673481.malone@gac.canonical.com>
Subject: [Bug 1875819] Re: [Feature request] prebuilt testing docker images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d1105341713c5be348effe2a5142c4a210ce4cde";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2d7e00920b93e422c112f9798a6af0b2cafd8aa5
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

GitLab has ability to host container images per project and also can
build them during CI runs. So I'd suggest that we create GitLab CI jobs
that build & publish each of the images under tests/docker on the master
branch.

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

