Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B94D6365E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 15:03:24 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkpmF-0000oU-FG
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 09:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkpkE-0008LF-Ur
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:01:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkpk2-0005D3-2l
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:01:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:38576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkpjs-0004yi-LI
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:00:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkpjm-0006IZ-US
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 13:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2FE52E80AD
 for <qemu-devel@nongnu.org>; Tue,  9 Jul 2019 13:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jul 2019 12:51:06 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz laurent-vivier pmaydell
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <156262578461.2222.11301272429426949561.malonedeb@wampee.canonical.com>
 <156267329906.2764.88840211247289671.malone@wampee.canonical.com>
 <06bf8be7-c97e-9a42-06c4-82f303dc1a76@physik.fu-berlin.de>
Message-Id: <3e3ac1b4-dd46-988a-9801-cd1353e81714@vivier.eu>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 15a9e4992ef2801cad836ee3d443c7f4ae81f340
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1835839] Re: qemu-user: $0 incorrectly always
 reports absolute path
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
Reply-To: Bug 1835839 <1835839@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/07/2019 =C3=A0 14:12, John Paul Adrian Glaubitz a =C3=A9crit=C2=A0:
> On 7/9/19 1:54 PM, Laurent Vivier wrote:
>> ** Patch added: "Enable binfmt-misc preserve-arg[0] flag"
>>    https://bugs.launchpad.net/qemu/+bug/1835839/+attachment/5275869/+fil=
es/0001-linux-user-manage-binfmt-misc-preserve-arg-0-flags.patch
> =

> Thanks! I just tried the patch and ran the setup script with:
> =

> ./scripts/qemu-binfmt-conf.sh --debian --qemu-path=3D/usr/bin --qemu-
> suffix=3D-static --preserve-arg0 yes
> =

> and:
> =

> root@nofan:~/qemu> systemctl restart binfmt-support.service =

> root@nofan:~/qemu>

if you use systemctl, the parameter of "./scripts/qemu-binfmt-conf.sh"
must be "--systemd m68k" rather than "--debian".

> =

> But still don't get the correct path:
> =

> (sid-m68k-sbuild)root@nofan:/# sh -c 'echo $0'
> /bin/sh
> (sid-m68k-sbuild)root@nofan:/#

Well, I've tested that, and it should work...

Thanks,
LAurent

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835839

Title:
  qemu-user: $0 incorrectly always reports absolute path

Status in QEMU:
  New

Bug description:
  We just ran into an issue with the Perl package on Debian/m68k when
  being built with qemu-user [1].

  The problem can be boiled down to qemu-user always reporting absolute
  paths for the shell variable $0 no matter on how the command was
  invoked.

  A simple reproducer is this:

  On normal system (no emulation):

  root@nofan:~> sh -c 'echo $0'
  sh
  root@nofan:~>

  On qemu-user:

  (sid-m68k-sbuild)root@nofan:/# sh -c 'echo $0'
  /bin/sh
  (sid-m68k-sbuild)root@nofan:/#

  > [1] https://lists.debian.org/debian-68k/2019/07/msg00007.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835839/+subscriptions

