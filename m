Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC5377770
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:52:04 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflit-0008Tv-60
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhV-0006RZ-Q6
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:58134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhU-00014S-0A
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflhS-0003nr-Hd
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8455B2E8136
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:44:09 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1910505@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161000881348.18330.2540162310564338256.malonedeb@gac.canonical.com>
Message-Id: <162057504916.2626.11690747108729537045.malone@wampee.canonical.com>
Subject: [Bug 1910505] Re: atomic failure linking with --enable-sanitizers on
 32-bit Linux hosts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 49ffd4cbc06ba41388df7687eef4641318d2e0fb
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
Reply-To: Bug 1910505 <1910505@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/235


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #235
   https://gitlab.com/qemu-project/qemu/-/issues/235

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910505

Title:
  atomic failure linking with --enable-sanitizers on 32-bit Linux hosts

Status in QEMU:
  Invalid

Bug description:
  As of commit 50536341b47, using --enable-sanitizers on 32-bit Linux host:
  - displays various warnings
  - fails linking

  Using Ubuntu 18.04 (release 20201211.1) and Clang10 on i386:

  [139/675] Compiling C object softmmu.fa.p/softmmu_icount.c.o
  In file included from ../softmmu/icount.c:31:
  In file included from include/exec/exec-all.h:23:
  In file included from ../target/mips/cpu.h:4:
  In file included from ../target/mips/cpu-qom.h:23:
  In file included from include/hw/core/cpu.h:23:
  In file included from include/hw/qdev-core.h:5:
  In file included from include/qemu/bitmap.h:16:
  In file included from include/qemu/bitops.h:17:
  include/qemu/atomic.h:463:12: warning: misaligned atomic operation may
  incur significant performance penalty [-Watomic-alignment]
      return qatomic_read__nocheck(ptr);
             ^
  include/qemu/atomic.h:129:5: note: expanded from macro
  'qatomic_read__nocheck'
      __atomic_load_n(ptr, __ATOMIC_RELAXED)
      ^
  include/qemu/atomic.h:473:5: warning: misaligned atomic operation may
  incur significant performance penalty [-Watomic-alignment]
      qatomic_set__nocheck(ptr, val);
      ^
  include/qemu/atomic.h:138:5: note: expanded from macro
  'qatomic_set__nocheck'
      __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
      ^
  2 warnings generated.
  [...]

  [850/2216] Linking target tests/test-hbitmap
  FAILED: tests/test-hbitmap
  clang  -o tests/test-hbitmap tests/test-hbitmap.p/test-hbitmap.c.o
  tests/test-hbitmap.p/iothread.c.o -Wl,--as-needed -Wl,--no-undefined
  -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa
  libio.fa -Wl,--no-whole-archive -Wl,--warn-common -fsanitize=3Dundefined
  -fsanitize=3Daddress -Wl,-z,relro -Wl,-z,now -m32 -ggdb
  -fstack-protector-strong -Wl,--start-group libqemuutil.a
  subprojects/libvhost-user/libvhost-user-glib.a
  subprojects/libvhost-user/libvhost-user.a libblock.fa libcrypto.fa
  libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0
  -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lutil -lgnutls
  -lm -lgthread-2.0 -lglib-2.0 /usr/lib/i386-linux-gnu/libglib-2.0.so
  -liscsi -lgthread-2.0 -lglib-2.0 -laio -lcurl
  /usr/lib/i386-linux-gnu/libz.so -lrbd -lrados -lnettle -lgnutls
  -Wl,--end-group
  libblock.fa(block_io.c.o): In function `stat64_max':
  include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
  include/qemu/stats64.h:60: undefined reference to
  `__atomic_compare_exchange_8'
  libblock.fa(block_qapi.c.o): In function `stat64_get':
  include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
  libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
  include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
  libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
  include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
  clang: error: linker command failed with exit code 1 (use -v to see
  invocation)

  Issue previously reported on the list here:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg770128.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910505/+subscriptions

