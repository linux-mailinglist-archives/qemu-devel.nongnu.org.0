Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5C37975B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:03:50 +0200 (CEST)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBBy-0001W0-OA
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgB9G-0006cO-Cp
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:00:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:42234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgB99-0000QH-NE
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgB96-00018n-L4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E4DE2E8186
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 18:53:25 -0000
From: Thomas Huth <1908062@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qiuhao th-huth
X-Launchpad-Bug-Reporter: Qiuhao Li (qiuhao)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160794824793.5567.9855788232054277622.malonedeb@gac.canonical.com>
Message-Id: <162067280541.6615.2505449057779726897.malone@gac.canonical.com>
Subject: [Bug 1908062] Re: qemu-system-i386 virtio-vga: Assertion in
 address_space_stw_le_cached failed again
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 23d2290f9d624771bc7255664fd13f50068c5e4b
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
Reply-To: Bug 1908062 <1908062@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908062

Title:
  qemu-system-i386 virtio-vga: Assertion in address_space_stw_le_cached
  failed again

Status in QEMU:
  Incomplete

Bug description:
  When I was fuzzing virtio-vga device of the latest QEMU (1758428, Dec
  12, built with --enable-sanitizers --enable-fuzzing), an assertion
  failed in include/exec/memory_ldst_cached.h.inc.

  --[ Reproducer

  cat << EOF | ./build/i386-softmmu/qemu-system-i386 -machine accel=3Dqtest=
 \
  -machine q35 -display none -nodefaults -device virtio-vga -qtest stdio
  outl 0xcf8 0x8000081c
  outb 0xcfc 0xc3
  outl 0xcf8 0x80000804
  outb 0xcfc 0x06
  write 0xc300001024 0x2 0x0040
  write 0xc300001028 0x1 0x5a
  write 0xc30000101c 0x1 0x01
  writel 0xc30000100c 0x20000000
  write 0xc300001016 0x3 0x80a080
  write 0xc300003002 0x1 0x80
  write 0x5c 0x1 0x10
  EOF

  --[ Output

  =3D=3D35337=3D=3DWARNING: ASan doesn't fully support makecontext/swapcont=
ext functions and may produce false positives in some cases!
  [I 1607946348.442865] OPENED
  [R +0.059305] outl 0xcf8 0x8000081c
  OK
  [S +0.059326] OK
  [R +0.059338] outb 0xcfc 0xc3
  OK
  [S +0.059355] OK
  [R +0.059363] outl 0xcf8 0x80000804
  OK
  [S +0.059369] OK
  [R +0.059381] outb 0xcfc 0x06
  OK
  [S +0.061094] OK
  [R +0.061107] write 0xc300001024 0x2 0x0040
  OK
  [S +0.061120] OK
  [R +0.061127] write 0xc300001028 0x1 0x5a
  OK
  [S +0.061135] OK
  [R +0.061142] write 0xc30000101c 0x1 0x01
  OK
  [S +0.061158] OK
  [R +0.061167] writel 0xc30000100c 0x20000000
  OK
  [S +0.061212] OK
  [R +0.061222] write 0xc300001016 0x3 0x80a080
  OK
  [S +0.061231] OK
  [R +0.061238] write 0xc300003002 0x1 0x80
  OK
  [S +0.061247] OK
  [R +0.061253] write 0x5c 0x1 0x10
  OK
  [S +0.061403] OK
  qemu-system-i386: /home/qiuhao/hack/qemu/include/exec/memory_ldst_cached.=
h.inc:88: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uin=
t32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D c=
ache->len - addr' failed.

  --[ Environment

  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  clang: 10.0.0-4ubuntu1
  glibc: 2.31-0ubuntu9.1
  libglib2.0-dev: 2.64.3-1~ubuntu20.04.1

  --[ Note

  Alexander Bulekov found the same assertion failure on 2020-08-04,
  https://bugs.launchpad.net/qemu/+bug/1890333, and it had been fixed in
  commit 2d69eba5fe52045b2c8b0d04fd3806414352afc1.

  Fam Zheng found the same assertion failure on 2018-09-29,
  https://bugs.launchpad.net/qemu/+bug/1795148, and it had been fixed in
  commit db812c4073c77c8a64db8d6663b3416a587c7b4a.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908062/+subscriptions

