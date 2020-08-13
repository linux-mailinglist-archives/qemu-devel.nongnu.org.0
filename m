Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9912244161
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:42:10 +0200 (CEST)
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6LvF-0004Oz-NE
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k6Lu3-0002k2-HD
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:48518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k6Lu0-0004NI-U2
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k6Ltz-0004iv-Id
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 861B22E804F
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2020 22:30:17 -0000
From: Alistair Francis <1886076@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=alistair@alistair23.me; 
X-Launchpad-Bug-Tags: risc-v
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 laurent-vivier nroyer
X-Launchpad-Bug-Reporter: Nicolas Royer (nroyer)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <159371008164.16126.4627604650696899204.malonedeb@soybean.canonical.com>
Message-Id: <159735781783.751.3700791949542118141.malone@chaenomeles.canonical.com>
Subject: [Bug 1886076] Re: risc-v pmp implementation error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7eee5e59278f8f8118989c0aaceab242e073896e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b7d97c5237854cb2b35f772f82e1ca2f67df791b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 18:40:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1886076 <1886076@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be fixed once the current RISC-V branch is merged into
master.

You can see the patch that fixes this here:
https://patchew.org/QEMU/20200812223045.96803-1-alistair.francis@wdc.com/20=
200812223045.96803-18-alistair.francis@wdc.com/

** Changed in: qemu
     Assignee: (unassigned) =3D> Alistair Francis (alistair2323)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886076

Title:
  risc-v pmp implementation error

Status in QEMU:
  Fix Committed

Bug description:
  QEMU Commit fc1bff958998910ec8d25db86cd2f53ff125f7ab

  =

  RISC-V PMP implementation is not correct on QEMU.

  When an access is granted there is no more PMP check on the 4KB memory ra=
nge of the accessed location.
  A cache flush is needed in order to force a PMP check on next access to t=
his 4KB memory range.
  A correct implementation would be to grant access to the maximum allowed =
area around the accessed location within the 4KB memory range.

  For instance, if PMP is configured to block all accesses from 0x80003000 =
to 0x800037FF and from 0x80003C00 to 0x80003FFF:
  1st case:
      1) A read access is done @0x80003900 --> access OK as expected
      2) Then a read access is done @0x80003400 --> access OK while it must=
 be blocked!
  2nd case:
      1) A read access is done @0x80003900 --> access OK as expected
      2) Cache is flushed (__asm__ __volatile__ ("sfence.vma" : : : "memory=
");)  =

      3) A read access is done @0x80003400 --> access blocked as expected

  Analysis:
      After the 1st read @0x80003900 QEMU add the memory range 0x80003000 t=
o 0x80003FFF into a TLB entry.
      Then no more PMP check is done from 0x80003000 to 0x80003FFF until th=
e TLB is flushed.
  What should be done:
      Only the range 0x80003800 to 0x80003BFF should be added to the TLB en=
try.

  The 4KB range is the default size of a TLB page on QEMU for RISCV.
  The minimum size that can be set is 64Bytes. However the PMP granularity =
can be as low as 4Bytes.

  I tested a quick fix and PMP is working as expected.
  The quick fix consist in replacing this line:
  tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK, prot,=
 mmu_idx, TARGET_PAGE_SIZE);
  By this one in target/riscv/cpu_helper.c:
  tlb_set_page(cs, address & ~0x3, pa & ~0x3, prot, mmu_idx, size);

  This quick fix has to be optimized in order to consume less HW
  resources, as explained at the beginning.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886076/+subscriptions

