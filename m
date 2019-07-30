Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCB7A5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 12:12:11 +0200 (CEST)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsP75-00015x-0H
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 06:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39679)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hsP5q-0007ws-Ga
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:10:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hsP5k-0004Df-6j
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:10:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:51394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hsP5i-0004CW-QZ
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:10:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hsP5h-00029y-HC
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 10:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C64F2E802D
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 10:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2019 09:59:40 -0000
From: Hans Peter <1838312@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=virt-manager;
 component=universe; status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: green-world78 paelzer
X-Launchpad-Bug-Reporter: Hans Peter (green-world78)
X-Launchpad-Bug-Modifier: Hans Peter (green-world78)
References: <156441781649.17826.2889969380137011138.malonedeb@gac.canonical.com>
Message-Id: <156448078010.18447.77391720438556151.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 008f5be78707b655a44ef39ec42ca59d855e1e5f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838312] Re: Qemu virt-manager Segmentation fault
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
Reply-To: Bug 1838312 <1838312@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found crash-report from python 3.7 similiar to this error:

kernel: [ 2003.888116] virt-manager[16014]: segfault at 32d0 ip
00000000000032d0 sp 00007ffeb09ac658 error 14 in python3.7[400000+21000]

kernel: [ 2003.888124] Code: Bad RIP value.


look here:

ProblemType: Crash
Date: Fri Jul 26 15:03:11 2019
ExecutablePath: /usr/bin/session-installer
ExecutableTimestamp: 1458142842
InterpreterPath: /usr/bin/python3.7
ProcCmdline: /usr/bin/python3 /usr/bin/session-installer
ProcCwd: /
ProcEnviron:
 SHELL=3D/bin/bash
 LC_NAME=3Den_US.UTF-8
 LC_MEASUREMENT=3Den_US.UTF-8
 LC_PAPER=3Den_US.UTF-8
 LC_MONETARY=3Den_US.UTF-8
 LC_NUMERIC=3Den_US.UTF-8
 LC_TIME=3Den_US.UTF-8
 LC_IDENTIFICATION=3Den_US.UTF-8
 LANGUAGE=3Den_US
 LC_TELEPHONE=3Dde_DE.UTF-8
 LC_ADDRESS=3Dde_DE.UTF-8
 LANG=3Den_US.UTF-8
ProcMaps:
 00400000-00421000 r--p 00000000 fd:01 2621992                            /=
usr/bin/python3.7
 00421000-00655000 r-xp 00021000 fd:01 2621992                            /=
usr/bin/python3.7
 00655000-00801000 r--p 00255000 fd:01 2621992                            /=
usr/bin/python3.7
 00801000-00802000 r--p 00400000 fd:01 2621992                            /=
usr/bin/python3.7
 00802000-008a8000 rw-p 00401000 fd:01 2621992                            /=
usr/bin/python3.7
 008a8000-008cb000 rw-p 00000000 00:00 0 =

 02651000-0296c000 rw-p 00000000 00:00 0                                  [=
heap]
 7f0869a78000-7f0869c78000 rw-p 00000000 00:00 0 =

 7f0869c78000-7f0869c83000 r--p 00000000 fd:01 11010294                   /=
lib/x86_64-linux-gnu/libdbus-1.so.3.19.9
 7f0869c83000-7f0869cb0000 r-xp 0000b000 fd:01 11010294                   /=
lib/x86_64-linux-gnu/libdbus-1.so.3.19.9
 7f0869cb0000-7f0869cc5000 r--p 00038000 fd:01 11010294                   /=
lib/x86_64-linux-gnu/libdbus-1.so.3.19.9
 7f0869cc5000-7f0869cc6000 r--p 0004c000 fd:01 11010294                   /=
lib/x86_64-linux-gnu/libdbus-1.so.3.19.9
 7f0869cc6000-7f0869cc7000 rw-p 0004d000 fd:01 11010294                   /=
lib/x86_64-linux-gnu/libdbus-1.so.3.19.9
 7f0869cd8000-7f0869cda000 r--p 00000000 fd:01 2760872                    /=
usr/lib/python3.7/lib-dynload/_json.cpython-37m-x86_64-linux-gnu.so
 7f0869cda000-7f0869ce5000 r-xp 00002000 fd:01 2760872                    /=
usr/lib/python3.7/lib-dynload/_json.cpython-37m-x86_64-linux-gnu.so
 7f0869ce5000-7f0869ce7000 r--p 0000d000 fd:01 2760872                    /=
usr/lib/python3.7/lib-dynload/_json.cpython-37m-x86_64-linux-gnu.so
 7f0869ce7000-7f0869ce8000 r--p 0000e000 fd:01 2760872                    /=
usr/lib/python3.7/lib-dynload/_json.cpython-37m-x86_64-linux-gnu.so
 7f0869ce8000-7f0869ce9000 rw-p 0000f000 fd:01 2760872                    /=
usr/lib/python3.7/lib-dynload/_json.cpython-37m-x86_64-linux-gnu.so
 7f0869cf0000-7f0869cf4000 r--p 00000000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869cf4000-7f0869cfb000 r-xp 00004000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869cfb000-7f0869cfd000 r--p 0000b000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869cfd000-7f0869cfe000 ---p 0000d000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869cfe000-7f0869cff000 r--p 0000d000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869cff000-7f0869d00000 rw-p 0000e000 fd:01 2624107                    /=
usr/lib/x86_64-linux-gnu/libapt-inst.so.2.0.0
 7f0869d07000-7f0869e98000 rw-p 00000000 00:00 0 =

 7f0869e98000-7f0869eb4000 r--p 00000000 fd:01 2631064                    /=
usr/lib/x86_64-linux-gnu/libssl.so.1.1
 7f0869eb4000-7f0869f01000 r-xp 0001c000 fd:01 2631064                    /=
usr/lib/x86_64-linux-gnu/libssl.so.1.1
 7f0869f01000-7f0869f1b000 r--p 00069000 fd:01 2631064                    /=
usr/lib/x86_64-linux-gnu/libssl.so.1.1
 7f0869f1b000-7f0869f24000 r--p 00082000 fd:01 2631064                    /=
usr/lib/x86_64-linux-gnu/libssl.so.1.1
 7f0869f24000-7f0869f28000 rw-p 0008b000 fd:01 2631064                    /=
usr/lib/x86_64-linux-gnu/libssl.so.1.1
 7f0869f30000-7f0869f32000 r--p 00000000 fd:01 2627510                    /=
usr/lib/python3/dist-packages/_dbus_glib_bindings.cpython-37m-x86_64-linux-=
gnu.so
 7f0869f32000-7f0869f34000 r-xp 00002000 fd:01 2627510                    /=
usr/lib/python3/dist-packages/_dbus_glib_bindings.cpython-37m-x86_64-linux-=
gnu.so
 7f0869f34000-7f0869f35000 r--p 00004000 fd:01 2627510                    /=
usr/lib/python3/dist-packages/_dbus_glib_bindings.cpython-37m-x86_64-linux-=
gnu.so
 7f0869f35000-7f0869f36000 r--p 00004000 fd:01 2627510                    /=
usr/lib/python3/dist-packages/_dbus_glib_bindings.cpython-37m-x86_64-linux-=
gnu.so
 7f0869f36000-7f0869f37000 rw-p 00005000 fd:01 2627510                    /=
usr/lib/python3/dist-packages/_dbus_glib_bindings.cpython-37m-x86_64-linux-=
gnu.so
 7f0869f38000-7f0869f3a000 r--p 00000000 fd:01 2760874                    /=
usr/lib/python3.7/lib-dynload/_lzma.cpython-37m-x86_64-linux-gnu.so
 7f0869f3a000-7f0869f3d000 r-xp 00002000 fd:01 2760874                    /=
usr/lib/python3.7/lib-dynload/_lzma.cpython-37m-x86_64-linux-gnu.so
 7f0869f3d000-7f0869f3f000 r--p 00005000 fd:01 2760874                    /=
usr/lib/python3.7/lib-dynload/_lzma.cpython-37m-x86_64-linux-gnu.so
 7f0869f3f000-7f0869f40000 r--p 00006000 fd:01 2760874                    /=
usr/lib/python3.7/lib-dynload/_lzma.cpython-37m-x86_64-linux-gnu.so
 7f0869f40000-7f0869f42000 rw-p 00007000 fd:01 2760874                    /=
usr/lib/python3.7/lib-dynload/_lzma.cpython-37m-x86_64-linux-gnu.so
 7f0869f48000-7f0869f4a000 r--p 00000000 fd:01 2760292                    /=
usr/lib/python3.7/lib-dynload/_bz2.cpython-37m-x86_64-linux-gnu.so
 7f0869f4a000-7f0869f4c000 r-xp 00002000 fd:01 2760292                    /=
usr/lib/python3.7/lib-dynload/_bz2.cpython-37m-x86_64-linux-gnu.so
 7f0869f4c000-7f0869f4d000 r--p 00004000 fd:01 2760292                    /=
usr/lib/python3.7/lib-dynload/_bz2.cpython-37m-x86_64-linux-gnu.so
 7f0869f4d000-7f0869f4e000 r--p 00004000 fd:01 2760292                    /=
usr/lib/python3.7/lib-dynload/_bz2.cpython-37m-x86_64-linux-gnu.so
 7f0869f4e000-7f0869f4f000 rw-p 00005000 fd:01 2760292                    /=
usr/lib/python3.7/lib-dynload/_bz2.cpython-37m-x86_64-linux-gnu.so
 7f0869f50000-7f0869fd0000 rw-p 00000000 00:00 0 =

 7f0869fd0000-7f086a048000 r--p 00000000 fd:01 2630452                    /=
usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
 7f086a048000-7f086a1e0000 r-xp 00078000 fd:01 2630452                    /=
usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
 7f086a1e0000-7f086a26d000 r--p 00210000 fd:01 2630452                    /=
usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
 7f086a26d000-7f086a299000 r--p 0029c000 fd:01 2630452                    /=
usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
 7f086a299000-7f086a29b000 rw-p 002c8000 fd:01 2630452                    /=
usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
 7f086a29b000-7f086a29e000 rw-p 00000000 00:00 0 =

 7f086a2a0000-7f086a360000 rw-p 00000000 00:00 0 =

 7f086a360000-7f086a37e000 r-xp 00000000 fd:01 3147544                    /=
usr/local/lib/libgpg-error.so.0.24.2
 7f086a37e000-7f086a57e000 ---p 0001e000 fd:01 3147544                    /=
usr/local/lib/libgpg-error.so.0.24.2
 7f086a57e000-7f086a57f000 r--p 0001e000 fd:01 3147544                    /=
usr/local/lib/libgpg-error.so.0.24.2
 7f086a57f000-7f086a580000 rw-p 0001f000 fd:01 3147544                    /=
usr/local/lib/libgpg-error.so.0.24.2
 7f086a580000-7f086a695000 r-xp 00000000 fd:01 3147567                    /=
usr/local/lib/libgcrypt.so.20.2.3
 7f086a695000-7f086a894000 ---p 00115000 fd:01 3147567                    /=
usr/local/lib/libgcrypt.so.20.2.3
 7f086a894000-7f086a896000 r--p 00114000 fd:01 3147567                    /=
usr/local/lib/libgcrypt.so.20.2.3
 7f086a896000-7f086a89b000 rw-p 00116000 fd:01 3147567                    /=
usr/local/lib/libgcrypt.so.20.2.3
 7f086a89b000-7f086a89c000 rw-p 00000000 00:00 0 =

 7f086a8a0000-7f086a8af000 r--p 00000000 fd:01 11010259                   /=
lib/x86_64-linux-gnu/libsystemd.so.0.24.0
 7f086a8af000-7f086a918000 r-xp 0000f000 fd:01 11010259                   /=
lib/x86_64-linux-gnu/libsystemd.so.0.24.0
 7f086a918000-7f086a939000 r--p 00078000 fd:01 11010259                   /=
lib/x86_64-linux-gnu/libsystemd.so.0.24.0
 7f086a939000-7f086a93c000 r--p 00098000 fd:01 11010259                   /=
lib/x86_64-linux-gnu/libsystemd.so.0.24.0
 7f086a93c000-7f086a93d000 rw-p 0009b000 fd:01 11010259                   /=
lib/x86_64-linux-gnu/libsystemd.so.0.24.0
 7f086a93d000-7f086a93e000 rw-p 00000000 00:00 0 =

 7f086a940000-7f086a944000 r--p 00000000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a944000-7f086a95b000 r-xp 00004000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a95b000-7f086a963000 r--p 0001b000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a963000-7f086a964000 ---p 00023000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a964000-7f086a965000 r--p 00023000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a965000-7f086a966000 rw-p 00024000 fd:01 11010051                   /=
lib/x86_64-linux-gnu/libudev.so.1.6.12
 7f086a968000-7f086a96c000 r--p 00000000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086a96c000-7f086a9f4000 r-xp 00004000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086a9f4000-7f086aa04000 r--p 0008c000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086aa04000-7f086aa05000 ---p 0009c000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086aa05000-7f086aa06000 r--p 0009c000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086aa06000-7f086aa07000 rw-p 0009d000 fd:01 2628521                    /=
usr/lib/x86_64-linux-gnu/libzstd.so.1.3.8
 7f086aa08000-7f086aa0a000 r--p 00000000 fd:01 2622434                    /=
usr/lib/x86_64-linux-gnu/liblz4.so.1.8.3
 7f086aa0a000-7f086aa32000 r-xp 00002000 fd:01 2622434                    /=
usr/lib/x86_64-linux-gnu/liblz4.so.1.8.3
 7f086aa32000-7f086aa35000 r--p 0002a000 fd:01 2622434                    /=
usr/lib/x86_64-linux-gnu/liblz4.so.1.8.3
 7f086aa35000-7f086aa36000 r--p 0002c000 fd:01 2622434                    /=
usr/lib/x86_64-linux-gnu/liblz4.so.1.8.3
 7f086aa36000-7f086aa37000 rw-p 0002d000 fd:01 2622434                    /=
usr/lib/x86_64-linux-gnu/liblz4.so.1.8.3
 7f086aa38000-7f086aa3b000 r--p 00000000 fd:01 11010220                   /=
lib/x86_64-linux-gnu/liblzma.so.5.2.4
 7f086aa3b000-7f086aa52000 r-xp 00003000 fd:01 11010220                   /=
lib/x86_64-linux-gnu/liblzma.so.5.2.4
 7f086aa52000-7f086aa5d000 r--p 0001a000 fd:01 11010220                   /=
lib/x86_64-linux-gnu/liblzma.so.5.2.4
 7f086aa5d000-7f086aa5e000 r--p 00024000 fd:01 11010220                   /=
lib/x86_64-linux-gnu/liblzma.so.5.2.4
 7f086aa5e000-7f086aa5f000 rw-p 00025000 fd:01 11010220                   /=
lib/x86_64-linux-gnu/liblzma.so.5.2.4
 7f086aa60000-7f086aa62000 r--p 00000000 fd:01 11010296                   /=
lib/x86_64-linux-gnu/libbz2.so.1.0.4
 7f086aa62000-7f086aa6f000 r-xp 00002000 fd:01 11010296                   /=
lib/x86_64-linux-gnu/libbz2.so.1.0.4
 7f086aa6f000-7f086aa71000 r--p 0000f000 fd:01 11010296                   /=
lib/x86_64-linux-gnu/libbz2.so.1.0.4
 7f086aa71000-7f086aa72000 r--p 00010000 fd:01 11010296                   /=
lib/x86_64-linux-gnu/libbz2.so.1.0.4
 7f086aa72000-7f086aa73000 rw-p 00011000 fd:01 11010296                   /=
lib/x86_64-linux-gnu/libbz2.so.1.0.4
 7f086aa78000-7f086ab0d000 r--p 00000000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086ab0d000-7f086abff000 r-xp 00095000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086abff000-7f086ac48000 r--p 00187000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086ac48000-7f086ac49000 ---p 001d0000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086ac49000-7f086ac54000 r--p 001d0000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086ac54000-7f086ac57000 rw-p 001db000 fd:01 2623796                    /=
usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.26
 7f086ac57000-7f086ac5a000 rw-p 00000000 00:00 0 =

 7f086ac60000-7f086aca4000 r--p 00000000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086aca4000-7f086addc000 r-xp 00044000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086addc000-7f086ae23000 r--p 0017c000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086ae23000-7f086ae24000 ---p 001c3000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086ae24000-7f086ae2a000 r--p 001c3000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086ae2a000-7f086ae2b000 rw-p 001c9000 fd:01 2626298                    /=
usr/lib/x86_64-linux-gnu/libapt-pkg.so.5.0.2
 7f086ae30000-7f086ae31000 r--p 00000000 fd:01 2758579                    /=
usr/lib/python3.7/lib-dynload/_opcode.cpython-37m-x86_64-linux-gnu.so
 7f086ae31000-7f086ae32000 r-xp 00001000 fd:01 2758579                    /=
usr/lib/python3.7/lib-dynload/_opcode.cpython-37m-x86_64-linux-gnu.so
 7f086ae32000-7f086ae33000 r--p 00002000 fd:01 2758579                    /=
usr/lib/python3.7/lib-dynload/_opcode.cpython-37m-x86_64-linux-gnu.so
 7f086ae33000-7f086ae34000 r--p 00002000 fd:01 2758579                    /=
usr/lib/python3.7/lib-dynload/_opcode.cpython-37m-x86_64-linux-gnu.so
 7f086ae34000-7f086ae35000 rw-p 00003000 fd:01 2758579                    /=
usr/lib/python3.7/lib-dynload/_opcode.cpython-37m-x86_64-linux-gnu.so
 7f086ae38000-7f086ae41000 r--p 00000000 fd:01 2758580                    /=
usr/lib/python3.7/lib-dynload/_ssl.cpython-37m-x86_64-linux-gnu.so
 7f086ae41000-7f086ae49000 r-xp 00009000 fd:01 2758580                    /=
usr/lib/python3.7/lib-dynload/_ssl.cpython-37m-x86_64-linux-gnu.so
 7f086ae49000-7f086ae4f000 r--p 00011000 fd:01 2758580                    /=
usr/lib/python3.7/lib-dynload/_ssl.cpython-37m-x86_64-linux-gnu.so
 7f086ae4f000-7f086ae50000 r--p 00016000 fd:01 2758580                    /=
usr/lib/python3.7/lib-dynload/_ssl.cpython-37m-x86_64-linux-gnu.so
 7f086ae50000-7f086ae55000 rw-p 00017000 fd:01 2758580                    /=
usr/lib/python3.7/lib-dynload/_ssl.cpython-37m-x86_64-linux-gnu.so
 7f086ae58000-7f086ae6f000 r--p 00000000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086ae6f000-7f086ae8d000 r-xp 00017000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086ae8d000-7f086aea4000 r--p 00035000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086aea4000-7f086aea5000 ---p 0004c000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086aea5000-7f086aea7000 r--p 0004c000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086aea7000-7f086aeb0000 rw-p 0004e000 fd:01 2624741                    /=
usr/lib/python3/dist-packages/apt_pkg.cpython-37m-x86_64-linux-gnu.so
 7f086aeb0000-7f086aef0000 rw-p 00000000 00:00 0 =

 7f086aef0000-7f086aefe000 r--p 00000000 fd:01 2758626                    /=
usr/lib/python3/dist-packages/cairo/_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086aefe000-7f086af10000 r-xp 0000e000 fd:01 2758626                    /=
usr/lib/python3/dist-packages/cairo/_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086af10000-7f086af19000 r--p 00020000 fd:01 2758626                    /=
usr/lib/python3/dist-packages/cairo/_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086af19000-7f086af1a000 r--p 00028000 fd:01 2758626                    /=
usr/lib/python3/dist-packages/cairo/_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086af1a000-7f086af24000 rw-p 00029000 fd:01 2758626                    /=
usr/lib/python3/dist-packages/cairo/_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086af28000-7f086af2c000 r--p 00000000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af2c000-7f086af3b000 r-xp 00004000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af3b000-7f086af3e000 r--p 00013000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af3e000-7f086af3f000 ---p 00016000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af3f000-7f086af40000 r--p 00016000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af40000-7f086af41000 rw-p 00017000 fd:01 2625396                    /=
usr/lib/x86_64-linux-gnu/libbsd.so.0.9.1
 7f086af41000-7f086af42000 rw-p 00000000 00:00 0 =

 7f086af48000-7f086af4d000 r-xp 00000000 fd:01 2624172                    /=
usr/lib/x86_64-linux-gnu/libXdmcp.so.6.0.0
 7f086af4d000-7f086b14c000 ---p 00005000 fd:01 2624172                    /=
usr/lib/x86_64-linux-gnu/libXdmcp.so.6.0.0
 7f086b14c000-7f086b14d000 r--p 00004000 fd:01 2624172                    /=
usr/lib/x86_64-linux-gnu/libXdmcp.so.6.0.0
 7f086b14d000-7f086b14e000 rw-p 00005000 fd:01 2624172                    /=
usr/lib/x86_64-linux-gnu/libXdmcp.so.6.0.0
 7f086b150000-7f086b152000 r-xp 00000000 fd:01 2627113                    /=
usr/lib/x86_64-linux-gnu/libXau.so.6.0.0
 7f086b152000-7f086b352000 ---p 00002000 fd:01 2627113                    /=
usr/lib/x86_64-linux-gnu/libXau.so.6.0.0
 7f086b352000-7f086b353000 r--p 00002000 fd:01 2627113                    /=
usr/lib/x86_64-linux-gnu/libXau.so.6.0.0
 7f086b353000-7f086b354000 rw-p 00003000 fd:01 2627113                    /=
usr/lib/x86_64-linux-gnu/libXau.so.6.0.0
 7f086b358000-7f086b369000 r-xp 00000000 fd:01 2627126                    /=
usr/lib/x86_64-linux-gnu/libXext.so.6.4.0
 7f086b369000-7f086b568000 ---p 00011000 fd:01 2627126                    /=
usr/lib/x86_64-linux-gnu/libXext.so.6.4.0
 7f086b568000-7f086b569000 r--p 00010000 fd:01 2627126                    /=
usr/lib/x86_64-linux-gnu/libXext.so.6.4.0
 7f086b569000-7f086b56a000 rw-p 00011000 fd:01 2627126                    /=
usr/lib/x86_64-linux-gnu/libXext.so.6.4.0
 7f086b570000-7f086b588000 r--p 00000000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b588000-7f086b610000 r-xp 00018000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b610000-7f086b6a4000 r--p 000a0000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b6a4000-7f086b6a5000 ---p 00134000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b6a5000-7f086b6a6000 r--p 00134000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b6a6000-7f086b6aa000 rw-p 00135000 fd:01 2624054                    /=
usr/lib/x86_64-linux-gnu/libX11.so.6.3.0
 7f086b6b0000-7f086b6b9000 r-xp 00000000 fd:01 2626055                    /=
usr/lib/x86_64-linux-gnu/libXrender.so.1.3.0
 7f086b6b9000-7f086b8b8000 ---p 00009000 fd:01 2626055                    /=
usr/lib/x86_64-linux-gnu/libXrender.so.1.3.0
 7f086b8b8000-7f086b8b9000 r--p 00008000 fd:01 2626055                    /=
usr/lib/x86_64-linux-gnu/libXrender.so.1.3.0
 7f086b8b9000-7f086b8ba000 rw-p 00009000 fd:01 2626055                    /=
usr/lib/x86_64-linux-gnu/libXrender.so.1.3.0
 7f086b8c0000-7f086b8c5000 r--p 00000000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8c5000-7f086b8ca000 r-xp 00005000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8ca000-7f086b8cc000 r--p 0000a000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8cc000-7f086b8cd000 ---p 0000c000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8cd000-7f086b8ce000 r--p 0000c000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8ce000-7f086b8cf000 rw-p 0000d000 fd:01 2624444                    /=
usr/lib/x86_64-linux-gnu/libxcb-render.so.0.0.0
 7f086b8d0000-7f086b8db000 r--p 00000000 fd:01 2621875                    /=
usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
 7f086b8db000-7f086b8ee000 r-xp 0000b000 fd:01 2621875                    /=
usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
 7f086b8ee000-7f086b8f7000 r--p 0001e000 fd:01 2621875                    /=
usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
 7f086b8f7000-7f086b8f8000 r--p 00026000 fd:01 2621875                    /=
usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
 7f086b8f8000-7f086b8f9000 rw-p 00027000 fd:01 2621875                    /=
usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
 7f086b900000-7f086b905000 r--p 00000000 fd:01 2624103                    /=
usr/lib/x86_64-linux-gnu/libpng16.so.16.36.0
 7f086b905000-7f086b929000 r-xp 00005000 fd:01 2624103                    /=
usr/lib/x86_64-linux-gnu/libpng16.so.16.36.0
 7f086b929000-7f086b935000 r--p 00029000 fd:01 2624103                    /=
usr/lib/x86_64-linux-gnu/libpng16.so.16.36.0
 7f086b935000-7f086b936000 r--p 00034000 fd:01 2624103                    /=
usr/lib/x86_64-linux-gnu/libpng16.so.16.36.0
 7f086b936000-7f086b937000 rw-p 00035000 fd:01 2624103                    /=
usr/lib/x86_64-linux-gnu/libpng16.so.16.36.0
 7f086b938000-7f086b944000 r--p 00000000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b944000-7f086b9c1000 r-xp 0000c000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b9c1000-7f086b9ea000 r--p 00089000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b9ea000-7f086b9eb000 ---p 000b2000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b9eb000-7f086b9f2000 r--p 000b2000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b9f2000-7f086b9f3000 rw-p 000b9000 fd:01 2623278                    /=
usr/lib/x86_64-linux-gnu/libfreetype.so.6.16.1
 7f086b9f8000-7f086b9ff000 r--p 00000000 fd:01 2624788                    /=
usr/lib/x86_64-linux-gnu/libfontconfig.so.1.12.0
 7f086b9ff000-7f086ba23000 r-xp 00007000 fd:01 2624788                    /=
usr/lib/x86_64-linux-gnu/libfontconfig.so.1.12.0
 7f086ba23000-7f086ba3b000 r--p 0002b000 fd:01 2624788                    /=
usr/lib/x86_64-linux-gnu/libfontconfig.so.1.12.0
 7f086ba3b000-7f086ba3d000 r--p 00042000 fd:01 2624788                    /=
usr/lib/x86_64-linux-gnu/libfontconfig.so.1.12.0
 7f086ba3d000-7f086ba3e000 rw-p 00044000 fd:01 2624788                    /=
usr/lib/x86_64-linux-gnu/libfontconfig.so.1.12.0
 7f086ba40000-7f086ba4a000 r--p 00000000 fd:01 2621770                    /=
usr/lib/x86_64-linux-gnu/libpixman-1.so.0.36.0
 7f086ba4a000-7f086bacd000 r-xp 0000a000 fd:01 2621770                    /=
usr/lib/x86_64-linux-gnu/libpixman-1.so.0.36.0
 7f086bacd000-7f086badd000 r--p 0008d000 fd:01 2621770                    /=
usr/lib/x86_64-linux-gnu/libpixman-1.so.0.36.0
 7f086badd000-7f086bae5000 r--p 0009c000 fd:01 2621770                    /=
usr/lib/x86_64-linux-gnu/libpixman-1.so.0.36.0
 7f086bae5000-7f086bae6000 rw-p 000a4000 fd:01 2621770                    /=
usr/lib/x86_64-linux-gnu/libpixman-1.so.0.36.0
 7f086bae8000-7f086bafa000 r--p 00000000 fd:01 2624264                    /=
usr/lib/x86_64-linux-gnu/libcairo.so.2.11600.0
 7f086bafa000-7f086bbc6000 r-xp 00012000 fd:01 2624264                    /=
usr/lib/x86_64-linux-gnu/libcairo.so.2.11600.0
 7f086bbc6000-7f086bc02000 r--p 000de000 fd:01 2624264                    /=
usr/lib/x86_64-linux-gnu/libcairo.so.2.11600.0
 7f086bc02000-7f086bc06000 r--p 00119000 fd:01 2624264                    /=
usr/lib/x86_64-linux-gnu/libcairo.so.2.11600.0
 7f086bc06000-7f086bc07000 rw-p 0011d000 fd:01 2624264                    /=
usr/lib/x86_64-linux-gnu/libcairo.so.2.11600.0
 7f086bc07000-7f086bc08000 rw-p 00000000 00:00 0 =

 7f086bc10000-7f086bc13000 r--p 00000000 fd:01 11010272                   /=
lib/x86_64-linux-gnu/libgcc_s.so.1
 7f086bc13000-7f086bc24000 r-xp 00003000 fd:01 11010272                   /=
lib/x86_64-linux-gnu/libgcc_s.so.1
 7f086bc24000-7f086bc28000 r--p 00014000 fd:01 11010272                   /=
lib/x86_64-linux-gnu/libgcc_s.so.1
 7f086bc28000-7f086bc29000 r--p 00017000 fd:01 11010272                   /=
lib/x86_64-linux-gnu/libgcc_s.so.1
 7f086bc29000-7f086bc2a000 rw-p 00018000 fd:01 11010272                   /=
lib/x86_64-linux-gnu/libgcc_s.so.1
 7f086bc30000-7f086bc70000 rw-p 00000000 00:00 0 =

 7f086bc70000-7f086bc7a000 r--p 00000000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bc7a000-7f086bcae000 r-xp 0000a000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bcae000-7f086bcbe000 r--p 0003e000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bcbe000-7f086bcbf000 ---p 0004e000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bcbf000-7f086bcc4000 r--p 0004e000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bcc4000-7f086bcc5000 rw-p 00053000 fd:01 11010331                   /=
lib/x86_64-linux-gnu/libblkid.so.1.1.0
 7f086bcc8000-7f086bccc000 r--p 00000000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bccc000-7f086bcdb000 r-xp 00004000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bcdb000-7f086bcde000 r--p 00013000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bcde000-7f086bcdf000 ---p 00016000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bcdf000-7f086bce0000 r--p 00016000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bce0000-7f086bce1000 rw-p 00017000 fd:01 11010530                   /=
lib/x86_64-linux-gnu/libresolv-2.29.so
 7f086bce1000-7f086bce3000 rw-p 00000000 00:00 0 =

 7f086bce8000-7f086bcee000 r--p 00000000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bcee000-7f086bd06000 r-xp 00006000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bd06000-7f086bd0d000 r--p 0001e000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bd0d000-7f086bd0e000 ---p 00025000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bd0e000-7f086bd0f000 r--p 00025000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bd0f000-7f086bd10000 rw-p 00026000 fd:01 11010270                   /=
lib/x86_64-linux-gnu/libselinux.so.1
 7f086bd10000-7f086bd12000 rw-p 00000000 00:00 0 =

 7f086bd18000-7f086bd23000 r--p 00000000 fd:01 11010466                   /=
lib/x86_64-linux-gnu/libmount.so.1.1.0
 7f086bd23000-7f086bd5e000 r-xp 0000b000 fd:01 11010466                   /=
lib/x86_64-linux-gnu/libmount.so.1.1.0
 7f086bd5e000-7f086bd70000 r--p 00046000 fd:01 11010466                   /=
lib/x86_64-linux-gnu/libmount.so.1.1.0
 7f086bd70000-7f086bd73000 r--p 00057000 fd:01 11010466                   /=
lib/x86_64-linux-gnu/libmount.so.1.1.0
 7f086bd73000-7f086bd74000 rw-p 0005a000 fd:01 11010466                   /=
lib/x86_64-linux-gnu/libmount.so.1.1.0
 7f086bd78000-7f086bdaf000 r--p 00000000 fd:01 2621583                    /=
usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6000.4
 7f086bdaf000-7f086beb0000 r-xp 00037000 fd:01 2621583                    /=
usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6000.4
 7f086beb0000-7f086bf36000 r--p 00138000 fd:01 2621583                    /=
usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6000.4
 7f086bf36000-7f086bf3e000 r--p 001bd000 fd:01 2621583                    /=
usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6000.4
 7f086bf3e000-7f086bf3f000 rw-p 001c5000 fd:01 2621583                    /=
usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6000.4
 7f086bf3f000-7f086bf41000 rw-p 00000000 00:00 0 =

 7f086bf48000-7f086bfb9000 r-xp 00000000 fd:01 11010538                   /=
lib/x86_64-linux-gnu/libpcre.so.3.13.3
 7f086bfb9000-7f086c1b8000 ---p 00071000 fd:01 11010538                   /=
lib/x86_64-linux-gnu/libpcre.so.3.13.3
 7f086c1b8000-7f086c1b9000 r--p 00070000 fd:01 11010538                   /=
lib/x86_64-linux-gnu/libpcre.so.3.13.3
 7f086c1b9000-7f086c1ba000 rw-p 00071000 fd:01 11010538                   /=
lib/x86_64-linux-gnu/libpcre.so.3.13.3
 7f086c1c0000-7f086c1c7000 r--p 00000000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1c7000-7f086c1e7000 r-xp 00007000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1e7000-7f086c1f4000 r--p 00027000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1f4000-7f086c1f5000 ---p 00034000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1f5000-7f086c1f6000 r--p 00034000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1f6000-7f086c1f7000 rw-p 00035000 fd:01 2621912                    /=
usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
 7f086c1f8000-7f086c213000 r--p 00000000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c213000-7f086c293000 r-xp 0001b000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c293000-7f086c315000 r--p 0009b000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c315000-7f086c316000 ---p 0011d000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c316000-7f086c317000 r--p 0011d000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c317000-7f086c318000 rw-p 0011e000 fd:01 2621584                    /=
usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6000.4
 7f086c318000-7f086c319000 rw-p 00000000 00:00 0 =

 7f086c31a000-7f086c35a000 rw-p 00000000 00:00 0 =

 7f086c360000-7f086c362000 r--p 00000000 fd:01 11010327                   /=
lib/x86_64-linux-gnu/libuuid.so.1.3.0
 7f086c362000-7f086c366000 r-xp 00002000 fd:01 11010327                   /=
lib/x86_64-linux-gnu/libuuid.so.1.3.0
 7f086c366000-7f086c367000 r--p 00006000 fd:01 11010327                   /=
lib/x86_64-linux-gnu/libuuid.so.1.3.0
 7f086c367000-7f086c368000 r--p 00006000 fd:01 11010327                   /=
lib/x86_64-linux-gnu/libuuid.so.1.3.0
 7f086c368000-7f086c369000 rw-p 00007000 fd:01 11010327                   /=
lib/x86_64-linux-gnu/libuuid.so.1.3.0
 7f086c370000-7f086c37e000 r--p 00000000 fd:01 2621586                    /=
usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.6000.4
 7f086c37e000-7f086c3b0000 r-xp 0000e000 fd:01 2621586                    /=
usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.6000.4
 7f086c3b0000-7f086c3c8000 r--p 00040000 fd:01 2621586                    /=
usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.6000.4
 7f086c3c8000-7f086c3cb000 r--p 00057000 fd:01 2621586                    /=
usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.6000.4
 7f086c3cb000-7f086c3cc000 rw-p 0005a000 fd:01 2621586                    /=
usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.6000.4
 7f086c3d0000-7f086c3d2000 r--p 00000000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3d2000-7f086c3d5000 r-xp 00002000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3d5000-7f086c3d6000 r--p 00005000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3d6000-7f086c3d7000 ---p 00006000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3d7000-7f086c3d8000 r--p 00006000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3d8000-7f086c3d9000 rw-p 00007000 fd:01 2758578                    /=
usr/lib/python3.7/lib-dynload/_hashlib.cpython-37m-x86_64-linux-gnu.so
 7f086c3e0000-7f086c3e4000 r--p 00000000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3e4000-7f086c3e6000 r-xp 00004000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3e6000-7f086c3e8000 r--p 00006000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3e8000-7f086c3e9000 ---p 00008000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3e9000-7f086c3eb000 r--p 00008000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3eb000-7f086c3ec000 rw-p 0000a000 fd:01 2625983                    /=
usr/lib/x86_64-linux-gnu/libcairo-gobject.so.2.11600.0
 7f086c3f0000-7f086c3f2000 r--p 00000000 fd:01 2756638                    /=
usr/lib/python3/dist-packages/gi/_gi_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086c3f2000-7f086c3f4000 r-xp 00002000 fd:01 2756638                    /=
usr/lib/python3/dist-packages/gi/_gi_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086c3f4000-7f086c3f5000 r--p 00004000 fd:01 2756638                    /=
usr/lib/python3/dist-packages/gi/_gi_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086c3f5000-7f086c3f6000 r--p 00004000 fd:01 2756638                    /=
usr/lib/python3/dist-packages/gi/_gi_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086c3f6000-7f086c3f7000 rw-p 00005000 fd:01 2756638                    /=
usr/lib/python3/dist-packages/gi/_gi_cairo.cpython-37m-x86_64-linux-gnu.so
 7f086c3f8000-7f086c407000 r--p 00000000 fd:01 2755379                    /=
usr/lib/python3/dist-packages/gi/_gi.cpython-37m-x86_64-linux-gnu.so
 7f086c407000-7f086c431000 r-xp 0000f000 fd:01 2755379                    /=
usr/lib/python3/dist-packages/gi/_gi.cpython-37m-x86_64-linux-gnu.so
 7f086c431000-7f086c441000 r--p 00039000 fd:01 2755379                    /=
usr/lib/python3/dist-packages/gi/_gi.cpython-37m-x86_64-linux-gnu.so
 7f086c441000-7f086c443000 r--p 00048000 fd:01 2755379                    /=
usr/lib/python3/dist-packages/gi/_gi.cpython-37m-x86_64-linux-gnu.so
 7f086c443000-7f086c44a000 rw-p 0004a000 fd:01 2755379                    /=
usr/lib/python3/dist-packages/gi/_gi.cpython-37m-x86_64-linux-gnu.so
 7f086c451000-7f086c4d1000 rw-p 00000000 00:00 0 =

 7f086c4d8000-7f086c4df000 r--p 00000000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c4df000-7f086c4ed000 r-xp 00007000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c4ed000-7f086c4f3000 r--p 00015000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c4f3000-7f086c4f4000 ---p 0001b000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c4f4000-7f086c4f5000 r--p 0001b000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c4f5000-7f086c502000 rw-p 0001c000 fd:01 2627042                    /=
usr/lib/python3/dist-packages/_dbus_bindings.cpython-37m-x86_64-linux-gnu.so
 7f086c508000-7f086c50c000 r--p 00000000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c50c000-7f086c510000 r-xp 00004000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c510000-7f086c513000 r--p 00008000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c513000-7f086c514000 ---p 0000b000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c514000-7f086c515000 r--p 0000b000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c515000-7f086c516000 rw-p 0000c000 fd:01 2623197                    /=
usr/lib/python3/dist-packages/apt_inst.cpython-37m-x86_64-linux-gnu.so
 7f086c51a000-7f086c67b000 rw-p 00000000 00:00 0 =

 7f086c680000-7f086c681000 r--p 00000000 fd:01 2623001                    /=
usr/lib/x86_64-linux-gnu/libxcb-shm.so.0.0.0
 7f086c681000-7f086c682000 r-xp 00001000 fd:01 2623001                    /=
usr/lib/x86_64-linux-gnu/libxcb-shm.so.0.0.0
 7f086c682000-7f086c683000 r--p 00002000 fd:01 2623001                    /=
usr/lib/x86_64-linux-gnu/libxcb-shm.so.0.0.0
 7f086c683000-7f086c684000 r--p 00002000 fd:01 2623001                    /=
usr/lib/x86_64-linux-gnu/libxcb-shm.so.0.0.0
 7f086c684000-7f086c685000 rw-p 00003000 fd:01 2623001                    /=
usr/lib/x86_64-linux-gnu/libxcb-shm.so.0.0.0
 7f086c688000-7f086c68b000 r--p 00000000 fd:01 11010600                   /=
lib/x86_64-linux-gnu/librt-2.29.so
 7f086c68b000-7f086c68f000 r-xp 00003000 fd:01 11010600                   /=
lib/x86_64-linux-gnu/librt-2.29.so
 7f086c68f000-7f086c691000 r--p 00007000 fd:01 11010600                   /=
lib/x86_64-linux-gnu/librt-2.29.so
 7f086c691000-7f086c692000 r--p 00008000 fd:01 11010600                   /=
lib/x86_64-linux-gnu/librt-2.29.so
 7f086c692000-7f086c693000 rw-p 00009000 fd:01 11010600                   /=
lib/x86_64-linux-gnu/librt-2.29.so
 7f086c698000-7f086c699000 r--p 00000000 fd:01 2621585                    /=
usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.6000.4
 7f086c699000-7f086c69b000 r-xp 00001000 fd:01 2621585                    /=
usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.6000.4
 7f086c69b000-7f086c69c000 r--p 00003000 fd:01 2621585                    /=
usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.6000.4
 7f086c69c000-7f086c69d000 r--p 00003000 fd:01 2621585                    /=
usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.6000.4
 7f086c69d000-7f086c69e000 rw-p 00004000 fd:01 2621585                    /=
usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.6000.4
 7f086c6a0000-7f086c7e0000 rw-p 00000000 00:00 0 =

 7f086c7e0000-7f086cda2000 r--p 00000000 fd:01 2622412                    /=
usr/lib/locale/locale-archive
 7f086cda8000-7f086cdb7000 r--p 00000000 fd:01 11010315                   /=
lib/x86_64-linux-gnu/libm-2.29.so
 7f086cdb7000-7f086ce5d000 r-xp 0000f000 fd:01 11010315                   /=
lib/x86_64-linux-gnu/libm-2.29.so
 7f086ce5d000-7f086cef4000 r--p 000b5000 fd:01 11010315                   /=
lib/x86_64-linux-gnu/libm-2.29.so
 7f086cef4000-7f086cef5000 r--p 0014b000 fd:01 11010315                   /=
lib/x86_64-linux-gnu/libm-2.29.so
 7f086cef5000-7f086cef6000 rw-p 0014c000 fd:01 11010315                   /=
lib/x86_64-linux-gnu/libm-2.29.so
 7f086cef8000-7f086cefa000 r--p 00000000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cefa000-7f086cf0b000 r-xp 00002000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cf0b000-7f086cf11000 r--p 00013000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cf11000-7f086cf12000 ---p 00019000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cf12000-7f086cf13000 r--p 00019000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cf13000-7f086cf14000 rw-p 0001a000 fd:01 11010324                   /=
lib/x86_64-linux-gnu/libz.so.1.2.11
 7f086cf18000-7f086cf1c000 r--p 00000000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf1c000-7f086cf3d000 r-xp 00004000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf3d000-7f086cf51000 r--p 00025000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf51000-7f086cf52000 ---p 00039000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf52000-7f086cf54000 r--p 00039000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf54000-7f086cf55000 rw-p 0003b000 fd:01 11010519                   /=
lib/x86_64-linux-gnu/libexpat.so.1.6.8
 7f086cf58000-7f086cf59000 r--p 00000000 fd:01 11010609                   /=
lib/x86_64-linux-gnu/libutil-2.29.so
 7f086cf59000-7f086cf5a000 r-xp 00001000 fd:01 11010609                   /=
lib/x86_64-linux-gnu/libutil-2.29.so
 7f086cf5a000-7f086cf5b000 r--p 00002000 fd:01 11010609                   /=
lib/x86_64-linux-gnu/libutil-2.29.so
 7f086cf5b000-7f086cf5c000 r--p 00002000 fd:01 11010609                   /=
lib/x86_64-linux-gnu/libutil-2.29.so
 7f086cf5c000-7f086cf5d000 rw-p 00003000 fd:01 11010609                   /=
lib/x86_64-linux-gnu/libutil-2.29.so
 7f086cf60000-7f086cf61000 r--p 00000000 fd:01 11010305                   /=
lib/x86_64-linux-gnu/libdl-2.29.so
 7f086cf61000-7f086cf63000 r-xp 00001000 fd:01 11010305                   /=
lib/x86_64-linux-gnu/libdl-2.29.so
 7f086cf63000-7f086cf64000 r--p 00003000 fd:01 11010305                   /=
lib/x86_64-linux-gnu/libdl-2.29.so
 7f086cf64000-7f086cf65000 r--p 00003000 fd:01 11010305                   /=
lib/x86_64-linux-gnu/libdl-2.29.so
 7f086cf65000-7f086cf66000 rw-p 00004000 fd:01 11010305                   /=
lib/x86_64-linux-gnu/libdl-2.29.so
 7f086cf68000-7f086cf6f000 r--p 00000000 fd:01 11010525                   /=
lib/x86_64-linux-gnu/libpthread-2.29.so
 7f086cf6f000-7f086cf7e000 r-xp 00007000 fd:01 11010525                   /=
lib/x86_64-linux-gnu/libpthread-2.29.so
 7f086cf7e000-7f086cf83000 r--p 00016000 fd:01 11010525                   /=
lib/x86_64-linux-gnu/libpthread-2.29.so
 7f086cf83000-7f086cf84000 r--p 0001a000 fd:01 11010525                   /=
lib/x86_64-linux-gnu/libpthread-2.29.so
 7f086cf84000-7f086cf85000 rw-p 0001b000 fd:01 11010525                   /=
lib/x86_64-linux-gnu/libpthread-2.29.so
 7f086cf85000-7f086cf89000 rw-p 00000000 00:00 0 =

 7f086cf90000-7f086cfb5000 r--p 00000000 fd:01 11010130                   /=
lib/x86_64-linux-gnu/libc-2.29.so
 7f086cfb5000-7f086d128000 r-xp 00025000 fd:01 11010130                   /=
lib/x86_64-linux-gnu/libc-2.29.so
 7f086d128000-7f086d171000 r--p 00198000 fd:01 11010130                   /=
lib/x86_64-linux-gnu/libc-2.29.so
 7f086d171000-7f086d174000 r--p 001e0000 fd:01 11010130                   /=
lib/x86_64-linux-gnu/libc-2.29.so
 7f086d174000-7f086d177000 rw-p 001e3000 fd:01 11010130                   /=
lib/x86_64-linux-gnu/libc-2.29.so
 7f086d177000-7f086d17b000 rw-p 00000000 00:00 0 =

 7f086d17d000-7f086d180000 rw-p 00000000 00:00 0 =

 7f086d188000-7f086d18a000 r--p 00000000 fd:01 2627514                    /=
usr/lib/x86_64-linux-gnu/libffi.so.6.0.4
 7f086d18a000-7f086d18f000 r-xp 00002000 fd:01 2627514                    /=
usr/lib/x86_64-linux-gnu/libffi.so.6.0.4
 7f086d18f000-7f086d190000 r--p 00007000 fd:01 2627514                    /=
usr/lib/x86_64-linux-gnu/libffi.so.6.0.4
 7f086d190000-7f086d191000 r--p 00007000 fd:01 2627514                    /=
usr/lib/x86_64-linux-gnu/libffi.so.6.0.4
 7f086d191000-7f086d192000 rw-p 00008000 fd:01 2627514                    /=
usr/lib/x86_64-linux-gnu/libffi.so.6.0.4
 7f086d198000-7f086d19f000 r--s 00000000 fd:01 3022083                    /=
usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
 7f086d1a6000-7f086d1a8000 rw-p 00000000 00:00 0 =

 7f086d1a8000-7f086d1a9000 r--p 00000000 fd:01 11010105                   /=
lib/x86_64-linux-gnu/ld-2.29.so
 7f086d1a9000-7f086d1ca000 r-xp 00001000 fd:01 11010105                   /=
lib/x86_64-linux-gnu/ld-2.29.so
 7f086d1ca000-7f086d1d2000 r--p 00022000 fd:01 11010105                   /=
lib/x86_64-linux-gnu/ld-2.29.so
 7f086d1d2000-7f086d1d3000 r--p 00029000 fd:01 11010105                   /=
lib/x86_64-linux-gnu/ld-2.29.so
 7f086d1d3000-7f086d1d4000 rw-p 0002a000 fd:01 11010105                   /=
lib/x86_64-linux-gnu/ld-2.29.so
 7f086d1d4000-7f086d1d5000 rw-p 00000000 00:00 0 =

 7f086d1d6000-7f086d1d8000 rw-p 00000000 00:00 0 =

 7ffc51666000-7ffc51687000 rw-p 00000000 00:00 0                          [=
stack]
 7ffc51790000-7ffc51793000 r--p 00000000 00:00 0                          [=
vvar]
 7ffc51793000-7ffc51794000 r-xp 00000000 00:00 0                          [=
vdso]
ProcStatus:
 Name:	session-install
 Umask:	0022
 State:	R (running)
 Tgid:	5886
 Ngid:	0
 Pid:	5886
 PPid:	5885
 TracerPid:	0
 Uid:	0	0	0	0
 Gid:	0	0	0	0
 FDSize:	64
 Groups:	0 =

 NStgid:	5886
 NSpid:	5886
 NSpgid:	3350
 NSsid:	3350
 VmPeak:	   63740 kB
 VmSize:	   63740 kB
 VmLck:	       0 kB
 VmPin:	       0 kB
 VmHWM:	   30236 kB
 VmRSS:	   30236 kB
 RssAnon:	   13316 kB
 RssFile:	   16920 kB
 RssShmem:	       0 kB
 VmData:	   13496 kB
 VmStk:	     132 kB
 VmExe:	    2388 kB
 VmLib:	   15956 kB
 VmPTE:	     156 kB
 VmSwap:	       0 kB
 HugetlbPages:	       0 kB
 CoreDumping:	0
 THP_enabled:	1
 Threads:	1
 SigQ:	0/127980
 SigPnd:	0000000000000000
 ShdPnd:	0000000000000000
 SigBlk:	0000000000000000
 SigIgn:	0000000001001000
 SigCgt:	0000000180000002
 CapInh:	0000000000000000
 CapPrm:	0000003fffffffff
 CapEff:	0000003fffffffff
 CapBnd:	0000003fffffffff
 CapAmb:	0000000000000000
 NoNewPrivs:	0
 Seccomp:	0
 Speculation_Store_Bypass:	globally mitigated
 Cpus_allowed:	ff
 Cpus_allowed_list:	0-7
 Mems_allowed:	00000000,00000000,00000000,00000000,00000000,00000000,000000=
00,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,=
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,000=
00000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,000000=
01
 Mems_allowed_list:	0
 voluntary_ctxt_switches:	87
 nonvoluntary_ctxt_switches:	54
PythonArgs: ['/usr/bin/session-installer']
Traceback:
 Traceback (most recent call last):
   File "/usr/bin/session-installer", line 23, in <module>
     from sessioninstaller.core import main
   File "/usr/lib/python3/dist-packages/sessioninstaller/core.py", line 47,=
 in <module>
     gi.require_version('GtK', '3.0')
   File "/usr/lib/python3/dist-packages/gi/__init__.py", line 129, in requi=
re_version
     raise ValueError('Namespace %s not available' % namespace)
 ValueError: Namespace GtK not available
UserGroups: =

_LogindSession: c3

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838312

Title:
  Qemu virt-manager Segmentation fault

Status in QEMU:
  Invalid
Status in virt-manager package in Ubuntu:
  Incomplete

Bug description:
  Hi!

  I installed all these packages:

  sudo apt install qemu
  sudo apt install ipxe-qemu-256k-compat-efi-roms libspice-server1 libbluet=
ooth3
  sudo apt install libbrlapi0.6 libcacard0 libfdt1 libusbredirparser1 libvi=
rglrenderer0 libxen-4.9 libxenstore3.0
  sudo apt install cpu-checker ibverbs-providers ipxe-qemu libibverbs1 libi=
scsi7 libnl-route-3-200 librados2 librbd1 librdmacm1 msr-tools sharutils
  sudo apt install qemu-block-extra qemu-system-common qemu-system-data qem=
u-system-gui qemu-utils
  sudo apt install --no-install-recommends qemu-kvm qemu-system-x86
  sudo apt install libauparse0 ebtables gir1.2-gtk-vnc-2.0 gir1.2-libosinfo=
-1.0 gir1.2-libvirt-glib-1.0 gir1.2-spiceclientglib-2.0 gir1.2-spiceclientg=
tk-3.0 libvde0 libvdeplug2 libgovirt-common libgovirt2 libgtk-vnc-2.0-0 lib=
gvnc-1.0-0 libosinfo-1.0-0 libphodav-2.0-0 libphodav-2.0-common libspice-cl=
ient-glib-2.0-8 libspice-client-gtk-3.0-5 libusbredirhost1 libvirt-clients =
libvirt-daemon libvirt-daemon-driver-storage-rbd libvirt-daemon-system libv=
irt-glib-1.0-0 libvirt0 osinfo-db python3-libvirt python3-libxml2 spice-cli=
ent-glib-usb-acl-helper vde2 vde2-cryptcab virt-viewer virtinst virt-manager

  without the i386 packages for Qemu because I want only 64 bit.

  I installed all these packages without error, but when I run

  # virt-manager

  Output: ...shows me:

  Segmentation fault

  =

  My hardware is 100% ok.
  Maybee a broken lib?


  How can I fix that?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838312/+subscriptions

