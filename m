Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6661302A9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 21:15:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWQWi-0003cK-Sy
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 15:15:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrolnik@gmail.com>) id 1hWQPF-0006Zq-Ty
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrolnik@gmail.com>) id 1hWQP8-0007D1-2Y
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:08:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hWQP7-0007CB-HP
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:07:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id d9so4925924wrx.0
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Kzle8dWRhBinDkQrx8jlACyjYIQ3ERXQPtW1FnyO6Y=;
	b=VZo3AgeRo6u9orNLEWN14PMXTP7u/YOx0zWlZ5D/NQg2FLXNsA0hE61uPqiZdhU1O6
	vx9pTHrXKfcE1n4+o78hyJVRM39tVJremh+XDExiBjm1DF87qtCNUUIBz1Ql/Ai02qeR
	cvODdgN6zxjwmnPpWlExde7rD+SNjDP/RYrj2Pa1BmziLNqqYnpipS8McQwujDNImFld
	Ag0rGj/scw14Pa/MJMJadcLqePJmz6yxO7XRkw/u1L2bfneJpUHhFclpxiC+haZJzsp9
	M3olsiRHkPUzEd6wfrNhdQpZGQ9PNbIYHNCA/9w3gY4iQL7TQE8p5J+THxpwM/kpuvGt
	dQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Kzle8dWRhBinDkQrx8jlACyjYIQ3ERXQPtW1FnyO6Y=;
	b=UqQEz+EibyZJ8MqUdE7uJU4mpqfXlpS88mdj04X4RNokp0UbXGBps0WrAu0b0axKM1
	2ypTo2t3PKDH+ZvfXGklHBsu0vNkJy4aQ6yiImAtR8sdPzI+A0acsjvap53bIU0ABMo5
	hH188IcAvQ2fZ9lBlTBIZ7X5vMuxqlmbvjEp+cc40bxge4T8QsZCeOwPeRgv4Jb+832C
	bjXc0Rza7IhaejKgBTe6bDNY0nTEr8XEoG9KVBrZfRrt5+zdDzKH2gaHjwh5yucrS+Wx
	xzKgIsSeuWqDYcUeyr1roQSRpOrzuJAEdhHOu883wCWQrtn4FQPPYWTMEVySzTyadRi2
	VcSg==
X-Gm-Message-State: APjAAAU7KlVY9u9xnu/F9kTYkz6qmPkY9EfqxJtghM18yyYH57l8ShGP
	/fxJrNyC/m4YsSsY+5CbKU4mPoor9Ks=
X-Google-Smtp-Source: APXvYqzU6f8B/VAAZuL6epYzka3HgLzt1puOCnawClGDeq/MNs01FQv4WRj1Oo8KBsjyI86sGTuXXQ==
X-Received: by 2002:adf:fd0f:: with SMTP id e15mr3685335wrr.104.1559243274837; 
	Thu, 30 May 2019 12:07:54 -0700 (PDT)
Received: from localhost.localdomain (bzq-109-65-68-81.red.bezeqint.net.
	[109.65.68.81])
	by smtp.gmail.com with ESMTPSA id u9sm8711230wme.48.2019.05.30.12.07.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 12:07:54 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 22:07:35 +0300
Message-Id: <20190530190738.22713-6-mrolnik@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190530190738.22713-1-mrolnik@gmail.com>
References: <20190530190738.22713-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH RFC v20 5/8] target/avr: Add instruction
 translation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sarah Harris <S.E.Harris@kent.ac.uk>

This includes:
- TCG translations for each instruction

Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/translate.c | 2981 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 2981 insertions(+)
 create mode 100644 target/avr/translate.c

diff --git a/target/avr/translate.c b/target/avr/translate.c
new file mode 100644
index 0000000000..ee96384e27
--- /dev/null
+++ b/target/avr/translate.c
@@ -0,0 +1,2981 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2016 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qemu-print.h"
+#include "tcg/tcg.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "disas/disas.h"
+#include "tcg-op.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+#include "exec/helper-gen.h"
+#include "exec/log.h"
+#include "exec/gdbstub.h"
+#include "exec/translator.h"
+
+static TCGv cpu_pc;
+
+static TCGv cpu_Cf;
+static TCGv cpu_Zf;
+static TCGv cpu_Nf;
+static TCGv cpu_Vf;
+static TCGv cpu_Sf;
+static TCGv cpu_Hf;
+static TCGv cpu_Tf;
+static TCGv cpu_If;
+
+static TCGv cpu_rampD;
+static TCGv cpu_rampX;
+static TCGv cpu_rampY;
+static TCGv cpu_rampZ;
+
+static TCGv cpu_r[32];
+static TCGv cpu_eind;
+static TCGv cpu_sp;
+
+#define REG(x) (cpu_r[x])
+
+enum {
+    BS_NONE = 0, /* Nothing special (none of the below) */
+    BS_STOP = 1, /* We want to stop translation for any reason */
+    BS_BRANCH = 2, /* A branch condition is reached */
+    BS_EXCP = 3, /* An exception condition is reached */
+};
+
+typedef struct DisasContext DisasContext;
+typedef struct InstInfo InstInfo;
+
+struct InstInfo {
+    target_long cpc;
+    target_long npc;
+    uint32_t opcode;
+    unsigned length;
+};
+
+/* This is the state at translation time. */
+struct DisasContext {
+    TranslationBlock *tb;
+
+    CPUAVRState *env;
+    int bs;
+
+    InstInfo inst[2];/* two consecutive instructions */
+
+    /* Routine used to access memory */
+    int memidx;
+    int bstate;
+    int singlestep;
+};
+
+static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16); }
+static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8); }
+static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4) * 2; }
+static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2; }
+
+static bool decode_insn16(DisasContext *ctx, uint16_t insn);
+static bool decode_insn32(DisasContext *ctx, uint32_t insn);
+#include "decode_insn16.inc.c"
+#include "decode_insn32.inc.c"
+
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    TranslationBlock *tb = ctx->tb;
+
+    if (ctx->singlestep == 0) {
+        tcg_gen_goto_tb(n);
+        tcg_gen_movi_i32(cpu_pc, dest);
+        tcg_gen_exit_tb(tb, n);
+    } else {
+        tcg_gen_movi_i32(cpu_pc, dest);
+        gen_helper_debug(cpu_env);
+        tcg_gen_exit_tb(NULL, 0);
+    }
+}
+
+#include "exec/gen-icount.h"
+
+static void gen_add_CHf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+    TCGv t3 = tcg_temp_new_i32();
+
+    tcg_gen_and_tl(t1, Rd, Rr); /* t1 = Rd & Rr */
+    tcg_gen_andc_tl(t2, Rd, R); /* t2 = Rd & ~R */
+    tcg_gen_andc_tl(t3, Rr, R); /* t3 = Rr & ~R */
+    tcg_gen_or_tl(t1, t1, t2); /* t1 = t1 | t2 | t3 */
+    tcg_gen_or_tl(t1, t1, t3);
+
+    tcg_gen_shri_tl(cpu_Cf, t1, 7); /* Cf = t1(7) */
+    tcg_gen_shri_tl(cpu_Hf, t1, 3); /* Hf = t1(3) */
+    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
+
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void gen_add_Vf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+
+    /* t1 = Rd & Rr & ~R | ~Rd & ~Rr & R = (Rd ^ R) & ~(Rd ^ Rr) */
+    tcg_gen_xor_tl(t1, Rd, R);
+    tcg_gen_xor_tl(t2, Rd, Rr);
+    tcg_gen_andc_tl(t1, t1, t2);
+
+    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+    TCGv t3 = tcg_temp_new_i32();
+
+    /* Cf & Hf */
+    tcg_gen_not_tl(t1, Rd); /* t1 = ~Rd */
+    tcg_gen_and_tl(t2, t1, Rr); /* t2 = ~Rd & Rr */
+    tcg_gen_or_tl(t3, t1, Rr); /* t3 = (~Rd | Rr) & R */
+    tcg_gen_and_tl(t3, t3, R);
+    tcg_gen_or_tl(t2, t2, t3); /* t2 = ~Rd & Rr | ~Rd & R | R & Rr */
+    tcg_gen_shri_tl(cpu_Cf, t2, 7); /* Cf = t2(7) */
+    tcg_gen_shri_tl(cpu_Hf, t2, 3); /* Hf = t2(3) */
+    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
+
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void gen_sub_Vf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+
+    /* Vf */
+    /* t1 = Rd & ~Rr & ~R | ~Rd & Rr & R = (Rd ^ R) & (Rd ^ R) */
+    tcg_gen_xor_tl(t1, Rd, R);
+    tcg_gen_xor_tl(t2, Rd, Rr);
+    tcg_gen_and_tl(t1, t1, t2);
+    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void gen_rshift_ZNVSf(TCGv R)
+{
+    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Vf, cpu_Nf, cpu_Cf);
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+static void gen_NSf(TCGv R)
+{
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+static void gen_ZNSf(TCGv R)
+{
+    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+static void gen_push_ret(DisasContext *ctx, int ret)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
+
+        TCGv t0 = tcg_const_i32((ret & 0x0000ff));
+
+        tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
+        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+
+        tcg_temp_free_i32(t0);
+    } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
+
+        TCGv t0 = tcg_const_i32((ret & 0x00ffff));
+
+        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+        tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
+        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+
+        tcg_temp_free_i32(t0);
+
+    } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
+
+        TCGv lo = tcg_const_i32((ret & 0x0000ff));
+        TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
+
+        tcg_gen_qemu_st_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
+        tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
+        tcg_gen_qemu_st_tl(hi, cpu_sp, MMU_DATA_IDX, MO_BEUW);
+        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+
+        tcg_temp_free_i32(lo);
+        tcg_temp_free_i32(hi);
+    }
+}
+
+static void gen_pop_ret(DisasContext *ctx, TCGv ret)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
+
+        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+        tcg_gen_qemu_ld_tl(ret, cpu_sp, MMU_DATA_IDX, MO_UB);
+
+    } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
+
+        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+        tcg_gen_qemu_ld_tl(ret, cpu_sp, MMU_DATA_IDX, MO_BEUW);
+        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+
+    } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
+
+        TCGv lo = tcg_temp_new_i32();
+        TCGv hi = tcg_temp_new_i32();
+
+        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+        tcg_gen_qemu_ld_tl(hi, cpu_sp, MMU_DATA_IDX, MO_BEUW);
+
+        tcg_gen_addi_tl(cpu_sp, cpu_sp, 2);
+        tcg_gen_qemu_ld_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
+
+        tcg_gen_deposit_tl(ret, lo, hi, 8, 16);
+
+        tcg_temp_free_i32(lo);
+        tcg_temp_free_i32(hi);
+    }
+}
+
+static void gen_jmp_ez(void)
+{
+    tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
+    tcg_gen_or_tl(cpu_pc, cpu_pc, cpu_eind);
+    tcg_gen_exit_tb(NULL, 0);
+}
+
+static void gen_jmp_z(void)
+{
+    tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
+    tcg_gen_exit_tb(NULL, 0);
+}
+
+/*
+ *  in the gen_set_addr & gen_get_addr functions
+ *  H assumed to be in 0x00ff0000 format
+ *  M assumed to be in 0x000000ff format
+ *  L assumed to be in 0x000000ff format
+ */
+static void gen_set_addr(TCGv addr, TCGv H, TCGv M, TCGv L)
+{
+
+    tcg_gen_andi_tl(L, addr, 0x000000ff);
+
+    tcg_gen_andi_tl(M, addr, 0x0000ff00);
+    tcg_gen_shri_tl(M, M, 8);
+
+    tcg_gen_andi_tl(H, addr, 0x00ff0000);
+}
+
+static void gen_set_xaddr(TCGv addr)
+{
+    gen_set_addr(addr, cpu_rampX, cpu_r[27], cpu_r[26]);
+}
+
+static void gen_set_yaddr(TCGv addr)
+{
+    gen_set_addr(addr, cpu_rampY, cpu_r[29], cpu_r[28]);
+}
+
+static void gen_set_zaddr(TCGv addr)
+{
+    gen_set_addr(addr, cpu_rampZ, cpu_r[31], cpu_r[30]);
+}
+
+static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
+{
+    TCGv addr = tcg_temp_new_i32();
+
+    tcg_gen_deposit_tl(addr, M, H, 8, 8);
+    tcg_gen_deposit_tl(addr, L, addr, 8, 16);
+
+    return addr;
+}
+
+static TCGv gen_get_xaddr(void)
+{
+    return gen_get_addr(cpu_rampX, cpu_r[27], cpu_r[26]);
+}
+
+static TCGv gen_get_yaddr(void)
+{
+    return gen_get_addr(cpu_rampY, cpu_r[29], cpu_r[28]);
+}
+
+static TCGv gen_get_zaddr(void)
+{
+    return gen_get_addr(cpu_rampZ, cpu_r[31], cpu_r[30]);
+}
+
+/*
+ *  Adds two registers and the contents of the C Flag and places the result in
+ *  the destination register Rd.
+ */
+static bool trans_ADC(DisasContext *ctx, arg_ADC *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_add_tl(R, Rd, Rr); /* R = Rd + Rr + Cf */
+    tcg_gen_add_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_add_CHf(R, Rd, Rr);
+    gen_add_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Adds two registers without the C Flag and places the result in the
+ *  destination register Rd.
+ */
+static bool trans_ADD(DisasContext *ctx, arg_ADD *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_add_tl(R, Rd, Rr); /* Rd = Rd + Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_add_CHf(R, Rd, Rr);
+    gen_add_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Adds an immediate value (0 - 63) to a register pair and places the result
+ *  in the register pair. This instruction operates on the upper four register
+ *  pairs, and is well suited for operations on the pointer registers.  This
+ *  instruction is not available in all devices. Refer to the device specific
+ *  instruction set summary.
+ */
+static bool trans_ADIW(DisasContext *ctx, arg_ADIW *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_ADIW_SBIW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    int Imm = (a->imm);
+    TCGv R = tcg_temp_new_i32();
+    TCGv Rd = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_deposit_tl(Rd, RdL, RdH, 8, 8); /* Rd = RdH:RdL */
+    tcg_gen_addi_tl(R, Rd, Imm); /* R = Rd + Imm */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+
+    /* Cf */
+    tcg_gen_andc_tl(cpu_Cf, Rd, R); /* Cf = Rd & ~R */
+    tcg_gen_shri_tl(cpu_Cf, cpu_Cf, 15);
+
+    /* Vf */
+    tcg_gen_andc_tl(cpu_Vf, R, Rd); /* Vf = R & ~Rd */
+    tcg_gen_shri_tl(cpu_Vf, cpu_Vf, 15);
+
+    /* Zf */
+    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
+
+    /* Nf */
+    tcg_gen_shri_tl(cpu_Nf, R, 15); /* Nf = R(15) */
+
+    /* Sf */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf);/* Sf = Nf ^ Vf */
+
+    /* R */
+    tcg_gen_andi_tl(RdL, R, 0xff);
+    tcg_gen_shri_tl(RdH, R, 8);
+
+    tcg_temp_free_i32(Rd);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Performs the logical AND between the contents of register Rd and register
+ *  Rr and places the result in the destination register Rd.
+ */
+static bool trans_AND(DisasContext *ctx, arg_AND *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_and_tl(R, Rd, Rr); /* Rd = Rd and Rr */
+
+    /* Vf */
+    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
+
+    /* Zf */
+    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
+
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Performs the logical AND between the contents of register Rd and a constant
+ *  and places the result in the destination register Rd.
+ */
+static bool trans_ANDI(DisasContext *ctx, arg_ANDI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    int Imm = (a->imm);
+
+    /* op */
+    tcg_gen_andi_tl(Rd, Rd, Imm); /* Rd = Rd & Imm */
+
+    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
+    gen_ZNSf(Rd);
+
+    return true;
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. Bit 7 is held constant. Bit 0
+ *  is loaded into the C Flag of the SREG. This operation effectively divides a
+ *  signed value by two without changing its sign. The Carry Flag can be used to
+ *  round the result.
+ */
+static bool trans_ASR(DisasContext *ctx, arg_ASR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+
+    /* Cf */
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1); /* Cf = Rd(0) */
+
+    /* op */
+    tcg_gen_andi_tl(t0, Rd, 0x80); /* Rd = (Rd & 0x80) | (Rd >> 1) */
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  Clears a single Flag in SREG.
+ */
+static bool trans_BCLR(DisasContext *ctx, arg_BCLR *a)
+{
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_movi_tl(cpu_Cf, 0x00);
+        break;
+    case 0x01:
+        tcg_gen_movi_tl(cpu_Zf, 0x01);
+        break;
+    case 0x02:
+        tcg_gen_movi_tl(cpu_Nf, 0x00);
+        break;
+    case 0x03:
+        tcg_gen_movi_tl(cpu_Vf, 0x00);
+        break;
+    case 0x04:
+        tcg_gen_movi_tl(cpu_Sf, 0x00);
+        break;
+    case 0x05:
+        tcg_gen_movi_tl(cpu_Hf, 0x00);
+        break;
+    case 0x06:
+        tcg_gen_movi_tl(cpu_Tf, 0x00);
+        break;
+    case 0x07:
+        tcg_gen_movi_tl(cpu_If, 0x00);
+        break;
+    }
+
+    return true;
+}
+
+/*
+ *  Copies the T Flag in the SREG (Status Register) to bit b in register Rd.
+ */
+static bool trans_BLD(DisasContext *ctx, arg_BLD *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_andi_tl(Rd, Rd, ~(1u << a->bit)); /* clear bit */
+    tcg_gen_shli_tl(t1, cpu_Tf, a->bit); /* create mask */
+    tcg_gen_or_tl(Rd, Rd, t1);
+
+    tcg_temp_free_i32(t1);
+
+    return true;
+}
+
+/*
+ *  Conditional relative branch. Tests a single bit in SREG and branches
+ *  relatively to PC if the bit is cleared. This instruction branches relatively
+ *  to PC in either direction (PC - 63 < = destination <= PC + 64). The
+ *  parameter k is the offset from PC and is represented in two's complement
+ *  form.
+ */
+static bool trans_BRBC(DisasContext *ctx, arg_BRBC *a)
+{
+    TCGLabel *taken = gen_new_label();
+
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Cf, 0, taken);
+        break;
+    case 0x01:
+        tcg_gen_brcondi_i32(TCG_COND_NE, cpu_Zf, 0, taken);
+        break;
+    case 0x02:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Nf, 0, taken);
+        break;
+    case 0x03:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Vf, 0, taken);
+        break;
+    case 0x04:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Sf, 0, taken);
+        break;
+    case 0x05:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Hf, 0, taken);
+        break;
+    case 0x06:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Tf, 0, taken);
+        break;
+    case 0x07:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_If, 0, taken);
+        break;
+    }
+
+    gen_goto_tb(ctx, 1, ctx->inst[0].npc);
+    gen_set_label(taken);
+    gen_goto_tb(ctx, 0, ctx->inst[0].npc + a->imm);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Conditional relative branch. Tests a single bit in SREG and branches
+ *  relatively to PC if the bit is set. This instruction branches relatively to
+ *  PC in either direction (PC - 63 < = destination <= PC + 64). The parameter k
+ *  is the offset from PC and is represented in two's complement form.
+ */
+static bool trans_BRBS(DisasContext *ctx, arg_BRBS *a)
+{
+    TCGLabel *taken = gen_new_label();
+
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Cf, 1, taken);
+        break;
+    case 0x01:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Zf, 0, taken);
+        break;
+    case 0x02:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Nf, 1, taken);
+        break;
+    case 0x03:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Vf, 1, taken);
+        break;
+    case 0x04:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Sf, 1, taken);
+        break;
+    case 0x05:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Hf, 1, taken);
+        break;
+    case 0x06:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_Tf, 1, taken);
+        break;
+    case 0x07:
+        tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_If, 1, taken);
+        break;
+    }
+
+    gen_goto_tb(ctx, 1, ctx->inst[0].npc);
+    gen_set_label(taken);
+    gen_goto_tb(ctx, 0, ctx->inst[0].npc + a->imm);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Sets a single Flag or bit in SREG.
+ */
+static bool trans_BSET(DisasContext *ctx, arg_BSET *a)
+{
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_movi_tl(cpu_Cf, 0x01);
+        break;
+    case 0x01:
+        tcg_gen_movi_tl(cpu_Zf, 0x00);
+        break;
+    case 0x02:
+        tcg_gen_movi_tl(cpu_Nf, 0x01);
+        break;
+    case 0x03:
+        tcg_gen_movi_tl(cpu_Vf, 0x01);
+        break;
+    case 0x04:
+        tcg_gen_movi_tl(cpu_Sf, 0x01);
+        break;
+    case 0x05:
+        tcg_gen_movi_tl(cpu_Hf, 0x01);
+        break;
+    case 0x06:
+        tcg_gen_movi_tl(cpu_Tf, 0x01);
+        break;
+    case 0x07:
+        tcg_gen_movi_tl(cpu_If, 0x01);
+        break;
+    }
+
+    return true;
+}
+
+/*
+ *  The BREAK instruction is used by the On-chip Debug system, and is
+ *  normally not used in the application software. When the BREAK instruction is
+ *  executed, the AVR CPU is set in the Stopped Mode. This gives the On-chip
+ *  Debugger access to internal resources.  If any Lock bits are set, or either
+ *  the JTAGEN or OCDEN Fuses are unprogrammed, the CPU will treat the BREAK
+ *  instruction as a NOP and will not enter the Stopped mode.  This instruction
+ *  is not available in all devices. Refer to the device specific instruction
+ *  set summary.
+ */
+static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_BREAK) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    if (gdb_is_active()) {
+        /* Program counter is set to *current* instruction to mimic AVaRICE. */
+        tcg_gen_movi_tl(cpu_pc, ctx->inst[0].cpc);
+        gen_helper_debug(cpu_env);
+    }
+
+    return true;
+}
+
+/*
+ *  Stores bit b from Rd to the T Flag in SREG (Status Register).
+ */
+static bool trans_BST(DisasContext *ctx, arg_BST *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_andi_tl(cpu_Tf, Rd, 1 << a->bit);
+    tcg_gen_shri_tl(cpu_Tf, cpu_Tf, a->bit);
+
+    return true;
+}
+
+/*
+ *  Calls to a subroutine within the entire Program memory. The return
+ *  address (to the instruction after the CALL) will be stored onto the Stack.
+ *  (See also RCALL). The Stack Pointer uses a post-decrement scheme during
+ *  CALL.  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_CALL(DisasContext *ctx, arg_CALL *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_JMP_CALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    int Imm = a->imm;
+    int ret = ctx->inst[0].npc;
+
+    gen_push_ret(ctx, ret);
+    gen_goto_tb(ctx, 0, Imm);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Clears a specified bit in an I/O Register. This instruction operates on
+ *  the lower 32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, ~(1 << a->bit));
+    gen_helper_outb(cpu_env, port, data);
+
+    tcg_temp_free_i32(data);
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+/*
+ *  Clears the specified bits in register Rd. Performs the logical AND
+ *  between the contents of register Rd and the complement of the constant mask
+ *  K. The result will be placed in register Rd.
+ */
+static bool trans_COM(DisasContext *ctx, arg_COM *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_xori_tl(Rd, Rd, 0xff);
+
+    tcg_gen_movi_tl(cpu_Cf, 1); /* Cf = 1 */
+    tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
+    gen_ZNSf(Rd);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs a compare between two registers Rd and Rr.
+ *  None of the registers are changed. All conditional branches can be used
+ *  after this instruction.
+ */
+static bool trans_CP(DisasContext *ctx, arg_CP *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs a compare between two registers Rd and Rr and
+ *  also takes into account the previous carry. None of the registers are
+ *  changed. All conditional branches can be used after this instruction.
+ */
+static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
+    tcg_gen_sub_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_NSf(R);
+
+    /*
+     * Previous value remains unchanged when the result is zero;
+     * cleared otherwise.
+     */
+    tcg_gen_or_tl(cpu_Zf, cpu_Zf, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs a compare between register Rd and a constant.
+ *  The register is not changed. All conditional branches can be used after this
+ *  instruction.
+ */
+static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    int Imm = a->imm;
+    TCGv Rr = tcg_const_i32(Imm);
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    tcg_temp_free_i32(R);
+    tcg_temp_free_i32(Rr);
+
+    return true;
+}
+
+/*
+ *  This instruction performs a compare between two registers Rd and Rr, and
+ *  skips the next instruction if Rd = Rr.
+ */
+static bool trans_CPSE(DisasContext *ctx, arg_CPSE *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGLabel *skip = gen_new_label();
+
+    /* PC if next inst is skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[1].npc);
+    tcg_gen_brcond_i32(TCG_COND_EQ, Rd, Rr, skip);
+    /* PC if next inst is not skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[0].npc);
+    gen_set_label(skip);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Subtracts one -1- from the contents of register Rd and places the result
+ *  in the destination register Rd.  The C Flag in SREG is not affected by the
+ *  operation, thus allowing the DEC instruction to be used on a loop counter in
+ *  multiple-precision computations.  When operating on unsigned values, only
+ *  BREQ and BRNE branches can be expected to perform consistently.  When
+ *  operating on two's complement values, all signed branches are available.
+ */
+static bool trans_DEC(DisasContext *ctx, arg_DEC *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_subi_tl(Rd, Rd, 1); /* Rd = Rd - 1 */
+    tcg_gen_andi_tl(Rd, Rd, 0xff); /* make it 8 bits */
+
+    /* cpu_Vf = Rd == 0x7f */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x7f);
+    gen_ZNSf(Rd);
+
+    return true;
+}
+
+/*
+ *  The module is an instruction set extension to the AVR CPU, performing
+ *  DES iterations. The 64-bit data block (plaintext or ciphertext) is placed in
+ *  the CPU register file, registers R0-R7, where LSB of data is placed in LSB
+ *  of R0 and MSB of data is placed in MSB of R7. The full 64-bit key (including
+ *  parity bits) is placed in registers R8- R15, organized in the register file
+ *  with LSB of key in LSB of R8 and MSB of key in MSB of R15. Executing one DES
+ *  instruction performs one round in the DES algorithm. Sixteen rounds must be
+ *  executed in increasing order to form the correct DES ciphertext or
+ *  plaintext. Intermediate results are stored in the register file (R0-R15)
+ *  after each DES instruction. The instruction's operand (K) determines which
+ *  round is executed, and the half carry flag (H) determines whether encryption
+ *  or decryption is performed.  The DES algorithm is described in
+ *  "Specifications for the Data Encryption Standard" (Federal Information
+ *  Processing Standards Publication 46). Intermediate results in this
+ *  implementation differ from the standard because the initial permutation and
+ *  the inverse initial permutation are performed each iteration. This does not
+ *  affect the result in the final ciphertext or plaintext, but reduces
+ *  execution time.
+ */
+static bool trans_DES(DisasContext *ctx, arg_DES *a)
+{
+    /* TODO */
+    if (avr_feature(ctx->env, AVR_FEATURE_DES) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    return true;
+}
+
+/*
+ *  Indirect call of a subroutine pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File and the EIND Register in the I/O space. This
+ *  instruction allows for indirect calls to the entire 4M (words) Program
+ *  memory space. See also ICALL. The Stack Pointer uses a post-decrement scheme
+ *  during EICALL.  This instruction is not available in all devices. Refer to
+ *  the device specific instruction set summary.
+ */
+static bool trans_EICALL(DisasContext *ctx, arg_EICALL *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_EIJMP_EICALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    int ret = ctx->inst[0].npc;
+
+    gen_push_ret(ctx, ret);
+
+    gen_jmp_ez();
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Indirect jump to the address pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File and the EIND Register in the I/O space. This
+ *  instruction allows for indirect jumps to the entire 4M (words) Program
+ *  memory space. See also IJMP.  This instruction is not available in all
+ *  devices. Refer to the device specific instruction set summary.
+ */
+static bool trans_EIJMP(DisasContext *ctx, arg_EIJMP *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_EIJMP_EICALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    gen_jmp_ez();
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Loads one byte pointed to by the Z-register and the RAMPZ Register in
+ *  the I/O space, and places this byte in the destination register Rd. This
+ *  instruction features a 100% space effective constant initialization or
+ *  constant data fetch. The Program memory is organized in 16-bit words while
+ *  the Z-pointer is a byte address. Thus, the least significant bit of the
+ *  Z-pointer selects either low byte (ZLSB = 0) or high byte (ZLSB = 1). This
+ *  instruction can address the entire Program memory space. The Z-pointer
+ *  Register can either be left unchanged by the operation, or it can be
+ *  incremented. The incrementation applies to the entire 24-bit concatenation
+ *  of the RAMPZ and Z-pointer Registers.  Devices with Self-Programming
+ *  capability can use the ELPM instruction to read the Fuse and Lock bit value.
+ *  Refer to the device documentation for a detailed description.  This
+ *  instruction is not available in all devices. Refer to the device specific
+ *  instruction set summary.
+ */
+static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_ELPM) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[0];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_ELPM) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_ELPMX) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Performs the logical EOR between the contents of register Rd and
+ *  register Rr and places the result in the destination register Rd.
+ */
+static bool trans_EOR(DisasContext *ctx, arg_EOR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+
+    tcg_gen_xor_tl(Rd, Rd, Rr);
+
+    tcg_gen_movi_tl(cpu_Vf, 0);
+    gen_ZNSf(Rd);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit unsigned
+ *  multiplication and shifts the result one bit left.
+ */
+static bool trans_FMUL(DisasContext *ctx, arg_FMUL *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd *Rr */
+    tcg_gen_shli_tl(R, R, 1);
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
+    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication
+ *  and shifts the result one bit left.
+ */
+static bool trans_FMULS(DisasContext *ctx, arg_FMULS *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
+    tcg_gen_ext8s_tl(t1, Rr); /* make Rr full 32 bit signed */
+    tcg_gen_mul_tl(R, t0, t1); /* R = Rd *Rr */
+    tcg_gen_shli_tl(R, R, 1);
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
+    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication
+ *  and shifts the result one bit left.
+ */
+static bool trans_FMULSU(DisasContext *ctx, arg_FMULSU *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new_i32();
+
+    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
+    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd *Rr */
+    tcg_gen_shli_tl(R, R, 1);
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
+    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Calls to a subroutine within the entire 4M (words) Program memory. The
+ *  return address (to the instruction after the CALL) will be stored onto the
+ *  Stack. See also RCALL. The Stack Pointer uses a post-decrement scheme during
+ *  CALL.  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_ICALL(DisasContext *ctx, arg_ICALL *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_IJMP_ICALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    int ret = ctx->inst[0].npc;
+
+    gen_push_ret(ctx, ret);
+    gen_jmp_z();
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Indirect jump to the address pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File. The Z-pointer Register is 16 bits wide and
+ *  allows jump within the lowest 64K words (128KB) section of Program memory.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_IJMP(DisasContext *ctx, arg_IJMP *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_IJMP_ICALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    gen_jmp_z();
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Loads data from the I/O Space (Ports, Timers, Configuration Registers,
+ *  etc.) into register Rd in the Register File.
+ */
+static bool trans_IN(DisasContext *ctx, arg_IN *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv port = tcg_const_i32(a->imm);
+
+    gen_helper_inb(Rd, cpu_env, port);
+
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+/*
+ *  Adds one -1- to the contents of register Rd and places the result in the
+ *  destination register Rd.  The C Flag in SREG is not affected by the
+ *  operation, thus allowing the INC instruction to be used on a loop counter in
+ *  multiple-precision computations.  When operating on unsigned numbers, only
+ *  BREQ and BRNE branches can be expected to perform consistently. When
+ *  operating on two's complement values, all signed branches are available.
+ */
+static bool trans_INC(DisasContext *ctx, arg_INC *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_addi_tl(Rd, Rd, 1);
+    tcg_gen_andi_tl(Rd, Rd, 0xff);
+
+    /* cpu_Vf = Rd == 0x80 */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x80);
+    gen_ZNSf(Rd);
+    return true;
+}
+
+/*
+ *  Jump to an address within the entire 4M (words) Program memory. See also
+ *  RJMP.  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.0
+ */
+static bool trans_JMP(DisasContext *ctx, arg_JMP *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_JMP_CALL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    gen_goto_tb(ctx, 0, a->imm);
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Load one byte indirect from data space to register and stores an clear
+ *  the bits in data space specified by the register. The instruction can only
+ *  be used towards internal SRAM.  The data location is pointed to by the Z (16
+ *  bits) Pointer Register in the Register File. Memory access is limited to the
+ *  current data segment of 64KB. To access another data segment in devices with
+ *  more than 64KB data space, the RAMPZ in register in the I/O area has to be
+ *  changed.  The Z-pointer Register is left unchanged by the operation. This
+ *  instruction is especially suited for clearing status bits stored in SRAM.
+ */
+static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
+{
+    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+        gen_helper_fullwr(cpu_env, data, addr);
+    } else {
+        tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
+    }
+}
+
+static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
+{
+    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+        gen_helper_fullrd(data, cpu_env, addr);
+    } else {
+        tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
+    }
+}
+
+static bool trans_LAC(DisasContext *ctx, arg_LAC *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_RMW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rr = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+        /* t1 = t0 & (0xff - Rr) = t0 and ~Rr */
+    tcg_gen_andc_tl(t1, t0, Rr);
+
+    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Load one byte indirect from data space to register and set bits in data
+ *  space specified by the register. The instruction can only be used towards
+ *  internal SRAM.  The data location is pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File. Memory access is limited to the current data
+ *  segment of 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
+ *  The Z-pointer Register is left unchanged by the operation. This instruction
+ *  is especially suited for setting status bits stored in SRAM.
+ */
+static bool trans_LAS(DisasContext *ctx, arg_LAS *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_RMW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rr = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+    tcg_gen_or_tl(t1, t0, Rr);
+
+    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Load one byte indirect from data space to register and toggles bits in
+ *  the data space specified by the register.  The instruction can only be used
+ *  towards SRAM.  The data location is pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File. Memory access is limited to the current data
+ *  segment of 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
+ *  The Z-pointer Register is left unchanged by the operation. This instruction
+ *  is especially suited for changing status bits stored in SRAM.
+ */
+static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_RMW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+    tcg_gen_xor_tl(t1, t0, Rd);
+
+    tcg_gen_mov_tl(Rd, t0); /* Rd = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Loads one byte indirect from the data space to a register. For parts
+ *  with SRAM, the data space consists of the Register File, I/O memory and
+ *  internal SRAM (and external SRAM if applicable). For parts without SRAM, the
+ *  data space consists of the Register File only. In some parts the Flash
+ *  Memory has been mapped to the data space and can be read using this command.
+ *  The EEPROM has a separate address space.  The data location is pointed to by
+ *  the X (16 bits) Pointer Register in the Register File. Memory access is
+ *  limited to the current data segment of 64KB. To access another data segment
+ *  in devices with more than 64KB data space, the RAMPX in register in the I/O
+ *  area has to be changed.  The X-pointer Register can either be left unchanged
+ *  by the operation, or it can be post-incremented or predecremented.  These
+ *  features are especially suited for accessing arrays, tables, and Stack
+ *  Pointer usage of the X-pointer Register. Note that only the low byte of the
+ *  X-pointer is updated in devices with no more than 256 bytes data space. For
+ *  such devices, the high byte of the pointer is not used by this instruction
+ *  and can be used for other purposes. The RAMPX Register in the I/O area is
+ *  updated in parts with more than 64KB data space or more than 64KB Program
+ *  memory, and the increment/decrement is added to the entire 24-bit address on
+ *  such devices.  Not all variants of this instruction is available in all
+ *  devices. Refer to the device specific instruction set summary.  In the
+ *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
+ *  operation as LPM since the program memory is mapped to the data memory
+ *  space.
+ */
+static bool trans_LDX1(DisasContext *ctx, arg_LDX1 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDX2(DisasContext *ctx, arg_LDX2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDX3(DisasContext *ctx, arg_LDX3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Loads one byte indirect with or without displacement from the data space
+ *  to a register. For parts with SRAM, the data space consists of the Register
+ *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
+ *  parts without SRAM, the data space consists of the Register File only. In
+ *  some parts the Flash Memory has been mapped to the data space and can be
+ *  read using this command. The EEPROM has a separate address space.  The data
+ *  location is pointed to by the Y (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPY in register in the I/O area has to be changed.  The Y-pointer Register
+ *  can either be left unchanged by the operation, or it can be post-incremented
+ *  or predecremented.  These features are especially suited for accessing
+ *  arrays, tables, and Stack Pointer usage of the Y-pointer Register. Note that
+ *  only the low byte of the Y-pointer is updated in devices with no more than
+ *  256 bytes data space. For such devices, the high byte of the pointer is not
+ *  used by this instruction and can be used for other purposes. The RAMPY
+ *  Register in the I/O area is updated in parts with more than 64KB data space
+ *  or more than 64KB Program memory, and the increment/decrement/displacement
+ *  is added to the entire 24-bit address on such devices.  Not all variants of
+ *  this instruction is available in all devices. Refer to the device specific
+ *  instruction set summary.  In the Reduced Core tinyAVR the LD instruction can
+ *  be used to achieve the same operation as LPM since the program memory is
+ *  mapped to the data memory space.
+ */
+static bool trans_LDY2(DisasContext *ctx, arg_LDY2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDY3(DisasContext *ctx, arg_LDY3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDDY(DisasContext *ctx, arg_LDDY *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Loads one byte indirect with or without displacement from the data space
+ *  to a register. For parts with SRAM, the data space consists of the Register
+ *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
+ *  parts without SRAM, the data space consists of the Register File only. In
+ *  some parts the Flash Memory has been mapped to the data space and can be
+ *  read using this command. The EEPROM has a separate address space.  The data
+ *  location is pointed to by the Z (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPZ in register in the I/O area has to be changed.  The Z-pointer Register
+ *  can either be left unchanged by the operation, or it can be post-incremented
+ *  or predecremented.  These features are especially suited for Stack Pointer
+ *  usage of the Z-pointer Register, however because the Z-pointer Register can
+ *  be used for indirect subroutine calls, indirect jumps and table lookup, it
+ *  is often more convenient to use the X or Y-pointer as a dedicated Stack
+ *  Pointer. Note that only the low byte of the Z-pointer is updated in devices
+ *  with no more than 256 bytes data space. For such devices, the high byte of
+ *  the pointer is not used by this instruction and can be used for other
+ *  purposes. The RAMPZ Register in the I/O area is updated in parts with more
+ *  than 64KB data space or more than 64KB Program memory, and the
+ *  increment/decrement/displacement is added to the entire 24-bit address on
+ *  such devices.  Not all variants of this instruction is available in all
+ *  devices. Refer to the device specific instruction set summary.  In the
+ *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
+ *  operation as LPM since the program memory is mapped to the data memory
+ *  space.  For using the Z-pointer for table lookup in Program memory see the
+ *  LPM and ELPM instructions.
+ */
+static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LDDZ(DisasContext *ctx, arg_LDDZ *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ * Loads an 8 bit constant directly to register 16 to 31.
+ */
+static bool trans_LDI(DisasContext *ctx, arg_LDI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    int imm = a->imm;
+
+    tcg_gen_movi_tl(Rd, imm);
+
+    return true;
+}
+
+/*
+ *  Loads one byte from the data space to a register. For parts with SRAM,
+ *  the data space consists of the Register File, I/O memory and internal SRAM
+ *  (and external SRAM if applicable). For parts without SRAM, the data space
+ *  consists of the register file only. The EEPROM has a separate address space.
+ *  A 16-bit address must be supplied. Memory access is limited to the current
+ *  data segment of 64KB. The LDS instruction uses the RAMPD Register to access
+ *  memory above 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPD in register in the I/O area has to be changed.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_LDS(DisasContext *ctx, arg_LDS *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_rampD;
+
+    tcg_gen_mov_tl(addr, H); /* addr = H:M:L */
+    tcg_gen_shli_tl(addr, addr, 16);
+    tcg_gen_ori_tl(addr, addr, a->imm);
+
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Loads one byte pointed to by the Z-register into the destination
+ *  register Rd. This instruction features a 100% space effective constant
+ *  initialization or constant data fetch. The Program memory is organized in
+ *  16-bit words while the Z-pointer is a byte address. Thus, the least
+ *  significant bit of the Z-pointer selects either low byte (ZLSB = 0) or high
+ *  byte (ZLSB = 1). This instruction can address the first 64KB (32K words) of
+ *  Program memory. The Zpointer Register can either be left unchanged by the
+ *  operation, or it can be incremented. The incrementation does not apply to
+ *  the RAMPZ Register.  Devices with Self-Programming capability can use the
+ *  LPM instruction to read the Fuse and Lock bit values.  Refer to the device
+ *  documentation for a detailed description.  The LPM instruction is not
+ *  available in all devices. Refer to the device specific instruction set
+ *  summary
+ */
+static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_LPM) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[0];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_LPM) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_LPMX) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    tcg_gen_andi_tl(L, addr, 0xff);
+
+    tcg_gen_shri_tl(addr, addr, 8);
+    tcg_gen_andi_tl(H, addr, 0xff);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. Bit 7 is cleared. Bit 0 is
+ *  loaded into the C Flag of the SREG. This operation effectively divides an
+ *  unsigned value by two. The C Flag can be used to round the result.
+ */
+static bool trans_LSR(DisasContext *ctx, arg_LSR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
+
+    tcg_gen_shri_tl(Rd, Rd, 1);
+
+    tcg_gen_mov_tl(cpu_Zf, Rd);
+    tcg_gen_movi_tl(cpu_Nf, 0);
+    tcg_gen_mov_tl(cpu_Vf, cpu_Cf);
+    tcg_gen_mov_tl(cpu_Sf, cpu_Vf);
+
+    return true;
+}
+
+/*
+ *  This instruction makes a copy of one register into another. The source
+ *  register Rr is left unchanged, while the destination register Rd is loaded
+ *  with a copy of Rr.
+ */
+static bool trans_MOV(DisasContext *ctx, arg_MOV *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+
+    tcg_gen_mov_tl(Rd, Rr);
+
+    return true;
+}
+
+/*
+ *  This instruction makes a copy of one register pair into another register
+ *  pair. The source register pair Rr+1:Rr is left unchanged, while the
+ *  destination register pair Rd+1:Rd is loaded with a copy of Rr + 1:Rr.  This
+ *  instruction is not available in all devices. Refer to the device specific
+ *  instruction set summary.
+ */
+static bool trans_MOVW(DisasContext *ctx, arg_MOVW *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MOVW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    TCGv RrL = cpu_r[a->rr];
+    TCGv RrH = cpu_r[a->rr + 1];
+
+    tcg_gen_mov_tl(RdH, RrH);
+    tcg_gen_mov_tl(RdL, RrL);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit unsigned multiplication.
+ */
+static bool trans_MUL(DisasContext *ctx, arg_MUL *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd *Rr */
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(16) */
+    tcg_gen_mov_tl(cpu_Zf, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication.
+ */
+static bool trans_MULS(DisasContext *ctx, arg_MULS *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
+    tcg_gen_ext8s_tl(t1, Rr); /* make Rr full 32 bit signed */
+    tcg_gen_mul_tl(R, t0, t1); /* R = Rd * Rr */
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(16) */
+    tcg_gen_mov_tl(cpu_Zf, R);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit multiplication of a
+ *  signed and an unsigned number.
+ */
+static bool trans_MULSU(DisasContext *ctx, arg_MULSU *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_MUL) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new_i32();
+
+    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
+    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd *Rr */
+
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+
+    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
+    tcg_gen_mov_tl(cpu_Zf, R);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Replaces the contents of register Rd with its two's complement; the
+ *  value $80 is left unchanged.
+ */
+static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_const_i32(0);
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, t0, Rd);
+    gen_sub_Vf(R, t0, Rd);
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction performs a single cycle No Operation.
+ */
+static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
+{
+
+    /* NOP */
+
+    return true;
+}
+
+/*
+ *  Performs the logical OR between the contents of register Rd and register
+ *  Rr and places the result in the destination register Rd.
+ */
+static bool trans_OR(DisasContext *ctx, arg_OR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_or_tl(R, Rd, Rr);
+
+    tcg_gen_movi_tl(cpu_Vf, 0);
+    gen_ZNSf(R);
+
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Performs the logical OR between the contents of register Rd and a
+ *  constant and places the result in the destination register Rd.
+ */
+static bool trans_ORI(DisasContext *ctx, arg_ORI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    int Imm = (a->imm);
+
+    tcg_gen_ori_tl(Rd, Rd, Imm); /* Rd = Rd | Imm */
+
+    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
+    gen_ZNSf(Rd);
+
+    return true;
+}
+
+/*
+ *  Stores data from register Rr in the Register File to I/O Space (Ports,
+ *  Timers, Configuration Registers, etc.).
+ */
+static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv port = tcg_const_i32(a->imm);
+
+    gen_helper_outb(cpu_env, port, Rd);
+
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+/*
+ *  This instruction loads register Rd with a byte from the STACK. The Stack
+ *  Pointer is pre-incremented by 1 before the POP.  This instruction is not
+ *  available in all devices. Refer to the device specific instruction set
+ *  summary.
+ */
+static bool trans_POP(DisasContext *ctx, arg_POP *a)
+{
+    /*
+     * Using a temp to work around some strange behaviour:
+     * tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+     * gen_data_load(ctx, Rd, cpu_sp);
+     * seems to cause the add to happen twice.
+     * This doesn't happen if either the add or the load is removed.
+     */
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_addi_tl(t1, cpu_sp, 1);
+    gen_data_load(ctx, Rd, t1);
+    tcg_gen_mov_tl(cpu_sp, t1);
+
+    return true;
+}
+
+/*
+ *  This instruction stores the contents of register Rr on the STACK. The
+ *  Stack Pointer is post-decremented by 1 after the PUSH.  This instruction is
+ *  not available in all devices. Refer to the device specific instruction set
+ *  summary.
+ */
+static bool trans_PUSH(DisasContext *ctx, arg_PUSH *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    gen_data_store(ctx, Rd, cpu_sp);
+    tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+
+    return true;
+}
+
+/*
+ *  Relative call to an address within PC - 2K + 1 and PC + 2K (words). The
+ *  return address (the instruction after the RCALL) is stored onto the Stack.
+ *  See also CALL. For AVR microcontrollers with Program memory not exceeding 4K
+ *  words (8KB) this instruction can address the entire memory from every
+ *  address location. The Stack Pointer uses a post-decrement scheme during
+ *  RCALL.
+ */
+static bool trans_RCALL(DisasContext *ctx, arg_RCALL *a)
+{
+    int ret = ctx->inst[0].npc;
+    int dst = ctx->inst[0].npc + a->imm;
+
+    gen_push_ret(ctx, ret);
+    gen_goto_tb(ctx, 0, dst);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Returns from subroutine. The return address is loaded from the STACK.
+ *  The Stack Pointer uses a preincrement scheme during RET.
+ */
+static bool trans_RET(DisasContext *ctx, arg_RET *a)
+{
+    gen_pop_ret(ctx, cpu_pc);
+
+    tcg_gen_exit_tb(NULL, 0);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Returns from interrupt. The return address is loaded from the STACK and
+ *  the Global Interrupt Flag is set.  Note that the Status Register is not
+ *  automatically stored when entering an interrupt routine, and it is not
+ *  restored when returning from an interrupt routine. This must be handled by
+ *  the application program. The Stack Pointer uses a pre-increment scheme
+ *  during RETI.
+ */
+static bool trans_RETI(DisasContext *ctx, arg_RETI *a)
+{
+    gen_pop_ret(ctx, cpu_pc);
+
+    tcg_gen_movi_tl(cpu_If, 1);
+
+    tcg_gen_exit_tb(NULL, 0);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Relative jump to an address within PC - 2K +1 and PC + 2K (words). For
+ *  AVR microcontrollers with Program memory not exceeding 4K words (8KB) this
+ *  instruction can address the entire memory from every address location. See
+ *  also JMP.
+ */
+static bool trans_RJMP(DisasContext *ctx, arg_RJMP *a)
+{
+    int dst = ctx->inst[0].npc + a->imm;
+
+    gen_goto_tb(ctx, 0, dst);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. The C Flag is shifted into
+ *  bit 7 of Rd. Bit 0 is shifted into the C Flag.  This operation, combined
+ *  with ASR, effectively divides multi-byte signed values by two. Combined with
+ *  LSR it effectively divides multi-byte unsigned values by two. The Carry Flag
+ *  can be used to round the result.
+ */
+static bool trans_ROR(DisasContext *ctx, arg_ROR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+
+    tcg_gen_shli_tl(t0, cpu_Cf, 7);
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  Subtracts two registers and subtracts with the C Flag and places the
+ *  result in the destination register Rd.
+ */
+static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
+    tcg_gen_sub_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_NSf(R);
+
+    /*
+     * Previous value remains unchanged when the result is zero;
+     * cleared otherwise.
+     */
+    tcg_gen_or_tl(cpu_Zf, cpu_Zf, R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  SBCI -- Subtract Immediate with Carry
+ */
+static bool trans_SBCI(DisasContext *ctx, arg_SBCI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
+    tcg_gen_sub_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_NSf(R);
+
+    /*
+     * Previous value remains unchanged when the result is zero;
+     * cleared otherwise.
+     */
+    tcg_gen_or_tl(cpu_Zf, cpu_Zf, R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+    tcg_temp_free_i32(Rr);
+
+    return true;
+}
+
+/*
+ *  Sets a specified bit in an I/O Register. This instruction operates on
+ *  the lower 32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_ori_tl(data, data, 1 << a->bit);
+    gen_helper_outb(cpu_env, port, data);
+
+    tcg_temp_free_i32(port);
+    tcg_temp_free_i32(data);
+
+    return true;
+}
+
+/*
+ *  This instruction tests a single bit in an I/O Register and skips the
+ *  next instruction if the bit is cleared. This instruction operates on the
+ *  lower 32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+    TCGLabel *skip = gen_new_label();
+
+    gen_helper_inb(data, cpu_env, port);
+
+    /* PC if next inst is skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[1].npc);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, data, 0, skip);
+    /* PC if next inst is not skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[0].npc);
+    gen_set_label(skip);
+
+    tcg_temp_free_i32(port);
+    tcg_temp_free_i32(data);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  This instruction tests a single bit in an I/O Register and skips the
+ *  next instruction if the bit is set. This instruction operates on the lower
+ *  32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+    TCGLabel *skip = gen_new_label();
+
+    gen_helper_inb(data, cpu_env, port);
+
+    /* PC if next inst is skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[1].npc);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
+    tcg_gen_brcondi_i32(TCG_COND_NE, data, 0, skip);
+    /* PC if next inst is not skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[0].npc);
+    gen_set_label(skip);
+
+    tcg_temp_free_i32(port);
+    tcg_temp_free_i32(data);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  Subtracts an immediate value (0-63) from a register pair and places the
+ *  result in the register pair. This instruction operates on the upper four
+ *  register pairs, and is well suited for operations on the Pointer Registers.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_SBIW(DisasContext *ctx, arg_SBIW *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_ADIW_SBIW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    int Imm = (a->imm);
+    TCGv R = tcg_temp_new_i32();
+    TCGv Rd = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_deposit_tl(Rd, RdL, RdH, 8, 8); /* Rd = RdH:RdL */
+    tcg_gen_subi_tl(R, Rd, Imm); /* R = Rd - Imm */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+
+    /* Cf */
+    tcg_gen_andc_tl(cpu_Cf, R, Rd);
+    tcg_gen_shri_tl(cpu_Cf, cpu_Cf, 15); /* Cf = R & ~Rd */
+
+    /* Vf */
+    tcg_gen_andc_tl(cpu_Vf, Rd, R);
+    tcg_gen_shri_tl(cpu_Vf, cpu_Vf, 15); /* Vf = Rd & ~R */
+
+    /* Zf */
+    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
+
+    /* Nf */
+    tcg_gen_shri_tl(cpu_Nf, R, 15); /* Nf = R(15) */
+
+    /* Sf */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+
+    /* R */
+    tcg_gen_andi_tl(RdL, R, 0xff);
+    tcg_gen_shri_tl(RdH, R, 8);
+
+    tcg_temp_free_i32(Rd);
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  This instruction tests a single bit in a register and skips the next
+ *  instruction if the bit is cleared.
+ */
+static bool trans_SBRC(DisasContext *ctx, arg_SBRC *a)
+{
+    TCGv Rr = cpu_r[a->rr];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGLabel *skip = gen_new_label();
+
+    /* PC if next inst is skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[1].npc);
+    tcg_gen_andi_tl(t0, Rr, 1 << a->bit);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, t0, 0, skip);
+    /* PC if next inst is not skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[0].npc);
+    gen_set_label(skip);
+
+    tcg_temp_free_i32(t0);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  This instruction tests a single bit in a register and skips the next
+ *  instruction if the bit is set.
+ */
+static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
+{
+    TCGv Rr = cpu_r[a->rr];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGLabel *skip = gen_new_label();
+
+    /* PC if next inst is skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[1].npc);
+    tcg_gen_andi_tl(t0, Rr, 1 << a->bit);
+    tcg_gen_brcondi_i32(TCG_COND_NE, t0, 0, skip);
+    /* PC if next inst is not skipped */
+    tcg_gen_movi_tl(cpu_pc, ctx->inst[0].npc);
+    gen_set_label(skip);
+
+    tcg_temp_free_i32(t0);
+
+    ctx->bstate = BS_BRANCH;
+    return true;
+}
+
+/*
+ *  This instruction sets the circuit in sleep mode defined by the MCU
+ *  Control Register.
+ */
+static bool trans_SLEEP(DisasContext *ctx, arg_SLEEP *a)
+{
+    gen_helper_sleep(cpu_env);
+
+    ctx->bstate = BS_EXCP;
+    return true;
+}
+
+/*
+ *  SPM can be used to erase a page in the Program memory, to write a page
+ *  in the Program memory (that is already erased), and to set Boot Loader Lock
+ *  bits. In some devices, the Program memory can be written one word at a time,
+ *  in other devices an entire page can be programmed simultaneously after first
+ *  filling a temporary page buffer. In all cases, the Program memory must be
+ *  erased one page at a time. When erasing the Program memory, the RAMPZ and
+ *  Z-register are used as page address. When writing the Program memory, the
+ *  RAMPZ and Z-register are used as page or word address, and the R1:R0
+ *  register pair is used as data(1). When setting the Boot Loader Lock bits,
+ *  the R1:R0 register pair is used as data. Refer to the device documentation
+ *  for detailed description of SPM usage. This instruction can address the
+ *  entire Program memory.  The SPM instruction is not available in all devices.
+ *  Refer to the device specific instruction set summary.  Note: 1. R1
+ *  determines the instruction high byte, and R0 determines the instruction low
+ *  byte.
+ */
+static bool trans_SPM(DisasContext *ctx, arg_SPM *a)
+{
+    /* TODO */
+    if (avr_feature(ctx->env, AVR_FEATURE_SPM) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    return true;
+}
+
+static bool trans_SPMX(DisasContext *ctx, arg_SPMX *a)
+{
+    /* TODO */
+    if (avr_feature(ctx->env, AVR_FEATURE_SPMX) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    return true;
+}
+
+static bool trans_STX1(DisasContext *ctx, arg_STX1 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STX2(DisasContext *ctx, arg_STX2 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STX3(DisasContext *ctx, arg_STX3 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STY2(DisasContext *ctx, arg_STY2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STY3(DisasContext *ctx, arg_STY3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STDY(DisasContext *ctx, arg_STDY *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STZ2(DisasContext *ctx, arg_STZ2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STZ3(DisasContext *ctx, arg_STZ3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STDZ(DisasContext *ctx, arg_STDZ *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Stores one byte from a Register to the data space. For parts with SRAM,
+ *  the data space consists of the Register File, I/O memory and internal SRAM
+ *  (and external SRAM if applicable). For parts without SRAM, the data space
+ *  consists of the Register File only. The EEPROM has a separate address space.
+ *  A 16-bit address must be supplied. Memory access is limited to the current
+ *  data segment of 64KB. The STS instruction uses the RAMPD Register to access
+ *  memory above 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPD in register in the I/O area has to be changed.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_STS(DisasContext *ctx, arg_STS *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_rampD;
+
+    tcg_gen_mov_tl(addr, H); /* addr = H:M:L */
+    tcg_gen_shli_tl(addr, addr, 16);
+    tcg_gen_ori_tl(addr, addr, a->imm);
+
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+/*
+ *  Subtracts two registers and places the result in the destination
+ *  register Rd.
+ */
+static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
+}
+
+/*
+ *  Subtracts a register and a constant and places the result in the
+ *  destination register Rd. This instruction is working on Register R16 to R31
+ *  and is very well suited for operations on the X, Y, and Z-pointers.
+ */
+static bool trans_SUBI(DisasContext *ctx, arg_SUBI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv R = tcg_temp_new_i32();
+
+    /* op */
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Imm */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+
+    /* R */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+    tcg_temp_free_i32(Rr);
+
+    return true;
+}
+
+/*
+ *  Swaps high and low nibbles in a register.
+ */
+static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_andi_tl(t0, Rd, 0x0f);
+    tcg_gen_shli_tl(t0, t0, 4);
+    tcg_gen_andi_tl(t1, Rd, 0xf0);
+    tcg_gen_shri_tl(t1, t1, 4);
+    tcg_gen_or_tl(Rd, t0, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  This instruction resets the Watchdog Timer. This instruction must be
+ *  executed within a limited time given by the WD prescaler. See the Watchdog
+ *  Timer hardware specification.
+ */
+static bool trans_WDR(DisasContext *ctx, arg_WDR *a)
+{
+    gen_helper_wdr(cpu_env);
+
+    return true;
+}
+
+/*
+ *  Exchanges one byte indirect between register and data space.  The data
+ *  location is pointed to by the Z (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPZ in register in the I/O area has to be changed.  The Z-pointer Register
+ *  is left unchanged by the operation. This instruction is especially suited
+ *  for writing/reading status bits stored in SRAM.
+ */
+static bool trans_XCH(DisasContext *ctx, arg_XCH *a)
+{
+    if (avr_feature(ctx->env, AVR_FEATURE_RMW) == false) {
+        gen_helper_unsupported(cpu_env);
+
+        ctx->bstate = BS_EXCP;
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_load(ctx, t0, addr);
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+void avr_cpu_tcg_init(void)
+{
+    int i;
+
+#define AVR_REG_OFFS(x) offsetof(CPUAVRState, x)
+    cpu_pc = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(pc_w), "pc");
+    cpu_Cf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregC), "Cf");
+    cpu_Zf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregZ), "Zf");
+    cpu_Nf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregN), "Nf");
+    cpu_Vf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregV), "Vf");
+    cpu_Sf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregS), "Sf");
+    cpu_Hf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregH), "Hf");
+    cpu_Tf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregT), "Tf");
+    cpu_If = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregI), "If");
+    cpu_rampD = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampD), "rampD");
+    cpu_rampX = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampX), "rampX");
+    cpu_rampY = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampY), "rampY");
+    cpu_rampZ = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampZ), "rampZ");
+    cpu_eind = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(eind), "eind");
+    cpu_sp = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sp), "sp");
+
+    for (i = 0; i < 32; i++) {
+        char name[16];
+
+        sprintf(name, "r[%d]", i);
+
+        cpu_r[i] = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(r[i]), name);
+    }
+}
+
+static void decode_opc(DisasContext *ctx, InstInfo *inst)
+{
+    uint32_t temp;
+    uint32_t opcode32;
+    uint16_t opcode16;
+    /* PC points to words.  */
+    temp = cpu_ldl_code(ctx->env, inst->cpc * 2);
+    opcode16 = temp & 0x0000ffff;
+    opcode32 = (temp << 16) | (temp >> 16);
+
+    /*  1001 000d dddd 0000 kkkk kkkk kkkk kkkk - LDS   */
+    bool lds = ((opcode32 & 0xfe0f0000) == 0x90000000);
+    /*  1001 001d dddd 0000 kkkk kkkk kkkk kkkk - STS   */
+    bool sts = ((opcode32 & 0xfe0f0000) == 0x92000000);
+    /*  1001 010k kkkk 110k kkkk kkkk kkkk kkkk - JMP   */
+    bool jmp = ((opcode32 & 0xfe0e0000) == 0x940c0000);
+    /*  1001 010k kkkk 111k kkkk kkkk kkkk kkkk - CALL  */
+    bool cll = ((opcode32 & 0xfe0e0000) == 0x940e0000);
+
+    if (lds || sts || jmp || cll) {
+        inst->length = 32;
+        inst->opcode = opcode32;
+        inst->npc = inst->cpc + 2;
+    } else {
+        inst->length = 16;
+        inst->opcode = opcode16;
+        inst->npc = inst->cpc + 1;
+    }
+}
+
+static void translate(DisasContext *ctx, const InstInfo *inst)
+{
+    int res;
+
+    if (inst->length == 16) {
+        res = decode_insn16(ctx, inst->opcode);
+    } else {
+        res = decode_insn32(ctx, inst->opcode);
+    }
+
+    if (res == false) {
+        gen_helper_unsupported(cpu_env);
+        ctx->bstate = BS_EXCP;
+    }
+}
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    CPUAVRState *env = cs->env_ptr;
+    DisasContext ctx = {
+        .tb = tb,
+        .env = env,
+        .memidx = 0,
+        .bstate = BS_NONE,
+        .singlestep = cs->singlestep_enabled,
+    };
+    target_ulong pc_start = tb->pc / 2;
+    int num_insns = 0;
+    target_ulong cpc;
+    target_ulong npc;
+
+    if (tb->flags & TB_FLAGS_FULL_ACCESS) {
+        /*
+         * This flag is set by ST/LD instruction we will regenerate it ONLY
+         * with mem/cpu memory access instead of mem access
+         */
+        max_insns = 1;
+    }
+
+    gen_tb_start(tb);
+
+    /* decode first instruction */
+    ctx.inst[0].cpc = pc_start;
+    decode_opc(&ctx, &ctx.inst[0]);
+    do {
+        /* set curr/next PCs */
+        cpc = ctx.inst[0].cpc;
+        npc = ctx.inst[0].npc;
+
+        /* decode next instruction */
+        ctx.inst[1].cpc = ctx.inst[0].npc;
+        decode_opc(&ctx, &ctx.inst[1]);
+
+        /* translate current instruction */
+        tcg_gen_insn_start(cpc);
+        num_insns++;
+
+        /*
+         * this is due to some strange GDB behavior
+         * let's assume main has address 0x100
+         * b main   - sets breakpoint at address 0x00000100 (code)
+         * b *0x100 - sets breakpoint at address 0x00800100 (data)
+         */
+        if (unlikely(cpu_breakpoint_test(cs, OFFSET_CODE + cpc * 2, BP_ANY))
+                 || cpu_breakpoint_test(cs, OFFSET_DATA + cpc * 2, BP_ANY)) {
+            tcg_gen_movi_i32(cpu_pc, cpc);
+            gen_helper_debug(cpu_env);
+            ctx.bstate = BS_EXCP;
+            goto done_generating;
+        }
+
+        translate(&ctx, &ctx.inst[0]);
+
+        if (num_insns >= max_insns) {
+            break; /* max translated instructions limit reached */
+        }
+        if (ctx.singlestep) {
+            break; /* single step */
+        }
+        if ((cpc & (TARGET_PAGE_SIZE - 1)) == 0) {
+            break; /* page boundary */
+        }
+
+        ctx.inst[0] = ctx.inst[1]; /* make next inst curr */
+    } while (ctx.bstate == BS_NONE && !tcg_op_buf_full());
+
+    if (tb->cflags & CF_LAST_IO) {
+        gen_io_end();
+    }
+
+    if (ctx.singlestep) {
+        if (ctx.bstate == BS_STOP || ctx.bstate == BS_NONE) {
+            tcg_gen_movi_tl(cpu_pc, npc);
+        }
+        gen_helper_debug(cpu_env);
+        tcg_gen_exit_tb(NULL, 0);
+    } else {
+        switch (ctx.bstate) {
+        case BS_STOP:
+        case BS_NONE:
+            gen_goto_tb(&ctx, 0, npc);
+            break;
+        case BS_EXCP:
+        case BS_BRANCH:
+            tcg_gen_exit_tb(NULL, 0);
+            break;
+        default:
+            break;
+        }
+    }
+
+done_generating:
+    gen_tb_end(tb, num_insns);
+
+    tb->size = (npc - pc_start) * 2;
+    tb->icount = num_insns;
+}
+
+void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
+                            target_ulong *data)
+{
+    env->pc_w = data[0];
+}
+
+void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "\n");
+    qemu_fprintf(f, "PC:    %06x\n", env->pc_w);
+    qemu_fprintf(f, "SP:      %04x\n", env->sp);
+    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
+    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
+    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
+    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
+    qemu_fprintf(f, "EIND:      %02x\n", env->eind);
+    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
+    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
+    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
+    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
+                        env->sregI ? 'I' : '-',
+                        env->sregT ? 'T' : '-',
+                        env->sregH ? 'H' : '-',
+                        env->sregS ? 'S' : '-',
+                        env->sregV ? 'V' : '-',
+                        env->sregN ? '-' : 'N', /* Zf has negative logic */
+                        env->sregZ ? 'Z' : '-',
+                        env->sregC ? 'I' : '-');
+
+    qemu_fprintf(f, "\n");
+    for (i = 0; i < ARRAY_SIZE(env->r); i++) {
+        qemu_fprintf(f, "R[%02d]:  %02x   ", i, env->r[i]);
+
+        if ((i % 8) == 7) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+    qemu_fprintf(f, "\n");
+}
-- 
2.18.0


