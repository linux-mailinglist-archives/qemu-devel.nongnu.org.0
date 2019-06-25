Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9F552DE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 17:06:45 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfn1w-00088n-58
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hfmmk-0007iM-Vj
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hfmmj-0003Qv-Oh
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:51:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:38968)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hfmmj-0003PH-IM
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:51:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hfmmg-0008G7-8P
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 14:50:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C3AB42E8079
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 14:50:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Jun 2019 14:43:32 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd rth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <156110323981.19354.11667763271761846721.malonedeb@wampee.canonical.com>
Message-Id: <156147381286.18147.1572558561573422063.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18991";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 1b6489fbacc757ece5a07c8781bcfc1cd092ddea
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1833668] Re: linux-user: Unable to run ARM
 binaries on Aarch64
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
Reply-To: Bug 1833668 <1833668@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Of course.  There's a separate qemu-arm executable for that.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833668

Title:
  linux-user: Unable to run ARM binaries on Aarch64

Status in QEMU:
  Invalid

Bug description:
  Download a ARM package from https://packages.debian.org/sid/busybox-
  static

  Here tested with: busybox-static_1.30.1-4_armel.deb

  $ file busybox.armel
  busybox.armel: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), st=
atically linked, for GNU/Linux 3.2.0, BuildID[sha1]=3D12cf572e016bafa240e11=
3b57b3641e94b837f37, stripped

  $ qemu-aarch64 --version
  qemu-aarch64 version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.14)

  $ qemu-aarch64 busybox.armel
  busybox.armel: Invalid ELF image for this architecture

  $ qemu-aarch64 -cpu cortex-a7 busybox.armel
  unable to find CPU model 'cortex-a7'

  Also reproduced with commit 33d609990621dea6c7d056c86f707b8811320ac1,
  while the aarch64_cpus[] array contains Aarch64 CPUs, the arm_cpus[] arra=
y is empty:

  $ gdb -q aarch64-linux-user/qemu-aarch64
  (gdb) p aarch64_cpus
  $1 =3D {{name =3D 0x1fe4e8 "cortex-a57", initfn =3D 0x109bc0 <aarch64_a57=
_initfn>, class_init =3D 0x0}, {name =3D 0x1fe508 "cortex-a53", initfn =3D =
0x109a10 <aarch64_a53_initfn>, class_init =3D 0x0}, {name =3D 0x1fe518 "cor=
tex-a72", =

      initfn =3D 0x109868 <aarch64_a72_initfn>, class_init =3D 0x0}, {name =
=3D 0x218020 "max", initfn =3D 0x109d70 <aarch64_max_initfn>, class_init =
=3D 0x0}, {name =3D 0x0, initfn =3D 0x0, class_init =3D 0x0}}
  (gdb) p arm_cpus
  $2 =3D {{name =3D 0x0, initfn =3D 0x0, class_init =3D 0x0}}

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833668/+subscriptions

