Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4336E8F0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:37:35 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc434-0002J2-3Y
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc41H-0001T8-My
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:35:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:35074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc41F-00078v-H3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:35:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc41E-0005Au-Bq
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:35:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 53F762E8030
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 10:26:01 -0000
From: Thomas Huth <1883560@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: build linux-user mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee aleksandar-markovic laurent-vivier th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159223432851.7281.13140123017230519248.malonedeb@gac.canonical.com>
Message-Id: <161969196203.3730.5874967706687329312.malone@chaenomeles.canonical.com>
Subject: [Bug 1883560] Re: mips linux-user builds occasionly crash randomly
 only to be fixed by a full clean re-build
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 50624cffb38f880c19cbc9a9269504a241c8ac19
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
Reply-To: Bug 1883560 <1883560@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does this problem still persist after we've switched the build system to
meson?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883560

Title:
  mips linux-user builds occasionly crash randomly only to be fixed by a
  full clean re-build

Status in QEMU:
  Incomplete

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

