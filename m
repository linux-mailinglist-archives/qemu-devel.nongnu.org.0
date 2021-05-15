Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F43817AD
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:35:55 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhreE-0001YE-9u
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZX-0004JG-Lt
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:31:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZR-0006Dp-1c
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:31:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhrZO-0004Ck-Tg
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF1292E8188
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:23:22 -0000
From: Thomas Huth <1922773@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: riscv32
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mehrdadhe th-huth
X-Launchpad-Bug-Reporter: Mehrdad Hessar (mehrdadhe)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161772848102.29247.5138127903263010821.malonedeb@gac.canonical.com>
Message-Id: <162107420287.21341.10547864525499442661.malone@soybean.canonical.com>
Subject: [Bug 1922773] Re: RISCV32 illegal instruction exception
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 989f1de0a36dd0930a6e73817fd327ec94332eb3
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
Reply-To: Bug 1922773 <1922773@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1922773

Title:
  RISCV32 illegal instruction exception

Status in QEMU:
  Incomplete

Bug description:
  I'm running a machine learning model on qemu riscv32 and I ran into
  illegal instruction exception for some reason. I wasn't sure if this
  is a bug and if so whether it is related to zephyr or qemu, however
  I'll try to provide as much as information to get a better
  understanding.

  Here is the assembly code that I'm running:

  0x8000bd74 <+0>:	lw	a4,0(a0)
     0x8000bd76 <+2>:	lw	a5,8(a0)
     0x8000bd78 <+4>:	lw	a0,0(a4)
     0x8000bd7a <+6>:	lw	a1,0(a5)
     0x8000bd7c <+8>:	li	a3,0
     0x8000bd7e <+10>:	j	0x8000bda4 <fused_nn_pad_layout_transform+48>
     0x8000bd80 <+12>:	addi	a5,a3,-2
     0x8000bd84 <+16>:	li	a2,27
     0x8000bd86 <+18>:	bgeu	a2,a5,0x8000bdae <fused_nn_pad_layout_transform=
+58>
  =3D> 0x8000bd8a <+22>:	fmv.w.x	fa5,zero
     0x8000bd8e <+26>:	slli	a5,a3,0x5
     0x8000bd92 <+30>:	add	a5,a5,a4
     0x8000bd94 <+32>:	slli	a5,a5,0x2
     0x8000bd96 <+34>:	add	a5,a5,a1
     0x8000bd98 <+36>:	fsw	fa5,0(a5)
     0x8000bd9a <+38>:	addi	a4,a4,1
     0x8000bd9c <+40>:	li	a5,31
     0x8000bd9e <+42>:	bge	a5,a4,0x8000bd80 <fused_nn_pad_layout_transform+=
12>
     0x8000bda2 <+46>:	addi	a3,a3,1
     0x8000bda4 <+48>:	li	a5,31
     0x8000bda6 <+50>:	blt	a5,a3,0x8000bde0 <fused_nn_pad_layout_transform+=
108>
     0x8000bdaa <+54>:	li	a4,0
     0x8000bdac <+56>:	j	0x8000bd9c <fused_nn_pad_layout_transform+40>
     0x8000bdae <+58>:	li	a5,1
     0x8000bdb0 <+60>:	bge	a5,a4,0x8000bdd4 <fused_nn_pad_layout_transform+=
96>
     0x8000bdb4 <+64>:	li	a5,29
     0x8000bdb6 <+66>:	blt	a5,a4,0x8000bdda <fused_nn_pad_layout_transform+=
102>
     0x8000bdba <+70>:	li	a5,28
     0x8000bdbc <+72>:	mul	a5,a3,a5
     0x8000bdc0 <+76>:	add	a5,a5,a4
     0x8000bdc2 <+78>:	lui	a2,0x40000
     0x8000bdc6 <+82>:	addi	a2,a2,-58 # 0x3fffffc6
     0x8000bdca <+86>:	add	a5,a5,a2
     0x8000bdcc <+88>:	slli	a5,a5,0x2
     0x8000bdce <+90>:	add	a5,a5,a0
     0x8000bdd0 <+92>:	flw	fa5,0(a5)
     0x8000bdd2 <+94>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bdd4 <+96>:	fmv.w.x	fa5,zero
     0x8000bdd8 <+100>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bdda <+102>:	fmv.w.x	fa5,zero
     0x8000bdde <+106>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bde0 <+108>:	li	a0,0
     0x8000bde2 <+110>:	ret

  My code breaks on line 0x8000bd8a and then the mcause register is
  loaded with value 0x02 which translates to illegal instruction. Please
  let me know if you need more information about this.

  I also posted this on ZephyrProject in case it is related to the
  Zephyr: https://github.com/zephyrproject-rtos/zephyr/issues/34026

  I have tested on both QEMU 5.1.0 and 5.2.0 versions. I ran the same
  code on qemu riscv64 and didn't have the same problem. Here is the
  assembly code that is generated for the same operation:

  =3D> 0x000000008000b446 <+0>:	ld	a4,0(a0)
     0x000000008000b448 <+2>:	ld	a5,8(a0)
     0x000000008000b44a <+4>:	ld	a0,0(a4)
     0x000000008000b44c <+6>:	ld	a1,0(a5)
     0x000000008000b44e <+8>:	li	a3,0
     0x000000008000b450 <+10>:	j	0x8000b476 <fused_nn_pad_layout_transform+=
48>
     0x000000008000b452 <+12>:	addiw	a5,a3,-2
     0x000000008000b456 <+16>:	li	a2,27
     0x000000008000b458 <+18>:	bgeu	a2,a5,0x8000b480 <fused_nn_pad_layout_t=
ransform+58>
     0x000000008000b45c <+22>:	li	a2,0
     0x000000008000b460 <+26>:	slliw	a5,a3,0x5
     0x000000008000b464 <+30>:	addw	a5,a5,a4
     0x000000008000b466 <+32>:	slli	a5,a5,0x2
     0x000000008000b468 <+34>:	add	a5,a5,a1
     0x000000008000b46a <+36>:	sw	a2,0(a5)
     0x000000008000b46c <+38>:	addiw	a4,a4,1
     0x000000008000b46e <+40>:	li	a5,31
     0x000000008000b470 <+42>:	bge	a5,a4,0x8000b452 <fused_nn_pad_layout_tr=
ansform+12>
     0x000000008000b474 <+46>:	addiw	a3,a3,1
     0x000000008000b476 <+48>:	li	a5,31
     0x000000008000b478 <+50>:	blt	a5,a3,0x8000b4ac <fused_nn_pad_layout_tr=
ansform+102>
     0x000000008000b47c <+54>:	li	a4,0
     0x000000008000b47e <+56>:	j	0x8000b46e <fused_nn_pad_layout_transform+=
40>
     0x000000008000b480 <+58>:	li	a5,1
     0x000000008000b482 <+60>:	bge	a5,a4,0x8000b4a0 <fused_nn_pad_layout_tr=
ansform+90>
     0x000000008000b486 <+64>:	li	a5,29
     0x000000008000b488 <+66>:	blt	a5,a4,0x8000b4a6 <fused_nn_pad_layout_tr=
ansform+96>
     0x000000008000b48c <+70>:	li	a5,28
     0x000000008000b48e <+72>:	mulw	a5,a5,a3
     0x000000008000b492 <+76>:	addw	a5,a5,a4
     0x000000008000b494 <+78>:	addiw	a5,a5,-58
     0x000000008000b498 <+82>:	slli	a5,a5,0x2
     0x000000008000b49a <+84>:	add	a5,a5,a0
     0x000000008000b49c <+86>:	lw	a2,0(a5)
     0x000000008000b49e <+88>:	j	0x8000b460 <fused_nn_pad_layout_transform+=
26>
     0x000000008000b4a0 <+90>:	li	a2,0
     0x000000008000b4a4 <+94>:	j	0x8000b460 <fused_nn_pad_layout_transform+=
26>
     0x000000008000b4a6 <+96>:	li	a2,0
     0x000000008000b4aa <+100>:	j	0x8000b460 <fused_nn_pad_layout_transform=
+26>
     0x000000008000b4ac <+102>:	li	a0,0
     0x000000008000b4ae <+104>:	ret

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922773/+subscriptions

