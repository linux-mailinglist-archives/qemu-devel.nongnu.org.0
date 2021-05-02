Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE126370A66
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 07:59:58 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld593-0005iF-N7
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 01:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld550-0001G8-Qm
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:35268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld54u-0004dp-CS
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld54t-0004OT-8t
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 05:55:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 422752E815C
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 05:55:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:46:44 -0000
From: Thomas Huth <1781281@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier luctrudeau th-huth
X-Launchpad-Bug-Reporter: Luc (luctrudeau)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153134235209.21545.5674967612897238430.malonedeb@soybean.canonical.com>
Message-Id: <161993440480.9706.10476648463073103815.malone@gac.canonical.com>
Subject: [Bug 1781281] Re: qemu-ppc64le uncaught target signal 4 (Illegal
 instruction)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 9ffee958f77e2d3c6b1d77f782d18d46b3c3bc43
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1781281 <1781281@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1781281

Title:
  qemu-ppc64le uncaught target signal 4 (Illegal instruction)

Status in QEMU:
  Incomplete

Bug description:
  qemu-ppc64le version 2.12.0
  host machine: x86_64 Arch Linux =


  I'm currently working on VSX support in libVPX, I'm using qemu to
  test, on line 723 of vpx_dsp/ppc/loopfilter_vsx.c, when I change the
  vec_sub to vec_subs I get:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

  Thread 1 "qemu-ppc64le" received signal SIGILL, Illegal instruction.
  0x00007ffff66d1bf6 in sigsuspend () from /usr/lib/libc.so.6
  (gdb) bt
  #0  0x00007ffff66d1bf6 in sigsuspend () from /usr/lib/libc.so.6
  #1  0x000055555567ee68 in ?? ()
  #2  0x000055555567fd18 in ?? ()
  #3  0x00005555556805ef in process_pending_signals ()
  #4  0x0000555555661e69 in cpu_loop ()
  #5  0x000055555561fd72 in main ()

  This can be reproduced by downloading this patch (patchset 1):

  https://chromium-review.googlesource.com/c/webm/libvpx/+/1134034

  and running

  qemu-ppc64le -L /home/ltrudeau/x-tools/powerpc64le-unknown-linux-gnu
  /powerpc64le-unknown-linux-gnu/sysroot/  ./test_libvpx
  --gtest_also_run_disabled_tests "--gtest_filter=3DVSX/*Loop*/*"

  I don't observe any issues when running the code on a POWER9 machine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1781281/+subscriptions

