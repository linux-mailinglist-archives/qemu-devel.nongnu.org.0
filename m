Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6483678C0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:32:52 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZR1H-00084i-Sd
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQzR-0006PL-Cr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:30:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:44778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQzO-0005du-7t
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:30:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQzM-0006vA-Oy
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:30:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A1DA32E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:30:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:24:54 -0000
From: Thomas Huth <1912059@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161081170825.23111.15517151874905086702.malonedeb@soybean.canonical.com>
Message-Id: <161906549484.32169.16563259457209589579.malone@soybean.canonical.com>
Subject: [Bug 1912059] Re: capstone link failure building linux-user static
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 777ed088cfad5e13f6e06bdaafe82e2c93fdc7c9
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
Reply-To: Bug 1912059 <1912059@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912059

Title:
  capstone link failure building linux-user static

Status in QEMU:
  Incomplete

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

