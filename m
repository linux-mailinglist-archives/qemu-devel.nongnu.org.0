Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDB38BB2B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 03:02:40 +0200 (CEST)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljtYk-0005LT-Vw
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 21:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljtX9-0004Zv-T7
 for qemu-devel@nongnu.org; Thu, 20 May 2021 21:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljtX5-0008UA-0n
 for qemu-devel@nongnu.org; Thu, 20 May 2021 21:00:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljtX2-0002uP-Cz
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 60BF42E8073
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 May 2021 00:53:36 -0000
From: Yasuhiro Horimoto <1749393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Triaged; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user qemu-20.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: doko gerard-f-vidal-4 hertzog janitor komainu8
 laurent-vivier paelzer peterogden pmaydell racb rth
X-Launchpad-Bug-Reporter: =?utf-8?q?Rapha=C3=ABl_Hertzog_=28hertzog=29?=
X-Launchpad-Bug-Modifier: Yasuhiro Horimoto (komainu8)
References: <151859702399.9461.6832978283203997178.malonedeb@chaenomeles.canonical.com>
Message-Id: <162155841631.5171.549216220012178090.malone@chaenomeles.canonical.com>
Subject: [Bug 1749393] Re: sbrk() not working under qemu-user with a
 PIE-compiled binary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="efc28e2b5d587feb8d4730501a578b7c3feee810"; Instance="production"
X-Launchpad-Hash: 38294d8f460e924193bb46efac40dbfbd6c524e1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1749393 <1749393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for fixing the problem.

I confirmed that https://bugs.launchpad.net/bugs/1924231 is fixed with
https://launchpad.net/~ci-train-ppa-
service/+archive/ubuntu/4535/+packages.

Thank you.

-- =

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
  Triaged

Bug description:
  [Impact]

   * The current space reserved can be too small and we can end up
     with no space at all for BRK. It can happen to any case, but is
     much more likely with the now common PIE binaries.

   * Backport the upstream fix which reserves a bit more space while loading
     and giving it back after interpreter and stack is loaded.

  [Test Plan]

   * On x86 run:
  sudo apt install -y qemu-user-static docker.io
  sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt i=
nstall -y wget'
  ...
  Running hooks in /etc/ca-certificates/update.d...
  done.
  Errors were encountered while processing:
   libc-bin
  E: Sub-process /usr/bin/dpkg returned an error code (1)

  =

  [Where problems could occur]

   * Regressions would be around use-cases of linux-user that is
     emulation not of a system but of binaries.
     Commonly uses for cross-tests and cross-builds so that is the
     space to watch for regressions

  [Other Info]
   =

   * n/a


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

