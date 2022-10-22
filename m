Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E3608D27
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 14:21:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omD7T-0003C2-N1; Sat, 22 Oct 2022 07:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD73-00032B-SG
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD71-0006i0-UW
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666439783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Fps74obIni96mKMShOCBvBkks/5+B5uGMDkYtJzx6k=;
 b=fdhc7WeyLKwjsafPoqapby6RdDv9vYCHVDf8IfoBppzCyfL1b9xtffYH916BHdgbNrhcJs
 pa+dsjSi2O14BDLwAR6wULFS6g/gAJZ51rGMH+m9FAtc7DgVZVFgCY9hqgUhDiv0Qw/2PC
 ViCVueexhyp0pazN/GwTvN8OrNoL7Nk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-7k8qM7TVNOCzTvm26jwwxg-1; Sat, 22 Oct 2022 07:56:18 -0400
X-MC-Unique: 7k8qM7TVNOCzTvm26jwwxg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020a056402255200b0045d2674d1a0so5160424edb.0
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Fps74obIni96mKMShOCBvBkks/5+B5uGMDkYtJzx6k=;
 b=DeeP2pjWVwdXa+OiwvFdpo7+K+AUFpJFVqX3UcCpZMNeXKS3CcD2kBxtOejKSwHpMj
 /0F6GxwFmZqgOr3KX+5DCKBxMo3K3JufEa4nLWAhSg2UVVE8Mgnqi7wE2A23rTWqlAIn
 oZz2wsvWBYfrTZlg4o054K3k1HtXq55DXnpKvxTAp/S1BVntX5OEevnqgRWcPIh1WozK
 S1TgeVvozegrX4cnBFrWD6A1r0bZSlMyu2qwO2GDUNTmRdOfKgeiyNdlGfqpIRZOXBXe
 Co+dFfCVtvHgx7LqCEorlj8cr8uTza9TbiAXzhga7uIvbKS2ecg6UOZ8c+TMSMb9Pn7J
 P+xA==
X-Gm-Message-State: ACrzQf2gpmrMj4kq9z9qZVkDkVgBL6Kz+YH61evVH0khKQrkqwpjPeyN
 qlVhJJeNyJ8OCbhB7P9Jxf4BNsQTjuieiqmscjBY+OG7dWhNqFbiNiK+8GVxPNHJ03HMvfN3h/P
 wEVWy/0bkf/pMJiXtGjAANgsq5u6fpOyg6LigTh2gpVfZjFEu4F5jApFJH8jkUfHvHl8=
X-Received: by 2002:a17:907:2cd9:b0:78d:9f4c:9cff with SMTP id
 hg25-20020a1709072cd900b0078d9f4c9cffmr19572873ejc.345.1666439776340; 
 Sat, 22 Oct 2022 04:56:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YC2f+n/qTzeNofbUTaMwQOoCmwIh6qgXxAx0gQ5qpGkPaP04VsH/ks5JtlcvvTVz9zjWPLg==
X-Received: by 2002:a17:907:2cd9:b0:78d:9f4c:9cff with SMTP id
 hg25-20020a1709072cd900b0078d9f4c9cffmr19572862ejc.345.1666439776101; 
 Sat, 22 Oct 2022 04:56:16 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906784700b0078d9e26db54sm12902093ejm.88.2022.10.22.04.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 04:56:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/4] target/i386: introduce function to set rounding mode from
 FPCW or MXCSR bits
Date: Sat, 22 Oct 2022 13:56:06 +0200
Message-Id: <20221022115608.152853-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022115608.152853-1-pbonzini@redhat.com>
References: <20221022115608.152853-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VROUND, FSTCW and STMXCSR all have to perform the same conversion from
x86 rounding modes to softfloat constants.  Since the ISA is consistent
on the meaning of the two-bit rounding modes, extract the common code
into a wrapper for set_float_rounding_mode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 60 +++---------------------------------
 target/i386/tcg/fpu_helper.c | 60 +++++++++++++-----------------------
 2 files changed, 25 insertions(+), 95 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index d35fc15c65..0799712f6e 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1684,20 +1684,7 @@ void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
-        switch (mode & 3) {
-        case 0:
-            set_float_rounding_mode(float_round_nearest_even, &env->sse_status);
-            break;
-        case 1:
-            set_float_rounding_mode(float_round_down, &env->sse_status);
-            break;
-        case 2:
-            set_float_rounding_mode(float_round_up, &env->sse_status);
-            break;
-        case 3:
-            set_float_rounding_mode(float_round_to_zero, &env->sse_status);
-            break;
-        }
+        set_x86_rounding_mode(mode & 3, &env->sse_status);
     }
 
     for (i = 0; i < 2 << SHIFT; i++) {
@@ -1721,20 +1708,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
-        switch (mode & 3) {
-        case 0:
-            set_float_rounding_mode(float_round_nearest_even, &env->sse_status);
-            break;
-        case 1:
-            set_float_rounding_mode(float_round_down, &env->sse_status);
-            break;
-        case 2:
-            set_float_rounding_mode(float_round_up, &env->sse_status);
-            break;
-        case 3:
-            set_float_rounding_mode(float_round_to_zero, &env->sse_status);
-            break;
-        }
+        set_x86_rounding_mode(mode & 3, &env->sse_status);
     }
 
     for (i = 0; i < 1 << SHIFT; i++) {
@@ -1759,20 +1733,7 @@ void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
-        switch (mode & 3) {
-        case 0:
-            set_float_rounding_mode(float_round_nearest_even, &env->sse_status);
-            break;
-        case 1:
-            set_float_rounding_mode(float_round_down, &env->sse_status);
-            break;
-        case 2:
-            set_float_rounding_mode(float_round_up, &env->sse_status);
-            break;
-        case 3:
-            set_float_rounding_mode(float_round_to_zero, &env->sse_status);
-            break;
-        }
+        set_x86_rounding_mode(mode & 3, &env->sse_status);
     }
 
     d->ZMM_S(0) = float32_round_to_int(s->ZMM_S(0), &env->sse_status);
@@ -1797,20 +1758,7 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
-        switch (mode & 3) {
-        case 0:
-            set_float_rounding_mode(float_round_nearest_even, &env->sse_status);
-            break;
-        case 1:
-            set_float_rounding_mode(float_round_down, &env->sse_status);
-            break;
-        case 2:
-            set_float_rounding_mode(float_round_up, &env->sse_status);
-            break;
-        case 3:
-            set_float_rounding_mode(float_round_to_zero, &env->sse_status);
-            break;
-        }
+        set_x86_rounding_mode(mode & 3, &env->sse_status);
     }
 
     d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index a6a90a1817..6f3741b635 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -32,7 +32,8 @@
 #define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
 #define ST1    ST(1)
 
-#define FPU_RC_MASK         0xc00
+#define FPU_RC_SHIFT        10
+#define FPU_RC_MASK         (3 << FPU_RC_SHIFT)
 #define FPU_RC_NEAR         0x000
 #define FPU_RC_DOWN         0x400
 #define FPU_RC_UP           0x800
@@ -685,28 +686,26 @@ uint32_t helper_fnstcw(CPUX86State *env)
     return env->fpuc;
 }
 
+static void set_x86_rounding_mode(unsigned mode, float_status *status)
+{
+    static FloatRoundMode x86_round_mode[4] = {
+        float_round_nearest_even,
+        float_round_down,
+        float_round_up,
+        float_round_to_zero
+    };
+    assert(mode < ARRAY_SIZE(x86_round_mode));
+    set_float_rounding_mode(x86_round_mode[mode], status);
+}
+
 void update_fp_status(CPUX86State *env)
 {
-    FloatRoundMode rnd_mode;
+    int rnd_mode;
     FloatX80RoundPrec rnd_prec;
 
     /* set rounding mode */
-    switch (env->fpuc & FPU_RC_MASK) {
-    default:
-    case FPU_RC_NEAR:
-        rnd_mode = float_round_nearest_even;
-        break;
-    case FPU_RC_DOWN:
-        rnd_mode = float_round_down;
-        break;
-    case FPU_RC_UP:
-        rnd_mode = float_round_up;
-        break;
-    case FPU_RC_CHOP:
-        rnd_mode = float_round_to_zero;
-        break;
-    }
-    set_float_rounding_mode(rnd_mode, &env->fp_status);
+    rnd_mode = (env->fpuc & FPU_RC_MASK) >> FPU_RC_SHIFT;
+    set_x86_rounding_mode(rnd_mode, &env->fp_status);
 
     switch ((env->fpuc >> 8) & 3) {
     case 0:
@@ -3038,11 +3037,8 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 /* XXX: optimize by storing fptt and fptags in the static cpu state */
 
 #define SSE_DAZ             0x0040
-#define SSE_RC_MASK         0x6000
-#define SSE_RC_NEAR         0x0000
-#define SSE_RC_DOWN         0x2000
-#define SSE_RC_UP           0x4000
-#define SSE_RC_CHOP         0x6000
+#define SSE_RC_SHIFT        13
+#define SSE_RC_MASK         (3 << SSE_RC_SHIFT)
 #define SSE_FZ              0x8000
 
 void update_mxcsr_status(CPUX86State *env)
@@ -3051,22 +3047,8 @@ void update_mxcsr_status(CPUX86State *env)
     int rnd_type;
 
     /* set rounding mode */
-    switch (mxcsr & SSE_RC_MASK) {
-    default:
-    case SSE_RC_NEAR:
-        rnd_type = float_round_nearest_even;
-        break;
-    case SSE_RC_DOWN:
-        rnd_type = float_round_down;
-        break;
-    case SSE_RC_UP:
-        rnd_type = float_round_up;
-        break;
-    case SSE_RC_CHOP:
-        rnd_type = float_round_to_zero;
-        break;
-    }
-    set_float_rounding_mode(rnd_type, &env->sse_status);
+    rnd_type = (mxcsr & SSE_RC_MASK) >> SSE_RC_SHIFT;
+    set_x86_rounding_mode(rnd_type, &env->sse_status);
 
     /* Set exception flags.  */
     set_float_exception_flags((mxcsr & FPUS_IE ? float_flag_invalid : 0) |
-- 
2.37.3


