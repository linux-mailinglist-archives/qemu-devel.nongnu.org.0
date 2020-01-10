Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1B136A45
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:52:33 +0100 (CET)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqy0-0006hH-7a
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipqwK-00058B-5V
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipqwI-0005xo-Vz
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:39130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipqwI-0005rT-QI
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipqwE-00023P-Hf
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:50:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0CFF12E80F3
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 09:42:03 -0000
From: Thomas Huth <1832281@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: manuelbaesler pmaydell th-huth
X-Launchpad-Bug-Reporter: manuel baesler (manuelbaesler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156021221413.18114.3680605096232908394.malonedeb@wampee.canonical.com>
Message-Id: <157864932359.2371.3549129679446928281.malone@soybean.canonical.com>
Subject: [Bug 1832281] Re: tcg bug master / 4.0.0 v8 operation >>> and |=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0ada7cbdcc011c61ef1cd8357ae8e593c767bc20
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
Reply-To: Bug 1832281 <1832281@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch had been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D1e8a98b53867f61da9c

** Changed in: qemu
       Status: In Progress =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832281

Title:
  tcg bug master / 4.0.0 v8 operation >>> and |=3D

Status in QEMU:
  Fix Released

Bug description:
  vm guest is linux, executed with tcg
  running this Node.js snippet leads to

  $ node
  > a =3D undefined
  undefined
  > a >>> 0
  4294967295

  host node
  $ node
  > a =3D undefined
  undefined
  > a >>> 0
  0

  same with |=3D

  node
  Welcome to Node.js v12.4.0.
  Type ".help" for more information.
  > let buffer
  undefined
  > buffer |=3D 0
  0

  vm with tcg:

  $ ./out/Release/node --version
  v12.4.0
  ./out/Release/node -e "let buffer; buffer |=3D 0; console.log(buffer);"
  -1

  vm guest is debian x86_64 latest release
  vm guest is started with ./x86_64-softmmu/qemu-system-x86_64 -vnc :0 -cdr=
om debian-9.9.0-amd64-netinst.iso -m 4G -smp cores=3D6,threads=3D1,sockets=
=3D1 -nic user,hostfwd=3Dtcp:ipv4addr:2233-:22 -cpu qemu64 debian.img

  git tag v4.0.0 and master, commit
  a578cdfbdd8f9beff5ced52b7826ddb1669abbbf, for building qemu-system-
  x86_64 was used.

  Node.js is compiled on the vm guest (v12.4.0 / master)

  see also
  https://github.com/nodejs/node/issues/19348#issuecomment-500465502

  I need further assistance to track down the cause of the bug.

  Kind regards
  Manuel

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832281/+subscriptions

