Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37137311EB5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 17:42:45 +0100 (CET)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8QfT-0003Yt-IK
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 11:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8Qdk-0002yO-Lt
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 11:40:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:49116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8Qdg-00046F-Fw
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 11:40:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l8Qdb-0006Jz-Eh
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 16:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6CC272E8042
 for <qemu-devel@nongnu.org>; Sat,  6 Feb 2021 16:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Feb 2021 16:35:40 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1914870@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <161262934089.14056.18327208796436481224.malonedeb@soybean.canonical.com>
Subject: [Bug 1914870] [NEW] libvixl compilation failure on Debian unstable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: b3cfb8b59e970eb107c4989bb21fce34fa56fdcc
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
Reply-To: Bug 1914870 <1914870@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

As of commit 0e324626306:

$ lsb_release -d
Description:    Debian GNU/Linux bullseye/sid

Project version: 5.2.50
C compiler for the host machine: cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.2.=
1 20210110")
C linker for the host machine: cc ld.bfd 2.35.1
C++ compiler for the host machine: c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6) 1=
0.2.1 20210110")
C++ linker for the host machine: c++ ld.bfd 2.35.1

[6/79] Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o =

c++ -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui/shader -I/usr/include/cap=
stone -I/usr/include/glib-2.0 -I/usr/lib/hppa-linux-gnu/glib-2.0/include -f=
diagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Wnon-virtual-dtor -Werr=
or -std=3Dgnu++11 -O2 -g -isystem /home/philmd/qemu/linux-headers -isystem =
linux-headers -iquote . -iquote /home/philmd/qemu -iquote /home/philmd/qemu=
/include -iquote /home/philmd/qemu/disas/libvixl -iquote /home/philmd/qemu/=
tcg/hppa -iquote /home/philmd/qemu/accel/tcg -pthread -D__STDC_LIMIT_MACROS=
 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -U_FORTIFY_SOURCE -D_FORTI=
FY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -W=
undef -Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -Wtype-limit=
s -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-b=
ody -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-m=
issing-include-dirs -Wno-shift-negative-value -Wno-psabi -fPIE -MD -MQ libc=
ommon.fa.p/disas_libvixl_vixl_utils.cc.o -MF libcommon.fa.p/disas_libvixl_v=
ixl_utils.cc.o.d -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disa=
s/libvixl/vixl/utils.cc
In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                 from ../disas/libvixl/vixl/utils.cc:27:
/usr/include/string.h:36:43: error: missing binary operator before token "("
   36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
      |                                           ^
/usr/include/string.h:53:62: error: missing binary operator before token "("
   53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2=
X)
      |                                                              ^
/usr/include/string.h:165:21: error: missing binary operator before token "=
("
  165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
      |                     ^
/usr/include/string.h:174:43: error: missing binary operator before token "=
("
  174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE=
 (ISOC2X)
      |                                           ^
/usr/include/string.h:492:19: error: missing binary operator before token "=
("
  492 | #if __GNUC_PREREQ (3,4)
      |                   ^
In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                 from ../disas/libvixl/vixl/utils.cc:27:
/usr/include/string.h:28:1: error: =E2=80=98__BEGIN_DECLS=E2=80=99 does not=
 name a type
   28 | __BEGIN_DECLS
      | ^~~~~~~~~~~~~
In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                 from ../disas/libvixl/vixl/utils.cc:27:
/usr/include/string.h:44:8: error: =E2=80=98size_t=E2=80=99 has not been de=
clared
   44 |        size_t __n) __THROW __nonnull ((1, 2));
      |        ^~~~~~
/usr/include/string.h:44:20: error: expected initializer before =E2=80=98__=
THROW=E2=80=99
   44 |        size_t __n) __THROW __nonnull ((1, 2));
      |                    ^~~~~~~
/usr/include/string.h:47:56: error: =E2=80=98size_t=E2=80=99 has not been d=
eclared
   47 | extern void *memmove (void *__dest, const void *__src, size_t __n)
      |                                                        ^~~~~~
/usr/include/string.h:48:6: error: expected initializer before =E2=80=98__T=
HROW=E2=80=99
   48 |      __THROW __nonnull ((1, 2));
      |      ^~~~~~~
/usr/include/string.h:61:42: error: =E2=80=98size_t=E2=80=99 has not been d=
eclared
   61 | extern void *memset (void *__s, int __c, size_t __n) __THROW __nonn=
ull ((1));
      |                                          ^~~~~~

Is there a package dependency missing?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914870

Title:
  libvixl compilation failure on Debian unstable

Status in QEMU:
  New

Bug description:
  As of commit 0e324626306:

  $ lsb_release -d
  Description:    Debian GNU/Linux bullseye/sid

  Project version: 5.2.50
  C compiler for the host machine: cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.=
2.1 20210110")
  C linker for the host machine: cc ld.bfd 2.35.1
  C++ compiler for the host machine: c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6)=
 10.2.1 20210110")
  C++ linker for the host machine: c++ ld.bfd 2.35.1

  [6/79] Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o =

  c++ -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui/shader -I/usr/include/c=
apstone -I/usr/include/glib-2.0 -I/usr/lib/hppa-linux-gnu/glib-2.0/include =
-fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Wnon-virtual-dtor -We=
rror -std=3Dgnu++11 -O2 -g -isystem /home/philmd/qemu/linux-headers -isyste=
m linux-headers -iquote . -iquote /home/philmd/qemu -iquote /home/philmd/qe=
mu/include -iquote /home/philmd/qemu/disas/libvixl -iquote /home/philmd/qem=
u/tcg/hppa -iquote /home/philmd/qemu/accel/tcg -pthread -D__STDC_LIMIT_MACR=
OS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -U_FORTIFY_SOURCE -D_FOR=
TIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE =
-Wundef -Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -Wtype-lim=
its -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty=
-body -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno=
-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fPIE -MD -MQ li=
bcommon.fa.p/disas_libvixl_vixl_utils.cc.o -MF libcommon.fa.p/disas_libvixl=
_vixl_utils.cc.o.d -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../di=
sas/libvixl/vixl/utils.cc
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:36:43: error: missing binary operator before token =
"("
     36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
        |                                           ^
  /usr/include/string.h:53:62: error: missing binary operator before token =
"("
     53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISO=
C2X)
        |                                                              ^
  /usr/include/string.h:165:21: error: missing binary operator before token=
 "("
    165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
        |                     ^
  /usr/include/string.h:174:43: error: missing binary operator before token=
 "("
    174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_U=
SE (ISOC2X)
        |                                           ^
  /usr/include/string.h:492:19: error: missing binary operator before token=
 "("
    492 | #if __GNUC_PREREQ (3,4)
        |                   ^
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:28:1: error: =E2=80=98__BEGIN_DECLS=E2=80=99 does n=
ot name a type
     28 | __BEGIN_DECLS
        | ^~~~~~~~~~~~~
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:44:8: error: =E2=80=98size_t=E2=80=99 has not been =
declared
     44 |        size_t __n) __THROW __nonnull ((1, 2));
        |        ^~~~~~
  /usr/include/string.h:44:20: error: expected initializer before =E2=80=98=
__THROW=E2=80=99
     44 |        size_t __n) __THROW __nonnull ((1, 2));
        |                    ^~~~~~~
  /usr/include/string.h:47:56: error: =E2=80=98size_t=E2=80=99 has not been=
 declared
     47 | extern void *memmove (void *__dest, const void *__src, size_t __n)
        |                                                        ^~~~~~
  /usr/include/string.h:48:6: error: expected initializer before =E2=80=98_=
_THROW=E2=80=99
     48 |      __THROW __nonnull ((1, 2));
        |      ^~~~~~~
  /usr/include/string.h:61:42: error: =E2=80=98size_t=E2=80=99 has not been=
 declared
     61 | extern void *memset (void *__s, int __c, size_t __n) __THROW __no=
nnull ((1));
        |                                          ^~~~~~

  Is there a package dependency missing?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914870/+subscriptions

