Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9F1475C6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 01:54:50 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iunFJ-00075h-Dq
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 19:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCP-0001Iw-Ls
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 19:51:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCM-00053B-7k
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 19:51:49 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38482)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCL-00052U-Tl; Thu, 23 Jan 2020 19:51:46 -0500
Received: by mail-wr1-x442.google.com with SMTP id y17so73617wrh.5;
 Thu, 23 Jan 2020 16:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGKSjwQf4inwl2X1hBeN0XP7ive7WPFMJjXi3Q5CvZ0=;
 b=C9jPLfxol813k95iUIAX7cZj/nFvJHcV2RPR958QCg4UKxHoXzt1X3SyLrXTnmjjE9
 EeZL0mAivxcuf640sueP6ke4+r3LGYjZsykv//04oxbjR0qUvqmbQiMXnma3wbwSgwVm
 VAGpplslf+WagqlgvpTpN/9I9Rz03cHi9PawfgGKpF45LuslmGRFwUVdJompbvy68DYf
 qi/36ZzqCSVME4f1bChy2Jnzryu+N/DVH6WUjMEGbG+NSlppP86WV3fSRuhf6CkT+EBb
 2gahsh/S+16NSjb+PJ2qHMa8+nslFCuxL/XvCY3bWRegPERUAGQVOESG7waj4HJadksc
 ltlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bGKSjwQf4inwl2X1hBeN0XP7ive7WPFMJjXi3Q5CvZ0=;
 b=CZSDYwYzb0rdb6GjJ0D9e0mU4ees8B8bo7sWqY649uLd2kNk0ABW8tK2XZfRGkaYIE
 U5hBXp1tkt0pFClRzo+0+QFKDD8aV8H8ONgz/iWvan0/bFqcQdxfkVJkzHugeQdin3Dj
 E9pdtTryNE9kV9MqG4DztFWnAgdmF79OUGzD79Pa5cFY+S9EDmjikF1bpYTo01qqh+wu
 TpJxBJwV3AVM7MompiMZHQuavDHEivnLJqSEgI3rjsQor7bGJKiGAcl+i7EABBMfc3Vd
 J73VYKHRGboNQMHY2S6T6cNANOoXGUK/4cNzCEuqzc+9tN8OKilYWPefCGg29ZrnCY1c
 PKZQ==
X-Gm-Message-State: APjAAAUUGiuX+7tx0vGKzkIXW+77ImXXiN0C9Rjc2VDg4kU7S1czZYOj
 dOrDVY8n6owA5luaFa0QNkKWOyB3
X-Google-Smtp-Source: APXvYqy5c+SUHc2EEB7K9Li0xVtMMcuNQ/CODN+Ev/f2KNT4Yfigj8kuy28HlNPg+JvLNgh/yLGYoA==
X-Received: by 2002:adf:e984:: with SMTP id h4mr835764wrm.275.1579827104252;
 Thu, 23 Jan 2020 16:51:44 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id s139sm4598271wme.35.2020.01.23.16.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 16:51:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar
Subject: [PATCH rc2 04/25] target/avr: Add instruction translation -
 Arithmetic and Logic Instructions
Date: Fri, 24 Jan 2020 01:51:10 +0100
Message-Id: <20200124005131.16276-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200124005131.16276-1-f4bug@amsat.org>
References: <20200124005131.16276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 S.E.Harris@kent.ac.uk, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, dovgaluk@ispras.ru,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, thuth@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, imammedo@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

This includes:
- ADD, ADC, ADIW
- SBIW, SUB, SUBI, SBC, SBCI
- AND, ANDI
- OR, ORI, EOR
- COM, NEG
- INC, DEC
- MUL, MULS, MULSU
- FMUL, FMULS, FMULSU
- DES

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200118191416.19934-5-mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 752 +++++++++++++++++++++++++++++++++++++++++
 target/avr/insn.decode |  93 +++++
 2 files changed, 845 insertions(+)
 create mode 100644 target/avr/insn.decode

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 535f666d18..00fb3f5350 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -169,3 +169,755 @@ static bool avr_have_feature(DisasContext *ctx, int feature)
 
 static bool decode_insn(DisasContext *ctx, uint16_t insn);
 #include "decode_insn.inc.c"
+
+/*
+ * Arithmetic Instructions
+ */
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
+    tcg_gen_shri_tl(cpu_Cf, t1, 7); /* Cf = t1(7) */
+    tcg_gen_shri_tl(cpu_Hf, t1, 3); /* Hf = t1(3) */
+    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
+
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+
+static void gen_add_Vf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+
+    /* t1 = Rd & Rr & ~R | ~Rd & ~Rr & R */
+    /*    = (Rd ^ R) & ~(Rd ^ Rr) */
+    tcg_gen_xor_tl(t1, Rd, R);
+    tcg_gen_xor_tl(t2, Rd, Rr);
+    tcg_gen_andc_tl(t1, t1, t2);
+    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+
+static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+    TCGv t3 = tcg_temp_new_i32();
+
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
+
+static void gen_sub_Vf(TCGv R, TCGv Rd, TCGv Rr)
+{
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv t2 = tcg_temp_new_i32();
+
+    /* t1 = Rd & ~Rr & ~R | ~Rd & Rr & R */
+    /*    = (Rd ^ R) & (Rd ^ R) */
+    tcg_gen_xor_tl(t1, Rd, R);
+    tcg_gen_xor_tl(t2, Rd, Rr);
+    tcg_gen_and_tl(t1, t1, t2);
+    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+
+static void gen_NSf(TCGv R)
+{
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+
+static void gen_ZNSf(TCGv R)
+{
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
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
+    tcg_gen_add_tl(R, Rd, Rr); /* Rd = Rd + Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_add_CHf(R, Rd, Rr);
+    gen_add_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+    /* update output registers */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+
+    return true;
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
+    tcg_gen_add_tl(R, Rd, Rr); /* R = Rd + Rr + Cf */
+    tcg_gen_add_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_add_CHf(R, Rd, Rr);
+    gen_add_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+    /* update output registers */
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_ADIW_SBIW)) {
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    int Imm = (a->imm);
+    TCGv R = tcg_temp_new_i32();
+    TCGv Rd = tcg_temp_new_i32();
+
+    tcg_gen_deposit_tl(Rd, RdL, RdH, 8, 8); /* Rd = RdH:RdL */
+    tcg_gen_addi_tl(R, Rd, Imm); /* R = Rd + Imm */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+    /* update status register */
+    tcg_gen_andc_tl(cpu_Cf, Rd, R); /* Cf = Rd & ~R */
+    tcg_gen_shri_tl(cpu_Cf, cpu_Cf, 15);
+    tcg_gen_andc_tl(cpu_Vf, R, Rd); /* Vf = R & ~Rd */
+    tcg_gen_shri_tl(cpu_Vf, cpu_Vf, 15);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    tcg_gen_shri_tl(cpu_Nf, R, 15); /* Nf = R(15) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf);/* Sf = Nf ^ Vf */
+    /* update output registers */
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
+ *  Subtracts two registers and places the result in the destination
+ *  register Rd.
+ */
+static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    tcg_gen_andc_tl(cpu_Cf, Rd, R); /* Cf = Rd & ~R */
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+    /* update output registers */
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
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Imm */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_ZNSf(R);
+    /* update output registers */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(R);
+    tcg_temp_free_i32(Rr);
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
+    TCGv zero = tcg_const_i32(0);
+
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
+    tcg_gen_sub_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_NSf(R);
+
+    /*
+     * Previous value remains unchanged when the result is zero;
+     * cleared otherwise.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, cpu_Zf, R, zero, cpu_Zf, zero);
+    /* update output registers */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(zero);
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
+    TCGv zero = tcg_const_i32(0);
+
+    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
+    tcg_gen_sub_tl(R, R, cpu_Cf);
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_sub_CHf(R, Rd, Rr);
+    gen_sub_Vf(R, Rd, Rr);
+    gen_NSf(R);
+
+    /*
+     * Previous value remains unchanged when the result is zero;
+     * cleared otherwise.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, cpu_Zf, R, zero, cpu_Zf, zero);
+    /* update output registers */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(zero);
+    tcg_temp_free_i32(R);
+    tcg_temp_free_i32(Rr);
+
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_ADIW_SBIW)) {
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    int Imm = (a->imm);
+    TCGv R = tcg_temp_new_i32();
+    TCGv Rd = tcg_temp_new_i32();
+
+    tcg_gen_deposit_tl(Rd, RdL, RdH, 8, 8); /* Rd = RdH:RdL */
+    tcg_gen_subi_tl(R, Rd, Imm); /* R = Rd - Imm */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+    /* update status register */
+    tcg_gen_andc_tl(cpu_Cf, R, Rd);
+    tcg_gen_shri_tl(cpu_Cf, cpu_Cf, 15); /* Cf = R & ~Rd */
+    tcg_gen_andc_tl(cpu_Vf, Rd, R);
+    tcg_gen_shri_tl(cpu_Vf, cpu_Vf, 15); /* Vf = Rd & ~R */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    tcg_gen_shri_tl(cpu_Nf, R, 15); /* Nf = R(15) */
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+    /* update output registers */
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
+    tcg_gen_and_tl(R, Rd, Rr); /* Rd = Rd and Rr */
+    /* update status register */
+    tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    gen_ZNSf(R);
+    /* update output registers */
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
+    tcg_gen_andi_tl(Rd, Rd, Imm); /* Rd = Rd & Imm */
+    /* update status register */
+    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
+    gen_ZNSf(Rd);
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
+    /* update status register */
+    tcg_gen_movi_tl(cpu_Vf, 0);
+    gen_ZNSf(R);
+    /* update output registers */
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
+    /* update status register */
+    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
+    gen_ZNSf(Rd);
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
+    /* update status register */
+    tcg_gen_movi_tl(cpu_Vf, 0);
+    gen_ZNSf(Rd);
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
+    /* update status register */
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
+ *  Replaces the contents of register Rd with its two's complement; the
+ *  value $80 is left unchanged.
+ */
+static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_const_i32(0);
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
+    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
+    /* update status register */
+    gen_sub_CHf(R, t0, Rd);
+    gen_sub_Vf(R, t0, Rd);
+    gen_ZNSf(R);
+    /* update output registers */
+    tcg_gen_mov_tl(Rd, R);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
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
+    /* update status register */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x80); /* Vf = Rd == 0x80 */
+    gen_ZNSf(Rd);
+
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
+    /* update status register */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x7f); /* Vf = Rd == 0x7f */
+    gen_ZNSf(Rd);
+
+    return true;
+}
+
+/*
+ *  This instruction performs 8-bit x 8-bit -> 16-bit unsigned multiplication.
+ */
+static bool trans_MUL(DisasContext *ctx, arg_MUL *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd * Rr */
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
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
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
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
+    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd * Rr */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make R 16 bits */
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
+        return true;
+    }
+
+    TCGv R0 = cpu_r[0];
+    TCGv R1 = cpu_r[1];
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+    TCGv R = tcg_temp_new_i32();
+
+    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd * Rr */
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    /* update output registers */
+    tcg_gen_shli_tl(R, R, 1);
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
+
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
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
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    /* update output registers */
+    tcg_gen_shli_tl(R, R, 1);
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
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
+    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd * Rr */
+    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
+    /* update status register */
+    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    /* update output registers */
+    tcg_gen_shli_tl(R, R, 1);
+    tcg_gen_andi_tl(R0, R, 0xff);
+    tcg_gen_shri_tl(R1, R, 8);
+    tcg_gen_andi_tl(R1, R1, 0xff);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(R);
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
+    if (!avr_have_feature(ctx, AVR_FEATURE_DES)) {
+        return true;
+    }
+
+    return true;
+}
diff --git a/target/avr/insn.decode b/target/avr/insn.decode
new file mode 100644
index 0000000000..9c71ed6b2f
--- /dev/null
+++ b/target/avr/insn.decode
@@ -0,0 +1,93 @@
+#
+# AVR instruction decode definitions.
+#
+# Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
+
+#
+#   regs_16_31_by_one = [16 .. 31]
+#   regs_16_23_by_one = [16 .. 23]
+#   regs_24_30_by_two = [24, 26, 28, 30]
+#   regs_00_30_by_two = [0, 2, 4, 6, 8, .. 30]
+
+%rd             4:5
+%rr             9:1 0:4
+
+%rd_a           4:4                         !function=to_regs_16_31_by_one
+%rd_b           4:3                         !function=to_regs_16_23_by_one
+%rd_c           4:2                         !function=to_regs_24_30_by_two
+%rd_d           4:4                         !function=to_regs_00_30_by_two
+%rr_a           0:4                         !function=to_regs_16_31_by_one
+%rr_b           0:3                         !function=to_regs_16_23_by_one
+%rr_d           0:4                         !function=to_regs_00_30_by_two
+
+%imm6           6:2 0:4
+%imm8           8:4 0:4
+
+%io_imm         9:2 0:4
+%ldst_d_imm     13:1 10:2 0:3
+
+# The 22-bit immediate is partially in the opcode word,
+# and partially in the next.  Use append_16 to build the
+# complete 22-bit value.
+%imm_call       4:5 0:1                     !function=append_16
+
+
+&rd_rr          rd rr
+&rd_imm         rd imm
+
+@op_rd_rr       .... .. . ..... ....        &rd_rr      rd=%rd rr=%rr
+@op_rd_imm6     .... .... .. .. ....        &rd_imm     rd=%rd_c imm=%imm6
+@op_rd_imm8     .... .... .... ....         &rd_imm     rd=%rd_a imm=%imm8
+@op_bit         .... .... . bit:3 ....
+@op_bit_imm     .... .. imm:s7 bit:3
+@fmul           .... .... . ... . ...       &rd_rr      rd=%rd_b rr=%rr_b
+@io_rd_imm      .... . .. ..... ....        &rd_imm     rd=%rd imm=%io_imm
+@ldst_d         .. . . .. . rd:5  . ...     &rd_imm     imm=%ldst_d_imm
+
+# The 16-bit immediate is completely in the next word.
+# Fields cannot be defined with no bits, so we cannot play
+# the same trick and append to a zero-bit value.
+# Defer reading the immediate until trans_{LDS,STS}.
+@ldst_s         .... ... rd:5 ....          imm=0
+
+#
+# Arithmetic Instructions
+#
+ADD             0000 11 . ..... ....        @op_rd_rr
+ADC             0001 11 . ..... ....        @op_rd_rr
+ADIW            1001 0110 .. .. ....        @op_rd_imm6
+SUB             0001 10 . ..... ....        @op_rd_rr
+SUBI            0101 .... .... ....         @op_rd_imm8
+SBC             0000 10 . ..... ....        @op_rd_rr
+SBCI            0100 .... .... ....         @op_rd_imm8
+SBIW            1001 0111 .. .. ....        @op_rd_imm6
+AND             0010 00 . ..... ....        @op_rd_rr
+ANDI            0111 .... .... ....         @op_rd_imm8
+OR              0010 10 . ..... ....        @op_rd_rr
+ORI             0110 .... .... ....         @op_rd_imm8
+EOR             0010 01 . ..... ....        @op_rd_rr
+COM             1001 010 rd:5 0000
+NEG             1001 010 rd:5 0001
+INC             1001 010 rd:5 0011
+DEC             1001 010 rd:5 1010
+MUL             1001 11 . ..... ....        @op_rd_rr
+MULS            0000 0010 .... ....         &rd_rr      rd=%rd_a rr=%rr_a
+MULSU           0000 0011 0 ... 0 ...       @fmul
+FMUL            0000 0011 0 ... 1 ...       @fmul
+FMULS           0000 0011 1 ... 0 ...       @fmul
+FMULSU          0000 0011 1 ... 1 ...       @fmul
+DES             1001 0100 imm:4 1011
-- 
2.21.1


