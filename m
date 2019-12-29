Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B095F12C292
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 14:41:57 +0100 (CET)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilYpQ-0005Xj-RP
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 08:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ilYoM-0004kH-E9
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 08:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ilYoL-0007Td-8P
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 08:40:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:59594)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ilYoK-0007QD-9H
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 08:40:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ilYoG-00075e-Df
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 13:40:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 614FE2E80C0
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 13:40:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Dec 2019 13:32:24 -0000
From: crocket <crockabiscuit@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crockabiscuit
X-Launchpad-Bug-Reporter: crocket (crockabiscuit)
X-Launchpad-Bug-Modifier: crocket (crockabiscuit)
References: <155806778498.21734.945063058665872727.malonedeb@chaenomeles.canonical.com>
Message-Id: <157762634562.2454.3016296222559656050.launchpad@soybean.canonical.com>
Subject: [Bug 1829459] Re: qemu seems to lack support for pid namespace.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7d7dbc06faf9e8fb0982a61ec62522a32fce53d3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1829459 <1829459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Summary changed:

- qemu: qemu_thread_create: Invalid argument
+ qemu seems to lack support for pid namespace.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829459

Title:
  qemu seems to lack support for pid namespace.

Status in QEMU:
  New

Bug description:
  # Version

  qemu-4.0.0
  glibc-2.28

  # commands used to launch qemu-aarch64 in user mode.

  : ${QEMU_BINFMT_FLAGS:=3DOC}

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}"
  >/proc/sys/fs/binfmt_misc/register

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l

  # host

  Gentoo Linux amd64

  # Guest

  Gentoo Linux aarch64

  # The problem that I have

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.

  # Workaround

  Disable pid-sandbox in emerge.

  # How to reproduce the issue

  Execute

  unshare --pid -- echo hello world

  or

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829459/+subscriptions

