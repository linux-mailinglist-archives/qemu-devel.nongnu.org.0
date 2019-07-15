Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7C685DB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 11:01:05 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmwr3-00086J-1C
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 05:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hmwqn-0007hq-R5
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hmwqm-0005wL-21
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:00:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:59672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hmwql-0005vU-Rt
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:00:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hmwqk-0006UF-6P
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 09:00:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 13B412E80C8
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 09:00:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jul 2019 08:53:00 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1836537@bugs.launchpad.net>
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
Message-Id: <156318078057.16506.13413250654919589949.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 1d6173192a013015ce59b8716bf6a5f02ed59f37
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836537] [NEW] Kconfig-related options not shown
 in ./configure --help
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
Reply-To: Bug 1836537 <1836537@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

tag: v4.1.0-rc0

I notice these options not documented by '--help':

  --with-default-devices) default_devices=3D"yes"
  --without-default-devices) default_devices=3D"no"

We might have other options not documented too.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836537

Title:
  Kconfig-related options not shown in ./configure --help

Status in QEMU:
  New

Bug description:
  tag: v4.1.0-rc0

  I notice these options not documented by '--help':

    --with-default-devices) default_devices=3D"yes"
    --without-default-devices) default_devices=3D"no"

  We might have other options not documented too.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836537/+subscriptions

