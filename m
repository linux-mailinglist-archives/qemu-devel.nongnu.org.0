Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F02F80DB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:33:11 +0100 (CET)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0S29-0006im-S4
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0RvB-0000xT-0N
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:25:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:50114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0Rv8-0002B4-G0
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:25:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0Rv6-0004ks-Ib
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8BC8E2E8139
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jan 2021 16:11:45 -0000
From: Peter Maydell <1907817@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: assertion tcg v5.2.0
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell qwart279 rth
X-Launchpad-Bug-Reporter: Matus Kysel (qwart279)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160769469739.30645.13581268559432751632.malonedeb@soybean.canonical.com>
Message-Id: <161072710528.6498.10192355415425377208.malone@wampee.canonical.com>
Subject: [Bug 1907817] Re: qemu-aarch64 tcg assertion v5.2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: ec78348f58cce044c31cbcbbc998244042995a0a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1907817 <1907817@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix now in master as commit 6d3ef04893bde -- will be in next QEMU
release.


** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907817

Title:
  qemu-aarch64 tcg assertion v5.2.0

Status in QEMU:
  Fix Committed

Bug description:
  After updating to 5.2 I am getting following assertion error:
  qemu-aarch64: ../tcg/tcg-op-gvec.c:54: check_size_align: Assertion `(maxs=
z & max_align) =3D=3D 0' failed.

  I think it was introduced by commit:
  e2e7168a214b0ed98dc357bba96816486a289762

  Becasue before this change, in function simd_desc only maxsz % 8 =3D=3D 0=
 was checked, but after this change qemu check for following:
   =

  max_align =3D maxsz >=3D 16 ? 15 : 7;
  tcg_debug_assert((maxsz & max_align) =3D=3D 0);  <--- here assertion happ=
ens

  in my case maxsz=3D56.

  =

  Whole backtrace:
  #4  0x0000004000314770 in check_size_align (oprsz=3D56, maxsz=3D56, ofs=
=3D0) at ../tcg/tcg-op-gvec.c:54
  #5  0x0000004000314950 in simd_desc (oprsz=3D56, maxsz=3D56, data=3D0) at=
 ../tcg/tcg-op-gvec.c:89
  #6  0x0000004000316270 in do_dup (vece=3D0, dofs=3D3144, oprsz=3D56, maxs=
z=3D56, in_32=3D0x0, in_64=3D0x0, in_c=3D0) at ../tcg/tcg-op-gvec.c:630
  #7  0x00000040003164d0 in expand_clr (dofs=3D3144, maxsz=3D56) at ../tcg/=
tcg-op-gvec.c:679
  #8  0x0000004000319bb0 in tcg_gen_gvec_mov (vece=3D3, dofs=3D3136, aofs=
=3D3136, oprsz=3D8, maxsz=3D64) at ../tcg/tcg-op-gvec.c:1538
  #9  0x0000004000200dc0 in clear_vec_high (s=3D0x40021a8180, is_q=3Dfalse,=
 rd=3D0) at ../target/arm/translate-a64.c:592
  #10 0x0000004000200e40 in write_fp_dreg (s=3D0x40021a8180, reg=3D0, v=3D0=
x1108) at ../target/arm/translate-a64.c:600
  --Type <RET> for more, q to quit, c to continue without paging--
  #11 0x0000004000200e90 in write_fp_sreg (s=3D0x40021a8180, reg=3D0, v=3D0=
x1060) at ../target/arm/translate-a64.c:608
  #12 0x0000004000214210 in handle_fpfpcvt (s=3D0x40021a8180, rd=3D0, rn=3D=
0, opcode=3D2, itof=3Dtrue, rmode=3D0, scale=3D64, sf=3D0, type=3D0)
      at ../target/arm/translate-a64.c:6988
  #13 0x0000004000214f90 in disas_fp_int_conv (s=3D0x40021a8180, insn=3D505=
544704) at ../target/arm/translate-a64.c:7299
  #14 0x0000004000215350 in disas_data_proc_fp (s=3D0x40021a8180, insn=3D50=
5544704) at ../target/arm/translate-a64.c:7389
  #15 0x000000400022aa70 in disas_data_proc_simd_fp (s=3D0x40021a8180, insn=
=3D505544704) at ../target/arm/translate-a64.c:14494
  #16 0x000000400022af90 in disas_a64_insn (env=3D0x7fac59b6b490, s=3D0x400=
21a8180) at ../target/arm/translate-a64.c:14663
  #17 0x000000400022b750 in aarch64_tr_translate_insn (dcbase=3D0x40021a818=
0, cpu=3D0x7fac59b63150) at ../target/arm/translate-a64.c:14823
  #18 0x00000040002e8630 in translator_loop (ops=3D0x4000902e00 <aarch64_tr=
anslator_ops>, db=3D0x40021a8180, cpu=3D0x7fac59b63150, =

      tb=3D0x7fac3419c5c0, max_insns=3D512) at ../accel/tcg/translator.c:103
  #19 0x00000040002e3a60 in gen_intermediate_code (cpu=3D0x7fac59b63150, tb=
=3D0x7fac3419c5c0, max_insns=3D512)
      at ../target/arm/translate.c:9283
  #20 0x00000040002fed30 in tb_gen_code (cpu=3D0x7fac59b63150, pc=3D4458820=
, cs_base=3D0, flags=3D2148544819, cflags=3D-16777216)
      at ../accel/tcg/translate-all.c:1744
  #21 0x000000400036a6e0 in tb_find (cpu=3D0x7fac59b63150, last_tb=3D0x7fac=
3419c400, tb_exit=3D0, cf_mask=3D0) at ../accel/tcg/cpu-exec.c:414
  --Type <RET> for more, q to quit, c to continue without paging--
  #22 0x000000400036b040 in cpu_exec (cpu=3D0x7fac59b63150) at ../accel/tcg=
/cpu-exec.c:770
  #23 0x0000004000113a90 in cpu_loop (env=3D0x7fac59b6b490) at ../linux-use=
r/aarch64/cpu_loop.c:84
  #24 0x00000040002fb8c0 in main (argc=3D2, argv=3D0x40021a8e68, envp=3D0x4=
0021a8e80) at ../linux-user/main.c:864

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907817/+subscriptions

