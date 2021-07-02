Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019813B9B95
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:37:44 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAvv-0003Cw-0n
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAl1-0000rG-KA
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAks-0002d2-RV
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkf-00053e-RU
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:26:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0F8182E8283
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1781281@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor laurent-vivier luctrudeau th-huth
X-Launchpad-Bug-Reporter: Luc (luctrudeau)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153134235209.21545.5674967612897238430.malonedeb@soybean.canonical.com>
Message-Id: <162519943635.31921.11521171485073034603.malone@loganberry.canonical.com>
Subject: [Bug 1781281] Re: qemu-ppc64le uncaught target signal 4 (Illegal
 instruction)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: f850f0b1a7a68f763406715055697416d73ea67b
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
Reply-To: Bug 1781281 <1781281@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1781281

Title:
  qemu-ppc64le uncaught target signal 4 (Illegal instruction)

Status in QEMU:
  Expired

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

