Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEE3B6D9E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:27:07 +0200 (CEST)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5Kz-0003sn-Ny
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ly5Jr-0002Z3-8y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:54410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ly5Jo-0001oW-Td
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:25:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ly5Jg-0000LB-Tb
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2EC692E81AC
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Jun 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1883560@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: build linux-user mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee aleksandar-markovic janitor
 laurent-vivier th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159223432851.7281.13140123017230519248.malonedeb@gac.canonical.com>
Message-Id: <162494023710.24284.9280610195087788138.malone@loganberry.canonical.com>
Subject: [Bug 1883560] Re: mips linux-user builds occasionly crash randomly
 only to be fixed by a full clean re-build
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11083652ba158ce73cebdfd79e69cf6f7d05a73"; Instance="production"
X-Launchpad-Hash: 2a5445b3a98d98a06d308753c58fb44f28d68d07
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
Reply-To: Bug 1883560 <1883560@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883560

Title:
  mips linux-user builds occasionly crash randomly only to be fixed by a
  full clean re-build

Status in QEMU:
  Expired

Bug description:
  From time to time I find check-tcg crashes with a one of the MIPS
  binaries. The last time it crashed was running the test:

    ./mips64el-linux-user/qemu-mips64el ./tests/tcg/mips64el-linux-
  user/threadcount

  Inevitably after some time noodling around wondering what could be
  causing this weird behaviour I wonder if it is a build issue. I wipe
  all the mips* build directories, re-run configure and re-build and
  voila problem goes away.

  It seems there must be some sort of build artefact which isn't being
  properly re-generated on a build update which causes weird problems.
  Additional data point if I:

    rm -rf mips64el-linux-user
    ../../configure
    make

  then I see failures in mip32 builds - eg:

      GEN     mipsn32el-linux-user/config-target.h
    In file included from /home/alex/lsrc/qemu.git/linux-user/syscall_defs.=
h:10,
                     from /home/alex/lsrc/qemu.git/linux-user/qemu.h:16,
                     from /home/alex/lsrc/qemu.git/linux-user/linuxload.c:5:
    /home/alex/lsrc/qemu.git/linux-user/mips64/syscall_nr.h:1: error: unter=
minated #ifndef
     #ifndef LINUX_USER_MIPS64_SYSCALL_NR_H

    make[1]: *** [/home/alex/lsrc/qemu.git/rules.mak:69: linux-user/linuxlo=
ad.o] Error 1
    make[1]: *** Waiting for unfinished jobs....

  which implies there is a cross dependency between different targets
  somewhere. If I executed:

    rm -rf mips*

  before re-configuring and re-building then everything works again.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883560/+subscriptions

