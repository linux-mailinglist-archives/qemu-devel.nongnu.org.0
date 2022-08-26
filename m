Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A405A328D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:23:09 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRifM-0003Lv-AP
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiV7-0006yd-HI
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiV5-0007qA-Eq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXsImx5i7hBv31oU1swR4MPDTIfDIok8sQcAF54K24s=;
 b=JCln/wSnQ4oNqbdV28ZSdlSo4eNqASXz7OwIV2QeG9kFm/ejG/MG0e3U6u8km3ysHXylL3
 MEouXNYcWqOz/e7HS5AVV1aqJER58Qqu0Q6d82SN5G5v3V4lqGV39AsGDGWvkqaDg/0Ewx
 E23F+KaFyMoYRmjuwZZmhSwSkM+m12o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-bDvsZ7tQP--9AQo_q4fYLA-1; Fri, 26 Aug 2022 19:12:28 -0400
X-MC-Unique: bDvsZ7tQP--9AQo_q4fYLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so1842435edd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YXsImx5i7hBv31oU1swR4MPDTIfDIok8sQcAF54K24s=;
 b=YxHovK7hNjmHz8YfbYO/oxj6ojHya6qNmQ7/oLsHPMOzbysMLLAWeVgw6+73xbVkr8
 BLvriKHJS+pzrzUEDLbdrL6trEJy6/rrMitIJA/8v9D06wJYSOHIvQE/WaHB7QTZpa7u
 5dNwUuZoZIuPfsRjTKafh92AAgk2B1a/MnueKwF3oYNLb+kxvdt6Acyf4oumIZKQMYCD
 AlSsxxuUh1go9/VnBRWFkwZ+gWLBDeTW42vRLAnWBbDjIMuCRBujFdUQDvEtsnh5qQnA
 vxOxJzvpGy1YHibTJeoPyZ6kd4S3vNkg3oz65jGEiFMshvvStzzxYtkVS8ADHaxSWzO1
 dC1g==
X-Gm-Message-State: ACgBeo0NbuxUxE4MxtU5Fly4hvDdrKMVCDRCyCCpuTRTHCwJWU4KEQoI
 NpERy2yLR6Go/gx/1gPGJCpjBGVfLxQNHbow0Hx4bfRKR6qSmPkVb6Hig4FKvNRZQkuRDyOtAfM
 w+KiN5AHOvZS38MfPshpLfFjttEXVLY+hC1U65Q2ceDHz1Dl1QhwI1cT3KW7PMfo48Ec=
X-Received: by 2002:a17:907:160b:b0:73c:fc00:e55e with SMTP id
 hb11-20020a170907160b00b0073cfc00e55emr6517002ejc.356.1661555547016; 
 Fri, 26 Aug 2022 16:12:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ajeqG5IZPZYDUfOQhe/tIljZLyJ7lGQpXk4EhPtc3VnlK2IMV3AgFB+49C8dhfbd4KXydDg==
X-Received: by 2002:a17:907:160b:b0:73c:fc00:e55e with SMTP id
 hb11-20020a170907160b00b0073cfc00e55emr6516991ejc.356.1661555546706; 
 Fri, 26 Aug 2022 16:12:26 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 dk1-20020a0564021d8100b0043bea0a48d0sm1919901edb.22.2022.08.26.16.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 11/23] i386: Add CHECK_NO_VEX
Date: Sat, 27 Aug 2022 01:11:52 +0200
Message-Id: <20220826231204.201395-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index f7e8cab52d..f155cbb667 100644
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
                 }
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



