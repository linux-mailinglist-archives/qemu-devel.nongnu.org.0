Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D23C6964
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:33:35 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A6w-0006gn-JG
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zl-0006o4-Jm
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:26:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zj-0008U6-V8
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:26:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zW-0003ex-77
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BFC922E81AC
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1915327@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: iii-i janitor th-huth
X-Launchpad-Bug-Reporter: Ilya Leoshkevich (iii-i)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161298968608.29108.9925609875505640314.malonedeb@soybean.canonical.com>
Message-Id: <162614984350.15811.8705644630794054093.malone@loganberry.canonical.com>
Subject: [Bug 1915327] Re: x86_64 cmpxchg behavior in qemu tcg does not match
 the real CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 992a6aeb3e7face4548938a2682ede626a13e081
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1915327 <1915327@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915327

Title:
  x86_64 cmpxchg behavior in qemu tcg does not match the real CPU

Status in QEMU:
  Expired

Bug description:
  QEMU version:
  1214d55d1c (HEAD, origin/master, origin/HEAD) Merge remote-tracking branc=
h 'remotes/nvme/tags/nvme-next-pull-request' into staging

  Consider the following little program:

  $ cat 1.c
  #include <stdio.h>
  int main() {
    int mem =3D 0x12345678;
    register long rax asm("rax") =3D 0x1234567812345678;
    register int edi asm("edi") =3D 0x77777777;
    asm("cmpxchg %[edi],%[mem]"
        : [ mem ] "+m"(mem), [ rax ] "+r"(rax)
        : [ edi ] "r"(edi));
    long rax2 =3D rax;
    printf("rax2 =3D %lx\n", rax2);
  }

  According to the Intel Manual, cmpxchg should not touch the
  accumulator in case the values are equal, which is indeed the case on
  the real CPU:

  $ gcc 1.c
  $ ./a.out =

  rax2 =3D 1234567812345678

  However, QEMU appears to zero extend EAX to RAX:

  $ qemu-x86_64 ./a.out =

  rax2 =3D 12345678

  This is also the case for lock cmpxchg.

  Found in BPF development context:
  https://lore.kernel.org/bpf/b1792bb3c51eb3e94b9d27e67665d3f2209bba7e.came=
l@linux.ibm.com

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915327/+subscriptions

