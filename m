Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70EC36791B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:11:21 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRcW-0005mg-UU
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRbA-0004p0-KS
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:09:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:48422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRb8-0004BN-KK
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:09:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRb6-0001gm-Vo
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:09:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE0612E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:09:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:58:22 -0000
From: Thomas Huth <1527765@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz laurent-vivier th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151218220640.25998.28926.malonedeb@soybean.canonical.com>
Message-Id: <161906750262.23076.5474395883394078715.malone@gac.canonical.com>
Subject: [Bug 1527765] Re: sh4: ghc randomly segfaults on qemu-sh4-static
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: d49789ee79b6fffd85cb87aa6d370a5688f38da7
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
Reply-To: Bug 1527765 <1527765@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1527765

Title:
  sh4: ghc randomly segfaults on qemu-sh4-static

Status in QEMU:
  Incomplete

Bug description:
  Hello!

  I am currently in the process of bootstrapping ghc for the Debian sh4
  port and ran into a strange problem with qemu-sh4-static which
  randomly segfaults when running ghc to compile a Haskell source:

  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ls
  Main.hi  Main.hs  Setup.hs  ghc-pwd.cabal  ghc.mk
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  [1 of 1] Compiling Main             ( Main.hs, Main.o )
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  [1 of 1] Compiling Main             ( Main.hs, Main.o )
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  [1 of 1] Compiling Main             ( Main.hs, Main.o )
  Bad interface file: /usr/local/lib/sh4-unknown-linux-gnu-ghc-7.10.3/time/=
dist-install/build/Data/Time/Format/Parse.hi
  =C2=A0=C2=A0=C2=A0=C2=A0ghc: panic! (the 'impossible' happened)
  =C2=A0=C2=A0(GHC version 7.10.3 for sh4-unknown-linux):
  =C2=A0getSymtabName:unknown known-key unique
  <<details unavailable>>

  Please report this as a GHC bug:
  http://www.haskell.org/ghc/reportabug

  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd# ghc Main.hs
  /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  [1 of 1] Compiling Main             ( Main.hs, Main.o )
  Linking Main ...
  root@jessie32:~/ghc-7.8.4/utils/ghc-pwd#

  As seen above, compiling a Haskell source code often results in a
  segfault but simply by retrying to run ghc over and over again, the
  compile process will eventually succeed and no segfault occurs.

  I have created a tarball which contains the sh4 chroot from the
  example above which also includes ghc, gcc and the source code in
  question (in /root/ghc-7.8.4/utils/ghc-pwd). To test, it's probably a
  good idea to replace the qemu-sh4-static binary in /usr/bin with a
  current git snapshot (which I tried but didn't help).

  > http://users.physik.fu-berlin.de/~glaubitz/sid-sh4-sbuild-ghc.tgz

  In case anyone wants to try ghc with their own sh4 chroot, here's my
  version of ghc:

  > https://people.debian.org/~glaubitz/sh4-unknown-linux-gnu-
  ghc-7.10.3.tar.gz

  Just extract this tarball into the root directory of the sh4 chroot.

  Please note, that it might be advisable on sh4 to apply the patches
  from these two bug reports as otherwise qemu-sh4-static won't work
  properly on amd64 and misses syscall 186:

  > https://bugs.launchpad.net/ubuntu/+source/qemu-linaro/+bug/1254824
  > https://bugs.launchpad.net/qemu/+bug/1516408

  The above issue is reproducible with the two patches applied and
  without. It's also reproducible with both libc6 2.19 and 2.21 in the
  chroot. Thus, I am currently out of ideas what else to test.

  Cheers,
  Adrian

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1527765/+subscriptions

