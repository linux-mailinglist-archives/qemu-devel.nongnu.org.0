Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAD12058B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:26:42 +0100 (CET)
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igpST-0007fX-AL
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1igpRY-0006qJ-8s
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1igpRX-0001R9-3C
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:43586)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1igpRW-0001PL-Ts
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1igpRW-0003W6-51
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 12:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 247F02E80C0
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 12:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Dec 2019 12:18:42 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1844814@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: trace
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156899381888.13411.12132927689585572811.malonedeb@gac.canonical.com>
Message-Id: <157649872273.18439.6864370970460927755.malone@wampee.canonical.com>
Subject: [Bug 1844814] Re: trace: SystemTap documentation out of date
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 34443d577f27139dc187cf0a90e26056c5674a73
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1844814 <1844814@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in v4.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1844814

Title:
  trace: SystemTap documentation out of date

Status in QEMU:
  Fix Released

Bug description:
  The docs/devel/tracing.txt help suggest:

      scripts/tracetool.py --backends=3Ddtrace --format=3Dstap \
                           --binary path/to/qemu-binary \
                           --target-type system \
                           --target-name x86_64 \
                           <trace-events-all >qemu.stp

  but since commit 2098c56a9bc this comment is outdated:

    $ scripts/tracetool.py --backends=3Ddtrace --format=3Dstap \
      --binary mips-softmmu/qemu-system-mips \
      --target-type system \
      --target-name mips trace-events-all
    Error: group name is required

  The offending commit seems:

  commit 2098c56a9bc5901e145fa5d4759f075808811685
  Author: Daniel P. Berrange <berrange@redhat.com>
  Date:   Wed Jan 25 16:14:14 2017 +0000

      trace: move setting of group name into Makefiles

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1844814/+subscriptions

