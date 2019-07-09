Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9C6388B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 17:23:12 +0200 (CEST)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkrxW-0002VZ-LF
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 11:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkrv8-00011Q-6F
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkrv6-0006mx-Qz
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:20:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkrv6-0006mG-Ji
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:20:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkrv5-0000lT-9r
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 15:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 485B62E80C9
 for <qemu-devel@nongnu.org>; Tue,  9 Jul 2019 15:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jul 2019 15:09:35 -0000
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz laurent-vivier pmaydell
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
References: <156262578461.2222.11301272429426949561.malonedeb@wampee.canonical.com>
 <156267329906.2764.88840211247289671.malone@wampee.canonical.com>
 <06bf8be7-c97e-9a42-06c4-82f303dc1a76@physik.fu-berlin.de>
 <3e3ac1b4-dd46-988a-9801-cd1353e81714@vivier.eu>
 <b88a6279-8e7a-32b6-4fc1-98be496aaaf0@physik.fu-berlin.de>
 <30e7b9fe-a99d-a83c-e4b6-7021a076332d@vivier.eu>
Message-Id: <0211fabd-65fe-f6b0-00b9-1f0969e4bc1c@physik.fu-berlin.de>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a11ce58c87368d0673eb14bacf53a8f643c5a3a5
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

On 7/9/19 4:01 PM, Laurent Vivier wrote:
> What is the content of:
> =

> /etc/binfmt.d/qemu-m68k.conf
> /proc/sys/fs/binfmt_misc/qemu-m68k

root@nofan:~> cat /etc/binfmt.d/qemu-m68k.conf
:qemu-m68k:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x=
02\x00\x04:\xff\xff\xff\xff\xff\xff\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff=
\xff\xfe\xff\xff:/usr/bin/qemu-m68k-static:P
root@nofan:~> cat /proc/sys/fs/binfmt_misc/qemu-m68k
enabled
interpreter /usr/bin/qemu-m68k-static
flags: OCF
offset 0
magic 7f454c4601020100000000000000000000020004
mask ffffffffffffff00fffffffffffffffffffeffff
root@nofan:~>

> what is the result of "file sid-m68k-sbuild/usr/bin/qemu-m68k-static"?
> =

> Bonus: if you don't want to copy qemu-m68k-static into the chroot, you
> can use "--persistent" with qemu-binfmt-conf.sh.
I'm doing that and I don't have a copy of qemu in the chroot.

But I think I forgot to pass --persistent to the script while testing.

Adrian

-- =

 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

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

