Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6412DFC59
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:36:46 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLMj-0002z2-2x
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krLLh-00024f-9q
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:35:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krLLc-0008Qb-Ca
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:35:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1krLLZ-0001Uk-OP
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 13:35:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6BFD2E813C
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 13:35:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Dec 2020 13:28:51 -0000
From: =?utf-8?q?Andreas_K=2E_H=C3=BCttel?= <1906193@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 dilfridge
X-Launchpad-Bug-Reporter: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
References: <160669515259.21126.12178770886175022752.malonedeb@gac.canonical.com>
Message-Id: <160855733170.28187.8715477213337798297.malone@gac.canonical.com>
Subject: [Bug 1906193] Re: riscv32 user mode emulation: fork return values
 broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 568cfb5b0e2f8f300e5452704cbe8a867961954f
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
Reply-To: Bug 1906193 <1906193@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After applying this patch on top of qemu-5.2.0, I can confirm that it
fixes the problem.

Thank you!!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906193

Title:
  riscv32 user mode emulation: fork return values broken

Status in QEMU:
  New

Bug description:
  When running in a chroot with riscv32 (on x86_64; qemu git master as
  of today):

  The following short program forks; the child immediately returns with
  exit(42). The parent checks for the return value - and obtains 40!

  gcc-10.2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #include <stdlib.h>
  #include <unistd.h>
  #include <stdio.h>
  #include <sys/wait.h>

  main(c, v)
       int c;
       char **v;
  {
    pid_t pid, p;
    int s, i, n;

    s =3D 0;
    pid =3D fork();
    if (pid =3D=3D 0)
      exit(42);

    /* wait for the process */
    p =3D wait(&s);
    if (p !=3D pid)
      exit (255);

    if (WIFEXITED(s))
    {
       int r=3DWEXITSTATUS(s);
       if (r!=3D42) {
        printf("child wants to return %i (0x%X), parent received %i (0x%X),=
 difference %i\n",42,42,r,r,r-42);
       }
    }
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  (riscv-ilp32 chroot) farino /tmp # ./wait-test-short =

  child wants to return 42 (0x2A), parent received 40 (0x28), difference -2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  (riscv-ilp32 chroot) farino /tmp # gcc --version
  gcc (Gentoo 10.2.0-r1 p2) 10.2.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  Dies ist freie Software; die Kopierbedingungen stehen in den Quellen. Es
  gibt KEINE Garantie; auch nicht f=C3=BCr MARKTG=C3=84NGIGKEIT oder F=C3=
=9CR SPEZIELLE ZWECKE.

  (riscv-ilp32 chroot) farino /tmp # ld --version
  GNU ld (Gentoo 2.34 p6) 2.34.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  This program is free software; you may redistribute it under the terms of
  the GNU General Public License version 3 or (at your option) a later vers=
ion.
  This program has absolutely no warranty.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906193/+subscriptions

