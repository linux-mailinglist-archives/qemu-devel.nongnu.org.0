Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4585BF04D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:40:51 +0200 (CEST)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalv8-00046k-87
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0Z-0006kS-Nt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0X-0002Gx-2a
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNJTRN07rdUHRl+49t4uiASrF5Xy08Mj8BelZltQBd8=;
 b=Xq8+u0h+jTJf6E4+dKEPpI/GOrl57Qj9dt9yFEzY71VdXsvrDnjqHxeAkR866bPoRgrVgg
 mOqavTCTczAZHOnQkvT3zkLmwfbraIVCrYyXHfE+VjBPhmn18tVEO59q6iDSbCG+ym8ySI
 8gLUIb8j4ewZWM8cCJaduE2Tn2EEtgk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-QX3jbAaPMVG2CnsCzbwAtg-1; Tue, 20 Sep 2022 13:26:01 -0400
X-MC-Unique: QX3jbAaPMVG2CnsCzbwAtg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sd4-20020a1709076e0400b00781e6ba94e1so689260ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VNJTRN07rdUHRl+49t4uiASrF5Xy08Mj8BelZltQBd8=;
 b=0N3LjxqmvHWTdmPMlGWuxKNqV1osk9JITAOqEzya7+w0mpZ28L3fXYl2KN62qeiyzK
 Kmu7+e9sumgMKbIPScqH4hZhgdhgjyBttggmxO8BmjRWp9ey+UIwewwKQCdu95Ra6at3
 yl7u/HvEP/m5kjIcs6NPvyI1UILSLjM4Zop95/RrFEDgdi5ssztU38vTNdy5TzPfV95f
 PFdF4XjDkNJ9H+M4Srk10meh01s9qolzI0nwFbHdRb1dbUV8hCQCVYMSRWg9ECBzMPaz
 hKJP3IS1BnicI40oEgJrjv4F2bcOt4nymV7JdZIuSYNvWLmYUVjhe726aMSzo1wXdMyA
 V68g==
X-Gm-Message-State: ACrzQf2Bf4H5VAGI3+mjYtQePazks9j1/VR25m9ijhPrDPA8by294xC8
 Ym+10DJsqqK6mtoI75QGT0z+MSCKh0s1FXwEdLAzUCaVHj1thM/UQK/Z1vWfxU/8/QzK9n6KVuo
 pyYr/+x6L0yywPrAOM0S07zxpYo6scEs9zTIiPrEsZU5VeAyvahZgnUkLh1KA7tELQyA=
X-Received: by 2002:a17:907:60c9:b0:77f:be6d:d870 with SMTP id
 hv9-20020a17090760c900b0077fbe6dd870mr17842279ejc.348.1663694759481; 
 Tue, 20 Sep 2022 10:25:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ApLrHAFhVK9qLIHsKB9hFtah+MBJM8dJoNXtibuQLCTgsWu7ICPASc9RONHidOARU9E5BpQ==
X-Received: by 2002:a17:907:60c9:b0:77f:be6d:d870 with SMTP id
 hv9-20020a17090760c900b0077fbe6dd870mr17842259ejc.348.1663694759226; 
 Tue, 20 Sep 2022 10:25:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a17090631d300b0073022b796a7sm171601ejf.93.2022.09.20.10.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 33/37] target/i386: implement VLDMXCSR/VSTMXCSR
Date: Tue, 20 Sep 2022 19:25:03 +0200
Message-Id: <20220920172507.95568-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

These are exactly the same as the non-VEX version, but one has to be careful
that only VEX.L=0 is allowed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 25 +++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 20 ++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 63eb66ccc4..efe52504f2 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -82,6 +82,10 @@
 
 #define X86_OP_ENTRY2(op, op0, s0, op1, s1, ...)                  \
     X86_OP_ENTRY3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_ENTRYw(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, op0, s0, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_ENTRYr(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, None, None, None, None, op0, s0, ## __VA_ARGS__)
 #define X86_OP_ENTRY0(op, ...)                                    \
     X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
 
@@ -149,6 +153,25 @@ static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEnt
     }
 }
 
+static void decode_group15(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    /* only includes ldmxcsr and stmxcsr, because they have AVX variants.  */
+    static const X86OpEntry group15_reg[8] = {
+    };
+
+    static const X86OpEntry group15_mem[8] = {
+        [2] = X86_OP_ENTRYr(LDMXCSR,    E,d, vex5),
+        [3] = X86_OP_ENTRYw(STMXCSR,    E,d, vex5),
+    };
+
+    uint8_t modrm = get_modrm(s, env);
+    if ((modrm >> 6) == 3) {
+        *entry = group15_reg[(modrm >> 3) & 7];
+    } else {
+        *entry = group15_mem[(modrm >> 3) & 7];
+    }
+}
+
 static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86GenFunc group17_gen[8] = {
@@ -830,6 +853,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP0(0F7F),
 
+    [0xae] = X86_OP_GROUP0(group15),
+
     [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
     [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
     [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 6e391e3598..be7e3797e8 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1099,6 +1099,16 @@ static void gen_INSERTQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
     gen_helper_insertq_r(cpu_env, OP_PTR0, OP_PTR2);
 }
 
+static void gen_LDMXCSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->vex_l) {
+        gen_illegal_opcode(s);
+        return;
+    }
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T1);
+    gen_helper_ldmxcsr(cpu_env, s->tmp2_i32);
+}
+
 static void gen_MASKMOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
@@ -1696,6 +1706,16 @@ static void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
     gen_helper_aeskeygenassist_xmm(cpu_env, OP_PTR0, OP_PTR1, imm);
 }
 
+static void gen_STMXCSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->vex_l) {
+        gen_illegal_opcode(s);
+        return;
+    }
+    gen_helper_update_mxcsr(cpu_env);
+    tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, mxcsr));
+}
+
 static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     assert(!s->vex_l);
-- 
2.37.2


