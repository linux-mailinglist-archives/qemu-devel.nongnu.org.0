Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC223708B0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:09:12 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuzF-0006L4-PM
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuat-0008RT-Ac
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:59 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuab-0000AA-Ce
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:59 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s22so839695pgk.6
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQmvMol4L6NLI9pwqHq/nK/UsN0vmBrtmnpsOQfPeC0=;
 b=THpyYKfKpsJwQHvlMrOyWpw22bbdoAxthfbj6l0UwWGlqik/V8BZllqxo02FvtBmEZ
 vXC/zwggW8u0N1N7G1qfitYW90gtOD4+2YHjbL7nGJTo56vfoXI7vhbVPjgClWxn9x4/
 6hHxbYTyJiCSptIe1Jw76RCZh1PJHzI09FzaexgyDbL0iePJaBhB+ifcbaugm3Stow1S
 /Q+mupQUvVlDRAQPoju0KRngZZzYr7WU6vlkoRA0W8tCeAQ7SnqnTFvm2e24ANx9SVmH
 CrMwc5QtxK/lOYvrkpBcs97BFykQDoCwcOOQ83KFaGdVXigPN9CKcIjDjfmQjOCO0rJB
 iy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQmvMol4L6NLI9pwqHq/nK/UsN0vmBrtmnpsOQfPeC0=;
 b=o1U/z7LEXud+JwztF6UdPYtyy04x9lTPzptlItAqECPsoNxRhXHGRqNprilfG1mwz1
 1rhT0/PwMaI+yW8vWcoZeSPxEjg1Jz4QrZlB3i5SzHAy9OyIt7IRnF7sNqjfHQIwyj5V
 RyTrYvQ/EyEbQCGBwDZ8Nkk0JWDBjL4wbKW7b9V28UH+0oLAaCcr3NgZlmdYSXOvZbxC
 dUHUDmLfAopwOFxszWKf61NE3y3zt5WSVkgrxdEkO+NpCVGj0t7m4EpOVm+LFItB6Qln
 W4TbMJpFlDGnDXYngRbx8l28DOd9MLlpxWjNJwRMPnhX4u91tMy9OcJS468v1vdqXYYa
 Gv1A==
X-Gm-Message-State: AOAM5320o4mfOqP7Bu4gl+JsGidwvQMLUpIfIMgAESHX7RE3ednm39LB
 G4pYqTQVNx8om7yj6uHMS3lBdfN8UKjFYQ==
X-Google-Smtp-Source: ABdhPJwceiV2Fv2wM9SGwLUT5czOOVgwUp+AQLAB9AEgL0f0RWUdkJboKw5M7IgJIcJolQy3TucisQ==
X-Received: by 2002:a63:e552:: with SMTP id z18mr10395835pgj.100.1619894620075; 
 Sat, 01 May 2021 11:43:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/31] Hexagon (target/hexagon) add F2_sfinvsqrta
Date: Sat,  1 May 2021 11:43:16 -0700
Message-Id: <20210501184324.1338186-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Rd32,Pe4 = sfinvsqrta(Rs32)
    Square root approx

The helper packs the 2 32-bit results into a 64-bit value,
and the fGEN_TCG override unpacks them into the proper results.

Test cases in tests/tcg/hexagon/multi_result.c
FP exception tests added to tests/tcg/hexagon/fpstuff.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-19-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.h                 |  2 ++
 target/hexagon/gen_tcg.h              | 16 +++++++++++++++
 target/hexagon/helper.h               |  1 +
 target/hexagon/arch.c                 | 21 ++++++++++++++++++-
 target/hexagon/op_helper.c            | 21 +++++++++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 15 ++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 29 +++++++++++++++++++++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/imported/float.idef    | 16 +++++++++++++++
 9 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index b6634e9615..3e0c334209 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -32,4 +32,6 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
 
 extern const uint8_t recip_lookup_table[128];
 
+extern const uint8_t invsqrt_lookup_table[128];
+
 #endif
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 428a670281..d78e7b8e5c 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -216,6 +216,22 @@
         tcg_temp_free_i64(tmp); \
     } while (0)
 
+/*
+ * Approximation of the reciprocal square root
+ * r1,p0 = sfinvsqrta(r0)
+ *
+ * The helper packs the 2 32-bit results into a 64-bit value,
+ * so unpack them into the proper results.
+ */
+#define fGEN_TCG_F2_sfinvsqrta(SHORTCODE) \
+    do { \
+        TCGv_i64 tmp = tcg_temp_new_i64(); \
+        gen_helper_sfinvsqrta(tmp, cpu_env, RsV); \
+        tcg_gen_extrh_i64_i32(RdV, tmp); \
+        tcg_gen_extrl_i64_i32(PeV, tmp); \
+        tcg_temp_free_i64(tmp); \
+    } while (0)
+
 /* Floating point */
 #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
     gen_helper_conv_sf2df(RddV, cpu_env, RsV)
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index b377293dd3..cb7508f746 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -25,6 +25,7 @@ DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
 DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
+DEF_HELPER_2(sfinvsqrta, i64, env, f32)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 46edf45b13..dee852e106 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -247,7 +247,7 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     int r_exp;
     int ret = 0;
     RsV = *Rs;
-    if (float32_is_infinity(RsV)) {
+    if (float32_is_any_nan(RsV)) {
         if (extract32(RsV, 22, 1) == 0) {
             float_raise(float_flag_invalid, fp_status);
         }
@@ -299,3 +299,22 @@ const uint8_t recip_lookup_table[128] = {
     0x011, 0x00f, 0x00e, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
     0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x000,
 };
+
+const uint8_t invsqrt_lookup_table[128] = {
+    0x069, 0x066, 0x063, 0x061, 0x05e, 0x05b, 0x059, 0x057,
+    0x054, 0x052, 0x050, 0x04d, 0x04b, 0x049, 0x047, 0x045,
+    0x043, 0x041, 0x03f, 0x03d, 0x03b, 0x039, 0x037, 0x036,
+    0x034, 0x032, 0x030, 0x02f, 0x02d, 0x02c, 0x02a, 0x028,
+    0x027, 0x025, 0x024, 0x022, 0x021, 0x01f, 0x01e, 0x01d,
+    0x01b, 0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x012,
+    0x011, 0x010, 0x00f, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
+    0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x001,
+    0x0fe, 0x0fa, 0x0f6, 0x0f3, 0x0ef, 0x0eb, 0x0e8, 0x0e4,
+    0x0e1, 0x0de, 0x0db, 0x0d7, 0x0d4, 0x0d1, 0x0ce, 0x0cb,
+    0x0c9, 0x0c6, 0x0c3, 0x0c0, 0x0be, 0x0bb, 0x0b8, 0x0b6,
+    0x0b3, 0x0b1, 0x0af, 0x0ac, 0x0aa, 0x0a8, 0x0a5, 0x0a3,
+    0x0a1, 0x09f, 0x09d, 0x09b, 0x099, 0x097, 0x095, 0x093,
+    0x091, 0x08f, 0x08d, 0x08b, 0x089, 0x087, 0x086, 0x084,
+    0x082, 0x080, 0x07f, 0x07d, 0x07b, 0x07a, 0x078, 0x077,
+    0x075, 0x074, 0x072, 0x071, 0x06f, 0x06e, 0x06c, 0x06b,
+};
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 75861e26c4..a25fb98f24 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -326,6 +326,27 @@ uint64_t HELPER(sfrecipa)(CPUHexagonState *env, float32 RsV, float32 RtV)
     return ((uint64_t)RdV << 32) | PeV;
 }
 
+uint64_t HELPER(sfinvsqrta)(CPUHexagonState *env, float32 RsV)
+{
+    int PeV = 0;
+    float32 RdV;
+    int idx;
+    int adjust;
+    int mant;
+    int exp;
+
+    arch_fpop_start(env);
+    if (arch_sf_invsqrt_common(&RsV, &RdV, &adjust, &env->fp_status)) {
+        PeV = adjust;
+        idx = (RsV >> 17) & 0x7f;
+        mant = (invsqrt_lookup_table[idx] << 15);
+        exp = SF_BIAS - ((float32_getexp(RsV) - SF_BIAS) >> 1) - 1;
+        RdV = build_float32(extract32(RsV, 31, 1), exp, mant);
+    }
+    arch_fpop_end(env);
+    return ((uint64_t)RdV << 32) | PeV;
+}
+
 /*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
index 8e3ba780d2..0dff429f4c 100644
--- a/tests/tcg/hexagon/fpstuff.c
+++ b/tests/tcg/hexagon/fpstuff.c
@@ -441,6 +441,20 @@ static void check_canonical_NaN(void)
     check_fpstatus(usr, 0);
 }
 
+static void check_invsqrta(void)
+{
+    int result;
+    int predval;
+
+    asm volatile("%0,p0 = sfinvsqrta(%2)\n\t"
+                 "%1 = p0\n\t"
+                 : "+r"(result), "=r"(predval)
+                 : "r"(0x7f800000)
+                 : "p0");
+    check32(result, 0xff800000);
+    check32(predval, 0x0);
+}
+
 static void check_float2int_convs()
 {
     int res32;
@@ -590,6 +604,7 @@ int main()
     check_dfminmax();
     check_recip_exception();
     check_canonical_NaN();
+    check_invsqrta();
     check_float2int_convs();
 
     puts(err ? "FAIL" : "PASS");
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index cb7dd313d4..67aa46249b 100644
--- a/tests/tcg/hexagon/multi_result.c
+++ b/tests/tcg/hexagon/multi_result.c
@@ -31,6 +31,20 @@ static int sfrecipa(int Rs, int Rt, int *pred_result)
   return result;
 }
 
+static int sfinvsqrta(int Rs, int *pred_result)
+{
+  int result;
+  int predval;
+
+  asm volatile("%0,p0 = sfinvsqrta(%2)\n\t"
+               "%1 = p0\n\t"
+               : "+r"(result), "=r"(predval)
+               : "r"(Rs)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
 int err;
 
 static void check(int val, int expect)
@@ -59,9 +73,24 @@ static void test_sfrecipa()
     check_p(pred_result, 0x00);
 }
 
+static void test_sfinvsqrta()
+{
+    int res;
+    int pred_result;
+
+    res = sfinvsqrta(0x04030201, &pred_result);
+    check(res, 0x4d330000);
+    check_p(pred_result, 0xe0);
+
+    res = sfinvsqrta(0x0, &pred_result);
+    check(res, 0x3f800000);
+    check_p(pred_result, 0x0);
+}
+
 int main()
 {
     test_sfrecipa();
+    test_sfinvsqrta();
 
     puts(err ? "FAIL" : "PASS");
     return err;
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index b01b4d7aa7..18fe45d696 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1642,6 +1642,7 @@ SH2_RR_ENC(F2_conv_sf2w,          "1011","100","-","000","ddddd")
 SH2_RR_ENC(F2_conv_sf2uw_chop,    "1011","011","-","001","ddddd")
 SH2_RR_ENC(F2_conv_sf2w_chop,     "1011","100","-","001","ddddd")
 SH2_RR_ENC(F2_sffixupr,           "1011","101","-","000","ddddd")
+SH2_RR_ENC(F2_sfinvsqrta,         "1011","111","-","0ee","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S2op"      1100 -------- PP------ --------","[#12] Rd=(Rs,#u6)")
diff --git a/target/hexagon/imported/float.idef b/target/hexagon/imported/float.idef
index eb5415801a..3e75bc4604 100644
--- a/target/hexagon/imported/float.idef
+++ b/target/hexagon/imported/float.idef
@@ -178,6 +178,22 @@ Q6INSN(F2_sffixupd,"Rd32=sffixupd(Rs32,Rt32)",ATTRIBS(),
     RdV = RtV;
 })
 
+Q6INSN(F2_sfinvsqrta,"Rd32,Pe4=sfinvsqrta(Rs32)",ATTRIBS(),
+"Reciprocal Square Root Approximation",
+{
+    fHIDE(int idx;)
+    fHIDE(int adjust;)
+    fHIDE(int mant;)
+    fHIDE(int exp;)
+    if (fSF_INVSQRT_COMMON(RsV,RdV,adjust)) {
+        PeV = adjust;
+        idx = (RsV >> 17) & 0x7f;
+        mant = (fSF_INVSQRT_LOOKUP(idx) << 15);
+        exp = fSF_BIAS() - ((fSF_GETEXP(RsV) - fSF_BIAS()) >> 1) - 1;
+        RdV = fMAKESF(fGETBIT(31,RsV),exp,mant);
+    }
+})
+
 Q6INSN(F2_sffixupr,"Rd32=sffixupr(Rs32)",ATTRIBS(),
 "Fix Up Radicand",
 {
-- 
2.25.1


