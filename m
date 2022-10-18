Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61B602D9F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:07 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6b-0005IQ-8K
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhR-00048Y-IN
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhN-00058M-9R
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51Uo/JDueUn1Yh1wB94rcbI9KY2tdfCqokjIWinqdqc=;
 b=SHLJ5RwYkGYWDNcT3eA08aFHuwa9NGJpqK7j5DTvX/xcm+JIy95LNyEAwUC+f2KmtY5HFE
 cfTrnqACqNsudFbOVbatpj7mV4qeLBoFmx/EGLqltz6QkJP746cLH/jtXkgkOEB4kCFX0M
 8snITxzZtgfHHPrEQBDI4yGqphy3p0c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-Nw31yZjzPeSoJwAjyH53Hw-1; Tue, 18 Oct 2022 09:31:59 -0400
X-MC-Unique: Nw31yZjzPeSoJwAjyH53Hw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so4285928edb.22
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=51Uo/JDueUn1Yh1wB94rcbI9KY2tdfCqokjIWinqdqc=;
 b=QfQt3LK6DUIV8UtidMWDSowb83FI6JqXWdxufhostPNkQCO5Nnn2DoucDCE/nxYIbF
 mCOm0U/yGNutLivwXprk7A0NK4CyLkoh5NuDYXmpo9mv25AzY1/uT1RUBaoFr3BL6aXt
 CyrHrsiUO45NSS67y05HlZHg71Y6iWjSOiwx2vPJl6bSoKy88vF0gRCxtM6hxrqKScPl
 u1Kb+uIp/3aHy5M5NIJluY65iU70xiz8mZTfPc5jCXtDIQU2ABjAkYQ4lvR2V5x7dJ0l
 xbDTUFKVLmyo1QqxY8BovXzhfcDFoaqjn3kPTC5QZxWS9s7GnyMJn9qdons1vpfx3aNv
 XqvQ==
X-Gm-Message-State: ACrzQf3+577bmkFc9tz996E8giSZJtMOgf/Ua2GBRIVt11H/3pleXWQf
 8VzaL8JoR5C/B83W0M1N3UGiXBWHvdZ9SOFc7AzrcHu5yPhGBiJ815nSg87YH2UTZlZZYAI/q1r
 unjzOOfJgn62hMfQRxjhGfHmxQH4ixU3gQm3oLGnuj13rUx6Li90ZHv6a8cn0Je2DjHI=
X-Received: by 2002:a17:907:6296:b0:787:d066:9fcf with SMTP id
 nd22-20020a170907629600b00787d0669fcfmr2328934ejc.692.1666099917023; 
 Tue, 18 Oct 2022 06:31:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5558lmjtUfdkxeWbqYoZo9JhsYNdf9VCR3mStDxDK16okaUWANtrUvRu/AD9WFhFkTl3r7Qg==
X-Received: by 2002:a17:907:6296:b0:787:d066:9fcf with SMTP id
 nd22-20020a170907629600b00787d0669fcfmr2328865ejc.692.1666099915796; 
 Tue, 18 Oct 2022 06:31:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056402345100b0045cba869e84sm9001636edc.26.2022.10.18.06.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/53] target/i386: add core of new i386 decoder
Date: Tue, 18 Oct 2022 15:30:10 +0200
Message-Id: <20221018133042.856368-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new decoder is based on three principles:

- use mostly table-driven decoding, using tables derived as much as possible
  from the Intel manual.  Centralizing the decode the operands makes it
  more homogeneous, for example all immediates are signed.  All modrm
  handling is in one function, and can be shared between SSE and ALU
  instructions (including XMM<->GPR instructions).  The SSE/AVX decoder
  will also not have duplicated code between the 0F, 0F38 and 0F3A tables.

- keep the code as "non-branchy" as possible.  Generally, the code for
  the new decoder is more verbose, but the control flow is simpler.
  Conditionals are not nested and have small bodies.  All instruction
  groups are resolved even before operands are decoded, and code
  generation is separated as much as possible within small functions
  that only handle one instruction each.

- keep address generation and (for ALU operands) memory loads and writeback
  as much in common code as possible.  All ALU operations for example
  are implemented as T0=f(T0,T1).  For non-ALU instructions,
  read-modify-write memory operations are rare, but registers do not
  have TCGv equivalents: therefore, the common logic sets up pointer
  temporaries with the operands, while load and writeback are handled
  by gvec or by helpers.

These principles make future code review and extensibility simpler, at
the cost of having a relatively large amount of code in the form of this
patch.  Even EVEX should not be _too_ hard to implement (it's just a crazy
large amount of possibilities).

This patch introduces the main decoder flow, and integrates the old
decoder with the new one.  The old decoder takes care of parsing
prefixes and then optionally drops to the new one.  The changes to the
old decoder are minimal and allow it to be replaced incrementally with
the new one.

There is a debugging mechanism through a "LIMIT" environment variable.
In user-mode emulation, the variable is the number of instructions
decoded by the new decoder before permanently switching to the old one.
In system emulation, the variable is the highest opcode that is decoded
by the new decoder (this is less friendly, but it's the best that can
be done without requiring deterministic execution).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 748 +++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     | 181 ++++++++
 target/i386/tcg/emit.c.inc       |  31 ++
 target/i386/tcg/translate.c      |  68 ++-
 4 files changed, 1020 insertions(+), 8 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-new.h
 create mode 100644 target/i386/tcg/emit.c.inc

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
new file mode 100644
index 0000000000..65f9c1de40
--- /dev/null
+++ b/target/i386/tcg/decode-new.c.inc
@@ -0,0 +1,748 @@
+/*
+ * New-style decoder for i386 instructions
+ *
+ *  Copyright (c) 2022 Red Hat, Inc.
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
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
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * The decoder is mostly based on tables copied from the Intel SDM.  As
+ * a result, most operand load and writeback is done entirely in common
+ * table-driven code using the same operand type (X86_TYPE_*) and
+ * size (X86_SIZE_*) codes used in the manual.
+ *
+ * The main difference is that the V, U and W types are extended to
+ * cover MMX as well; if an instruction is like
+ *
+ *      por   Pq, Qq
+ *  66  por   Vx, Hx, Wx
+ *
+ * only the second row is included and the instruction is marked as a
+ * valid MMX instruction.  The MMX flag directs the decoder to rewrite
+ * the V/U/H/W types to P/N/P/Q if there is no prefix, as well as changing
+ * "x" to "q" if there is no prefix.
+ *
+ * In addition, the ss/ps/sd/pd types are sometimes mushed together as "x"
+ * if the difference is expressed via prefixes.  Individual instructions
+ * are separated by prefix in the generator functions.
+ *
+ * There are a couple cases in which instructions (e.g. MOVD) write the
+ * whole XMM or MM register but are established incorrectly in the manual
+ * as "d" or "q".  These have to be fixed for the decoder to work correctly.
+ */
+
+#define X86_OP_NONE { 0 },
+
+#define X86_OP_GROUP3(op, op0_, s0_, op1_, s1_, op2_, s2_, ...) { \
+    .decode = glue(decode_, op),                                  \
+    .op0 = glue(X86_TYPE_, op0_),                                 \
+    .s0 = glue(X86_SIZE_, s0_),                                   \
+    .op1 = glue(X86_TYPE_, op1_),                                 \
+    .s1 = glue(X86_SIZE_, s1_),                                   \
+    .op2 = glue(X86_TYPE_, op2_),                                 \
+    .s2 = glue(X86_SIZE_, s2_),                                   \
+    .is_decode = true,                                            \
+    ## __VA_ARGS__                                                \
+}
+
+#define X86_OP_GROUP2(op, op0, s0, op1, s1, ...)                  \
+    X86_OP_GROUP3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_GROUP0(op, ...)                                    \
+    X86_OP_GROUP3(op, None, None, None, None, None, None, ## __VA_ARGS__)
+
+#define X86_OP_ENTRY3(op, op0_, s0_, op1_, s1_, op2_, s2_, ...) { \
+    .gen = glue(gen_, op),                                        \
+    .op0 = glue(X86_TYPE_, op0_),                                 \
+    .s0 = glue(X86_SIZE_, s0_),                                   \
+    .op1 = glue(X86_TYPE_, op1_),                                 \
+    .s1 = glue(X86_SIZE_, s1_),                                   \
+    .op2 = glue(X86_TYPE_, op2_),                                 \
+    .s2 = glue(X86_SIZE_, s2_),                                   \
+    ## __VA_ARGS__                                                \
+}
+
+#define X86_OP_ENTRY4(op, op0_, s0_, op1_, s1_, op2_, s2_, ...)   \
+    X86_OP_ENTRY3(op, op0_, s0_, op1_, s1_, op2_, s2_,            \
+        .op3 = X86_TYPE_I, .s3 = X86_SIZE_b,                      \
+        ## __VA_ARGS__)
+
+#define X86_OP_ENTRY2(op, op0, s0, op1, s1, ...)                  \
+    X86_OP_ENTRY3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_ENTRY0(op, ...)                                    \
+    X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
+
+#define i64 .special = X86_SPECIAL_i64,
+#define o64 .special = X86_SPECIAL_o64,
+#define xchg .special = X86_SPECIAL_Locked,
+#define mmx .special = X86_SPECIAL_MMX,
+#define zext0 .special = X86_SPECIAL_ZExtOp0,
+#define zext2 .special = X86_SPECIAL_ZExtOp2,
+
+static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
+{
+    if (!s->has_modrm) {
+        s->modrm = x86_ldub_code(env, s);
+        s->has_modrm = true;
+    }
+    return s->modrm;
+}
+
+static const X86OpEntry opcodes_0F38_00toEF[240] = {
+};
+
+/* five rows for no prefix, 66, F3, F2, 66+F2  */
+static const X86OpEntry opcodes_0F38_F0toFF[16][5] = {
+};
+
+static void decode_0F38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    if (*b < 0xf0) {
+        *entry = opcodes_0F38_00toEF[*b];
+    } else {
+        int row = 0;
+        if (s->prefix & PREFIX_REPZ) {
+            /* The REPZ (F3) prefix has priority over 66 */
+            row = 2;
+        } else {
+            row += s->prefix & PREFIX_REPNZ ? 3 : 0;
+            row += s->prefix & PREFIX_DATA ? 1 : 0;
+        }
+        *entry = opcodes_0F38_F0toFF[*b & 15][row];
+    }
+}
+
+static const X86OpEntry opcodes_0F3A[256] = {
+};
+
+static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    *entry = opcodes_0F3A[*b];
+}
+
+static const X86OpEntry opcodes_0F[256] = {
+    [0x38] = X86_OP_GROUP0(0F38),
+    [0x3a] = X86_OP_GROUP0(0F3A),
+};
+
+static void do_decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *entry = opcodes_0F[*b];
+}
+
+static void decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    do_decode_0F(s, env, entry, b);
+}
+
+static const X86OpEntry opcodes_root[256] = {
+    [0x0F] = X86_OP_GROUP0(0F),
+};
+
+#undef mmx
+
+/*
+ * Decode the fixed part of the opcode and place the last
+ * in b.
+ */
+static void decode_root(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *entry = opcodes_root[*b];
+}
+
+
+static int decode_modrm(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                        X86DecodedOp *op, X86OpType type)
+{
+    int modrm = get_modrm(s, env);
+    if ((modrm >> 6) == 3) {
+        if (s->prefix & PREFIX_LOCK) {
+            decode->e.gen = gen_illegal;
+            return 0xff;
+        }
+        op->n = (modrm & 7);
+        if (type != X86_TYPE_Q && type != X86_TYPE_N) {
+            op->n |= REX_B(s);
+        }
+    } else {
+        op->has_ea = true;
+        op->n = -1;
+        decode->mem = gen_lea_modrm_0(env, s, get_modrm(s, env));
+    }
+    return modrm;
+}
+
+static bool decode_op_size(DisasContext *s, X86OpEntry *e, X86OpSize size, MemOp *ot)
+{
+    switch (size) {
+    case X86_SIZE_b:  /* byte */
+        *ot = MO_8;
+        return true;
+
+    case X86_SIZE_d:  /* 32-bit */
+    case X86_SIZE_ss: /* SSE/AVX scalar single precision */
+        *ot = MO_32;
+        return true;
+
+    case X86_SIZE_p:  /* Far pointer, return offset size */
+    case X86_SIZE_s:  /* Descriptor, return offset size */
+    case X86_SIZE_v:  /* 16/32/64-bit, based on operand size */
+        *ot = s->dflag;
+        return true;
+
+    case X86_SIZE_pi: /* MMX */
+    case X86_SIZE_q:  /* 64-bit */
+    case X86_SIZE_sd: /* SSE/AVX scalar double precision */
+        *ot = MO_64;
+        return true;
+
+    case X86_SIZE_w:  /* 16-bit */
+        *ot = MO_16;
+        return true;
+
+    case X86_SIZE_y:  /* 32/64-bit, based on operand size */
+        *ot = s->dflag == MO_16 ? MO_32 : s->dflag;
+        return true;
+
+    case X86_SIZE_z:  /* 16-bit for 16-bit operand size, else 32-bit */
+        *ot = s->dflag == MO_16 ? MO_16 : MO_32;
+        return true;
+
+    case X86_SIZE_dq: /* SSE/AVX 128-bit */
+        if (e->special == X86_SPECIAL_MMX &&
+            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+            *ot = MO_64;
+            return true;
+        }
+        if (s->vex_l && e->s0 != X86_SIZE_qq && e->s1 != X86_SIZE_qq) {
+            return false;
+        }
+        *ot = MO_128;
+        return true;
+
+    case X86_SIZE_qq: /* AVX 256-bit */
+        if (!s->vex_l) {
+            return false;
+        }
+        *ot = MO_256;
+        return true;
+
+    case X86_SIZE_x:  /* 128/256-bit, based on operand size */
+        if (e->special == X86_SPECIAL_MMX &&
+            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+            *ot = MO_64;
+            return true;
+        }
+        /* fall through */
+    case X86_SIZE_ps: /* SSE/AVX packed single precision */
+    case X86_SIZE_pd: /* SSE/AVX packed double precision */
+        *ot = s->vex_l ? MO_256 : MO_128;
+        return true;
+
+    case X86_SIZE_d64:  /* Default to 64-bit in 64-bit mode */
+        *ot = CODE64(s) && s->dflag == MO_32 ? MO_64 : s->dflag;
+        return true;
+
+    case X86_SIZE_f64:  /* Ignore size override prefix in 64-bit mode */
+        *ot = CODE64(s) ? MO_64 : s->dflag;
+        return true;
+
+    default:
+        *ot = -1;
+        return true;
+    }
+}
+
+static bool decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                      X86DecodedOp *op, X86OpType type, int b)
+{
+    int modrm;
+
+    switch (type) {
+    case X86_TYPE_None:  /* Implicit or absent */
+    case X86_TYPE_A:  /* Implicit */
+    case X86_TYPE_F:  /* EFLAGS/RFLAGS */
+        break;
+
+    case X86_TYPE_B:  /* VEX.vvvv selects a GPR */
+        op->unit = X86_OP_INT;
+        op->n = s->vex_v;
+        break;
+
+    case X86_TYPE_C:  /* REG in the modrm byte selects a control register */
+        op->unit = X86_OP_CR;
+        goto get_reg;
+
+    case X86_TYPE_D:  /* REG in the modrm byte selects a debug register */
+        op->unit = X86_OP_DR;
+        goto get_reg;
+
+    case X86_TYPE_G:  /* REG in the modrm byte selects a GPR */
+        op->unit = X86_OP_INT;
+        goto get_reg;
+
+    case X86_TYPE_S:  /* reg selects a segment register */
+        op->unit = X86_OP_SEG;
+        goto get_reg;
+
+    case X86_TYPE_P:
+        op->unit = X86_OP_MMX;
+        goto get_reg;
+
+    case X86_TYPE_V:  /* reg in the modrm byte selects an XMM/YMM register */
+        if (decode->e.special == X86_SPECIAL_MMX &&
+            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+            op->unit = X86_OP_MMX;
+        } else {
+            op->unit = X86_OP_SSE;
+        }
+    get_reg:
+        op->n = ((get_modrm(s, env) >> 3) & 7) | REX_R(s);
+        break;
+
+    case X86_TYPE_E:  /* ALU modrm operand */
+        op->unit = X86_OP_INT;
+        goto get_modrm;
+
+    case X86_TYPE_Q:  /* MMX modrm operand */
+        op->unit = X86_OP_MMX;
+        goto get_modrm;
+
+    case X86_TYPE_W:  /* XMM/YMM modrm operand */
+        if (decode->e.special == X86_SPECIAL_MMX &&
+            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+            op->unit = X86_OP_MMX;
+        } else {
+            op->unit = X86_OP_SSE;
+        }
+        goto get_modrm;
+
+    case X86_TYPE_N:  /* R/M in the modrm byte selects an MMX register */
+        op->unit = X86_OP_MMX;
+        goto get_modrm_reg;
+
+    case X86_TYPE_U:  /* R/M in the modrm byte selects an XMM/YMM register */
+        if (decode->e.special == X86_SPECIAL_MMX &&
+            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+            op->unit = X86_OP_MMX;
+        } else {
+            op->unit = X86_OP_SSE;
+        }
+        goto get_modrm_reg;
+
+    case X86_TYPE_R:  /* R/M in the modrm byte selects a register */
+        op->unit = X86_OP_INT;
+    get_modrm_reg:
+        modrm = get_modrm(s, env);
+        if ((modrm >> 6) != 3) {
+            return false;
+        }
+        goto get_modrm;
+
+    case X86_TYPE_M:  /* modrm byte selects a memory operand */
+        modrm = get_modrm(s, env);
+        if ((modrm >> 6) == 3) {
+            return false;
+        }
+    get_modrm:
+        decode_modrm(s, env, decode, op, type);
+        break;
+
+    case X86_TYPE_O:  /* Absolute address encoded in the instruction */
+        op->unit = X86_OP_INT;
+        op->has_ea = true;
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_DS,
+            .base = -1,
+            .index = -1,
+            .disp = insn_get_addr(env, s, s->aflag)
+        };
+        break;
+
+    case X86_TYPE_H:  /* For AVX, VEX.vvvv selects an XMM/YMM register */
+        if ((s->prefix & PREFIX_VEX)) {
+            op->unit = X86_OP_SSE;
+            op->n = s->vex_v;
+            break;
+        }
+        if (op == &decode->op[0]) {
+            /* shifts place the destination in VEX.vvvv, use modrm */
+            return decode_op(s, env, decode, op, decode->e.op1, b);
+        } else {
+            return decode_op(s, env, decode, op, decode->e.op0, b);
+        }
+
+    case X86_TYPE_I:  /* Immediate */
+        op->unit = X86_OP_IMM;
+        decode->immediate = insn_get_signed(env, s, op->ot);
+        break;
+
+    case X86_TYPE_J:  /* Relative offset for a jump */
+        op->unit = X86_OP_IMM;
+        decode->immediate = insn_get_signed(env, s, op->ot);
+        decode->immediate += s->pc - s->cs_base;
+        if (s->dflag == MO_16) {
+            decode->immediate &= 0xffff;
+        } else if (!CODE64(s)) {
+            decode->immediate &= 0xffffffffu;
+        }
+        break;
+
+    case X86_TYPE_L:  /* The upper 4 bits of the immediate select a 128-bit register */
+        op->n = insn_get(env, s, op->ot) >> 4;
+        break;
+
+    case X86_TYPE_X:  /* string source */
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_DS,
+            .base = R_ESI,
+            .index = -1,
+        };
+        break;
+
+    case X86_TYPE_Y:  /* string destination */
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_ES,
+            .base = R_EDI,
+            .index = -1,
+        };
+        break;
+
+    case X86_TYPE_2op:
+        *op = decode->op[0];
+        break;
+
+    case X86_TYPE_LoBits:
+        op->n = (b & 7) | REX_B(s);
+        op->unit = X86_OP_INT;
+        break;
+
+    case X86_TYPE_0 ... X86_TYPE_7:
+        op->n = type - X86_TYPE_0;
+        op->unit = X86_OP_INT;
+        break;
+
+    case X86_TYPE_ES ... X86_TYPE_GS:
+        op->n = type - X86_TYPE_ES;
+        op->unit = X86_OP_SEG;
+        break;
+    }
+
+    return true;
+}
+
+static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_func,
+                        X86DecodedInsn *decode)
+{
+    X86OpEntry *e = &decode->e;
+
+    decode_func(s, env, e, &decode->b);
+    while (e->is_decode) {
+        e->is_decode = false;
+        e->decode(s, env, e, &decode->b);
+    }
+
+    /* First compute size of operands in order to initialize s->rip_offset.  */
+    if (e->op0 != X86_TYPE_None) {
+        if (!decode_op_size(s, e, e->s0, &decode->op[0].ot)) {
+            return false;
+        }
+        if (e->op0 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[0].ot;
+        }
+    }
+    if (e->op1 != X86_TYPE_None) {
+        if (!decode_op_size(s, e, e->s1, &decode->op[1].ot)) {
+            return false;
+        }
+        if (e->op1 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[1].ot;
+        }
+    }
+    if (e->op2 != X86_TYPE_None) {
+        if (!decode_op_size(s, e, e->s2, &decode->op[2].ot)) {
+            return false;
+        }
+        if (e->op2 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[2].ot;
+        }
+    }
+    if (e->op3 != X86_TYPE_None) {
+        assert(e->op3 == X86_TYPE_I && e->s3 == X86_SIZE_b);
+        s->rip_offset += 1;
+    }
+
+    if (e->op0 != X86_TYPE_None &&
+        !decode_op(s, env, decode, &decode->op[0], e->op0, decode->b)) {
+        return false;
+    }
+
+    if (e->op1 != X86_TYPE_None &&
+        !decode_op(s, env, decode, &decode->op[1], e->op1, decode->b)) {
+        return false;
+    }
+
+    if (e->op2 != X86_TYPE_None &&
+        !decode_op(s, env, decode, &decode->op[2], e->op2, decode->b)) {
+        return false;
+    }
+
+    if (e->op3 != X86_TYPE_None) {
+        decode->immediate = insn_get_signed(env, s, MO_8);
+    }
+
+    return true;
+}
+
+/*
+ * Convert one instruction. s->base.is_jmp is set if the translation must
+ * be stopped.
+ */
+static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
+{
+    CPUX86State *env = cpu->env_ptr;
+    bool first = true;
+    X86DecodedInsn decode;
+    X86DecodeFunc decode_func = decode_root;
+
+#ifdef CONFIG_USER_ONLY
+    if (limit) { --limit; }
+#endif
+    s->has_modrm = false;
+
+ next_byte:
+    if (first) {
+        first = false;
+    } else {
+        b = x86_ldub_code(env, s);
+    }
+    /* Collect prefixes.  */
+    switch (b) {
+    case 0xf3:
+        s->prefix |= PREFIX_REPZ;
+        s->prefix &= ~PREFIX_REPNZ;
+        goto next_byte;
+    case 0xf2:
+        s->prefix |= PREFIX_REPNZ;
+        s->prefix &= ~PREFIX_REPZ;
+        goto next_byte;
+    case 0xf0:
+        s->prefix |= PREFIX_LOCK;
+        goto next_byte;
+    case 0x2e:
+        s->override = R_CS;
+        goto next_byte;
+    case 0x36:
+        s->override = R_SS;
+        goto next_byte;
+    case 0x3e:
+        s->override = R_DS;
+        goto next_byte;
+    case 0x26:
+        s->override = R_ES;
+        goto next_byte;
+    case 0x64:
+        s->override = R_FS;
+        goto next_byte;
+    case 0x65:
+        s->override = R_GS;
+        goto next_byte;
+    case 0x66:
+        s->prefix |= PREFIX_DATA;
+        goto next_byte;
+    case 0x67:
+        s->prefix |= PREFIX_ADR;
+        goto next_byte;
+#ifdef TARGET_X86_64
+    case 0x40 ... 0x4f:
+        if (CODE64(s)) {
+            /* REX prefix */
+            s->prefix |= PREFIX_REX;
+            s->vex_w = (b >> 3) & 1;
+            s->rex_r = (b & 0x4) << 1;
+            s->rex_x = (b & 0x2) << 2;
+            s->rex_b = (b & 0x1) << 3;
+            goto next_byte;
+        }
+        break;
+#endif
+    case 0xc5: /* 2-byte VEX */
+    case 0xc4: /* 3-byte VEX */
+        /*
+         * VEX prefixes cannot be used except in 32-bit mode.
+         * Otherwise the instruction is LES or LDS.
+         */
+        if (CODE32(s) && !VM86(s)) {
+            static const int pp_prefix[4] = {
+                0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
+            };
+            int vex3, vex2 = x86_ldub_code(env, s);
+
+            if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
+                /*
+                 * 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
+                 * otherwise the instruction is LES or LDS.
+                 */
+                s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
+                break;
+            }
+
+            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
+            if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ
+                             | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
+                goto illegal_op;
+            }
+#ifdef TARGET_X86_64
+            s->rex_r = (~vex2 >> 4) & 8;
+#endif
+            if (b == 0xc5) {
+                /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
+                vex3 = vex2;
+                decode_func = decode_0F;
+            } else {
+                /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
+                vex3 = x86_ldub_code(env, s);
+#ifdef TARGET_X86_64
+                s->rex_x = (~vex2 >> 3) & 8;
+                s->rex_b = (~vex2 >> 2) & 8;
+#endif
+                s->vex_w = (vex3 >> 7) & 1;
+                switch (vex2 & 0x1f) {
+                case 0x01: /* Implied 0f leading opcode bytes.  */
+                    decode_func = decode_0F;
+                    break;
+                case 0x02: /* Implied 0f 38 leading opcode bytes.  */
+                    decode_func = decode_0F38;
+                    break;
+                case 0x03: /* Implied 0f 3a leading opcode bytes.  */
+                    decode_func = decode_0F3A;
+                    break;
+                default:   /* Reserved for future use.  */
+                    goto unknown_op;
+                }
+            }
+            s->vex_v = (~vex3 >> 3) & 0xf;
+            s->vex_l = (vex3 >> 2) & 1;
+            s->prefix |= pp_prefix[vex3 & 3] | PREFIX_VEX;
+        }
+        break;
+    default:
+        if (b >= 0x100) {
+            b -= 0x100;
+            decode_func = do_decode_0F;
+        }
+        break;
+    }
+
+    /* Post-process prefixes.  */
+    if (CODE64(s)) {
+        /*
+         * In 64-bit mode, the default data size is 32-bit.  Select 64-bit
+         * data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
+         * over 0x66 if both are present.
+         */
+        s->dflag = (REX_W(s) ? MO_64 : s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
+        s->aflag = (s->prefix & PREFIX_ADR ? MO_32 : MO_64);
+    } else {
+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
+        if (CODE32(s) ^ ((s->prefix & PREFIX_DATA) != 0)) {
+            s->dflag = MO_32;
+        } else {
+            s->dflag = MO_16;
+        }
+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
+        if (CODE32(s) ^ ((s->prefix & PREFIX_ADR) != 0)) {
+            s->aflag = MO_32;
+        }  else {
+            s->aflag = MO_16;
+        }
+    }
+
+    memset(&decode, 0, sizeof(decode));
+    decode.b = b;
+    if (!decode_insn(s, env, decode_func, &decode)) {
+        goto illegal_op;
+    }
+    if (!decode.e.gen) {
+        goto unknown_op;
+    }
+
+    switch (decode.e.special) {
+    case X86_SPECIAL_None:
+        break;
+
+    case X86_SPECIAL_Locked:
+        if (decode.op[0].has_ea) {
+            s->prefix |= PREFIX_LOCK;
+        }
+        break;
+
+    case X86_SPECIAL_ProtMode:
+        if (!PE(s) || VM86(s)) {
+            goto illegal_op;
+        }
+        break;
+
+    case X86_SPECIAL_i64:
+        if (CODE64(s)) {
+            goto illegal_op;
+        }
+        break;
+    case X86_SPECIAL_o64:
+        if (!CODE64(s)) {
+            goto illegal_op;
+        }
+        break;
+
+    case X86_SPECIAL_ZExtOp0:
+        assert(decode.op[0].unit == X86_OP_INT);
+        if (!decode.op[0].has_ea) {
+            decode.op[0].ot = MO_32;
+        }
+        break;
+
+    case X86_SPECIAL_ZExtOp2:
+        assert(decode.op[2].unit == X86_OP_INT);
+        if (!decode.op[2].has_ea) {
+            decode.op[2].ot = MO_32;
+        }
+        break;
+
+    case X86_SPECIAL_MMX:
+        if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
+            gen_helper_enter_mmx(cpu_env);
+        }
+        break;
+    }
+
+    if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
+        gen_load_ea(s, &decode.mem);
+    }
+    decode.e.gen(s, env, &decode);
+    return;
+ illegal_op:
+    gen_illegal_opcode(s);
+    return;
+ unknown_op:
+    gen_unknown_opcode(env, s);
+}
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
new file mode 100644
index 0000000000..2f22d4d22e
--- /dev/null
+++ b/target/i386/tcg/decode-new.h
@@ -0,0 +1,181 @@
+/*
+ * Decode table flags, mostly based on Intel SDM.
+ *
+ *  Copyright (c) 2022 Red Hat, Inc.
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
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
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+typedef enum X86OpType {
+    X86_TYPE_None,
+
+    X86_TYPE_A, /* Implicit */
+    X86_TYPE_B, /* VEX.vvvv selects a GPR */
+    X86_TYPE_C, /* REG in the modrm byte selects a control register */
+    X86_TYPE_D, /* REG in the modrm byte selects a debug register */
+    X86_TYPE_E, /* ALU modrm operand */
+    X86_TYPE_F, /* EFLAGS/RFLAGS */
+    X86_TYPE_G, /* REG in the modrm byte selects a GPR */
+    X86_TYPE_H, /* For AVX, VEX.vvvv selects an XMM/YMM register */
+    X86_TYPE_I, /* Immediate */
+    X86_TYPE_J, /* Relative offset for a jump */
+    X86_TYPE_L, /* The upper 4 bits of the immediate select a 128-bit register */
+    X86_TYPE_M, /* modrm byte selects a memory operand */
+    X86_TYPE_N, /* R/M in the modrm byte selects an MMX register */
+    X86_TYPE_O, /* Absolute address encoded in the instruction */
+    X86_TYPE_P, /* reg in the modrm byte selects an MMX register */
+    X86_TYPE_Q, /* MMX modrm operand */
+    X86_TYPE_R, /* R/M in the modrm byte selects a register */
+    X86_TYPE_S, /* reg selects a segment register */
+    X86_TYPE_U, /* R/M in the modrm byte selects an XMM/YMM register */
+    X86_TYPE_V, /* reg in the modrm byte selects an XMM/YMM register */
+    X86_TYPE_W, /* XMM/YMM modrm operand */
+    X86_TYPE_X, /* string source */
+    X86_TYPE_Y, /* string destination */
+
+    /* Custom */
+    X86_TYPE_2op, /* 2-operand RMW instruction */
+    X86_TYPE_LoBits, /* encoded in bits 0-2 of the operand + REX.B */
+    X86_TYPE_0, /* Hard-coded GPRs (RAX..RDI) */
+    X86_TYPE_1,
+    X86_TYPE_2,
+    X86_TYPE_3,
+    X86_TYPE_4,
+    X86_TYPE_5,
+    X86_TYPE_6,
+    X86_TYPE_7,
+    X86_TYPE_ES, /* Hard-coded segment registers */
+    X86_TYPE_CS,
+    X86_TYPE_SS,
+    X86_TYPE_DS,
+    X86_TYPE_FS,
+    X86_TYPE_GS,
+} X86OpType;
+
+typedef enum X86OpSize {
+    X86_SIZE_None,
+
+    X86_SIZE_a,  /* BOUND operand */
+    X86_SIZE_b,  /* byte */
+    X86_SIZE_d,  /* 32-bit */
+    X86_SIZE_dq, /* SSE/AVX 128-bit */
+    X86_SIZE_p,  /* Far pointer */
+    X86_SIZE_pd, /* SSE/AVX packed double precision */
+    X86_SIZE_pi, /* MMX */
+    X86_SIZE_ps, /* SSE/AVX packed single precision */
+    X86_SIZE_q,  /* 64-bit */
+    X86_SIZE_qq, /* AVX 256-bit */
+    X86_SIZE_s,  /* Descriptor */
+    X86_SIZE_sd, /* SSE/AVX scalar double precision */
+    X86_SIZE_ss, /* SSE/AVX scalar single precision */
+    X86_SIZE_si, /* 32-bit GPR */
+    X86_SIZE_v,  /* 16/32/64-bit, based on operand size */
+    X86_SIZE_w,  /* 16-bit */
+    X86_SIZE_x,  /* 128/256-bit, based on operand size */
+    X86_SIZE_y,  /* 32/64-bit, based on operand size */
+    X86_SIZE_z,  /* 16-bit for 16-bit operand size, else 32-bit */
+
+    /* Custom */
+    X86_SIZE_d64,
+    X86_SIZE_f64,
+} X86OpSize;
+
+/* Execution flags */
+
+typedef enum X86OpUnit {
+    X86_OP_SKIP,    /* not valid or managed by emission function */
+    X86_OP_SEG,     /* segment selector */
+    X86_OP_CR,      /* control register */
+    X86_OP_DR,      /* debug register */
+    X86_OP_INT,     /* loaded into/stored from s->T0/T1 */
+    X86_OP_IMM,     /* immediate */
+    X86_OP_SSE,     /* address in either s->ptrX or s->A0 depending on has_ea */
+    X86_OP_MMX,     /* address in either s->ptrX or s->A0 depending on has_ea */
+} X86OpUnit;
+
+typedef enum X86InsnSpecial {
+    X86_SPECIAL_None,
+
+    /* Always locked if it has a memory operand (XCHG) */
+    X86_SPECIAL_Locked,
+
+    /* Fault outside protected mode */
+    X86_SPECIAL_ProtMode,
+
+    /*
+     * Register operand 0/2 is zero extended to 32 bits.  Rd/Mb or Rd/Mw
+     * in the manual.
+     */
+    X86_SPECIAL_ZExtOp0,
+    X86_SPECIAL_ZExtOp2,
+
+    /*
+     * MMX instruction exists with no prefix; if there is no prefix, V/H/W/U operands
+     * become P/P/Q/N, and size "x" becomes "q".
+     */
+    X86_SPECIAL_MMX,
+
+    /* Illegal or exclusive to 64-bit mode */
+    X86_SPECIAL_i64,
+    X86_SPECIAL_o64,
+} X86InsnSpecial;
+
+typedef struct X86OpEntry  X86OpEntry;
+typedef struct X86DecodedInsn X86DecodedInsn;
+
+/* Decode function for multibyte opcodes.  */
+typedef void (*X86DecodeFunc)(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b);
+
+/* Code generation function.  */
+typedef void (*X86GenFunc)(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode);
+
+struct X86OpEntry {
+    /* Based on the is_decode flags.  */
+    union {
+        X86GenFunc gen;
+        X86DecodeFunc decode;
+    };
+    /* op0 is always written, op1 and op2 are always read.  */
+    X86OpType    op0:8;
+    X86OpSize    s0:8;
+    X86OpType    op1:8;
+    X86OpSize    s1:8;
+    X86OpType    op2:8;
+    X86OpSize    s2:8;
+    /* Must be I and b respectively if present.  */
+    X86OpType    op3:8;
+    X86OpSize    s3:8;
+
+    X86InsnSpecial special:8;
+    bool         is_decode:1;
+};
+
+typedef struct X86DecodedOp {
+    int8_t n;
+    MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
+    X86OpUnit unit;
+    bool has_ea;
+} X86DecodedOp;
+
+struct X86DecodedInsn {
+    X86OpEntry e;
+    X86DecodedOp op[3];
+    target_ulong immediate;
+    AddressParts mem;
+
+    uint8_t b;
+};
+
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
new file mode 100644
index 0000000000..e86364ffc1
--- /dev/null
+++ b/target/i386/tcg/emit.c.inc
@@ -0,0 +1,31 @@
+/*
+ * New-style TCG opcode generator for i386 instructions
+ *
+ *  Copyright (c) 2022 Red Hat, Inc.
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
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
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+static void gen_illegal(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_illegal_opcode(s);
+}
+
+static void gen_load_ea(DisasContext *s, AddressParts *mem)
+{
+    TCGv ea = gen_lea_modrm_1(s, *mem);
+    gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 279e34e0d0..a9cf6c00aa 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -86,6 +86,9 @@ typedef struct DisasContext {
     int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
     uint8_t prefix;
 
+    bool has_modrm;
+    uint8_t modrm;
+
 #ifndef CONFIG_USER_ONLY
     uint8_t cpl;   /* code priv level */
     uint8_t iopl;  /* i/o priv level */
@@ -2425,6 +2428,31 @@ static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp ot)
     return ret;
 }
 
+static target_long insn_get_signed(CPUX86State *env, DisasContext *s, MemOp ot)
+{
+    target_long ret;
+
+    switch (ot) {
+    case MO_8:
+        ret = (int8_t) x86_ldub_code(env, s);
+        break;
+    case MO_16:
+        ret = (int16_t) x86_lduw_code(env, s);
+        break;
+    case MO_32:
+        ret = (int32_t) x86_ldl_code(env, s);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        ret = x86_ldq_code(env, s);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
 static inline int insn_const_size(MemOp ot)
 {
     if (ot <= MO_32) {
@@ -2927,6 +2955,11 @@ typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
 typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
 
+static bool first = true; static unsigned long limit;
+#include "decode-new.h"
+#include "emit.c.inc"
+#include "decode-new.c.inc"
+
 #define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
 #define SSE_OPF_SPECIAL   (1 << 3) /* magic */
 #define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
@@ -4859,10 +4892,35 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
     prefixes = 0;
 
+    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
+    bool use_new = true;
+#ifdef CONFIG_USER_ONLY
+    use_new &= limit > 0;
+#endif
  next_byte:
+    s->prefix = prefixes;
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
     switch (b) {
+    default:
+#ifndef CONFIG_USER_ONLY
+        use_new &= b <= limit;
+#endif
+        if (use_new && 0) {
+            disas_insn_new(s, cpu, b);
+            return s->pc;
+        }
+        break;
+    case 0x0f:
+        b = x86_ldub_code(env, s) + 0x100;
+#ifndef CONFIG_USER_ONLY
+        use_new &= b <= limit;
+#endif
+        if (use_new && 0) {
+            disas_insn_new(s, cpu, b + 0x100);
+            return s->pc;
+        }
+        break;
     case 0xf3:
         prefixes |= PREFIX_REPZ;
         prefixes &= ~PREFIX_REPNZ;
@@ -4913,6 +4971,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0xc5: /* 2-byte VEX */
     case 0xc4: /* 3-byte VEX */
+        use_new = false;
         /* VEX prefixes cannot be used except in 32-bit mode.
            Otherwise the instruction is LES or LDS.  */
         if (CODE32(s) && !VM86(s)) {
@@ -4997,14 +5056,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     s->dflag = dflag;
 
     /* now check op code */
- reswitch:
-    switch(b) {
-    case 0x0f:
-        /**************************/
-        /* extended op code */
-        b = x86_ldub_code(env, s) | 0x100;
-        goto reswitch;
-
+    switch (b) {
         /**************************/
         /* arith & logic */
     case 0x00 ... 0x05:
-- 
2.37.3


