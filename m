Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13493776EF
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:14:00 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkBz-0000CD-Sc
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk8w-0003QH-CM
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:10:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:52320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk8o-0000Ex-Us
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:10:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfk8n-0003eo-5h
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:10:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 27EEE2E8026
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:10:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:05:05 -0000
From: Thomas Huth <1895471@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ameynarkhede stefanha th-huth
X-Launchpad-Bug-Reporter: Amey Narkhede (ameynarkhede)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160002337216.747.16078826830052525094.malonedeb@chaenomeles.canonical.com>
Message-Id: <162056910512.17197.5347109553459299643.malone@soybean.canonical.com>
Subject: [Bug 1895471] Re: compilation error with clang in util/async.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 27ad16662a8416c6a0d67a2c320dd2d33a71be5f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1895471 <1895471@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this has been fixed here:
https://gitlab.com/qemu-project/qemu/-/commit/d73415a315471a
... so I'm closing this now. If you still have problems, please open a new =
ticket in our new issue tracker here: https://gitlab.com/qemu-project/qemu/=
-/issues

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895471

Title:
  compilation error with clang in util/async.c

Status in QEMU:
  Fix Released

Bug description:
  configured with ` CC=3Dclang CXX=3Dclang++ ../configure --target-
  list=3Dx86_64-softmmu --enable-kvm --enable-curl --enable-debug
  --enable-jemalloc --enable-fuzzing --enable-sdl` and after make I get
  the following error related to c11 atomics. I'm using clang because
  I'm experimenting with fuzzer

  [glitz@archlinux /code/qemu/build]$ ninja -j5
  [479/2290] Compiling C object libqemuutil.a.p/util_async.c.o
  FAILED: libqemuutil.a.p/util_async.c.o
  clang -Ilibqemuutil.a.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader -I/usr/i=
nclude/p11-kit-1 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr=
/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -Ilinux-=
headers -Xclang -fcolor-diagnostics -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu99 -g -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE=
_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmis=
sing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-defini=
tion -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qua=
lifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined=
 -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-v=
alue -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-=
limit-compare -fstack-protector-strong -fsanitize=3Dfuzzer-no-link -iquote =
/code/qemu/tcg/i386 -isystem /code/qemu/linux-headers -iquote . -iquote /co=
de/qemu -iquote /code/qemu/accel/tcg -iquote /code/qemu/include -iquote /co=
de/qemu/disas/libvixl -pthread -fPIC -MD -MQ libqemuutil.a.p/util_async.c.o=
 -MF libqemuutil.a.p/util_async.c.o.d -o libqemuutil.a.p/util_async.c.o -c =
../util/async.c
  ../util/async.c:79:17: error: address argument to atomic operation must b=
e a pointer to _Atomic type ('unsigned int *' invalid)
      old_flags =3D atomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
                  ^               ~~~~~~~~~~
  /usr/lib/clang/10.0.1/include/stdatomic.h:138:42: note: expanded from mac=
ro 'atomic_fetch_or'
  #define atomic_fetch_or(object, operand) __c11_atomic_fetch_or(object, op=
erand, __ATOMIC_SEQ_CST)
                                           ^                     ~~~~~~
  ../util/async.c:105:14: error: address argument to atomic operation must =
be a pointer to _Atomic type ('unsigned int *' invalid)
      *flags =3D atomic_fetch_and(&bh->flags,
               ^                ~~~~~~~~~~
  /usr/lib/clang/10.0.1/include/stdatomic.h:144:43: note: expanded from mac=
ro 'atomic_fetch_and'
  #define atomic_fetch_and(object, operand) __c11_atomic_fetch_and(object, =
operand, __ATOMIC_SEQ_CST)
                                            ^                      ~~~~~~
  2 errors generated.
  [483/2290] Compiling C object libqemuutil.a.p/util_qemu-error.c.o
  ninja: build stopped: subcommand failed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895471/+subscriptions

