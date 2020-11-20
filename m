Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D82BB548
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:30:47 +0100 (CET)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgC7K-0005wu-GJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgBmx-0003d9-Uo
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:09:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgBmv-0003qo-5e
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:09:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgBms-0001nH-NO
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 19:09:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AAE932E8138
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 19:09:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 18:59:55 -0000
From: Thomas Huth <1346784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m-ilin th-huth
X-Launchpad-Bug-Reporter: Mikhail Ilyin (m-ilin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140722074411.21128.87948.malonedeb@wampee.canonical.com>
Message-Id: <160589879561.25323.10458694960694975302.malone@wampee.canonical.com>
Subject: [Bug 1346784] Re: qemu internal memory areas visible to a guest via
 /proc/self/maps
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 8119b48cbbdcef5822709155206b78ca9e8b0e81
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
Reply-To: Bug 1346784 <1346784@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this had been fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dd67f4aaae8379b44b3b51=
ff0

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1346784

Title:
  qemu internal memory areas visible to a guest via /proc/self/maps

Status in QEMU:
  Fix Released

Bug description:
  =

  Qemu internal memory areas are not suppressed in the output and are  visi=
ble to a guest via /proc/self/maps.

  $ echo "int main() { return 0; }" > /tmp/test.c
  $ gcc -m32 -fsanitize=3Daddress -fno-common -Wall -g -fPIC -o /tmp/test /=
tmp/test.c
  $ qemu-i386-static -R 0 /tmp/test

  We use -R option because the binary can't be executed under stock
  version of Qemu with address sanitizer instrumentations (Asan).

  Qemu memory map looks the following way where GUEST valid addresses
  are marked with ***** and invalid with @@@:

  ***** 08048000-08049000 r-xp 00000000 08:01 28835889          /tmp/test
  ***** 08049000-0804a000 rw-p 00000000 08:01 28835889          /tmp/test
  ***** 1ffff000-24000000 rw-p 00000000 00:00 0 =

  ***** 24000000-28000000 ---p 00000000 00:00 0 =

  ***** 28000000-40000000 rw-p 00000000 00:00 0 =

  ***** 40000000-40001000 ---p 00000000 00:00 0 =

  ***** 40001000-40801000 rw-p 00000000 00:00 0                         [st=
ack]
  ***** 40801000-40821000 r-xp 00000000 08:01 26738694          /lib32/ld-2=
.19.so
  ***** 40821000-40822000 r--p 0001f000 08:01 26738694          /lib32/ld-2=
.19.so
  ***** 40822000-40823000 rw-p 00020000 08:01 26738694          /lib32/ld-2=
.19.so
  ***** 40823000-40827000 rw-p 00000000 00:00 0 =

  ***** 40827000-408ca000 r-xp 00000000 08:01 49424994          /home/micha=
il/build/lib32/libasan.so.1.0.0
  ***** 408ca000-408cc000 rw-p 000a3000 08:01 49424994          /home/micha=
il/build/lib32/libasan.so.1.0.0
  ***** 408cc000-40d24000 rw-p 00000000 00:00 0 =

  ***** 40d3c000-40ee2000 r-xp 00000000 08:01 26738695          /lib32/libc=
-2.19.so
  ***** 40ee2000-40ee4000 r--p 001a6000 08:01 26738695          /lib32/libc=
-2.19.so
  ***** 40ee4000-40ee5000 rw-p 001a8000 08:01 26738695          /lib32/libc=
-2.19.so
  ***** 40ee5000-40ee8000 rw-p 00000000 00:00 0 =

  ***** 40ee8000-40f00000 r-xp 00000000 08:01 26738711          /lib32/libp=
thread-2.19.so
  ***** 40f00000-40f01000 r--p 00017000 08:01 26738711          /lib32/libp=
thread-2.19.so
  ***** 40f01000-40f02000 rw-p 00018000 08:01 26738711          /lib32/libp=
thread-2.19.so
  ***** 40f02000-40f04000 rw-p 00000000 00:00 0 =

  ***** 40f04000-40f07000 r-xp 00000000 08:01 26738708          /lib32/libd=
l-2.19.so
  ***** 40f07000-40f08000 r--p 00002000 08:01 26738708          /lib32/libd=
l-2.19.so
  ***** 40f08000-40f09000 rw-p 00003000 08:01 26738708          /lib32/libd=
l-2.19.so
  ***** 40f09000-40fee000 r-xp 00000000 08:01 49424965          /home/micha=
il/build/lib32/libstdc++.so.6.0.20
  ***** 40fee000-40ff2000 r--p 000e5000 08:01 49424965          /home/micha=
il/build/lib32/libstdc++.so.6.0.20
  ***** 40ff2000-40ff3000 rw-p 000e9000 08:01 49424965          /home/micha=
il/build/lib32/libstdc++.so.6.0.20
  ***** 40ff3000-40ffa000 rw-p 00000000 00:00 0 =

  ***** 40ffa000-4103e000 r-xp 00000000 08:01 26738698          /lib32/libm=
-2.19.so
  ***** 4103e000-4103f000 r--p 00043000 08:01 26738698          /lib32/libm=
-2.19.so
  ***** 4103f000-41040000 rw-p 00044000 08:01 26738698          /lib32/libm=
-2.19.so
  ***** 41040000-41041000 rw-p 00000000 00:00 0 =

  ***** 41041000-4105b000 r-xp 00000000 08:01 49424637          /home/micha=
il/build/lib32/libgcc_s.so.1
  ***** 4105b000-4105c000 rw-p 00019000 08:01 49424637          /home/micha=
il/build/lib32/libgcc_s.so.1
  ***** 4105c000-4105e000 rw-p 00000000 00:00 0 =

  ***** 4105f000-41061000 rw-p 00000000 00:00 0 =

  ***** 41065000-421ed000 rw-p 00000000 00:00 0 =

  ***** 421ee000-421f1000 rw-p 00000000 00:00 0 =

  ***** 60000000-6033b000 r-xp 00000000 08:01 48760980          /home/micha=
il/build/bin/qemu-i386-static
  ***** 6053b000-60546000 rw-p 0033b000 08:01 48760980          /home/micha=
il/build/bin/qemu-i386-static
  ***** 60546000-6059a000 rw-p 00000000 00:00 0 =

  ***** 6059a000-6259b000 rwxp 00000000 00:00 0 =

  ***** 6259b000-625ae000 rw-p 00000000 00:00 0 =

  ***** 62dce000-62e12000 rw-p 00000000 00:00 0                          [h=
eap]
  @@@ 7f3f5e6a9000 - 7f3f61f28000 rw-p 00000000 00:00 0 =

  @@@ 7fffad130000 - 7fffad132000 r-xp 00000000 00:00 0          [vdso]
  @@@ ffffffffff600000 - ffffffffff601000 r-xp 00000000 00:00 0          [v=
syscall]

  qemu-i386-static and its heap are in ranges which are valid and be
  reported to guest in case of maps file reading.

  The issue is related to early reported bugs:
  http://lists.nongnu.org/archive/html/qemu-devel/2014-07/msg02793.html
  http://lists.nongnu.org/archive/html/qemu-devel/2014-07/msg03085.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1346784/+subscriptions

