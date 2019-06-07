Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE9387F9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 12:31:20 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZC9W-0005BP-00
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 06:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50559)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hZBMc-0006qx-BE
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hZBMa-0007Ov-Vb
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:40:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:53080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hZBMa-0007Jn-Pn
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:40:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hZBMX-0006SA-5s
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 09:40:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A0FF2E80C0
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 09:40:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Jun 2019 09:35:32 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: regression tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-randrianasulu
X-Launchpad-Bug-Reporter: Andrew Randrianasulu (andrew-randrianasulu)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <155962633298.7880.15982922254182327026.malonedeb@wampee.canonical.com>
Message-Id: <155990013345.23637.1090495552868552769.launchpad@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 31e95d0a1e062c1e84e82ddbaec5c956ab717ba7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831545] Re: "accel/tcg: demacro cputlb" break
 qemu-system-x86_64 on 32-bit x86 host
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
Reply-To: Bug 1831545 <1831545@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
     Assignee: (unassigned) =3D> Alex Benn=C3=A9e (ajbennee)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831545

Title:
  "accel/tcg: demacro cputlb" break qemu-system-x86_64 on 32-bit x86
  host

Status in QEMU:
  In Progress

Bug description:
  As described in https://lists.gnu.org/archive/html/qemu-
  devel//2019-05/msg07362.html I run into TCG regression in qemu-git.

  Unfortunately, fix from bug
  https://bugs.launchpad.net/qemu/+bug/1830872 seems to be nonn-
  effective for my case.

  For reproduction (on 32-bit x86 host, in my case Slackware with gcc
  5.5.0):

  ./configure --target-list=3Dx86_64-softmmu --disable-werror --enable-
  debug-tcg

  make (-j5 in my case)

  try to boot any 64-bit kernel:

  x86_64-softmmu/qemu-system-x86_64 -kernel /boot/bzImage-4.12.0-x64
  -accel tcg

  result is - qemu appear to hang right after "Booting the kernel" line.
  Decompression (xz) was ok.

  Tested with qemu-git commit  e2a58ff493a2e00db3e963c1839c5374500110f2

  32-bit OS can be booted fine, and -enable-kvm also allow 64 bit
  kernel/os to boot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831545/+subscriptions

