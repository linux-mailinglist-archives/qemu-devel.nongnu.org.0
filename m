Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDF1B16C5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 22:17:25 +0200 (CEST)
Received: from localhost ([::1]:41732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQcr6-0003DR-5u
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 16:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jQcpW-0002M0-E7
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 16:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jQcpV-0002hJ-Mj
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 16:15:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:45494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jQcpV-0002f5-7O
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 16:15:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jQcpT-0000wV-Fg
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 20:15:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 758902E8104
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 20:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Apr 2020 20:09:38 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=gentoo; sourcepackage=None; component=None;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: alpha linux-user python
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyborgyn laurent-vivier trofi
X-Launchpad-Bug-Reporter: Barnabas Viragh (cyborgyn)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158690356239.28566.12748384831078553261.malonedeb@gac.canonical.com>
Message-Id: <158741337977.11806.2987953149606923087.malone@soybean.canonical.com>
Subject: [Bug 1872847] Re: qemu-alpha linux-user breaks python3.6
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e51a0fada5aab0da5b40cba228e9283a2222a517
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/20 16:15:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1872847 <1872847@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

386d38656889  ("linux-user/syscall.c: add target-to-host mapping for
epoll_create1()")


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872847

Title:
  qemu-alpha linux-user breaks python3.6

Status in QEMU:
  Fix Committed
Status in Gentoo Linux:
  Fix Released

Bug description:
  Running on Gentoo Linux in a chroot environment:
  # python3 -c 'import selectors; selectors.DefaultSelector()'
  Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/usr/lib/python3.7/selectors.py", line 349, in __init__
      self._selector =3D self._selector_cls()
  OSError: [Errno 22] Invalid argument

  However, on real hardware, with the same binaries there is no
  exception.

  This impacts whole python3 based Gentoo ebuild system (package
  management), and renders linux user mode alpha emulation in chroot
  environment building useless, more or less.

  The used systems:
  # qemu-alpha --version
  qemu-alpha version 4.2.0
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
  # uname -a
  Linux blackbird 5.4.28-gentoo-blackbird-06 #2 SMP Sat Apr 4 13:13:10 CEST=
 2020 x86_64 AMD Ryzen 5 3600 6-Core Processor AuthenticAMD GNU/Linux
  (chroot)# python3 --version
  Python 3.7.7

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872847/+subscriptions

