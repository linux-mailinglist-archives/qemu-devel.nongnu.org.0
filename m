Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0327B74B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 23:44:13 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kN0wO-0001MO-3w
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 17:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kN0tB-00006R-2O
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 17:40:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kN0t8-0002rY-TR
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 17:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kN0t6-0003fQ-2Z
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 21:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 107CA2E80DB
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 21:40:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2020 21:30:55 -0000
From: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano?=
 <1857269@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: untio
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano_=28un?=
 =?utf-8?q?tio=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Jos=C3=A9_Antonio_L=C3=B3pez_Cano_=28un?=
 =?utf-8?q?tio=29?=
References: <157705903476.27888.2879696880940848378.malonedeb@chaenomeles.canonical.com>
Message-Id: <160132865506.23770.240359781932975959.malone@gac.canonical.com>
Subject: [Bug 1857269] Re: Keyboard not fully working on Windows version
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d685c0a40836eb9844ed835c9700f20633c1d7af"; Instance="production"
X-Launchpad-Hash: 67b392a4293b8eb41d4e84880b78d10023ea5aa8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 17:40:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.199, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1857269 <1857269@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug is solved in last version of qemu for windows.

Great work.

Best regards.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857269

Title:
  Keyboard not fully working on Windows version

Status in QEMU:
  New

Bug description:
  Hello,

  I am working with windows qemu version:

  qemu-w64-setup-20190815

  I have installed a msdos virtual machine on qemu with sp keyboard
  layout (Spain at Europe). I have found that some keys do not work in
  the way they should. I believe that the problem is that es qemu
  spanish keyboard layout is the latin one, la in msdos sysytem.

  I ask you to create the Spain layout.


  Thanks in advance.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857269/+subscriptions

