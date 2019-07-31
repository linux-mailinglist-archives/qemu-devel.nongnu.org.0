Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57007BD31
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 11:31:15 +0200 (CEST)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hskx0-0002BX-W2
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 05:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hskwW-0001jI-Bj
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hskwV-0004lo-63
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:34152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hskwU-0004ku-Vt
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hskwS-0003cz-Tt
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:30:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC9952E80CB
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:30:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 31 Jul 2019 09:23:11 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee s4s
X-Launchpad-Bug-Reporter: _ (s4s)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156451696673.6584.7291488800307870571.malonedeb@soybean.canonical.com>
Message-Id: <156456499190.15322.12128839781937792027.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19012";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 939bdd17544f0b8fcbf653cd57bafbc05b03b74c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838465] Re: qemu-system-x86_64 kernel panic 30%
 of the time starting up VM
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
Reply-To: Bug 1838465 <1838465@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this using TCG (i.e. emulation) rather than Hyper V virtualisation?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838465

Title:
  qemu-system-x86_64 kernel panic 30% of the time starting up VM

Status in QEMU:
  New

Bug description:
  I have created a Fedora Core 5 x86_64 VM image. When I run the image
  using QEMU on Windows the VM hangs while loading the kernel about 30%
  of the time. I am trying to use this VM with a CI software, looking at
  the history the build failed 27 out of 79 attempts. QEMU 3.0.0 is
  installed on the CI machine. I have tried using the exact same image
  using QEMU on Linux (Ubuntu) and found the image boot successful every
  time (40+ attempts). The VM image is fairly old it was created using
  QEMU 0.11.1.

  I have tried multiple versions on QEMU on windows; 0.11.1, 2.12.1, and
  3.0.0 all of them fail randomly. I can reproduce the issue on several
  different Windows 10 computers.

  The command I am using to start the VM is =E2=80=9Cqemu-system-x86_64.exe=
 -cpu
  qemu64 -smp cores=3D2 -device e1000,netdev=3Dnet0 -boot menu=3Doff -m 1G
  -drive `"file=3DC:\qimages\Fedora-Core-5-x64.qcow2,index=3D0,media=3Ddisk=
`"
  -snapshot -netdev user,id=3Dnet0,hostfwd=3Dtcp::10022-:22=E2=80=9D

  I can provide the qcow image but it is somewhat large coming it at
  4.15GB so I=E2=80=99m not sure what would be the best way to transfer it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838465/+subscriptions

