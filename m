Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296530B6CB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 06:07:07 +0100 (CET)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6nu5-0003fC-JW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 00:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6nsi-0002wi-LQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:05:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6nsf-0004TP-2a
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:05:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6nsc-0000In-PA
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 953C42E813C
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 05:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 04:58:59 -0000
From: Venkatesh Srinivas <1911351@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: charco pmaydell venkatesh-srinivas
X-Launchpad-Bug-Reporter: Marco (charco)
X-Launchpad-Bug-Modifier: Venkatesh Srinivas (venkatesh-srinivas)
References: <161049230444.13717.10732991676985431455.malonedeb@gac.canonical.com>
Message-Id: <161224193914.13121.15293709183751600564.malone@soybean.canonical.com>
Subject: [Bug 1911351] Re: x86-64 MTTCG Does not update page table entries
 atomically
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: e19578927c7c11bfcd007a112b876df4c5ccaa93
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
Reply-To: Bug 1911351 <1911351@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BTW, the RISC-V MMU code _does_ get this right and the model could be
followed by the x86 version - - something like
https://github.com/vsrinivas/qemu/commit/1efa7dc689c4572d8fe0880ddbe44ec22f=
8f4348,
(but with more compiling + working) might solve this problem and more
closely model h/w.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911351

Title:
  x86-64 MTTCG Does not update page table entries atomically

Status in QEMU:
  Confirmed

Bug description:
  It seems like the qemu tcg code for x86-64 doesn't write the access
  and dirty bits of the page table entries atomically. Instead, they
  first read the entry, see if they need to set the page table entry,
  and then write back the updated page table entry. So if you have two
  threads running at the same time, one accessing the virtual address
  over and over again, and the other modifying the page table entry, it
  is possible that after the second thread modifies the page table
  entry, qemu overwrites the value with the old page table entry value,
  with the access/dirty flags set.

  Here's a unit test that reproduces this behavior:

  https://github.com/mvanotti/kvm-unit-
  tests/commit/09f9722807271226a714b04f25174776454b19cd

  You can run it with:

  ```
  /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults \
  -device pc-testdev -device isa-debug-exit,iobase=3D0xf4,iosize=3D0x4 \
  -vnc none -serial stdio -device pci-testdev \
  -smp 4 -machine q35 --accel tcg,thread=3Dmulti \
  -kernel x86/mmu-race.flat # -initrd /tmp/tmp.avvPpezMFf
  ```

  Expected output (failure):

  ```
  kvm-unit-tests$ make && /usr/bin/qemu-system-x86_64 --no-reboot -nodefaul=
ts -device pc-testdev -device isa-debug-exit,iobase=3D0xf4,iosize=3D0x4 -vn=
c none -serial stdio -device pci-testdev -smp 4 -machine q35 --accel tcg,th=
read=3Dmulti  -kernel x86/mmu-race.flat # -initrd /tmp/tmp.avvPpezMFf
  enabling apic
  enabling apic
  enabling apic
  enabling apic
  paging enabled
  cr0 =3D 80010011
  cr3 =3D 627000
  cr4 =3D 20
  found 4 cpus
  PASS: Need more than 1 CPU
  Detected overwritten PTE:
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0want: 0x000000000062e007
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got:  0x000000000062d027
  FAIL: PTE not overwritten
  PASS: All Reads were zero
  SUMMARY: 3 tests, 1 unexpected failures
  ```

  This bug allows user-to-root privilege escalation inside the guest VM:
  if the user is able overwrite an entry that belongs to a second-to-
  last level page table, and is able to allocate the referenced page,
  then the user would be in control of a last-level page table, being
  able to map any memory they want. This is not uncommon in situations
  where memory is being decomitted.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911351/+subscriptions

