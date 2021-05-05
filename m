Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CC374C17
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:48:21 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRFc-0006YQ-8K
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQu3-0002BN-GM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:26:03 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQty-00010n-Np
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257158; x=1651793158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HhXS6Fd5kQIv7sJJfl/l66LLxPEJxvVRkO3qUYKWd2Q=;
 b=BcqkHBcRFzZI5F2VD9gGgacN88Ks0Qtw5mPoTqmGyfPlSBTSVbfmyER7
 lCpx92uiP9h4tIzgMgDaeaY60Qfz7eMXqWbjMVVipmHBOnzfh0D3i+3B/
 xcM/mBfk1grXgE5HqkHCZD/h1FBTe9Dg9er4tZTzpQTZNK/4lhAt8b0Ux
 bicV27L1H2Ke8qfz3Ncf718rl2wr2mtNbNtVjvqXTnAbZFELOBx9V7Bsc
 lflzG6SDmCyQ72T7BQdVbFmJOlb3GHMjhJTCxZ03BWefMYrHtDDGjvQHh
 i915MsxT2NsXsN3lgMVTIFLR5Au4GqVZnhXc1ztG/8xoXSD/0LF9ixVZ4 A==;
IronPort-SDR: PmjWMntshZcdNyofN2z7cjJGAcvin0BHkqBsuSCX/xO1PQXrf8f3SdfWoMmlIoMpOxOw0zmfNR
 VHDLgV+/eoSZWKyzuDUlH/M2Y3Ppv8NWDYvgK6OJ96Qb6yH3RvL6geZGOGycrCYFqITETjW3gk
 IzMuZ8SmGivPenrrcnIBpkp1aAA24YzPC3Cdp4TXSlSgadq5N44mdwjFSY7B/+EnY06Y6xgq6b
 nxIwoU5xWSvqFToL20ePYuuo3IbMsWLehWfNfDy41aO4/MMBuAq+v1rw0EtX9PTN04jTW+M9eR
 Cp0=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586048"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:38 +0800
IronPort-SDR: Ns24vjuVaXsHBDYyT8UrLzenXWDg/7FHil5m9ckuF1pMX3Y9MqqSAuKITHe+vdBRPRcVfFRZm8
 29sWN7w+bOUqfOdISMwpPDMUtuh7MLjSGqeFOFseel0UVUPumhoRFSe8Q6C60Nrr3ul0KA+NlR
 nnn6ga4lK2BG/7NCr68gwmAsOFiQBKhfBX0WzaMopZeov6Y3nn/y8DtenCOptJw77DT5/Hxp49
 i6Ar4AM0zMA4b1b21mA/Xsz02qOy2yqe5qpRskxCLGmt4mOblbFJbEcWA1BktzqTkpxwEPCJAL
 OymqfF37j86vVfjgVckguFpf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:04:18 -0700
IronPort-SDR: izNLBnPtfDZ/f95oOHgfsg8k4O/o2Sfv9qHnKk8OemGUYTW4qVoEvDYL6HaORIYu6htuKUwa08
 S7bCOdP/9fUl3JqS/KwURlrCHz9aqAc6/9zHDJSIBSHqxvAUjoA7jGs5tAHh0RFc7GnGetrGZ5
 qZQuo23wmMD8lr86Tne1zKcmeNwiRA6oy/FJMAHmUcA4VpM0s2wagU7uVm5h5Lbnt6vkCPcp/n
 5OkiGUBv5QGnIpu+Q5a+ykRJrt54/xtkGZTLStI/JMXsORXLwpFdeqHJpTT1U95FBy3XC76mQ3
 EEU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 41/42] target/riscv: Consolidate RV32/64 16-bit instructions
Date: Thu,  6 May 2021 09:23:11 +1000
Message-Id: <20210505232312.4175486-42-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch removes the insn16-32.decode and insn16-64.decode decode
files and consolidates the instructions into the general RISC-V
insn16.decode decode tree.

This means that all of the instructions are avaliable in both the 32-bit
and 64-bit builds. This also means that we run a check to ensure we are
running a 64-bit softmmu before we execute the 64-bit only instructions.
This allows us to include the 32-bit instructions in the 64-bit build,
while also ensuring that 32-bit only software can not execute the
instructions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 01e2b0efeae311adc7ebf133c2cde6a7a37224d7.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/insn16-32.decode           | 28 -------------------
 target/riscv/insn16-64.decode           | 36 -------------------------
 target/riscv/insn16.decode              | 30 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  6 +++++
 target/riscv/meson.build                | 11 +++-----
 5 files changed, 39 insertions(+), 72 deletions(-)
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode

diff --git a/target/riscv/insn16-32.decode b/target/riscv/insn16-32.decode
deleted file mode 100644
index 0819b17028..0000000000
--- a/target/riscv/insn16-32.decode
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
-#
-# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
-#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2 or later, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# *** RV32C Standard Extension (Quadrant 0) ***
-flw               011  ... ... .. ... 00 @cl_w
-fsw               111  ... ... .. ... 00 @cs_w
-
-# *** RV32C Standard Extension (Quadrant 1) ***
-jal               001     ........... 01 @cj    rd=1  # C.JAL
-
-# *** RV32C Standard Extension (Quadrant 2) ***
-flw               011 .  .....  ..... 10 @c_lwsp
-fsw               111 .  .....  ..... 10 @c_swsp
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
deleted file mode 100644
index 672e1e916f..0000000000
--- a/target/riscv/insn16-64.decode
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
-#
-# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
-#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2 or later, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# *** RV64C Standard Extension (Quadrant 0) ***
-ld                011  ... ... .. ... 00 @cl_d
-sd                111  ... ... .. ... 00 @cs_d
-
-# *** RV64C Standard Extension (Quadrant 1) ***
-{
-  illegal         001 -  00000  ----- 01 # c.addiw, RES rd=0
-  addiw           001 .  .....  ..... 01 @ci
-}
-subw              100 1 11 ... 00 ... 01 @cs_2
-addw              100 1 11 ... 01 ... 01 @cs_2
-
-# *** RV64C Standard Extension (Quadrant 2) ***
-{
-  illegal         011 -  00000  ----- 10 # c.ldsp, RES rd=0
-  ld              011 .  .....  ..... 10 @c_ldsp
-}
-sd                111 .  .....  ..... 10 @c_sdsp
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 1cb93876fe..2e9212663c 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -92,6 +92,16 @@ lw                010  ... ... .. ... 00 @cl_w
 fsd               101  ... ... .. ... 00 @cs_d
 sw                110  ... ... .. ... 00 @cs_w
 
+# *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
+{
+  ld              011  ... ... .. ... 00 @cl_d
+  flw             011  ... ... .. ... 00 @cl_w
+}
+{
+  sd              111  ... ... .. ... 00 @cs_d
+  fsw             111  ... ... .. ... 00 @cs_w
+}
+
 # *** RV32/64C Standard Extension (Quadrant 1) ***
 addi              000 .  .....  ..... 01 @ci
 addi              010 .  .....  ..... 01 @c_li
@@ -111,6 +121,15 @@ jal               101     ........... 01 @cj    rd=0  # C.J
 beq               110  ... ...  ..... 01 @cb_z
 bne               111  ... ...  ..... 01 @cb_z
 
+# *** RV64C and RV32C specific Standard Extension (Quadrant 1) ***
+{
+  c64_illegal     001 -  00000  ----- 01 # c.addiw, RES rd=0
+  addiw           001 .  .....  ..... 01 @ci
+  jal             001     ........... 01 @cj    rd=1  # C.JAL
+}
+subw              100 1 11 ... 00 ... 01 @cs_2
+addw              100 1 11 ... 01 ... 01 @cs_2
+
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
 fld               001 .  .....  ..... 10 @c_ldsp
@@ -130,3 +149,14 @@ fld               001 .  .....  ..... 10 @c_ldsp
 }
 fsd               101   ......  ..... 10 @c_sdsp
 sw                110 .  .....  ..... 10 @c_swsp
+
+# *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
+{
+  c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
+  ld              011 .  .....  ..... 10 @c_ldsp
+  flw             011 .  .....  ..... 10 @c_lwsp
+}
+{
+  sd              111 .  .....  ..... 10 @c_sdsp
+  fsw             111 .  .....  ..... 10 @c_swsp
+}
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 1340676209..bd93f634cf 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -24,6 +24,12 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
     return true;
 }
 
+static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
+{
+     REQUIRE_64BIT(ctx);
+     return trans_illegal(ctx, a);
+}
+
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 24bf049164..af6c3416b7 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,18 +1,13 @@
 # FIXME extra_args should accept files()
 dir = meson.current_source_dir()
-gen32 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-32.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
-  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-]
 
-gen64 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-64.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
+gen = [
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
 riscv_ss = ss.source_set()
-riscv_ss.add(when: 'TARGET_RISCV32', if_true: gen32)
-riscv_ss.add(when: 'TARGET_RISCV64', if_true: gen64)
+riscv_ss.add(gen)
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
-- 
2.31.1


