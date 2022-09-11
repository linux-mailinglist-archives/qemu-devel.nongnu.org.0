Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070275B51E5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:25:03 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWJx-0003nM-EA
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0d-0000Oe-0w
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0X-000715-I2
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7y7zyX5peGZwtpNG4lrcdi7+gttql+7vFP/UAcxIOQ=;
 b=ATYDswDAol1htd15kEoiChkWnzi7tAS3mnxZ0R9UjlqNE1nG7tyV7USdem6eL0b+Gypje/
 lmQIg6IeG6GAS3k6zlsL+Vohc2Wq4yyl8qZRT/fjoRf0YBrZ3R6AU0L/VbF3/6QoPyzOpG
 0CQ2fslNgMVLM2RO59Dx1olBQyJ7smo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-EMp8ld9oNR-BWJfg_hr7Nw-1; Sun, 11 Sep 2022 19:04:55 -0400
X-MC-Unique: EMp8ld9oNR-BWJfg_hr7Nw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso5053563edc.21
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i7y7zyX5peGZwtpNG4lrcdi7+gttql+7vFP/UAcxIOQ=;
 b=GjPZPs6fDIuP85HNsmMF/2DYpZil8/E8L/TvzXBnDZFka9VNmFk3qC7woZEPPuLN3s
 L6KMKgyap4yFiOj30YwX77NxeZ7QBTOELn4Sh7/r2FuFv+0VAsTbxi2qN3hdRtEhwnk7
 D2mOZ5BFtxFfA90CGhTfCfHmO5T70KNz9gArFtcY1lsyVYKAO4qV9a3Sw/5ilsONIcOF
 sDArX6/lMMHg3pj3/5HFZeTrSkP6t8qz3EtTaUKyWxezlVOx3UwxLqKRxhPHR243nx7m
 ltrtdqTwNAJWScnxIASSQDbQYL9WZo4J/xOWQuFSTIlEVoqtzWtsJe4PHpmaoC1nw/OJ
 SNBQ==
X-Gm-Message-State: ACgBeo39cbjtg+7+fZ4el6dtLevU2kuIYY9j3C57N7nQz7FwH/ZnfyUZ
 2iC/4tGNvl74KfgJ+c2AyfiPIE5MfgUkHQeJ9EuZ8677W8NwkOnbMyX3hC9s/jjWS1YJ6gzHvoN
 wGaJKphmodcjbv5qX71g7z0oTr/NyFBfNdwQMozDVr0XthHk1SEWehqgL+OGif4Bipzs=
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr17033350ejb.426.1662937494124; 
 Sun, 11 Sep 2022 16:04:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NJ87nJz2HueVb1gRgjpfwtnSSnBAJkeyII5aC1059d8nuqBrcbgRIIfN0xhBCfzAs7zCXnw==
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr17033338ejb.426.1662937493691; 
 Sun, 11 Sep 2022 16:04:53 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 ed10-20020a056402294a00b0045184540cecsm2177378edb.36.2022.09.11.16.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/37] target/i386: validate VEX prefixes via the
 instructions' exception classes
Date: Mon, 12 Sep 2022 01:03:50 +0200
Message-Id: <20220911230418.340941-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 160 ++++++++++++++++++++++++++++++-
 target/i386/tcg/decode-new.h     |  32 +++++++
 target/i386/tcg/emit.c.inc       |  34 ++++++-
 target/i386/tcg/translate.c      |  17 ++--
 4 files changed, 232 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index a9b8b6c05f..f6c032c694 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -91,6 +91,23 @@
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
@@ -155,6 +172,18 @@ static const X86OpEntry opcodes_root[256] = {
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
@@ -553,6 +582,132 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
     }
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
+        assert(s->has_modrm);
+        /* Must have a VSIB byte and no address prefix.  */
+        if ((s->modrm & 7) != 4 || s->aflag == MO_16) {
+            goto illegal;
+        }
+        /* Check no overlap between registers.  */
+        if (decode->op[0].unit == decode->op[1].unit && decode->op[0].n == decode->op[1].n) {
+            goto illegal;
+        }
+        if (decode->op[0].unit == X86_OP_SSE && decode->op[0].n == decode->mem.index) {
+            goto illegal;
+        }
+        if (decode->op[1].unit == X86_OP_SSE && decode->op[1].n == decode->mem.index) {
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
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
@@ -789,8 +944,11 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         break;
     }
 
+    if (!validate_vex(s, &decode)) {
+        return s->pc;
+    }
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
-        gen_load_ea(s, &decode.mem);
+        gen_load_ea(s, &decode.mem, decode.e.vex_class == 12);
     }
     if (s->prefix & PREFIX_LOCK) {
         if (decode.op[0].unit != X86_OP_INT || !decode.op[0].has_ea) {
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 6fb2d9151e..b5299d0dd2 100644
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
 
     X86InsnSpecial special : 8;
     X86CPUIDFeature cpuid : 8;
+    uint8_t      vex_class : 8;
+    X86VEXSpecial vex_special : 8;
     bool         is_decode : 1;
 };
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 6fa0062d6a..ce0205e05a 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,14 +19,19 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_NM_exception(DisasContext *s)
+{
+    gen_exception(s, EXCP07_PREX, s->pc_start - s->cs_base);
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
 
@@ -102,6 +107,25 @@ static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs)
     }
 }
 
+static inline bool sse_needs_alignment(DisasContext *s, X86DecodedInsn *decode, X86DecodedOp *op)
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
+        return op->has_ea && op->ot >= MO_128;
+
+    default:
+        return false;
+    }
+}
+
 static void gen_load(DisasContext *s, TCGv v, TCGv_ptr ptr, X86DecodedOp *op, uint64_t imm)
 {
     switch (op->unit) {
@@ -175,7 +199,13 @@ static void gen_writeback(DisasContext *s, X86DecodedOp *op)
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
     default:
         abort();
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a92ef61527..4ecf75ede3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2217,11 +2217,11 @@ static AddressParts gen_lea_modrm_0(CPUX86State *env, DisasContext *s,
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
@@ -2249,7 +2249,7 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
 static void gen_lea_modrm(CPUX86State *env, DisasContext *s, int modrm)
 {
     AddressParts a = gen_lea_modrm_0(env, s, modrm);
-    TCGv ea = gen_lea_modrm_1(s, a);
+    TCGv ea = gen_lea_modrm_1(s, a, false);
     gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
 }
 
@@ -2262,7 +2262,8 @@ static void gen_nop_modrm(CPUX86State *env, DisasContext *s, int modrm)
 static void gen_bndck(CPUX86State *env, DisasContext *s, int modrm,
                       TCGCond cond, TCGv_i64 bndv)
 {
-    TCGv ea = gen_lea_modrm_1(s, gen_lea_modrm_0(env, s, modrm));
+    AddressParts a = gen_lea_modrm_0(env, s, modrm);
+    TCGv ea = gen_lea_modrm_1(s, a, false);
 
     tcg_gen_extu_tl_i64(s->tmp1_i64, ea);
     if (!CODE64(s)) {
@@ -5953,7 +5954,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         reg = ((modrm >> 3) & 7) | REX_R(s);
         {
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
-            TCGv ea = gen_lea_modrm_1(s, a);
+            TCGv ea = gen_lea_modrm_1(s, a, false);
             gen_lea_v_seg(s, s->aflag, ea, -1, -1);
             gen_op_mov_reg_v(s, dflag, reg, s->A0);
         }
@@ -6180,7 +6181,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (mod != 3) {
                 /* memory op */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                TCGv ea = gen_lea_modrm_1(s, a);
+                TCGv ea = gen_lea_modrm_1(s, a, false);
                 TCGv last_addr = tcg_temp_new();
                 bool update_fdp = true;
 
@@ -7210,7 +7211,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_exts(ot, s->T1);
             tcg_gen_sari_tl(s->tmp0, s->T1, 3 + ot);
             tcg_gen_shli_tl(s->tmp0, s->tmp0, ot);
-            tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a), s->tmp0);
+            tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a, false), s->tmp0);
             gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
             if (!(s->prefix & PREFIX_LOCK)) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -8281,7 +8282,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     /* rip-relative generates #ud */
                     goto illegal_op;
                 }
-                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a));
+                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a, false));
                 if (!CODE64(s)) {
                     tcg_gen_ext32u_tl(s->A0, s->A0);
                 }
-- 
2.37.2



