Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DE1AB3F3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 00:51:57 +0200 (CEST)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOqsu-0005O6-EL
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 18:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jOqrm-0004vq-I8
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jOqrl-00056Y-Bb
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:50:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:52766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jOqrl-00056A-6a
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:50:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jOqrj-0003ap-L9
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 22:50:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9BB6E2E8042
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 22:50:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2020 22:39:29 -0000
From: Sergei Trofimovich <1872847@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=gentoo; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: alpha linux-user python
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyborgyn laurent-vivier trofi
X-Launchpad-Bug-Reporter: Barnabas Viragh (cyborgyn)
X-Launchpad-Bug-Modifier: Sergei Trofimovich (trofi)
References: <158690356239.28566.12748384831078553261.malonedeb@gac.canonical.com>
Message-Id: <158699036954.11904.140318039530441249.malone@soybean.canonical.com>
Subject: [Bug 1872847] Re: qemu-alpha linux-user breaks python3.6
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 92d32393400907e5843882e091a72db3dfb1e42b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

Proposed possible fix as https://lists.nongnu.org/archive/html/qemu-
devel/2020-04/msg02545.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872847

Title:
  qemu-alpha linux-user breaks python3.6

Status in QEMU:
  New
Status in Gentoo Linux:
  New

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

