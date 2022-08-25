Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2725A1C4A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:27:00 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLJT-0008KM-Ll
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7M-0007bh-LP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7G-0002iF-2N
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/JLlOdAw3QYFUnxJ8O2aMRfezhGQL+/wZadeFuKZyw=;
 b=ilglcSX2d5kaAAmE+jnxhh8Xw17H1xk32Q7QL6Utce4LbwQtJ9+LPHCf6JkvK3uufDGKiN
 d3no+SJO8ylVFaPX4Rh19ooWfxaed99rwtv2Q+aieeWvjgzFtSoXdCFYw3elqgz+OEvsQg
 7ey8/JBF6NKncAA2w9WSqChUNzLsEIw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-ZglJpf0EOIm4l_RvuVq3jQ-1; Thu, 25 Aug 2022 18:14:19 -0400
X-MC-Unique: ZglJpf0EOIm4l_RvuVq3jQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso11487698wmq.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=V/JLlOdAw3QYFUnxJ8O2aMRfezhGQL+/wZadeFuKZyw=;
 b=GCyCdKnZOmdsea1+sBA+qBTfKl5Flj+wd+vOYBj5z2vUORPIE+1LSP4SZpV+bBgk+l
 MLg5nzZnGjfUizPgOoNcoPDdJeduO5EoSFmz7qXR8MTIfuCmV8yBJMzJBsJEpmXgIV9x
 d+HcvOcVjEUEMUxbcvG0SJY6pbvpJtruPghRSpr2AJJI9ehH/gXjCjEswfeJcDCV6wJp
 fI/A/TCVydI363Z1lFf54Fp89rWddwD8My5u4cAXIQ3bgAySJGqVOaa7fqm3d1vSgiDy
 56HJd57MmCxSHz9OWn3vyaFrykKQrPq/CO6zb70qSegNiW/2p5DrIc5lkzmibtzGEB96
 8CZA==
X-Gm-Message-State: ACgBeo2itTiBGSukMkC/ht7O18bJofKa9jOJsSWY/PzJ/yw2DjHYhGJP
 rnS8Vn1mQPW0+OkwwyTvC8kX06B6WicYJ+VYOqURWD6ZLGJDoHQz6Jl1TAyMskALRM2lgXVJGwH
 UnFaHg80F6S/Z+McH06xW+/BsVfouIu6VTKkL/Q9cccUg+cx+RfE50qG52+iW4PZJBwM=
X-Received: by 2002:a5d:5343:0:b0:225:2ffe:77ba with SMTP id
 t3-20020a5d5343000000b002252ffe77bamr3491155wrv.453.1661465658459; 
 Thu, 25 Aug 2022 15:14:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6p99qJxOsk2cRYLcL8XEVa0ACfPYPUVzar8js4Gb//s+G5Pzzc5vrcQaiixi1rCP5gI7kWIg==
X-Received: by 2002:a5d:5343:0:b0:225:2ffe:77ba with SMTP id
 t3-20020a5d5343000000b002252ffe77bamr3491141wrv.453.1661465658110; 
 Thu, 25 Aug 2022 15:14:18 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a5fa79007fsm557356wmp.7.2022.08.25.15.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 03/18] i386: Add CHECK_NO_VEX
Date: Fri, 26 Aug 2022 00:13:56 +0200
Message-Id: <20220825221411.35122-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Paul Brook <paul@nowt.org>

Reject invalid VEX encodings on MMX instructions.

Signed-off-by: Paul Brook <paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220424220204.2493824-7-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5335b86c01..66ba690b7d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3179,6 +3179,12 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
 #undef BLENDV_OP
 #undef SPECIAL_OP
 
+/* VEX prefix not allowed */
+#define CHECK_NO_VEX(s) do { \
+    if (s->prefix & PREFIX_VEX) \
+        goto illegal_op; \
+    } while (0)
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
@@ -3262,6 +3268,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b |= (b1 << 8);
         switch(b) {
         case 0x0e7: /* movntq */
+            CHECK_NO_VEX(s);
             if (mod == 3) {
                 goto illegal_op;
             }
@@ -3297,6 +3304,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6e: /* movd mm, ea */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
@@ -3330,6 +3338,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6f: /* movq mm, ea */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3464,6 +3473,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x178:
         case 0x378:
+            CHECK_NO_VEX(s);
             {
                 int bit_index, field_length;
 
@@ -3484,6 +3494,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x7e: /* movd ea, mm */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
@@ -3524,6 +3535,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x7f: /* movq ea, mm */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3607,6 +3619,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
                 op1_offset = offsetof(CPUX86State,xmm_t0);
             } else {
+                CHECK_NO_VEX(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(0)));
@@ -3648,6 +3661,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x02a: /* cvtpi2ps */
         case 0x12a: /* cvtpi2pd */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3693,6 +3707,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x12c: /* cvttpd2pi */
         case 0x02d: /* cvtps2pi */
         case 0x12d: /* cvtpd2pi */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3766,6 +3781,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
             } else {
+                CHECK_NO_VEX(s);
                 val &= 3;
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
@@ -3805,6 +3821,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x2d6: /* movq2dq */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7);
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
@@ -3812,6 +3829,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x3d6: /* movdq2q */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
@@ -3827,6 +3845,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                  offsetof(CPUX86State, xmm_regs[rm]));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
+                CHECK_NO_VEX(s);
                 rm = (modrm & 7);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State, fpregs[rm].mmx));
@@ -3891,6 +3910,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                 }
             } else {
+                CHECK_NO_VEX(s);
                 if ((op6.flags & SSE_OPF_MMX) == 0) {
                     goto unknown_op;
                 }
@@ -3928,6 +3948,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             case 0x3f0: /* crc32 Gd,Eb */
             case 0x3f1: /* crc32 Gd,Ey */
             do_crc32:
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
                     goto illegal_op;
                 }
@@ -3950,6 +3971,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f0: /* crc32 or movbe */
             case 0x1f1:
+                CHECK_NO_VEX(s);
                 /* For these insns, the f3 prefix is supposed to have priority
                    over the 66 prefix, but that's not what we implement above
                    setting b1.  */
@@ -3959,6 +3981,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* FALLTHRU */
             case 0x0f0: /* movbe Gy,My */
             case 0x0f1: /* movbe My,Gy */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
                     goto illegal_op;
                 }
@@ -4125,6 +4148,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
                     goto illegal_op;
                 } else {
@@ -4439,6 +4463,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_ldo_env_A0(s, op2_offset);
                 }
             } else {
+                CHECK_NO_VEX(s);
                 if ((op7.flags & SSE_OPF_MMX) == 0) {
                     goto illegal_op;
                 }
@@ -4565,6 +4590,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
             }
         } else {
+            CHECK_NO_VEX(s);
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-- 
2.37.1



