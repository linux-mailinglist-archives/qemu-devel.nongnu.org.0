Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA14602E1C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:15:31 +0200 (CEST)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknNS-00038n-Aa
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiR-0004RL-Vx
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhe-0005FE-Di
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfSaYGguZ4N5nvJ/l5lKobhGOQddQwK6wwIF7gUioj0=;
 b=ItsU09+QfGIJ4xr52sunjCOVScKI/W24ZeBgGSTCwMpS9i/th2dMDuDTKjc0yuKWIjFK/U
 mE1qwqOZPOe0kQZSEV7BJfIXBJmJPGgHrEVvBKLJRLMulVSKPVQgjiGFIfC49JEzugrQ74
 A1Z9J11AIc5LfawjOSxe0pUCYNa4/Gs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-wScmDLoZNmanu2oMgolEnA-1; Tue, 18 Oct 2022 09:32:14 -0400
X-MC-Unique: wScmDLoZNmanu2oMgolEnA-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso6344377ejc.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfSaYGguZ4N5nvJ/l5lKobhGOQddQwK6wwIF7gUioj0=;
 b=iDVp1pHST7JSxE/WtsMr7EptcHYvYwDHBqvP+mudU+/wJTYMOD/eJZ8vGRkGtGX+yb
 CvcOqRMFYaYEAtTnFVwRQgaVwxy8ihXPQzHhmwiGQ8Oq2j9YJilnguvXbVAqB7sD4PW5
 XI8beUWMiM3QOf0ZPOFaE+hnN/AExqgwc1IOupHAerhFVt+2xgamYDbr8uKqnp0mMSp4
 qaAg5K6eZJr81D117RsGwq5x+CGjigZavN0urCqOk+DfcttM1owqS5nlcf0B8gMfuxvD
 1mgoGfJL7jfmIj8zKcgre/GJ9ebky/b5I4bxd9TzmUcBApRU5ubavYgihm8h8RbGr50w
 Jv1A==
X-Gm-Message-State: ACrzQf3mtNjiR0+Rb2vnadv+5VJblc2p6QK1++EsH0RYSTdtnRUfSifp
 GfKa2Fb5nbQE3dTukc3wLbEhWq+USw5DGy3vBbFn91WNG87C4pysMIppg3Z7863pioIVbhhRhen
 rDwfTXrW9XZ9nwPaaCwszqBHRzc1MYOaQzmniSclJrJ8ebErqNQsKSf1Aoe7bGteBZ4k=
X-Received: by 2002:a17:907:2e0b:b0:78d:387d:1579 with SMTP id
 ig11-20020a1709072e0b00b0078d387d1579mr2363198ejc.761.1666099933149; 
 Tue, 18 Oct 2022 06:32:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5u+3n9utDvzn6/dbj7jtqbYgrj4LX2kiq/2tOW3amKp3hH8M4ViyeNqLrwe4hvb4l4+sbjmA==
X-Received: by 2002:a17:907:2e0b:b0:78d:387d:1579 with SMTP id
 ig11-20020a1709072e0b00b0078d387d1579mr2363169ejc.761.1666099932695; 
 Tue, 18 Oct 2022 06:32:12 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a17090676d800b0072f112a6ad2sm7536755ejn.97.2022.10.18.06.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 26/53] target/i386: validate VEX prefixes via the instructions'
 exception classes
Date: Tue, 18 Oct 2022 15:30:15 +0200
Message-Id: <20221018133042.856368-27-pbonzini@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 164 ++++++++++++++++++++++++++++++-
 target/i386/tcg/decode-new.h     |  32 ++++++
 target/i386/tcg/emit.c.inc       |  37 ++++++-
 target/i386/tcg/translate.c      |  18 ++--
 4 files changed, 239 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 9afc26b9c9..a7af673df3 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -93,6 +93,23 @@
 #define zext0 .special = X86_SPECIAL_ZExtOp0,
 #define zext2 .special = X86_SPECIAL_ZExtOp2,
 
+#define vex1 .vex_class = 1,
+#define vex1_rep3 .vex_class = 1, .vex_special = X86_VEX_REPScalar,
+#define vex2 .vex_class = 2,
+#define vex2_rep3 .vex_class = 2, .vex_special = X86_VEX_REPScalar,
+#define vex3 .vex_class = 3,
+#define vex4 .vex_class = 4,
+#define vex4_unal .vex_class = 4, .vex_special = X86_VEX_SSEUnaligned,
+#define vex5 .vex_class = 5,
+#define vex6 .vex_class = 6,
+#define vex7 .vex_class = 7,
+#define vex8 .vex_class = 8,
+#define vex11 .vex_class = 11,
+#define vex12 .vex_class = 12,
+#define vex13 .vex_class = 13,
+
+#define avx2_256 .vex_special = X86_VEX_AVX2_256,
+
 static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
 {
     if (!s->has_modrm) {
@@ -157,6 +174,18 @@ static const X86OpEntry opcodes_root[256] = {
 };
 
 #undef mmx
+#undef vex1
+#undef vex2
+#undef vex3
+#undef vex4
+#undef vex4_unal
+#undef vex5
+#undef vex6
+#undef vex7
+#undef vex8
+#undef vex11
+#undef vex12
+#undef vex13
 
 /*
  * Decode the fixed part of the opcode and place the last
@@ -564,6 +593,136 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
     g_assert_not_reached();
 }
 
+static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
+{
+    X86OpEntry *e = &decode->e;
+
+    switch (e->vex_special) {
+    case X86_VEX_REPScalar:
+        /*
+         * Instructions which differ between 00/66 and F2/F3 in the
+         * exception classification and the size of the memory operand.
+         */
+        assert(e->vex_class == 1 || e->vex_class == 2);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            e->vex_class = 3;
+            if (s->vex_l) {
+                goto illegal;
+            }
+            assert(decode->e.s2 == X86_SIZE_x);
+            if (decode->op[2].has_ea) {
+                decode->op[2].ot = s->prefix & PREFIX_REPZ ? MO_32 : MO_64;
+            }
+        }
+        break;
+
+    case X86_VEX_SSEUnaligned:
+        /* handled in sse_needs_alignment.  */
+        break;
+
+    case X86_VEX_AVX2_256:
+        if ((s->prefix & PREFIX_VEX) && s->vex_l && !has_cpuid_feature(s, X86_FEAT_AVX2)) {
+            goto illegal;
+        }
+    }
+
+    /* TODO: instructions that require VEX.W=0 (Table 2-16) */
+
+    switch (e->vex_class) {
+    case 0:
+        if (s->prefix & PREFIX_VEX) {
+            goto illegal;
+        }
+        return true;
+    case 1:
+    case 2:
+    case 3:
+    case 4:
+    case 5:
+    case 7:
+        if (s->prefix & PREFIX_VEX) {
+            if (!(s->flags & HF_AVX_EN_MASK)) {
+                goto illegal;
+            }
+        } else {
+            if (!(s->flags & HF_OSFXSR_MASK)) {
+                goto illegal;
+            }
+        }
+        break;
+    case 12:
+        /* Must have a VSIB byte and no address prefix.  */
+        assert(s->has_modrm);
+        if ((s->modrm & 7) != 4 || s->aflag == MO_16) {
+            goto illegal;
+        }
+
+        /* Check no overlap between registers.  */
+        if (!decode->op[0].has_ea &&
+            (decode->op[0].n == decode->mem.index || decode->op[0].n == decode->op[1].n)) {
+            goto illegal;
+        }
+        assert(!decode->op[1].has_ea);
+        if (decode->op[1].n == decode->mem.index) {
+            goto illegal;
+        }
+        if (!decode->op[2].has_ea &&
+            (decode->op[2].n == decode->mem.index || decode->op[2].n == decode->op[1].n)) {
+            goto illegal;
+        }
+        /* fall through */
+    case 6:
+    case 11:
+        if (!(s->prefix & PREFIX_VEX)) {
+            goto illegal;
+        }
+        if (!(s->flags & HF_AVX_EN_MASK)) {
+            goto illegal;
+        }
+        break;
+    case 8:
+        if (!(s->prefix & PREFIX_VEX)) {
+            /* EMMS */
+            return true;
+        }
+        if (!(s->flags & HF_AVX_EN_MASK)) {
+            goto illegal;
+        }
+        break;
+    case 13:
+        if (!(s->prefix & PREFIX_VEX)) {
+            goto illegal;
+        }
+        if (s->vex_l) {
+            goto illegal;
+        }
+        /* All integer instructions use VEX.vvvv, so exit.  */
+        return true;
+    }
+
+    if (s->vex_v != 0 &&
+        e->op0 != X86_TYPE_H && e->op0 != X86_TYPE_B &&
+        e->op1 != X86_TYPE_H && e->op1 != X86_TYPE_B &&
+        e->op2 != X86_TYPE_H && e->op2 != X86_TYPE_B) {
+        goto illegal;
+    }
+
+    if (s->flags & HF_TS_MASK) {
+        goto nm_exception;
+    }
+    if (s->flags & HF_EM_MASK) {
+        goto illegal;
+    }
+    return true;
+
+nm_exception:
+    gen_NM_exception(s);
+    return false;
+illegal:
+    gen_illegal_opcode(s);
+    return false;
+}
+
 static void decode_temp_free(X86DecodedOp *op)
 {
     if (op->v_ptr) {
@@ -804,8 +963,11 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         break;
     }
 
+    if (!validate_vex(s, &decode)) {
+        return;
+    }
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
-        gen_load_ea(s, &decode.mem);
+        gen_load_ea(s, &decode.mem, decode.e.vex_class == 12);
     }
     if (s->prefix & PREFIX_LOCK) {
         if (decode.op[0].unit != X86_OP_INT || !decode.op[0].has_ea) {
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index e62e9c9d87..25e5400a8a 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -152,6 +152,36 @@ typedef enum X86InsnSpecial {
     X86_SPECIAL_o64,
 } X86InsnSpecial;
 
+/*
+ * Special cases for instructions that operate on XMM/YMM registers.  Intel
+ * retconned all of them to have VEX exception classes other than 0 and 13, so
+ * all these only matter for instructions that have a VEX exception class.
+ * Based on tables in the "AVX and SSE Instruction Exception Specification"
+ * section of the manual.
+ */
+typedef enum X86VEXSpecial {
+    /* Legacy SSE instructions that allow unaligned operands */
+    X86_VEX_SSEUnaligned,
+
+    /*
+     * Used for instructions that distinguish the XMM operand type with an
+     * instruction prefix; legacy SSE encodings will allow unaligned operands
+     * for scalar operands only (identified by a REP prefix).  In this case,
+     * the decoding table uses "x" for the vector operands instead of specifying
+     * pd/ps/sd/ss individually.
+     */
+    X86_VEX_REPScalar,
+
+    /*
+     * VEX instructions that only support 256-bit operands with AVX2 (Table 2-17
+     * column 3).  Columns 2 and 4 (instructions limited to 256- and 127-bit
+     * operands respectively) are implicit in the presence of dq and qq
+     * operands, and thus handled by decode_op_size.
+     */
+    X86_VEX_AVX2_256,
+} X86VEXSpecial;
+
+
 typedef struct X86OpEntry  X86OpEntry;
 typedef struct X86DecodedInsn X86DecodedInsn;
 
@@ -180,6 +210,8 @@ struct X86OpEntry {
 
     X86InsnSpecial special:8;
     X86CPUIDFeature cpuid:8;
+    unsigned     vex_class:8;
+    X86VEXSpecial vex_special:8;
     bool         is_decode:1;
 };
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index f8ba888c33..85b0aeac60 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,14 +19,19 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_NM_exception(DisasContext *s)
+{
+    gen_exception(s, EXCP07_PREX);
+}
+
 static void gen_illegal(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_illegal_opcode(s);
 }
 
-static void gen_load_ea(DisasContext *s, AddressParts *mem)
+static void gen_load_ea(DisasContext *s, AddressParts *mem, bool is_vsib)
 {
-    TCGv ea = gen_lea_modrm_1(s, *mem);
+    TCGv ea = gen_lea_modrm_1(s, *mem, is_vsib);
     gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
 }
 
@@ -113,6 +118,25 @@ static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs, boo
     }
 }
 
+static bool sse_needs_alignment(DisasContext *s, X86DecodedInsn *decode, MemOp ot)
+{
+    switch (decode->e.vex_class) {
+    case 2:
+    case 4:
+        if ((s->prefix & PREFIX_VEX) ||
+            decode->e.vex_special == X86_VEX_SSEUnaligned) {
+            /* MOST legacy SSE instructions require aligned memory operands, but not all.  */
+            return false;
+        }
+        /* fall through */
+    case 1:
+        return ot >= MO_128;
+
+    default:
+        return false;
+    }
+}
+
 static void gen_load(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
 {
     X86DecodedOp *op = &decode->op[opn];
@@ -149,7 +173,8 @@ static void gen_load(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
         compute_xmm_offset(op);
     load_vector:
         if (op->has_ea) {
-            gen_load_sse(s, v, op->ot, op->offset, true);
+            bool aligned = sse_needs_alignment(s, decode, op->ot);
+            gen_load_sse(s, v, op->ot, op->offset, aligned);
         }
         break;
 
@@ -176,7 +201,13 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
         }
         break;
     case X86_OP_MMX:
+        break;
     case X86_OP_SSE:
+        if ((s->prefix & PREFIX_VEX) && op->ot == MO_128) {
+            tcg_gen_gvec_dup_imm(MO_64,
+                                 offsetof(CPUX86State, xmm_regs[op->n].ZMM_X(1)),
+                                 16, 16, 0);
+        }
         break;
     case X86_OP_CR:
     case X86_OP_DR:
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index abccaadfbf..b5be0e59f4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -23,6 +23,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
@@ -2281,11 +2282,11 @@ static AddressParts gen_lea_modrm_0(CPUX86State *env, DisasContext *s,
 }
 
 /* Compute the address, with a minimum number of TCG ops.  */
-static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
+static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a, bool is_vsib)
 {
     TCGv ea = NULL;
 
-    if (a.index >= 0) {
+    if (a.index >= 0 && !is_vsib) {
         if (a.scale == 0) {
             ea = cpu_regs[a.index];
         } else {
@@ -2318,7 +2319,7 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
 static void gen_lea_modrm(CPUX86State *env, DisasContext *s, int modrm)
 {
     AddressParts a = gen_lea_modrm_0(env, s, modrm);
-    TCGv ea = gen_lea_modrm_1(s, a);
+    TCGv ea = gen_lea_modrm_1(s, a, false);
     gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
 }
 
@@ -2331,7 +2332,8 @@ static void gen_nop_modrm(CPUX86State *env, DisasContext *s, int modrm)
 static void gen_bndck(CPUX86State *env, DisasContext *s, int modrm,
                       TCGCond cond, TCGv_i64 bndv)
 {
-    TCGv ea = gen_lea_modrm_1(s, gen_lea_modrm_0(env, s, modrm));
+    AddressParts a = gen_lea_modrm_0(env, s, modrm);
+    TCGv ea = gen_lea_modrm_1(s, a, false);
 
     tcg_gen_extu_tl_i64(s->tmp1_i64, ea);
     if (!CODE64(s)) {
@@ -6011,7 +6013,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         reg = ((modrm >> 3) & 7) | REX_R(s);
         {
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
-            TCGv ea = gen_lea_modrm_1(s, a);
+            TCGv ea = gen_lea_modrm_1(s, a, false);
             gen_lea_v_seg(s, s->aflag, ea, -1, -1);
             gen_op_mov_reg_v(s, dflag, reg, s->A0);
         }
@@ -6234,7 +6236,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (mod != 3) {
                 /* memory op */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                TCGv ea = gen_lea_modrm_1(s, a);
+                TCGv ea = gen_lea_modrm_1(s, a, false);
                 TCGv last_addr = tcg_temp_new();
                 bool update_fdp = true;
 
@@ -7229,7 +7231,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exts(ot, s->T1);
             tcg_gen_sari_tl(s->tmp0, s->T1, 3 + ot);
             tcg_gen_shli_tl(s->tmp0, s->tmp0, ot);
-            tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a), s->tmp0);
+            tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a, false), s->tmp0);
             gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
             if (!(s->prefix & PREFIX_LOCK)) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -8278,7 +8280,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     /* rip-relative generates #ud */
                     goto illegal_op;
                 }
-                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a));
+                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a, false));
                 if (!CODE64(s)) {
                     tcg_gen_ext32u_tl(s->A0, s->A0);
                 }
-- 
2.37.3


