Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF91E1104
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 16:52:05 +0200 (CEST)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdESS-0000Kr-By
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 10:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jdER4-0007w3-6l
 for qemu-devel@nongnu.org; Mon, 25 May 2020 10:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:51458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jdER3-0003bb-44
 for qemu-devel@nongnu.org; Mon, 25 May 2020 10:50:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jdER0-0003L2-UB
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 14:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E0C9A2E8078
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 14:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2020 14:41:29 -0000
From: Laurent Vivier <1880332@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hectormf
X-Launchpad-Bug-Reporter: =?utf-8?q?H=C3=A9ctor_Molinero_Fern=C3=A1ndez_=28?=
 =?utf-8?q?hectormf=29?=
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <159026122753.1613.8522405227035466257.malonedeb@chaenomeles.canonical.com>
Message-Id: <159041768966.20452.13101078246801522226.launchpad@soybean.canonical.com>
Subject: [Bug 1880332] Re: Possible regression in QEMU 5.0.0 after
 CVE-2020-10702 (segmentation fault)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1f7bc749b40714a4cc10f5e4d787118a78037035";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dae35c7134fe052fe7a0d8516abf272161573182
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 10:50:34
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
Reply-To: Bug 1880332 <1880332@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880332

Title:
  Possible regression in QEMU 5.0.0 after CVE-2020-10702 (segmentation
  fault)

Status in QEMU:
  New

Bug description:
  I've come across a very specific situation, but I'm sure it could be
  replicated in other cases.

  In QEMU 5.0.0 when I use user emulation with a cURL binary for aarch64
  and connect to a server using TLS 1.2 and ECDHE-ECDSA-
  CHACHA20-POLY1305 cypher a segmentation fault occurs.

  I attach a Dockerfile that reproduces this crash and the strace output
  with and without the de0b1bae6461f67243282555475f88b2384a1eb9 commit
  reverted.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880332/+subscriptions

