Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA424C1E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:15:58 +0200 (CEST)
Received: from localhost ([::1]:56994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mIH-0003ZC-C1
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mDu-0006R2-Fv
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:11:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:50866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mDp-0006vw-Ru
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:11:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mDj-0000Im-Dr
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:11:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 632F62E80EE
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:11:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 15:04:10 -0000
From: Thomas Huth <1876373@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marler8997 th-huth
X-Launchpad-Bug-Reporter: Jonathan Marler (marler8997)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158836364215.11388.17303335808881708822.malonedeb@wampee.canonical.com>
Message-Id: <159793585026.2736.3571317164869205745.malone@chaenomeles.canonical.com>
Subject: [Bug 1876373] Re: segfault mremap 4096
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 269b1ac3d183836a0e06d24c24c90ad1c3ddd631
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1876373 <1876373@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D257a7e212d5e518ac5

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1876373

Title:
  segfault mremap 4096

Status in QEMU:
  Fix Released

Bug description:
  a qemu-hosted process segfaults when the program calls mremap to
  shrink the size of a buffer to 4096 that was allocated with mmap. See
  below for a C program to reproduce this issue.  I was able to compile
  this program for both i386 and 32-bit arm, and use qemu-i386 and qemu-
  arm to reproduce the segfault.  If I run the i386 program natively on
  my x86_64 system, no segfault occurs.  Also note that if I change the
  mremap size to something else such as 12288, no segfault occurs.  I
  also confirmed using qemu's -singlestep debug option that the segfault
  occurs during the mremap syscall.

  If you save the source below to mremapbug.c, the following should
  reproduce the issue given you have gcc-multilib:

  gcc -m32 mremapbug.c
  # works
  ./a.out
  # segfault
  qemu-i386 a.out

  If you can also compile to arm, the same thing happens when running
  "qemu-arm a.out".  I also tried compiling natively and running "qemu-
  x86_64 a.out" but no segfault in that case, not sure if it's because
  it is 64-bits or if it was because it was my native target.

  =

  #define _GNU_SOURCE
  #include <stdlib.h>
  #include <stdio.h>
  #include <sys/mman.h>

  int main(int argc, char *argv[])
  {
    const size_t initial_size =3D 8192;

    printf("calling mmap, size=3D%llu\n", (unsigned long long)initial_size);
    void *mmap_ptr =3D mmap(NULL, initial_size,
                     PROT_READ | PROT_WRITE ,
                     MAP_PRIVATE | MAP_ANONYMOUS,
                     -1, 0);
    printf("mmap returned  : %p\n", mmap_ptr);
    if (mmap_ptr =3D=3D MAP_FAILED) {
      perror("mmap");
      exit(1);
    }

    const size_t new_size =3D 4096;
    printf("calling mremap, size=3D%llu\n", (unsigned long long)new_size);
    void *remap_ptr =3D mremap(mmap_ptr, initial_size, new_size, 0);
    printf("mremap returned: %p\n", remap_ptr);
    if (remap_ptr !=3D mmap_ptr) {
      perror("mreamap");
      exit(1);
    }
    printf("Success: pointers match\n");
  }

  =

  This issue was found while I was pushing code that calls "mremap" to the =
Zig compiler repository, it's CI testing uses qemu-i386 and qemu-arm to run=
 tests for non-native hosts.  I've filed an issue in that repository as wel=
l with details on how to reproduce this issue with the Zig compiler as well=
: https://github.com/ziglang/zig/issues/5245

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1876373/+subscriptions

