Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AB69034
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:21:30 +0200 (CEST)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1r7-0003Ui-L8
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hn1qn-0002mZ-Mi
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hn1qm-0000jO-L9
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:21:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:46294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hn1qm-0000hW-FT
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:21:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hn1qi-0002Zr-Dl
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 14:21:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 42A562E81C1
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 14:20:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jul 2019 14:07:01 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: configure documentation
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28alex-bennee=29?=
References: <156318078057.16506.13413250654919589949.malonedeb@soybean.canonical.com>
Message-Id: <156319962197.29012.2078451452255002073.launchpad@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d30ab49ad8103cec8e59ab9327f3bc5872f7e257
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836537] Re: Kconfig-related options not shown in
 ./configure --help
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

** Tags added: configure documentation

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

