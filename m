Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A1614F794
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 12:07:14 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixqcK-0002Yc-Jy
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 06:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ixqbY-00026b-MA
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 06:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ixqbX-0001cW-8s
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 06:06:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:56866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ixqbX-0001WZ-3T
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 06:06:23 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ixqbV-0001r6-L4
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 11:06:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 92E8A2E80C0
 for <qemu-devel@nongnu.org>; Sat,  1 Feb 2020 11:06:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Feb 2020 10:59:09 -0000
From: Sergey Lunkin <1861551@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: unclegluk
X-Launchpad-Bug-Reporter: Sergey Lunkin (unclegluk)
X-Launchpad-Bug-Modifier: Sergey Lunkin (unclegluk)
Message-Id: <158055475004.19181.5169686507307672959.malonedeb@gac.canonical.com>
Subject: [Bug 1861551] [NEW] Errors while compiling source
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 99ff04f539692c1a4dd626e0f07e86f423a57a03
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1861551 <1861551@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

OS type: Mac OS X 10.11.6
List of errors:
qemu-io-cmds.c:837:5: warning: implicit declaration of function 'clock_gett=
ime' is invalid in C99 [-Wimplicit-function-declaration]
    clock_gettime(CLOCK_MONOTONIC, &t1);
    ^
qemu-io-cmds.c:837:19: error: use of undeclared identifier 'CLOCK_MONOTONIC'
    clock_gettime(CLOCK_MONOTONIC, &t1);
                  ^
qemu-io-cmds.c:843:19: error: use of undeclared identifier 'CLOCK_MONOTONIC'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:970:19: error: use of undeclared identifier 'CLOCK_MONOTONIC'
    clock_gettime(CLOCK_MONOTONIC, &t1);
                  ^
qemu-io-cmds.c:972:19: error: use of undeclared identifier 'CLOCK_MONOTONIC'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:1184:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t1);
                  ^
qemu-io-cmds.c:1194:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:1306:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t1);
                  ^
qemu-io-cmds.c:1308:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:1351:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:1383:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
qemu-io-cmds.c:1518:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
                  ^
qemu-io-cmds.c:1663:23: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
        clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
                      ^
qemu-io-cmds.c:1885:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t1);
                  ^
qemu-io-cmds.c:1887:19: error: use of undeclared identifier 'CLOCK_MONOTONI=
C'
    clock_gettime(CLOCK_MONOTONIC, &t2);
                  ^
1 warning and 14 errors generated.
make: *** [qemu-io-cmds.o] Error 1

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861551

Title:
  Errors while compiling source

Status in QEMU:
  New

Bug description:
  OS type: Mac OS X 10.11.6
  List of errors:
  qemu-io-cmds.c:837:5: warning: implicit declaration of function 'clock_ge=
ttime' is invalid in C99 [-Wimplicit-function-declaration]
      clock_gettime(CLOCK_MONOTONIC, &t1);
      ^
  qemu-io-cmds.c:837:19: error: use of undeclared identifier 'CLOCK_MONOTON=
IC'
      clock_gettime(CLOCK_MONOTONIC, &t1);
                    ^
  qemu-io-cmds.c:843:19: error: use of undeclared identifier 'CLOCK_MONOTON=
IC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:970:19: error: use of undeclared identifier 'CLOCK_MONOTON=
IC'
      clock_gettime(CLOCK_MONOTONIC, &t1);
                    ^
  qemu-io-cmds.c:972:19: error: use of undeclared identifier 'CLOCK_MONOTON=
IC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:1184:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t1);
                    ^
  qemu-io-cmds.c:1194:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:1306:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t1);
                    ^
  qemu-io-cmds.c:1308:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:1351:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:1383:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  qemu-io-cmds.c:1518:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
                    ^
  qemu-io-cmds.c:1663:23: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
          clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
                        ^
  qemu-io-cmds.c:1885:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t1);
                    ^
  qemu-io-cmds.c:1887:19: error: use of undeclared identifier 'CLOCK_MONOTO=
NIC'
      clock_gettime(CLOCK_MONOTONIC, &t2);
                    ^
  1 warning and 14 errors generated.
  make: *** [qemu-io-cmds.o] Error 1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861551/+subscriptions

