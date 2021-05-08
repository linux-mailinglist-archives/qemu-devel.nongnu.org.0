Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B7376E63
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:07:35 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCNS-0002PC-4v
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4x-0004Cs-9X
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4k-0003at-Ur
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 69so1535915plc.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTft5gBrUD6MnXZkZyjYyUchTRH6b2xyA6TvzbAPqzc=;
 b=u21InNkF/bOCTjlyvEKcsibWT0f6bGinlGaZxEyZRwA/FP3WL2Bwr/lu01xOriI/zg
 b9i4h9P3en63XW6qaMcpqramw9DrZtuVLWn3kQqcai9zq7SUSTKIaTioCDZAaWfna9Ct
 GtIKWesRE1fdPZV7LTiS2MbLUEY8y1bXPkUA6eYZMGounQ4Q1vWjHwe5Wszn8g3HYWYB
 dVNo1nYTJi3d2Ty14NBPPdTV5v8H0eMol46VAt4puY55SuD3hnYkZL3Uq1WJssO/J98I
 BZZRz+NS5asUn6peUdktBwqCJyZRA55EooaIfL32l3T5Z8W/i3NueWNNVzy7B7kZPK73
 CUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTft5gBrUD6MnXZkZyjYyUchTRH6b2xyA6TvzbAPqzc=;
 b=qvhkMESUJ652MBePESFodjCNn1/dBox7Mf7Jg58WDhoBSyQWEGRXC7nxsDXQtm++70
 3Ch3v3Lkw79UYmkWxYNDqI2pS8TIqpFmF8EGtg9aufZv9XoOxnbn9xvZxNt652S7eVcO
 OeAzHK4p42mh07vTy8knpEhxYDSR/k3nYsDheUxnl4/CKKkGtqqKs5soj+G/hXLuk9ef
 12twAXO2Ktsw6jRhRg12m7RqeQmICePTu6VLpbZbN9A1Rkhsl+QToWbm6u6n8RRjZkKg
 bok0UiNwP3Ty+0oVI1iN7HqZ/JOOLwtHWoYGRX9vBZdg0sLDWq9MxCn8z0vhTxN2HulX
 ggyg==
X-Gm-Message-State: AOAM5332OJS03uQ8yPXEqcZVV5Ro8COM5ChSyS+sR/IWN/rqgATGjFHC
 fk0AfhPM0/uUJgpu0KaPQuvsezgSMsTcQw==
X-Google-Smtp-Source: ABdhPJx9YhT9Cy8h8KdugV78dbVaC2JOMRcaWc0rIKKNDsGFEmoz9JzJ837Y51PtPx+8NhWLVlonng==
X-Received: by 2002:a17:90a:ad09:: with SMTP id
 r9mr27177608pjq.2.1620438493514; 
 Fri, 07 May 2021 18:48:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/72] softfloat: Rename FloatParts to FloatParts64
Date: Fri,  7 May 2021 18:47:05 -0700
Message-Id: <20210508014802.892561-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 362 ++++++++++++++++-----------------
 fpu/softfloat-specialize.c.inc |   6 +-
 2 files changed, 184 insertions(+), 184 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6589f00b23..27b51659c9 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -515,7 +515,7 @@ typedef struct {
     int32_t  exp;
     FloatClass cls;
     bool sign;
-} FloatParts;
+} FloatParts64;
 
 #define DECOMPOSED_BINARY_POINT    63
 #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
@@ -580,11 +580,11 @@ static const FloatFmt float64_params = {
 };
 
 /* Unpack a float to parts, but do not canonicalize.  */
-static inline FloatParts unpack_raw(FloatFmt fmt, uint64_t raw)
+static inline FloatParts64 unpack_raw(FloatFmt fmt, uint64_t raw)
 {
     const int sign_pos = fmt.frac_size + fmt.exp_size;
 
-    return (FloatParts) {
+    return (FloatParts64) {
         .cls = float_class_unclassified,
         .sign = extract64(raw, sign_pos, 1),
         .exp = extract64(raw, fmt.frac_size, fmt.exp_size),
@@ -592,50 +592,50 @@ static inline FloatParts unpack_raw(FloatFmt fmt, uint64_t raw)
     };
 }
 
-static inline FloatParts float16_unpack_raw(float16 f)
+static inline FloatParts64 float16_unpack_raw(float16 f)
 {
     return unpack_raw(float16_params, f);
 }
 
-static inline FloatParts bfloat16_unpack_raw(bfloat16 f)
+static inline FloatParts64 bfloat16_unpack_raw(bfloat16 f)
 {
     return unpack_raw(bfloat16_params, f);
 }
 
-static inline FloatParts float32_unpack_raw(float32 f)
+static inline FloatParts64 float32_unpack_raw(float32 f)
 {
     return unpack_raw(float32_params, f);
 }
 
-static inline FloatParts float64_unpack_raw(float64 f)
+static inline FloatParts64 float64_unpack_raw(float64 f)
 {
     return unpack_raw(float64_params, f);
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
+static inline uint64_t pack_raw(FloatFmt fmt, FloatParts64 p)
 {
     const int sign_pos = fmt.frac_size + fmt.exp_size;
     uint64_t ret = deposit64(p.frac, fmt.frac_size, fmt.exp_size, p.exp);
     return deposit64(ret, sign_pos, 1, p.sign);
 }
 
-static inline float16 float16_pack_raw(FloatParts p)
+static inline float16 float16_pack_raw(FloatParts64 p)
 {
     return make_float16(pack_raw(float16_params, p));
 }
 
-static inline bfloat16 bfloat16_pack_raw(FloatParts p)
+static inline bfloat16 bfloat16_pack_raw(FloatParts64 p)
 {
     return pack_raw(bfloat16_params, p);
 }
 
-static inline float32 float32_pack_raw(FloatParts p)
+static inline float32 float32_pack_raw(FloatParts64 p)
 {
     return make_float32(pack_raw(float32_params, p));
 }
 
-static inline float64 float64_pack_raw(FloatParts p)
+static inline float64 float64_pack_raw(FloatParts64 p)
 {
     return make_float64(pack_raw(float64_params, p));
 }
@@ -651,7 +651,7 @@ static inline float64 float64_pack_raw(FloatParts p)
 #include "softfloat-specialize.c.inc"
 
 /* Canonicalize EXP and FRAC, setting CLS.  */
-static FloatParts sf_canonicalize(FloatParts part, const FloatFmt *parm,
+static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
                                   float_status *status)
 {
     if (part.exp == parm->exp_max && !parm->arm_althp) {
@@ -689,7 +689,7 @@ static FloatParts sf_canonicalize(FloatParts part, const FloatFmt *parm,
  * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
  */
 
-static FloatParts round_canonical(FloatParts p, float_status *s,
+static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
                                   const FloatFmt *parm)
 {
     const uint64_t frac_lsb = parm->frac_lsb;
@@ -838,59 +838,59 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
 }
 
 /* Explicit FloatFmt version */
-static FloatParts float16a_unpack_canonical(float16 f, float_status *s,
+static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
                                             const FloatFmt *params)
 {
     return sf_canonicalize(float16_unpack_raw(f), params, s);
 }
 
-static FloatParts float16_unpack_canonical(float16 f, float_status *s)
+static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
 {
     return float16a_unpack_canonical(f, s, &float16_params);
 }
 
-static FloatParts bfloat16_unpack_canonical(bfloat16 f, float_status *s)
+static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
 {
     return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
 }
 
-static float16 float16a_round_pack_canonical(FloatParts p, float_status *s,
+static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
                                              const FloatFmt *params)
 {
     return float16_pack_raw(round_canonical(p, s, params));
 }
 
-static float16 float16_round_pack_canonical(FloatParts p, float_status *s)
+static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
 {
     return float16a_round_pack_canonical(p, s, &float16_params);
 }
 
-static bfloat16 bfloat16_round_pack_canonical(FloatParts p, float_status *s)
+static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
 {
     return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
 }
 
-static FloatParts float32_unpack_canonical(float32 f, float_status *s)
+static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
 {
     return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
 }
 
-static float32 float32_round_pack_canonical(FloatParts p, float_status *s)
+static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
 {
     return float32_pack_raw(round_canonical(p, s, &float32_params));
 }
 
-static FloatParts float64_unpack_canonical(float64 f, float_status *s)
+static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
 {
     return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
 }
 
-static float64 float64_round_pack_canonical(FloatParts p, float_status *s)
+static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
 {
     return float64_pack_raw(round_canonical(p, s, &float64_params));
 }
 
-static FloatParts return_nan(FloatParts a, float_status *s)
+static FloatParts64 return_nan(FloatParts64 a, float_status *s)
 {
     g_assert(is_nan(a.cls));
     if (is_snan(a.cls)) {
@@ -904,7 +904,7 @@ static FloatParts return_nan(FloatParts a, float_status *s)
     return parts_default_nan(s);
 }
 
-static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
+static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
 {
     if (is_snan(a.cls) || is_snan(b.cls)) {
         float_raise(float_flag_invalid, s);
@@ -925,7 +925,7 @@ static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
     return a;
 }
 
-static FloatParts pick_nan_muladd(FloatParts a, FloatParts b, FloatParts c,
+static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
                                   bool inf_zero, float_status *s)
 {
     int which;
@@ -971,7 +971,7 @@ static FloatParts pick_nan_muladd(FloatParts a, FloatParts b, FloatParts c,
  * Arithmetic.
  */
 
-static FloatParts addsub_floats(FloatParts a, FloatParts b, bool subtract,
+static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
                                 float_status *s)
 {
     bool a_sign = a.sign;
@@ -1062,18 +1062,18 @@ static FloatParts addsub_floats(FloatParts a, FloatParts b, bool subtract,
 
 float16 QEMU_FLATTEN float16_add(float16 a, float16 b, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pb = float16_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, false, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pb = float16_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, false, status);
 
     return float16_round_pack_canonical(pr, status);
 }
 
 float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pb = float16_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, true, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pb = float16_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, true, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1081,9 +1081,9 @@ float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_addsub(float32 a, float32 b, bool subtract, float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pb = float32_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, subtract, status);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pb = float32_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, subtract, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1101,9 +1101,9 @@ static inline float32 soft_f32_sub(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_addsub(float64 a, float64 b, bool subtract, float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pb = float64_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, subtract, status);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pb = float64_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, subtract, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1199,18 +1199,18 @@ float64_sub(float64 a, float64 b, float_status *s)
  */
 bfloat16 QEMU_FLATTEN bfloat16_add(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pb = bfloat16_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, false, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, false, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
 
 bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pb = bfloat16_unpack_canonical(b, status);
-    FloatParts pr = addsub_floats(pa, pb, true, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pr = addsub_floats(pa, pb, true, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1221,7 +1221,7 @@ bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
  * for Binary Floating-Point Arithmetic.
  */
 
-static FloatParts mul_floats(FloatParts a, FloatParts b, float_status *s)
+static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
 {
     bool sign = a.sign ^ b.sign;
 
@@ -1267,9 +1267,9 @@ static FloatParts mul_floats(FloatParts a, FloatParts b, float_status *s)
 
 float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pb = float16_unpack_canonical(b, status);
-    FloatParts pr = mul_floats(pa, pb, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pb = float16_unpack_canonical(b, status);
+    FloatParts64 pr = mul_floats(pa, pb, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1277,9 +1277,9 @@ float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_mul(float32 a, float32 b, float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pb = float32_unpack_canonical(b, status);
-    FloatParts pr = mul_floats(pa, pb, status);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pb = float32_unpack_canonical(b, status);
+    FloatParts64 pr = mul_floats(pa, pb, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1287,9 +1287,9 @@ soft_f32_mul(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_mul(float64 a, float64 b, float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pb = float64_unpack_canonical(b, status);
-    FloatParts pr = mul_floats(pa, pb, status);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pb = float64_unpack_canonical(b, status);
+    FloatParts64 pr = mul_floats(pa, pb, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1325,9 +1325,9 @@ float64_mul(float64 a, float64 b, float_status *s)
 
 bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pb = bfloat16_unpack_canonical(b, status);
-    FloatParts pr = mul_floats(pa, pb, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pr = mul_floats(pa, pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1344,7 +1344,7 @@ bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
  * NaNs.)
  */
 
-static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
+static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c,
                                 int flags, float_status *s)
 {
     bool inf_zero, p_sign;
@@ -1520,10 +1520,10 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
 float16 QEMU_FLATTEN float16_muladd(float16 a, float16 b, float16 c,
                                                 int flags, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pb = float16_unpack_canonical(b, status);
-    FloatParts pc = float16_unpack_canonical(c, status);
-    FloatParts pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pb = float16_unpack_canonical(b, status);
+    FloatParts64 pc = float16_unpack_canonical(c, status);
+    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1532,10 +1532,10 @@ static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_muladd(float32 a, float32 b, float32 c, int flags,
                 float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pb = float32_unpack_canonical(b, status);
-    FloatParts pc = float32_unpack_canonical(c, status);
-    FloatParts pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pb = float32_unpack_canonical(b, status);
+    FloatParts64 pc = float32_unpack_canonical(c, status);
+    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1544,10 +1544,10 @@ static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_muladd(float64 a, float64 b, float64 c, int flags,
                 float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pb = float64_unpack_canonical(b, status);
-    FloatParts pc = float64_unpack_canonical(c, status);
-    FloatParts pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pb = float64_unpack_canonical(b, status);
+    FloatParts64 pc = float64_unpack_canonical(c, status);
+    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1705,10 +1705,10 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
                                       int flags, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pb = bfloat16_unpack_canonical(b, status);
-    FloatParts pc = bfloat16_unpack_canonical(c, status);
-    FloatParts pr = muladd_floats(pa, pb, pc, flags, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pc = bfloat16_unpack_canonical(c, status);
+    FloatParts64 pr = muladd_floats(pa, pb, pc, flags, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1719,7 +1719,7 @@ bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
  * the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
  */
 
-static FloatParts div_floats(FloatParts a, FloatParts b, float_status *s)
+static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
 {
     bool sign = a.sign ^ b.sign;
 
@@ -1786,9 +1786,9 @@ static FloatParts div_floats(FloatParts a, FloatParts b, float_status *s)
 
 float16 float16_div(float16 a, float16 b, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pb = float16_unpack_canonical(b, status);
-    FloatParts pr = div_floats(pa, pb, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pb = float16_unpack_canonical(b, status);
+    FloatParts64 pr = div_floats(pa, pb, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1796,9 +1796,9 @@ float16 float16_div(float16 a, float16 b, float_status *status)
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_div(float32 a, float32 b, float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pb = float32_unpack_canonical(b, status);
-    FloatParts pr = div_floats(pa, pb, status);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pb = float32_unpack_canonical(b, status);
+    FloatParts64 pr = div_floats(pa, pb, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1806,9 +1806,9 @@ soft_f32_div(float32 a, float32 b, float_status *status)
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_div(float64 a, float64 b, float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pb = float64_unpack_canonical(b, status);
-    FloatParts pr = div_floats(pa, pb, status);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pb = float64_unpack_canonical(b, status);
+    FloatParts64 pr = div_floats(pa, pb, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -1878,9 +1878,9 @@ float64_div(float64 a, float64 b, float_status *s)
 
 bfloat16 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pb = bfloat16_unpack_canonical(b, status);
-    FloatParts pr = div_floats(pa, pb, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pr = div_floats(pa, pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -1896,7 +1896,7 @@ bfloat16 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
  * invalid exceptions and handling the conversion on NaNs.
  */
 
-static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
+static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
                                  float_status *s)
 {
     if (dstf->arm_althp) {
@@ -1934,32 +1934,32 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts p = float16a_unpack_canonical(a, s, fmt16);
-    FloatParts pr = float_to_float(p, &float32_params, s);
+    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
+    FloatParts64 pr = float_to_float(p, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts p = float16a_unpack_canonical(a, s, fmt16);
-    FloatParts pr = float_to_float(p, &float64_params, s);
+    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
+    FloatParts64 pr = float_to_float(p, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
 float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts p = float32_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, fmt16, s);
+    FloatParts64 p = float32_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, fmt16, s);
     return float16a_round_pack_canonical(pr, s, fmt16);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_float32_to_float64(float32 a, float_status *s)
 {
-    FloatParts p = float32_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &float64_params, s);
+    FloatParts64 p = float32_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
@@ -1982,43 +1982,43 @@ float64 float32_to_float64(float32 a, float_status *s)
 float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts p = float64_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, fmt16, s);
+    FloatParts64 p = float64_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, fmt16, s);
     return float16a_round_pack_canonical(pr, s, fmt16);
 }
 
 float32 float64_to_float32(float64 a, float_status *s)
 {
-    FloatParts p = float64_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &float32_params, s);
+    FloatParts64 p = float64_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 {
-    FloatParts p = bfloat16_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &float32_params, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &float32_params, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 {
-    FloatParts p = bfloat16_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &float64_params, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &float64_params, s);
     return float64_round_pack_canonical(pr, s);
 }
 
 bfloat16 float32_to_bfloat16(float32 a, float_status *s)
 {
-    FloatParts p = float32_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &bfloat16_params, s);
+    FloatParts64 p = float32_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &bfloat16_params, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
 bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 {
-    FloatParts p = float64_unpack_canonical(a, s);
-    FloatParts pr = float_to_float(p, &bfloat16_params, s);
+    FloatParts64 p = float64_unpack_canonical(a, s);
+    FloatParts64 pr = float_to_float(p, &bfloat16_params, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
@@ -2029,7 +2029,7 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
  * Arithmetic.
  */
 
-static FloatParts round_to_int(FloatParts a, FloatRoundMode rmode,
+static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
                                int scale, float_status *s)
 {
     switch (a.cls) {
@@ -2132,22 +2132,22 @@ static FloatParts round_to_int(FloatParts a, FloatRoundMode rmode,
 
 float16 float16_round_to_int(float16 a, float_status *s)
 {
-    FloatParts pa = float16_unpack_canonical(a, s);
-    FloatParts pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa = float16_unpack_canonical(a, s);
+    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float16_round_pack_canonical(pr, s);
 }
 
 float32 float32_round_to_int(float32 a, float_status *s)
 {
-    FloatParts pa = float32_unpack_canonical(a, s);
-    FloatParts pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa = float32_unpack_canonical(a, s);
+    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float32_round_pack_canonical(pr, s);
 }
 
 float64 float64_round_to_int(float64 a, float_status *s)
 {
-    FloatParts pa = float64_unpack_canonical(a, s);
-    FloatParts pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa = float64_unpack_canonical(a, s);
+    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return float64_round_pack_canonical(pr, s);
 }
 
@@ -2158,8 +2158,8 @@ float64 float64_round_to_int(float64 a, float_status *s)
 
 bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, s);
-    FloatParts pr = round_to_int(pa, s->float_rounding_mode, 0, s);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pr = round_to_int(pa, s->float_rounding_mode, 0, s);
     return bfloat16_round_pack_canonical(pr, s);
 }
 
@@ -2174,13 +2174,13 @@ bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
  * is returned.
 */
 
-static int64_t round_to_int_and_pack(FloatParts in, FloatRoundMode rmode,
+static int64_t round_to_int_and_pack(FloatParts64 in, FloatRoundMode rmode,
                                      int scale, int64_t min, int64_t max,
                                      float_status *s)
 {
     uint64_t r;
     int orig_flags = get_float_exception_flags(s);
-    FloatParts p = round_to_int(in, rmode, scale, s);
+    FloatParts64 p = round_to_int(in, rmode, scale, s);
 
     switch (p.cls) {
     case float_class_snan:
@@ -2452,12 +2452,12 @@ int64_t bfloat16_to_int64_round_to_zero(bfloat16 a, float_status *s)
  *  flag.
  */
 
-static uint64_t round_to_uint_and_pack(FloatParts in, FloatRoundMode rmode,
+static uint64_t round_to_uint_and_pack(FloatParts64 in, FloatRoundMode rmode,
                                        int scale, uint64_t max,
                                        float_status *s)
 {
     int orig_flags = get_float_exception_flags(s);
-    FloatParts p = round_to_int(in, rmode, scale, s);
+    FloatParts64 p = round_to_int(in, rmode, scale, s);
     uint64_t r;
 
     switch (p.cls) {
@@ -2726,9 +2726,9 @@ uint64_t bfloat16_to_uint64_round_to_zero(bfloat16 a, float_status *s)
  * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
  */
 
-static FloatParts int_to_float(int64_t a, int scale, float_status *status)
+static FloatParts64 int_to_float(int64_t a, int scale, float_status *status)
 {
-    FloatParts r = { .sign = false };
+    FloatParts64 r = { .sign = false };
 
     if (a == 0) {
         r.cls = float_class_zero;
@@ -2753,7 +2753,7 @@ static FloatParts int_to_float(int64_t a, int scale, float_status *status)
 
 float16 int64_to_float16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts pa = int_to_float(a, scale, status);
+    FloatParts64 pa = int_to_float(a, scale, status);
     return float16_round_pack_canonical(pa, status);
 }
 
@@ -2789,7 +2789,7 @@ float16 int8_to_float16(int8_t a, float_status *status)
 
 float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts pa = int_to_float(a, scale, status);
+    FloatParts64 pa = int_to_float(a, scale, status);
     return float32_round_pack_canonical(pa, status);
 }
 
@@ -2820,7 +2820,7 @@ float32 int16_to_float32(int16_t a, float_status *status)
 
 float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts pa = int_to_float(a, scale, status);
+    FloatParts64 pa = int_to_float(a, scale, status);
     return float64_round_pack_canonical(pa, status);
 }
 
@@ -2856,7 +2856,7 @@ float64 int16_to_float64(int16_t a, float_status *status)
 
 bfloat16 int64_to_bfloat16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts pa = int_to_float(a, scale, status);
+    FloatParts64 pa = int_to_float(a, scale, status);
     return bfloat16_round_pack_canonical(pa, status);
 }
 
@@ -2893,9 +2893,9 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
  * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
  */
 
-static FloatParts uint_to_float(uint64_t a, int scale, float_status *status)
+static FloatParts64 uint_to_float(uint64_t a, int scale, float_status *status)
 {
-    FloatParts r = { .sign = false };
+    FloatParts64 r = { .sign = false };
     int shift;
 
     if (a == 0) {
@@ -2913,7 +2913,7 @@ static FloatParts uint_to_float(uint64_t a, int scale, float_status *status)
 
 float16 uint64_to_float16_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts pa = uint_to_float(a, scale, status);
+    FloatParts64 pa = uint_to_float(a, scale, status);
     return float16_round_pack_canonical(pa, status);
 }
 
@@ -2949,7 +2949,7 @@ float16 uint8_to_float16(uint8_t a, float_status *status)
 
 float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts pa = uint_to_float(a, scale, status);
+    FloatParts64 pa = uint_to_float(a, scale, status);
     return float32_round_pack_canonical(pa, status);
 }
 
@@ -2980,7 +2980,7 @@ float32 uint16_to_float32(uint16_t a, float_status *status)
 
 float64 uint64_to_float64_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts pa = uint_to_float(a, scale, status);
+    FloatParts64 pa = uint_to_float(a, scale, status);
     return float64_round_pack_canonical(pa, status);
 }
 
@@ -3016,7 +3016,7 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
 
 bfloat16 uint64_to_bfloat16_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts pa = uint_to_float(a, scale, status);
+    FloatParts64 pa = uint_to_float(a, scale, status);
     return bfloat16_round_pack_canonical(pa, status);
 }
 
@@ -3061,7 +3061,7 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
  * minnummag() and maxnummag() functions correspond to minNumMag()
  * and minNumMag() from the IEEE-754 2008.
  */
-static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
+static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
                                 bool ieee, bool ismag, float_status *s)
 {
     if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
@@ -3136,9 +3136,9 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
 float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
                                      float_status *s)                   \
 {                                                                       \
-    FloatParts pa = float ## sz ## _unpack_canonical(a, s);             \
-    FloatParts pb = float ## sz ## _unpack_canonical(b, s);             \
-    FloatParts pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
+    FloatParts64 pa = float ## sz ## _unpack_canonical(a, s);             \
+    FloatParts64 pb = float ## sz ## _unpack_canonical(b, s);             \
+    FloatParts64 pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
                                                                         \
     return float ## sz ## _round_pack_canonical(pr, s);                 \
 }
@@ -3169,9 +3169,9 @@ MINMAX(64, maxnummag, false, true, true)
 #define BF16_MINMAX(name, ismin, isiee, ismag)                          \
 bfloat16 bfloat16_ ## name(bfloat16 a, bfloat16 b, float_status *s)     \
 {                                                                       \
-    FloatParts pa = bfloat16_unpack_canonical(a, s);                    \
-    FloatParts pb = bfloat16_unpack_canonical(b, s);                    \
-    FloatParts pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
+    FloatParts64 pa = bfloat16_unpack_canonical(a, s);                    \
+    FloatParts64 pb = bfloat16_unpack_canonical(b, s);                    \
+    FloatParts64 pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
                                                                         \
     return bfloat16_round_pack_canonical(pr, s);                        \
 }
@@ -3186,7 +3186,7 @@ BF16_MINMAX(maxnummag, false, true, true)
 #undef BF16_MINMAX
 
 /* Floating point compare */
-static FloatRelation compare_floats(FloatParts a, FloatParts b, bool is_quiet,
+static FloatRelation compare_floats(FloatParts64 a, FloatParts64 b, bool is_quiet,
                                     float_status *s)
 {
     if (is_nan(a.cls) || is_nan(b.cls)) {
@@ -3247,8 +3247,8 @@ static FloatRelation compare_floats(FloatParts a, FloatParts b, bool is_quiet,
 static int attr                                                         \
 name(float ## sz a, float ## sz b, bool is_quiet, float_status *s)      \
 {                                                                       \
-    FloatParts pa = float ## sz ## _unpack_canonical(a, s);             \
-    FloatParts pb = float ## sz ## _unpack_canonical(b, s);             \
+    FloatParts64 pa = float ## sz ## _unpack_canonical(a, s);             \
+    FloatParts64 pb = float ## sz ## _unpack_canonical(b, s);             \
     return compare_floats(pa, pb, is_quiet, s);                         \
 }
 
@@ -3349,8 +3349,8 @@ FloatRelation float64_compare_quiet(float64 a, float64 b, float_status *s)
 static FloatRelation QEMU_FLATTEN
 soft_bf16_compare(bfloat16 a, bfloat16 b, bool is_quiet, float_status *s)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, s);
-    FloatParts pb = bfloat16_unpack_canonical(b, s);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, s);
     return compare_floats(pa, pb, is_quiet, s);
 }
 
@@ -3365,16 +3365,16 @@ FloatRelation bfloat16_compare_quiet(bfloat16 a, bfloat16 b, float_status *s)
 }
 
 /* Multiply A by 2 raised to the power N.  */
-static FloatParts scalbn_decomposed(FloatParts a, int n, float_status *s)
+static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
 {
     if (unlikely(is_nan(a.cls))) {
         return return_nan(a, s);
     }
     if (a.cls == float_class_normal) {
-        /* The largest float type (even though not supported by FloatParts)
+        /* The largest float type (even though not supported by FloatParts64)
          * is float128, which has a 15 bit exponent.  Bounding N to 16 bits
          * still allows rounding to infinity, without allowing overflow
-         * within the int32_t that backs FloatParts.exp.
+         * within the int32_t that backs FloatParts64.exp.
          */
         n = MIN(MAX(n, -0x10000), 0x10000);
         a.exp += n;
@@ -3384,29 +3384,29 @@ static FloatParts scalbn_decomposed(FloatParts a, int n, float_status *s)
 
 float16 float16_scalbn(float16 a, int n, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pr = scalbn_decomposed(pa, n, status);
     return float16_round_pack_canonical(pr, status);
 }
 
 float32 float32_scalbn(float32 a, int n, float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pr = scalbn_decomposed(pa, n, status);
     return float32_round_pack_canonical(pr, status);
 }
 
 float64 float64_scalbn(float64 a, int n, float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pr = scalbn_decomposed(pa, n, status);
     return float64_round_pack_canonical(pr, status);
 }
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pr = scalbn_decomposed(pa, n, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pr = scalbn_decomposed(pa, n, status);
     return bfloat16_round_pack_canonical(pr, status);
 }
 
@@ -3422,7 +3422,7 @@ bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
  * especially for 64 bit floats.
  */
 
-static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
+static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *p)
 {
     uint64_t a_frac, r_frac, s_frac;
     int bit, last_bit;
@@ -3482,24 +3482,24 @@ static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
 
 float16 QEMU_FLATTEN float16_sqrt(float16 a, float_status *status)
 {
-    FloatParts pa = float16_unpack_canonical(a, status);
-    FloatParts pr = sqrt_float(pa, status, &float16_params);
+    FloatParts64 pa = float16_unpack_canonical(a, status);
+    FloatParts64 pr = sqrt_float(pa, status, &float16_params);
     return float16_round_pack_canonical(pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_sqrt(float32 a, float_status *status)
 {
-    FloatParts pa = float32_unpack_canonical(a, status);
-    FloatParts pr = sqrt_float(pa, status, &float32_params);
+    FloatParts64 pa = float32_unpack_canonical(a, status);
+    FloatParts64 pr = sqrt_float(pa, status, &float32_params);
     return float32_round_pack_canonical(pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_sqrt(float64 a, float_status *status)
 {
-    FloatParts pa = float64_unpack_canonical(a, status);
-    FloatParts pr = sqrt_float(pa, status, &float64_params);
+    FloatParts64 pa = float64_unpack_canonical(a, status);
+    FloatParts64 pr = sqrt_float(pa, status, &float64_params);
     return float64_round_pack_canonical(pr, status);
 }
 
@@ -3559,8 +3559,8 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
 
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
-    FloatParts pa = bfloat16_unpack_canonical(a, status);
-    FloatParts pr = sqrt_float(pa, status, &bfloat16_params);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pr = sqrt_float(pa, status, &bfloat16_params);
     return bfloat16_round_pack_canonical(pr, status);
 }
 
@@ -3570,28 +3570,28 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 
 float16 float16_default_nan(float_status *status)
 {
-    FloatParts p = parts_default_nan(status);
+    FloatParts64 p = parts_default_nan(status);
     p.frac >>= float16_params.frac_shift;
     return float16_pack_raw(p);
 }
 
 float32 float32_default_nan(float_status *status)
 {
-    FloatParts p = parts_default_nan(status);
+    FloatParts64 p = parts_default_nan(status);
     p.frac >>= float32_params.frac_shift;
     return float32_pack_raw(p);
 }
 
 float64 float64_default_nan(float_status *status)
 {
-    FloatParts p = parts_default_nan(status);
+    FloatParts64 p = parts_default_nan(status);
     p.frac >>= float64_params.frac_shift;
     return float64_pack_raw(p);
 }
 
 float128 float128_default_nan(float_status *status)
 {
-    FloatParts p = parts_default_nan(status);
+    FloatParts64 p = parts_default_nan(status);
     float128 r;
 
     /* Extrapolate from the choices made by parts_default_nan to fill
@@ -3608,7 +3608,7 @@ float128 float128_default_nan(float_status *status)
 
 bfloat16 bfloat16_default_nan(float_status *status)
 {
-    FloatParts p = parts_default_nan(status);
+    FloatParts64 p = parts_default_nan(status);
     p.frac >>= bfloat16_params.frac_shift;
     return bfloat16_pack_raw(p);
 }
@@ -3619,7 +3619,7 @@ bfloat16 bfloat16_default_nan(float_status *status)
 
 float16 float16_silence_nan(float16 a, float_status *status)
 {
-    FloatParts p = float16_unpack_raw(a);
+    FloatParts64 p = float16_unpack_raw(a);
     p.frac <<= float16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float16_params.frac_shift;
@@ -3628,7 +3628,7 @@ float16 float16_silence_nan(float16 a, float_status *status)
 
 float32 float32_silence_nan(float32 a, float_status *status)
 {
-    FloatParts p = float32_unpack_raw(a);
+    FloatParts64 p = float32_unpack_raw(a);
     p.frac <<= float32_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float32_params.frac_shift;
@@ -3637,7 +3637,7 @@ float32 float32_silence_nan(float32 a, float_status *status)
 
 float64 float64_silence_nan(float64 a, float_status *status)
 {
-    FloatParts p = float64_unpack_raw(a);
+    FloatParts64 p = float64_unpack_raw(a);
     p.frac <<= float64_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float64_params.frac_shift;
@@ -3646,7 +3646,7 @@ float64 float64_silence_nan(float64 a, float_status *status)
 
 bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 {
-    FloatParts p = bfloat16_unpack_raw(a);
+    FloatParts64 p = bfloat16_unpack_raw(a);
     p.frac <<= bfloat16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= bfloat16_params.frac_shift;
@@ -3658,7 +3658,7 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 | input-denormal exception and return zero. Otherwise just return the value.
 *----------------------------------------------------------------------------*/
 
-static bool parts_squash_denormal(FloatParts p, float_status *status)
+static bool parts_squash_denormal(FloatParts64 p, float_status *status)
 {
     if (p.exp == 0 && p.frac != 0) {
         float_raise(float_flag_input_denormal, status);
@@ -3671,7 +3671,7 @@ static bool parts_squash_denormal(FloatParts p, float_status *status)
 float16 float16_squash_input_denormal(float16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts p = float16_unpack_raw(a);
+        FloatParts64 p = float16_unpack_raw(a);
         if (parts_squash_denormal(p, status)) {
             return float16_set_sign(float16_zero, p.sign);
         }
@@ -3682,7 +3682,7 @@ float16 float16_squash_input_denormal(float16 a, float_status *status)
 float32 float32_squash_input_denormal(float32 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts p = float32_unpack_raw(a);
+        FloatParts64 p = float32_unpack_raw(a);
         if (parts_squash_denormal(p, status)) {
             return float32_set_sign(float32_zero, p.sign);
         }
@@ -3693,7 +3693,7 @@ float32 float32_squash_input_denormal(float32 a, float_status *status)
 float64 float64_squash_input_denormal(float64 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts p = float64_unpack_raw(a);
+        FloatParts64 p = float64_unpack_raw(a);
         if (parts_squash_denormal(p, status)) {
             return float64_set_sign(float64_zero, p.sign);
         }
@@ -3704,7 +3704,7 @@ float64 float64_squash_input_denormal(float64 a, float_status *status)
 bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts p = bfloat16_unpack_raw(a);
+        FloatParts64 p = bfloat16_unpack_raw(a);
         if (parts_squash_denormal(p, status)) {
             return bfloat16_set_sign(bfloat16_zero, p.sign);
         }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 5988830c16..52fc76d800 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -129,7 +129,7 @@ static bool parts_is_snan_frac(uint64_t frac, float_status *status)
 | The pattern for a default generated deconstructed floating-point NaN.
 *----------------------------------------------------------------------------*/
 
-static FloatParts parts_default_nan(float_status *status)
+static FloatParts64 parts_default_nan(float_status *status)
 {
     bool sign = 0;
     uint64_t frac;
@@ -164,7 +164,7 @@ static FloatParts parts_default_nan(float_status *status)
     }
 #endif
 
-    return (FloatParts) {
+    return (FloatParts64) {
         .cls = float_class_qnan,
         .sign = sign,
         .exp = INT_MAX,
@@ -177,7 +177,7 @@ static FloatParts parts_default_nan(float_status *status)
 | floating-point parts.
 *----------------------------------------------------------------------------*/
 
-static FloatParts parts_silence_nan(FloatParts a, float_status *status)
+static FloatParts64 parts_silence_nan(FloatParts64 a, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
     g_assert(!status->default_nan_mode);
-- 
2.25.1


