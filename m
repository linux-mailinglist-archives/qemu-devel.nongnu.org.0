Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE5377B59
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:57:05 +0200 (CEST)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxya-0004yk-Fe
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxxK-0003c8-VQ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:55:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:52468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxxH-00066E-Iv
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:55:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxxF-0001dL-W9
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F08BB2E8187
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:46:15 -0000
From: Thomas Huth <1906516@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phantom1003 th-huth
X-Launchpad-Bug-Reporter: jinyan (phantom1003)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160691732836.26002.10346003915035160514.malonedeb@chaenomeles.canonical.com>
Message-Id: <162062197517.10300.11316562518570049938.malone@chaenomeles.canonical.com>
Subject: [Bug 1906516] Re: [RISCV] sfence.vma need to end the translation block
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 004dbe7e47c89bb73e186fb459a9dc06da52dc6b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1906516 <1906516@bugs.launchpad.net>
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


** Tags added: tcg

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906516

Title:
  [RISCV] sfence.vma need to end the translation block

Status in QEMU:
  Incomplete

Bug description:
  QEMU emulator version 5.0.0

  sfence.vma will flush the tlb, so after this instruction, the translation=
 block should be end. The following code will only work in single step mode:
  ```
  relocate:
  =C2=A0li a0, OFFSET

  =C2=A0la t0, 1f
  =C2=A0add t0, t0, a0
  =C2=A0csrw stvec, t0

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0la t0, early_pgtbl
  =C2=A0srl t0, t0, PAGE_SHIFT
  =C2=A0li t1, SATP_SV39
  =C2=A0or t0, t1, t0

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csrw satp, t0
  1:
  =C2=A0sfence.vma
  =C2=A0la t0, trap_s
  =C2=A0csrw stvec, t0
  =C2=A0ret
  ```

  In this code, I want to relocate pc to virtual address with the OFFSET
  prefix. Before writing to satp, pc run at physic address, stvec has
  been set to label 1 with a virtual prefix and virtual address has been
  mapping in early_pgtbl, after writing satp, qemu will throw a page
  fault, and pc will set to virtual address of label 1.

  The problem is that, in this situation, the translation block will not
  end after sfence.vma, and stvec will be set to trap_s,

  ```
  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000dc:  00a080b3          add             ra,ra,a0
  0x00000000800000e0:  00007297          auipc           t0,28672        # =
0x800070e0
  0x00000000800000e4:  f2028293          addi            t0,t0,-224
  0x00000000800000e8:  00c2d293          srli            t0,t0,12
  0x00000000800000ec:  fff0031b          addiw           t1,zero,-1
  0x00000000800000f0:  03f31313          slli            t1,t1,63
  0x00000000800000f4:  005362b3          or              t0,t1,t0
  0x00000000800000f8:  18029073          csrrw           zero,satp,t0

  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000fc:  12000073          sfence.vma      zero,zero
  0x0000000080000100:  00000297          auipc           t0,0            # =
0x80000100
  0x0000000080000104:  1c828293          addi            t0,t0,456
  0x0000000080000108:  10529073          csrrw           zero,stvec,t0

  riscv_raise_exception: 12
  riscv_raise_exception: 12
  riscv_raise_exception: 12
  riscv_raise_exception: 12
  ...
  ```

  So, the program will crash, and the program will work in single step mode:
  ```
  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000f8:  18029073          csrrw           zero,satp,t0

  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000fc:  12000073          sfence.vma      zero,zero

  riscv_raise_exception: 12
  ----------------
  IN:
  Priv: 1; Virt: 0
  0xffffffff800000fc:  12000073          sfence.vma      zero,zero

  ----------------
  IN:
  Priv: 1; Virt: 0
  0xffffffff80000100:  00000297          auipc           t0,0            # =
0xffffffff80000100

  ```
  The pc will set to label 1, instead of trap_s.

  I try to patch the code in fence.i in trans_rvi.inc.c to sfence.vma:
  ```
  =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
  =C2=A0=C2=A0=C2=A0=C2=A0exit_tb(ctx);
  =C2=A0=C2=A0=C2=A0=C2=A0ctx->base.is_jmp =3D DISAS_NORETURN;
  ```
  This codes can help to end the tranlate block, since I'm not a qemu guy, =
I'm not sure if this is a corret method.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906516/+subscriptions

