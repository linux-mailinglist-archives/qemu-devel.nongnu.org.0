Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E987D3BC576
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:27:50 +0200 (CEST)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cgW-0001ZV-UA
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf3-0007S2-Bx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:50674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cez-00033e-R4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0ceu-0004xO-BM
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E432F2E82B5
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:40 -0000
From: Launchpad Bug Tracker <1904259@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=None; component=None;
 status=Expired; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor oceanfish81 th-huth
X-Launchpad-Bug-Reporter: Ivan Serdyuk (oceanfish81)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160532517027.32164.5994775965173619452.malonedeb@chaenomeles.canonical.com>
Message-Id: <162554506071.7821.15559952299351895711.malone@loganberry.canonical.com>
Subject: [Bug 1904259] Re: include/qemu/atomic.h:495:5: error: misaligned
 atomic operation may incur significant performance penalty (Clang 11;
 Ubuntu 16 i686)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: c4851b74730bd24ae796fedec2687430740d4ea6
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
Reply-To: Bug 1904259 <1904259@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for Ubuntu because there has been no activity for 60 days.]

** Changed in: ubuntu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904259

Title:
  include/qemu/atomic.h:495:5: error: misaligned atomic operation may
  incur significant performance penalty (Clang 11; Ubuntu 16 i686)

Status in QEMU:
  Expired
Status in Ubuntu:
  Expired

Bug description:
  Hello.
  I haven't found any "official" executables, for emulating RISC-V (32bit; =
64bit) so I had to compile those myself.

  I found that auto-generated build scripts, for Ninja, contained some
  warnings interpreted as errors:

  =

  oceanfish81@gollvm:~/Desktop/qemu/build$ ninja -j 1
  [2/1977] Compiling C object libqemuutil.a.p/util_qsp.c.o
  FAILED: libqemuutil.a.p/util_qsp.c.o =

  clang-11 -Ilibqemuutil.a.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader -I/us=
r/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/includ=
e/gio-unix-2.0/ -Xclang -fcolor-diagnostics -pipe -Wall -Winvalid-pch -Werr=
or -std=3Dgnu99 -O2 -g -m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGE=
FILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -=
Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-de=
finition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored=
-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-def=
ined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negati=
ve-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-t=
ype-limit-compare -Wno-psabi -fstack-protector-strong -isystem /home/oceanf=
ish81/Desktop/qemu/linux-headers -isystem linux-headers -iquote /home/ocean=
fish81/Desktop/qemu/tcg/i386 -iquote . -iquote /home/oceanfish81/Desktop/qe=
mu -iquote /home/oceanfish81/Desktop/qemu/accel/tcg -iquote /home/oceanfish=
81/Desktop/qemu/include -iquote /home/oceanfish81/Desktop/qemu/disas/libvix=
l -pthread -Wno-unused-function -fPIC -MD -MQ libqemuutil.a.p/util_qsp.c.o =
-MF libqemuutil.a.p/util_qsp.c.o.d -o libqemuutil.a.p/util_qsp.c.o -c ../ut=
il/qsp.c
  In file included from ../util/qsp.c:62:
  In file included from /home/oceanfish81/Desktop/qemu/include/qemu/thread.=
h:4:
  In file included from /home/oceanfish81/Desktop/qemu/include/qemu/process=
or.h:10:
  /home/oceanfish81/Desktop/qemu/include/qemu/atomic.h:495:5: error: misali=
gned atomic operation may incur significant performance penalty [-Werror,-W=
atomic-alignment]
      qatomic_set__nocheck(ptr, val);
      ^
  /home/oceanfish81/Desktop/qemu/include/qemu/atomic.h:138:5: note: expande=
d from macro 'qatomic_set__nocheck'
      __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
      ^
  /home/oceanfish81/Desktop/qemu/include/qemu/atomic.h:485:12: error: misal=
igned atomic operation may incur significant performance penalty [-Werror,-=
Watomic-alignment]
      return qatomic_read__nocheck(ptr);
             ^
  /home/oceanfish81/Desktop/qemu/include/qemu/atomic.h:129:5: note: expande=
d from macro 'qatomic_read__nocheck'
      __atomic_load_n(ptr, __ATOMIC_RELAXED)
      ^
  2 errors generated.
  ninja: build stopped: subcommand failed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904259/+subscriptions

