Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF22AFFB5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 07:37:21 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6ES-0004EZ-EL
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 01:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6D2-0003QO-3i
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:35:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:50010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6Cu-0008PC-Gh
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:35:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd6Cp-0001hk-Aw
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:35:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 511672E812F
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:35:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 06:26:07 -0000
From: Thomas Huth <1794086@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: o-andriyanov th-huth
X-Launchpad-Bug-Reporter: Oleg Andriyanov (o-andriyanov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153779469711.24405.12458384472320713523.malonedeb@gac.canonical.com>
Message-Id: <160516236762.5334.479992863222782588.malone@soybean.canonical.com>
Subject: [Bug 1794086] Re: readlink(2) returns incorrect size for
 /proc/self/exe
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 3cec78da96673b87c2b5e6368f48c3ad052c720e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1794086 <1794086@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1794086

Title:
  readlink(2) returns incorrect size for /proc/self/exe

Status in QEMU:
  Incomplete

Bug description:
  readlink(2) seems to ignore the size of supplied buffer for the
  resolved name and always returns the actual size of the resolved name
  instead.

  Steps to reproduce:

  ```bash
  echo '#include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>

  int main(int argc, const char** argv)
  {
      if(argc < 2) exit(1);
      char buf[1];
      printf("%d\n", readlink(argv[1], buf, sizeof(buf)));
  }' >test.c

  # I used GCC mipsel cross-compiler to reproduce this bug
  mipsel-linux-gnu-gcc-5.5 test.c -o a.out

  echo "PWD: `pwd`"
  qemu-mipsel ./a.out /proc/self/exe
  ```

  Expected output (observed when running a.out natively on Linux 4.17 amd64=
):
  ```
  PWD: /tmp/test
  1
  ```

  Output observed when running with qemu-mipsel 2.1.2:
  ```
  PWD: /tmp/test
  15
  ```

  According to POSIX description of readlink [1], the function shall
  return the number of bytes written to the supplied buffer, which
  obviously cannot exceed size of the buffer.

  Note that the bug is only reproduced with links within /proc
  filesystem; links to the regular files within /home are resolved
  normally.

  The bug is present in qemu-mipsel 2.1.2:

  # qemu-mipsel -version
  qemu-mipsel version 2.1.2 (Debian 1:2.1+dfsg-12+deb8u6), Copyright (c) 20=
03-2008 Fabrice Bellard

  [1]:
  http://pubs.opengroup.org/onlinepubs/009695399/functions/readlink.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1794086/+subscriptions

