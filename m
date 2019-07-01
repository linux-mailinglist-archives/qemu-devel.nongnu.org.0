Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB35547E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 18:29:53 +0200 (CEST)
Received: from localhost ([::1]:33878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfoKO-0004Cg-J6
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 12:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hfo2D-00008a-VV
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hfo2C-000362-1a
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:11:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:57384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hfo2B-00032A-Rj
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:11:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hfo28-0001ls-W0
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 16:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F0FE22E807D
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 16:11:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Jun 2019 15:59:47 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1833668@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier philmd rth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156110323981.19354.11667763271761846721.malonedeb@wampee.canonical.com>
 <156147381286.18147.1572558561573422063.malone@gac.canonical.com>
 <d5c913aa-0edf-ff4b-f21e-8c1a375e10fd@vivier.eu>
Message-Id: <43eac243-bfb9-fc66-d0ce-8135c68e14a4@redhat.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18991";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: fe542addc7f060d820f6a9df9167061a874f180f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1833668] Re: linux-user: Unable to run ARM
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

On 6/25/19 5:27 PM, Laurent Vivier wrote:
> Le 25/06/2019 =C3=A0 16:43, Richard Henderson a =C3=A9crit=C2=A0:
>> Of course.  There's a separate qemu-arm executable for that.
> =

> On some other architectures (like ppc/ppc64) the idea is the 64bit
> version supports also all 32bit versions CPUs.
> =

> I think it's why this bug has been opened.

At any rate the error message could be more explicit, to avoid
confusion.

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

