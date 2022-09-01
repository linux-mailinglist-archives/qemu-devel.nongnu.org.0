Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECB5A920C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:25:32 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfVz-0002eB-Rq
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewp-0001JP-Pf
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewn-00037n-V3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iT5cL3WTVeQZflXZw+M1LECEHW0Yw44IK7kf+h+EFn4=;
 b=eeHUz6N1FsK082myuWv8VX0N/EDh8AOM7Jl/3e+Kxn+rjM3zzXY036eOUDd6PydZM68/dS
 M1wYXtnEz4x1ggaiZJ2f2yr1vbgTqOcK0Xer1msWUsfwEicdzgGxADAIARyrp6MZbCHuw+
 RMMcQFg8WFNyzvWEj2wbOWbqksZJloM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645--kJweAh-O06eX6fFnjP9bQ-1; Thu, 01 Sep 2022 03:49:08 -0400
X-MC-Unique: -kJweAh-O06eX6fFnjP9bQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b00225b9579132so2822702wrg.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iT5cL3WTVeQZflXZw+M1LECEHW0Yw44IK7kf+h+EFn4=;
 b=pZLCkiPNHfKtHnnlKaB+ecQyw157H6NNcU5fCN7CDUD+FDRVXAypYoC2CvPSXhsaQ+
 oVHC0DPptDdXdZ2wPXjLBS8LhPgoeJF/EINRTYmqczUmePRQvRsEIzAD++sDt40f3Tzd
 7c1gH2ivUmZ2hVqXuWnZm3wNDwX0y1rw0FR+Ae+KTRExyy1/+HYmq5Y9OK3tVinPqUG1
 NH15H7rV+Avzt4EITMMoxaKG0GnM7k6a3+/vghRLGIT6yyj7JilfA9ZGFYDiKiYToOQS
 TosgcAps7h4YFZbTpAjvhJxRzjF7ztsi7F1u+kAtROUu1FTJp37MigrwMZLulDYENtPj
 TM+g==
X-Gm-Message-State: ACgBeo1jtuCeTwS816spqNWeNKgimE8CZxXe0Nb8xHexOE25uCbRMrQ9
 JwJLMLEFoX9bXLLxFWZ+riKXqB5op/nRMtUbGhvwzmvVBD46A6Xx/AI0DwfEEf3vnLhDrukRUid
 QfGPDXEGR8PqlvzPbxASmk43GmZVBlhSpsHDbuqUqmyAEdsmau/awelRLzn0keRonYwc=
X-Received: by 2002:a05:6000:713:b0:226:ea6c:2d7d with SMTP id
 bs19-20020a056000071300b00226ea6c2d7dmr4224888wrb.293.1662018546707; 
 Thu, 01 Sep 2022 00:49:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6iDxTsZbp4IK5wpmPplvsKwrfF87FGP4Kafz62WlQsk7LoNdWn5zOKc1sorrTotVwsfj/Plg==
X-Received: by 2002:a05:6000:713:b0:226:ea6c:2d7d with SMTP id
 bs19-20020a056000071300b00226ea6c2d7dmr4224867wrb.293.1662018546374; 
 Thu, 01 Sep 2022 00:49:06 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 cc2-20020a5d5c02000000b0021e4bc9edbfsm14799787wrb.112.2022.09.01.00.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 11/23] i386: Add CHECK_NO_VEX
Date: Thu,  1 Sep 2022 09:48:30 +0200
Message-Id: <20220901074842.57424-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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
index c6a9a5b1d4..99c84473f4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3186,6 +3186,12 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
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
@@ -3272,6 +3278,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b |= (b1 << 8);
         switch(b) {
         case 0x0e7: /* movntq */
+            CHECK_NO_VEX(s);
             if (mod == 3) {
                 goto illegal_op;
             }
@@ -3307,6 +3314,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6e: /* movd mm, ea */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
@@ -3338,6 +3346,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6f: /* movq mm, ea */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3473,6 +3482,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x178:
         case 0x378:
+            CHECK_NO_VEX(s);
             {
                 int bit_index, field_length;
 
@@ -3492,6 +3502,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x7e: /* movd ea, mm */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
@@ -3532,6 +3543,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x7f: /* movq ea, mm */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3614,6 +3626,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
                 op1_offset = offsetof(CPUX86State,xmm_t0);
             } else {
+                CHECK_NO_VEX(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(0)));
@@ -3653,6 +3666,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x02a: /* cvtpi2ps */
         case 0x12a: /* cvtpi2pd */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3698,6 +3712,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x12c: /* cvttpd2pi */
         case 0x02d: /* cvtps2pi */
         case 0x12d: /* cvtpd2pi */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3771,6 +3786,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
             } else {
+                CHECK_NO_VEX(s);
                 val &= 3;
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
@@ -3810,6 +3826,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x2d6: /* movq2dq */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7);
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
@@ -3817,6 +3834,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x3d6: /* movdq2q */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
@@ -3831,6 +3849,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
+                CHECK_NO_VEX(s);
                 rm = (modrm & 7);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State, fpregs[rm].mmx));
@@ -3901,6 +3920,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
                 op6->fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
             } else {
+                CHECK_NO_VEX(s);
                 if ((op6->flags & SSE_OPF_MMX) == 0) {
                     goto unknown_op;
                 }
@@ -3934,6 +3954,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             case 0x3f0: /* crc32 Gd,Eb */
             case 0x3f1: /* crc32 Gd,Ey */
             do_crc32:
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
                     goto illegal_op;
                 }
@@ -3956,6 +3977,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f0: /* crc32 or movbe */
             case 0x1f1:
+                CHECK_NO_VEX(s);
                 /* For these insns, the f3 prefix is supposed to have priority
                    over the 66 prefix, but that's not what we implement above
                    setting b1.  */
@@ -3965,6 +3987,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* FALLTHRU */
             case 0x0f0: /* movbe Gy,My */
             case 0x0f1: /* movbe My,Gy */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
                     goto illegal_op;
                 }
@@ -4131,6 +4154,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
                     goto illegal_op;
                 } else {
@@ -4436,6 +4460,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
 
             if (b1 == 0) {
+                CHECK_NO_VEX(s);
                 /* MMX */
                 if ((op7->flags & SSE_OPF_MMX) == 0) {
                     goto illegal_op;
@@ -4582,6 +4607,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = ZMM_OFFSET(rm);
             }
         } else {
+            CHECK_NO_VEX(s);
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-- 
2.37.1



