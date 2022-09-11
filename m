Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C55B51F2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:35:28 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWU4-00052J-1V
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1G-00014Z-Iu
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1E-0007Ln-70
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qPRXUOvERwr+r3H8Hg4XWGUZlIxjCBm8Pacyfe2giU=;
 b=IZCnhZtCK7S8ExnW2Z2kUJmI4aDze7b4kFPXF5PJUBOCmNaZVrs8cZc9MAO5K/saz1/6aW
 9rPPTM3L1WJW1CTCuNfeo065kUfI5ABQZ3ZBXv8jPofCp9ra37/lVq3Rflft4mz4qyDi32
 C2/zPvD224TFq383GB6EddSGi2k7jYY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-yiduVVCaME6Z0SS8OjqI_g-1; Sun, 11 Sep 2022 19:05:36 -0400
X-MC-Unique: yiduVVCaME6Z0SS8OjqI_g-1
Received: by mail-ed1-f69.google.com with SMTP id
 m3-20020a056402430300b004512f6268dbso3996491edc.23
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2qPRXUOvERwr+r3H8Hg4XWGUZlIxjCBm8Pacyfe2giU=;
 b=HzSrVo+5cKhOfHCIgng1Ma5Gw7i9HVK/07jsFzpulSkEFldVP6DddrZg05JpsJiAX/
 8LTKTNEQFT7liWd3RGv1MG0cQ2K2/WDdcCgX5XWdFRrz6qUzEtSyftcJGoy0KhboYGNL
 yd/xErBgdxP+rg1+sUwXFg+CnGjpRKb6awW4cnfhlIuVCUxqwMV0AYKSwDmUQF8m/dHO
 2DXLD/mWKFbeqW9rqWWFTkkwA8Q1juUOCmUJFtBWqBMsgEEYsF1aJmaX+JTurCPhfvRQ
 lT/ta+TwcqENrfVnZIvnt01nfGw7b2l+cYLuXwKHLn20poHb9huGY8FZNK5LgbCnposB
 o2mg==
X-Gm-Message-State: ACgBeo38RuMy5xB/RvcJfQk9KrT//vQBkWTqaOFZsALOzoOCWQ4qoh/k
 THPutwmsIVCpt1VG7+YkhdoMOjkVGxPP6doRFU1gTwrgrb1Jgs9FJgvAZGwJdYmzdtXTt8uAEgF
 wVJ1iEG0Hzd1d8e0RXUxkRoVlcmb9pJDpqfNPI++K7FbRzvlDeSTavKmkIByyuUGp4wA=
X-Received: by 2002:a05:6402:ca9:b0:44e:d8f3:3d0e with SMTP id
 cn9-20020a0564020ca900b0044ed8f33d0emr19807157edb.397.1662937535104; 
 Sun, 11 Sep 2022 16:05:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4llx2fwDzKvLda/2vbSdO483+OVEm7RYrVZqYV4PNSXTu6T4u5Ka4iWbDkx+M6Md5owWYDBw==
X-Received: by 2002:a05:6402:ca9:b0:44e:d8f3:3d0e with SMTP id
 cn9-20020a0564020ca900b0044ed8f33d0emr19807129edb.397.1662937534669; 
 Sun, 11 Sep 2022 16:05:34 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa7c855000000b0044e983132c3sm4612988edt.60.2022.09.11.16.05.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/37] target/i386: reimplement 0x0f 0x70-0x77, add AVX
Date: Mon, 12 Sep 2022 01:04:04 +0200
Message-Id: <20220911230418.340941-25-pbonzini@redhat.com>
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

This includes shifts by immediate, which use bits 3-5 of the ModRM byte
as an opcode extension.  With the exception of 128-bit shifts, they are
implemented using gvec.

This also covers VZEROALL and VZEROUPPER, which use the same opcode
as EMMS.  If we were wanting to optimize out gen_clear_ymmh then this
would be one of the starting points.  The implementation of the VZEROALL
and VZEROUPPER helpers is by Paul Brook.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h             |   7 +
 target/i386/tcg/decode-new.c.inc |  76 ++++++++++
 target/i386/tcg/emit.c.inc       | 232 +++++++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c     |  46 ++++++
 target/i386/tcg/translate.c      |   3 +-
 5 files changed, 362 insertions(+), 2 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 3da5df98b9..d7e6878263 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -221,6 +221,13 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
 #define SHIFT 2
 #include "ops_sse_header.h"
 
+DEF_HELPER_1(vzeroall, void, env)
+DEF_HELPER_1(vzeroupper, void, env)
+#ifdef TARGET_X86_64
+DEF_HELPER_1(vzeroall_hi8, void, env)
+DEF_HELPER_1(vzeroupper_hi8, void, env)
+#endif
+
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
 DEF_HELPER_3(rcll, tl, env, tl, tl)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 6aa8bac74f..0e2da85934 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -133,6 +133,19 @@ static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
     return s->modrm;
 }
 
+static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEntry entries[4])
+{
+    if (s->prefix & PREFIX_REPNZ) {
+        return &entries[3];
+    } else if (s->prefix & PREFIX_REPZ) {
+        return &entries[2];
+    } else if (s->prefix & PREFIX_DATA) {
+        return &entries[1];
+    } else {
+        return &entries[0];
+    }
+}
+
 static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86GenFunc group17_gen[8] = {
@@ -142,6 +155,48 @@ static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     entry->gen = group17_gen[op];
 }
 
+static void decode_group12_13_14(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry group[3][8] = {
+        {
+            /* grp12 */
+            {},
+            {},
+            X86_OP_ENTRY3(PSRLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+            X86_OP_ENTRY3(PSRAW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+            X86_OP_ENTRY3(PSLLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+        },
+        {
+            /* grp13 */
+            {},
+            {},
+            X86_OP_ENTRY3(PSRLD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+            X86_OP_ENTRY3(PSRAD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+            X86_OP_ENTRY3(PSLLD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            {},
+        },
+        {
+            /* grp14 */
+            {},
+            {},
+            X86_OP_ENTRY3(PSRLQ_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            X86_OP_ENTRY3(PSRLDQ_i, H,x, U,x, I,b, vex7 avx2_256 p_66),
+            {},
+            {},
+            X86_OP_ENTRY3(PSLLQ_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+            X86_OP_ENTRY3(PSLLDQ_i, H,x, U,x, I,b, vex7 avx2_256 p_66),
+        }
+    };
+
+    int op = (get_modrm(s, env) >> 3) & 7;
+    *entry = group[*b - 0x71][op];
+}
+
 static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (s->prefix & PREFIX_REPNZ) {
@@ -159,6 +214,18 @@ static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_0F70(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry pshufw[4] = {
+        X86_OP_ENTRY3(PSHUFW,  P,q, Q,q, I,b, vex4),
+        X86_OP_ENTRY3(PSHUFD,  V,x, W,x, I,b, vex4 avx2_256),
+        X86_OP_ENTRY3(PSHUFHW, V,x, W,x, I,b, vex4 avx2_256),
+        X86_OP_ENTRY3(PSHUFLW, V,x, W,x, I,b, vex4 avx2_256),
+    };
+
+    *entry = *decode_by_prefix(s, pshufw);
+}
+
 static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry movd_from_vec =
@@ -292,6 +359,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x66] = X86_OP_ENTRY3(PCMPGTD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x67] = X86_OP_ENTRY3(PACKUSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
 
+    [0x70] = X86_OP_GROUP0(0F70),
+    [0x71] = X86_OP_GROUP0(group12_13_14),
+    [0x72] = X86_OP_GROUP0(group12_13_14),
+    [0x73] = X86_OP_GROUP0(group12_13_14),
+    [0x74] = X86_OP_ENTRY3(PCMPEQB,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x75] = X86_OP_ENTRY3(PCMPEQW,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x76] = X86_OP_ENTRY3(PCMPEQD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x77] = X86_OP_ENTRY0(EMMS_VZERO, vex8),
+
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 2053c9d8fb..fb01035d06 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -475,6 +475,30 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 BINARY_INT_SSE(PUNPCKLQDQ, punpcklqdq)
 BINARY_INT_SSE(PUNPCKHQDQ, punpckhqdq)
 
+static inline void gen_unary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                     SSEFunc_0_ppi xmm, SSEFunc_0_ppi ymm)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(s->ptr0, s->ptr1, imm);
+    } else {
+        ymm(s->ptr0, s->ptr1, imm);
+    }
+    tcg_temp_free_i32(imm);
+}
+
+#define UNARY_IMM_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_imm_sse(s, env, decode,                                              \
+                      gen_helper_##lname##_xmm,                                    \
+                      gen_helper_##lname##_ymm);                                   \
+}
+
+UNARY_IMM_SSE(PSHUFD,     pshufd)
+UNARY_IMM_SSE(PSHUFHW,    pshufhw)
+UNARY_IMM_SSE(PSHUFLW,    pshuflw)
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -633,6 +657,29 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_const_i32(8 << ot));
 }
 
+static void gen_EMMS_VZERO(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (!(s->prefix & PREFIX_VEX)) {
+        gen_helper_emms(cpu_env);
+        return;
+    }
+    if (s->vex_l) {
+        gen_helper_vzeroall(cpu_env);
+#ifdef TARGET_X86_64
+        if (CODE64(s)) {
+            gen_helper_vzeroall_hi8(cpu_env);
+        }
+#endif
+    } else {
+        gen_helper_vzeroupper(cpu_env);
+#ifdef TARGET_X86_64
+        if (CODE64(s)) {
+            gen_helper_vzeroupper_hi8(cpu_env);
+        }
+#endif
+    }
+}
+
 static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -787,6 +834,33 @@ static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
                       decode->op[1].offset, vec_len, vec_len);
 }
 
+static void gen_PCMPEQB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_EQ, MO_8,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PCMPEQW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_EQ, MO_16,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PCMPEQD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_EQ, MO_32,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
 static void gen_PCMPGTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
@@ -841,6 +915,164 @@ static void gen_POR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
                     decode->op[2].offset, vec_len, vec_len);
 }
 
+static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    gen_helper_pshufw_mmx(s->ptr0, s->ptr1, imm);
+    tcg_temp_free_i32(imm);
+}
+
+static void gen_PSRLW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_16,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_16,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSRAW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        decode->immediate = 15;
+    }
+    tcg_gen_gvec_sari(MO_16,
+                      decode->op[0].offset, decode->op[1].offset,
+                      decode->immediate, vec_len, vec_len);
+}
+
+static void gen_PSRLD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_32,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_32,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSRAD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        decode->immediate = 31;
+    }
+    tcg_gen_gvec_sari(MO_32,
+                      decode->op[0].offset, decode->op[1].offset,
+                      decode->immediate, vec_len, vec_len);
+}
+
+static void gen_PSRLQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 64) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_64,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    if (decode->immediate >= 64) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_64,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static inline TCGv_ptr make_imm_mmx_vec(uint32_t imm)
+{
+    TCGv_i64 imm_v = tcg_const_i64(imm);
+    TCGv_ptr ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, mmx_t0));
+    tcg_gen_st_i64(imm_v, ptr, offsetof(MMXReg, MMX_Q(0)));
+    return ptr;
+}
+
+static inline TCGv_ptr make_imm_xmm_vec(uint32_t imm, int vec_len)
+{
+    MemOp ot = vec_len == 16 ? MO_128 : MO_256;
+    TCGv_i32 imm_v = tcg_const_i32(imm);
+    TCGv_ptr ptr = tcg_temp_new_ptr();
+
+    tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_t0) + xmm_offset(ot),
+                         vec_len, vec_len, 0);
+
+    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
+    tcg_gen_st_i32(imm_v, ptr, offsetof(ZMMReg, ZMM_L(0)));
+    return ptr;
+}
+
+static void gen_PSRLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+    TCGv_ptr imm_vec = make_imm_xmm_vec(decode->immediate, vec_len);
+
+    if (s->vex_l) {
+        gen_helper_psrldq_ymm(cpu_env, s->ptr0, s->ptr1, imm_vec);
+    } else {
+        gen_helper_psrldq_xmm(cpu_env, s->ptr0, s->ptr1, imm_vec);
+    }
+    tcg_temp_free_ptr(imm_vec);
+}
+
+static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+    TCGv_ptr imm_vec = make_imm_xmm_vec(decode->immediate, vec_len);
+
+    if (s->vex_l) {
+        gen_helper_pslldq_ymm(cpu_env, s->ptr0, s->ptr1, imm_vec);
+    } else {
+        gen_helper_pslldq_xmm(cpu_env, s->ptr0, s->ptr1, imm_vec);
+    }
+    tcg_temp_free_ptr(imm_vec);
+}
+
 static void gen_PXOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 819e920ec6..230907bc5c 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3056,3 +3056,49 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 2
 #include "ops_sse.h"
+
+void helper_vzeroall(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+#ifdef TARGET_X86_64
+void helper_vzeroall_hi8(CPUX86State *env)
+{
+    int i;
+
+    for (i = 8; i < 16; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper_hi8(CPUX86State *ense_new &&
-            ((b >= 0x150 && b <= 0x16f) ||
-             (b >= 0x178 && b <= 0x17f) ||
+            ((b >= 0x150 && b <= 0x17f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             return disas_insn_new(s, cpu, b + 0x100);
         }
-- 
2.37.2



