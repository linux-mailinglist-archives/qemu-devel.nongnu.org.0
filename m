Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBC37BBCF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:32:20 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn6B-0003x5-6Z
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn4j-0002Wu-7z
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:30:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:36940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn4h-0002gA-Bp
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:30:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgn4f-0004zb-P2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:30:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B22D22E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:30:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:22:52 -0000
From: Thomas Huth <1911351@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: charco pmaydell th-huth venkatesh-srinivas
X-Launchpad-Bug-Reporter: Marco (charco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161049230444.13717.10732991676985431455.malonedeb@gac.canonical.com>
Message-Id: <162081857295.23460.13861539276458656141.malone@soybean.canonical.com>
Subject: [Bug 1911351] Re: x86-64 MTTCG Does not update page table entries
 atomically
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 1caef716d07acd422e04ca15e9103250977d969e
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911351

Title:
  x86-64 MTTCG Does not update page table entries atomically

Status in QEMU:
  Incomplete

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

