Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20981484733
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:50:06 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nwi-0006aE-8C
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:50:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n4nsr-0002C6-1j
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:46:08 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:59274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n4nsl-0000L6-72
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:46:04 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 303C540321
 for <qemu-devel@nongnu.org>; Tue,  4 Jan 2022 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1641318356;
 bh=G8mKdN5WKgXDdcGRspdZ0O/l6czNXscpykULcIHu2Is=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=RkF0KHabDYKeZzsfgF77wKwDulCG07Iof7oJ9PVtaaWTvbg/7Xa2b2mdgU8kx70I7
 LEujnZN3zlbu4ulW3u+kAmBcGmQPufnD93LEeSM+9oFITo/qUYvOomZm/Hj5t21THY
 xCfXXdn04Ti+0sKLMMekWh5eVu0CCoEOImw+NQu6L9CKGU2pVEK0kJDQmGs/qr/cZt
 wJBxxh2qeBugh0n1XHuOrk62MX/mcqcyes5C2T5bPAm133r5CwG60AffZoSCxfBTEa
 ltEAgtd3qaX7BYluKMwYNLxD9CTy3hOCwbU4fExBlzf0x1PG0/5o6JtfpKXhY6AGxc
 lwJ0und2yeKPA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 47C632E817B
 for <qemu-devel@nongnu.org>; Tue,  4 Jan 2022 17:45:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Jan 2022 17:38:50 -0000
From: Launchpad Bug Tracker <1749393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu;
 component=main; status=Fix Released; importance=Medium;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug-Tags: arm linux-user qemu-20.10 server-next verification-done
 verification-done-focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brian-murray doko frankwu gerard-f-vidal-4 hertzog
 janitor komainu8 laurent-vivier paelzer peterogden pmaydell racb rth
 sebunger44
X-Launchpad-Bug-Reporter: =?utf-8?q?Rapha=C3=ABl_Hertzog_=28hertzog=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151859702399.9461.6832978283203997178.malonedeb@chaenomeles.canonical.com>
Message-Id: <164131793326.11355.2443302543988633154.malone@ackee.canonical.com>
Subject: [Bug 1749393] Re: sbrk() not working under qemu-user with a
 PIE-compiled binary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="adb364d6a74a28e7b95d51cd30446ec16160de6c"; Instance="production"
X-Launchpad-Hash: 6bb3a2ea6ac57213718b7baf84c4905c2ff290d0
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1749393 <1749393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug was fixed in the package qemu - 1:4.2-3ubuntu6.19

---------------
qemu (1:4.2-3ubuntu6.19) focal; urgency=3Dmedium

  * d/p/u/lp-1749393-linux-user-Reserve-space-for-brk.patch: fix static
    use cases needing a lot of brk space (LP: #1749393)
  * d/p/u/lp-1929926-target-s390x-Fix-translation-exception-on-illegal-in.p=
atch:
    fix uretprobe in s390x TCG (LP: #1929926)

 -- Christian Ehrhardt <christian.ehrhardt@canonical.com>  Mon, 26 Apr
2021 11:11:19 +0200

** Changed in: qemu (Ubuntu Focal)
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749393

Title:
  sbrk() not working under qemu-user with a PIE-compiled binary?

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Fix Released

Bug description:
  [Impact]

  =C2=A0* The current space reserved can be too small and we can end up
  =C2=A0=C2=A0=C2=A0with no space at all for BRK. It can happen to any case=
, but is
  =C2=A0=C2=A0=C2=A0much more likely with the now common PIE binaries.

  =C2=A0* Backport the upstream fix which reserves a bit more space while l=
oading
  =C2=A0=C2=A0=C2=A0and giving it back after interpreter and stack is loade=
d.

  [Test Plan]

  =C2=A0* On x86 run:
  sudo apt install -y qemu-user-static docker.io
  sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt i=
nstall -y wget'
  ...
  Running hooks in /etc/ca-certificates/update.d...
  done.
  Errors were encountered while processing:
  =C2=A0libc-bin
  E: Sub-process /usr/bin/dpkg returned an error code (1)

 =20
  Second test from bug 1928075

  $ sudo qemu-debootstrap --arch=3Darm64 bullseye bullseye-arm64
  http://ftp.debian.org/debian

  In the bad case this is failing like
  W: Failure trying to run: /sbin/ldconfig
  W: See //debootstrap/debootstrap.log for detail

  And in that log file you'll see the segfault
  $ tail -n 2 bullseye-arm64/debootstrap/debootstrap.log
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault (core dumped)

  [Where problems could occur]

  =C2=A0* Regressions would be around use-cases of linux-user that is
  =C2=A0=C2=A0=C2=A0emulation not of a system but of binaries.
  =C2=A0=C2=A0=C2=A0Commonly uses for cross-tests and cross-builds so that =
is the
  =C2=A0=C2=A0=C2=A0space to watch for regressions

  [Other Info]

  =C2=A0* n/a

  ---

  In Debian unstable, we recently switched bash to be a PIE-compiled
  binary (for hardening). Unfortunately this resulted in bash being
  broken when run under qemu-user (for all target architectures, host
  being amd64 for me).

  $ sudo chroot /srv/chroots/sid-i386/ qemu-i386-static /bin/bash
  bash: xmalloc: .././shell.c:1709: cannot allocate 10 bytes (0 bytes alloc=
ated)

  bash has its own malloc implementation based on sbrk():
  https://git.savannah.gnu.org/cgit/bash.git/tree/lib/malloc/malloc.c

  When we disable this internal implementation and rely on glibc's
  malloc, then everything is fine. But it might be that glibc has a
  fallback when sbrk() is not working properly and it might hide the
  underlying problem in qemu-user.

  This issue has also been reported to the bash upstream author and he sugg=
ested that the issue might be in qemu-user so I'm opening a ticket here. He=
re's the discussion with the bash upstream author:
  https://lists.gnu.org/archive/html/bug-bash/2018-02/threads.html#00080

  You can find the problematic bash binary in that .deb file:
  http://snapshot.debian.org/archive/debian/20180206T154716Z/pool/main/b/ba=
sh/bash_4.4.18-1_i386.deb

  The version of qemu I have been using is 2.11 (Debian package qemu-
  user-static version 1:2.11+dfsg-1) but I have had reports that the
  problem is reproducible with older versions (back to 2.8 at least).

  Here are the related Debian bug reports:
  https://bugs.debian.org/889869
  https://bugs.debian.org/865599

  It's worth noting that bash used to have this problem (when compiled as a=
 PIE binary) even when run directly but then something got fixed in the ker=
nel and now the problem only appears when run under qemu-user:
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1518483

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1749393/+subscriptions


