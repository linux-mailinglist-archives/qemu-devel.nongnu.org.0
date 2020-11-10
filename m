Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8322ADAE4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:52:08 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVwF-0002DG-Jq
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVuu-0000vc-Cy
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:50:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:51086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVus-0007yC-Kd
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcVur-0003vv-2K
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F03232E8079
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 15:42:33 -0000
From: Thomas Huth <1761153@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mgautierfr th-huth
X-Launchpad-Bug-Reporter: Matthieu Gautier (mgautierfr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152284551397.28710.6742910020765706357.malonedeb@chaenomeles.canonical.com>
Message-Id: <160502295364.18737.18369796673484640829.malone@soybean.canonical.com>
Subject: [Bug 1761153] Re: qemu-user incorrect mmap for large files on 64bits
 host and 32bits executable.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 3c4fee517a6330c239a623570efbcdfec3b808f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1761153 <1761153@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1761153

Title:
  qemu-user incorrect mmap for large files on 64bits host and 32bits
  executable.

Status in QEMU:
  Incomplete

Bug description:
  qemu-user seems to incorrectly mmap a file if the offset is > 4GiB and
  guest binary is 32 bits elf.

  See attached test program `test_mmap.c`.

  ```
  $ gcc -g -m32 -march=3Di386 test_mmap.c -o test_mmap
  $ file test_mmap
  test_mmap: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dyna=
mically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0, BuildI=
D[sha1]=3De36db05f4dfd8a9cfde8a969214a242c1f5a4b49, with debug_info, not st=
ripped
  $ uname -a
  Linux localhost.localdomain 4.15.10-300.fc27.x86_64 #1 SMP Thu Mar 15 17:=
13:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
  $ qemu-i386 --version
  qemu-i386 version 2.10.1(qemu-2.10.1-2.fc27)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
  $ ./test_mmap
  $ qemu-i386 test_mmap
  Incorrect data 1
  ```

  Tested with qemu-i386 packaged in Fedora 27 and qemu-i386 compiled
  from git master (094b62cd9c)

  The issue was firstly detected on (more complex program) using qemu-
  arm (with 32bits binary) so it is probably a 32/64bits problem
  independently of the cpu family.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1761153/+subscriptions

