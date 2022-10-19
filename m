Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49B604ADE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:12:55 +0200 (CEST)
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAkY-000297-Vq
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeN-0000br-Ib
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeK-0000Mu-V6
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666191986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJutn04GsnDUciIRck6NVbmsZUgHVUtXA9ajB4916jI=;
 b=fJxR8oaOGLp6xKkrcv3lldU5dC1jKpIi276v0dD8iUEs/cbVsBga9CBrXfK1HQpmTGwzOw
 b3VIOBXhRXpS/eBfTdy2TjAq3s36bCTr9rwyeumZ6MHxd+i+YBsgkzIcqwVFhJO2NtEsUM
 CVWbHDHwRyQjq5U19Vhlr2kcqqtIJk8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-g2h2Qh5EMcecwU2S2g_Psw-1; Wed, 19 Oct 2022 11:06:25 -0400
X-MC-Unique: g2h2Qh5EMcecwU2S2g_Psw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d1-20020ac80601000000b00388b0fc84beso12957058qth.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJutn04GsnDUciIRck6NVbmsZUgHVUtXA9ajB4916jI=;
 b=Zv+lAjtiK0v4mzykWSMrMC7RqDefY6Ruh3omM/SH/WeGplLe8/g6Sz1m8N/ysu79QO
 hnSRkXexF48ZY5R8t+9TI0nV1Zy2LhbMxUlzw0k6U81GbUZEz9U3up85fCTsdiJ7fvQa
 vUiKbMnSt840V0zsHq7rYQtprRM8z716m9tN6bLRnXWwA8FC00cePxpA9x5TSt9OTkUH
 muZCoJs24hK4PxjV96NQFlKQvyHeMruaKDl6WHligY7Uw6f6PzSOMMrvfOVkMZqTKDG8
 hsppn2U1EuFe6g7wuajRiKoC2X/sFGV/XORnqaDRbo5bNF4u9fBZd/4SIEhiz49NAlCh
 SoRQ==
X-Gm-Message-State: ACrzQf2pIr/nPoV4quFT5BmQcEj/yS/FwzpUOq3PI+TVRvkWX+xjeHYI
 X5b4dybZ9rJ16rmQZ3Kak0ukXfAPO4YaYntob2Tvp7Z6D/GSXIKdA6Phzn47RXhRcD+iXknWP8F
 BFlQFyfzjuV9lekGB9GMFklhFXnSTHNq+iLTyQluLsimC0E95L49MVhRHyxRx3e8vyeY=
X-Received: by 2002:ad4:5bc5:0:b0:4af:b21d:2ad7 with SMTP id
 t5-20020ad45bc5000000b004afb21d2ad7mr6833860qvt.112.1666191984677; 
 Wed, 19 Oct 2022 08:06:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Q092MEWdETJsg7abMCghIcg5wzJAFm0s6nRNgFnHoz+LqF9FANgI8F9vo5aG3ocVkLN3oEA==
X-Received: by 2002:ad4:5bc5:0:b0:4af:b21d:2ad7 with SMTP id
 t5-20020ad45bc5000000b004afb21d2ad7mr6833803qvt.112.1666191984211; 
 Wed, 19 Oct 2022 08:06:24 -0700 (PDT)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a0c4a00b006bb2cd2f6d1sm4946811qki.127.2022.10.19.08.06.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:06:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/i386: introduce function to set rounding mode from
 FPCW or MXCSR bits
Date: Wed, 19 Oct 2022 17:06:14 +0200
Message-Id: <20221019150616.929463-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221019150616.929463-1-pbonzini@redhat.com>
References: <20221019150616.929463-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

VROUND, FSTCW and STMXCSR all have to perform the same conversion from
x86 rounding modes to softfloat constants.  Since the ISA is consistent
on the meaning of the two-bit rounding modes, extract the common code
into a wrapper for set_float_rounding_mode.

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


