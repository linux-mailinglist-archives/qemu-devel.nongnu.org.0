Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23270377777
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:56:42 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflnN-0006iF-8S
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflmT-0005G0-E2
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:55:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:58944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflmR-0004PZ-DD
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:55:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflmP-0004dq-LF
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:55:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F5812E8139
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:48:10 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1912059@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161081170825.23111.15517151874905086702.malonedeb@soybean.canonical.com>
Message-Id: <162057529038.9997.17076161694635368660.malone@chaenomeles.canonical.com>
Subject: [Bug 1912059] Re: capstone link failure building linux-user static
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: c98843f8dac1d2934dca17ae0433392fe4796a1f
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
Reply-To: Bug 1912059 <1912059@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/238


** Changed in: qemu
       Status: Incomplete =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #238
   https://gitlab.com/qemu-project/qemu/-/issues/238

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912059

Title:
  capstone link failure building linux-user static

Status in QEMU:
  Invalid

Bug description:
  $ ../configure --disable-system --static

  qemu 5.2.50

                       static build: YES
                           capstone: system
  [...]

  $ make qemu-i386
  [...]
  [478/478] Linking target qemu-i386
  FAILED: qemu-i386 =

  cc  -o qemu-i386 libcommon.fa.p/hw_core_cpu.c.o libcommon.fa.p/disas_caps=
tone.c.o libcommon.fa.p/disas_i386.c.o ... -Wl,--as-needed -Wl,--no-undefin=
ed -Wl,--whole-archive libhwcore.fa libqom.fa -Wl,--no-whole-archive -Wl,--=
warn-common -Wl,-z,relro -Wl,-z,now -static -m64 -fstack-protector-strong -=
Wl,--start-group libqemuutil.a subprojects/libvhost-user/libvhost-user-glib=
.a subprojects/libvhost-user/libvhost-user.a libhwcore.fa libqom.fa -lcapst=
one -lrt -pthread -lutil -lm -lgthread-2.0 -lglib-2.0 -lpcre -lgthread-2.0 =
-lglib-2.0 -lpcre -Wl,--end-group
  /usr/bin/ld: cannot find -lcapstone
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  make: *** [Makefile:172: run-ninja] Error 1

  $ rpm -ql capstone-devel
  /usr/include/capstone
  /usr/include/capstone/arm.h
  /usr/include/capstone/arm64.h
  /usr/include/capstone/capstone.h
  /usr/include/capstone/evm.h
  /usr/include/capstone/m680x.h
  /usr/include/capstone/m68k.h
  /usr/include/capstone/mips.h
  /usr/include/capstone/platform.h
  /usr/include/capstone/ppc.h
  /usr/include/capstone/sparc.h
  /usr/include/capstone/systemz.h
  /usr/include/capstone/tms320c64x.h
  /usr/include/capstone/x86.h
  /usr/include/capstone/xcore.h
  /usr/lib64/libcapstone.so
  /usr/lib64/pkgconfig/capstone.pc

  libcapstone.a seems detected by Meson but is not installed on the
  system (Fedora 32).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912059/+subscriptions

