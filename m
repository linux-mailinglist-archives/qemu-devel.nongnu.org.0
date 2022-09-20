Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E45BF0D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:10:03 +0200 (CEST)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamNN-0002bW-LY
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Sj-Tx; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001sW-63; Tue, 20 Sep 2022 15:42:54 -0400
Received: by mail-oi1-x22c.google.com with SMTP id d64so2107232oia.9;
 Tue, 20 Sep 2022 12:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4l/X3hVi4nLspsZ3CaSGwq3+mci37+3eF+RQG1vpjyk=;
 b=qj++4kQnnEH23nVuC9dzUntgJZuUeL8UTOHZLQQp+YSZacgAVbyYCXBCNQqYQ6slyd
 5sa4/WZuWWWgnOx69O2nKXQ3OkkKsG9Tsyv3AW20lZRSWnRzjEt6vQLl6Gqs0cDRc/ZN
 /sryCjvr8E1V3L9wiPGAu1HnD8v44lz0iTEk7ZmtnQla+yqucgoUSy0AcDk25cMvDcty
 SsXWYZV2dgRpUZRtZkSqaQ9TFMMYGv4MzGIwwEtdUvBBhec69IP+ATiFbHqLzQrUyTAf
 MBjb4yifxcLM/Kyef/FlUwSf2phkzDRNSN10x1ER7KxjEH0YbvU3nzriLPgTRM26+EYZ
 wZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4l/X3hVi4nLspsZ3CaSGwq3+mci37+3eF+RQG1vpjyk=;
 b=CUsgTz55d4wEuHXMoRk2QjfEDv4/8dyoQ12akbqwtXSZVYbjqr4C1ICFaFmxD7otk2
 AoOmzzzPhG3SJrERHA8HMktTa/QIIYm5+bf3NrRXWoCgqtBKMeWEvyZDSu9oJv2SYvTP
 MiRXQOwdTyyXBQ15t8rytU430KLuVm/tFRKegVqhTC18/VWRamLiDjITIxRVJXXNWLl4
 g5ZWdi0D5dTfBF2pyaXJYNGtN2h1bNdnr1qbmkEZZX9pxw/q6tK+n47ywSGT9kzVi3C1
 b1h8ettriZMBjwohHb7OO9rreiXsUCqOM6lT/KUwXfVhVOE+ac12QAf4kih5ZwVIe5sk
 PlTg==
X-Gm-Message-State: ACrzQf0+qw/AtXHc99Vm5ZrJmio4fBUTNV+Y+xC+8ZHkM9eDPFU3Jkri
 tK4mynw5tm956WntqEo/KcCmOUOyTTk=
X-Google-Smtp-Source: AMsMyM6OJItFa9/5AVV5YPAyWmzZeduc3ShuW+sjYysA09pggMbzArMLqd92LiF5N7GO8LAcRpcvXg==
X-Received: by 2002:a05:6808:308c:b0:34f:9433:dca6 with SMTP id
 bl12-20020a056808308c00b0034f9433dca6mr2313970oib.255.1663702967591; 
 Tue, 20 Sep 2022 12:42:47 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 14/17] target/ppc: Clear fpstatus flags on helpers missing it
Date: Tue, 20 Sep 2022 16:41:59 -0300
Message-Id: <20220920194202.82615-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

In ppc emulation, exception flags are not cleared at the end of an
instruction. Instead, the next instruction is responsible to clear
it before its emulation. However, some helpers are not doing it,
causing an issue where the previously set exception flags are being
used and leading to incorrect values being set in FPSCR.
Fix this by clearing fp_status before doing the instruction 'real' work
for the following helpers that were missing this behavior:

- VSX_CVT_INT_TO_FP_VECTOR
- VSX_CVT_FP_TO_FP
- VSX_CVT_FP_TO_INT_VECTOR
- VSX_CVT_FP_TO_INT2
- VSX_CVT_FP_TO_INT
- VSX_CVT_FP_TO_FP_HP
- VSX_CVT_FP_TO_FP_VECTOR
- VSX_CMP
- VSX_ROUND
- xscvqpdp
- xscvdpsp[n]

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-9-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f07330ffc1..ae25f32d6e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2628,6 +2628,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
     int all_true = 1;                                                     \
     int all_false = 1;                                                    \
                                                                           \
+    helper_reset_fpstatus(env);                                           \
+                                                                          \
     for (i = 0; i < nels; i++) {                                          \
         if (unlikely(tp##_is_any_nan(xa->fld) ||                          \
                      tp##_is_any_nan(xb->fld))) {                         \
@@ -2681,6 +2683,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     ppc_vsr_t t = { };                                             \
     int i;                                                         \
                                                                    \
+    helper_reset_fpstatus(env);                                    \
+                                                                   \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);        \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
@@ -2706,6 +2710,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
     ppc_vsr_t t = { };                                                \
     int i;                                                            \
                                                                       \
+    helper_reset_fpstatus(env);                                       \
+                                                                      \
     for (i = 0; i < nels; i++) {                                      \
         t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status); \
         if (unlikely(stp##_is_signaling_nan(xb->VsrD(i),              \
@@ -2743,6 +2749,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     ppc_vsr_t t = *xt;                                                  \
     int i;                                                              \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
+                                                                        \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,                   \
@@ -2778,6 +2786,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     ppc_vsr_t t = { };                                             \
     int i;                                                         \
                                                                    \
+    helper_reset_fpstatus(env);                                    \
+                                                                   \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, 1, &env->fp_status);     \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
@@ -2825,6 +2835,8 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     ppc_vsr_t t = { };
     float_status tstat;
 
+    helper_reset_fpstatus(env);
+
     tstat = env->fp_status;
     if (ro != 0) {
         tstat.float_rounding_mode = float_round_to_odd;
@@ -2846,6 +2858,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 {
     uint64_t result, sign, exp, frac;
 
+    helper_reset_fpstatus(env);
     float_status tstat = env->fp_status;
     set_float_exception_flags(0, &tstat);
 
@@ -2901,22 +2914,20 @@ uint64_t helper_XSCVSPDPN(uint64_t xb)
 #define VSX_CVT_FP_TO_INT(op, nels, stp, ttp, sfld, tfld, sfi, rnan)         \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    int all_flags = env->fp_status.float_exception_flags, flags;             \
     ppc_vsr_t t = { };                                                       \
-    int i;                                                                   \
+    int i, flags;                                                            \
+                                                                             \
+    helper_reset_fpstatus(env);                                              \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
-        env->fp_status.float_exception_flags = 0;                            \
         t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
         flags = env->fp_status.float_exception_flags;                        \
         if (unlikely(flags & float_flag_invalid)) {                          \
             t.tfld = float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC());\
         }                                                                    \
-        all_flags |= flags;                                                  \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    env->fp_status.float_exception_flags = all_flags;                        \
     do_float_check_status(env, sfi, GETPC());                                \
 }
 
@@ -2968,12 +2979,12 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
 #define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    int all_flags = env->fp_status.float_exception_flags, flags;             \
     ppc_vsr_t t = { };                                                       \
-    int i;                                                                   \
+    int i, flags;                                                            \
+                                                                             \
+    helper_reset_fpstatus(env);                                              \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
-        env->fp_status.float_exception_flags = 0;                            \
         t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i),          \
                                                        &env->fp_status);     \
         flags = env->fp_status.float_exception_flags;                        \
@@ -2982,11 +2993,9 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                               rnan, 0, GETPC());             \
         }                                                                    \
         t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
-        all_flags |= flags;                                                  \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    env->fp_status.float_exception_flags = all_flags;                        \
     do_float_check_status(env, sfi, GETPC());                                \
 }
 
@@ -3011,6 +3020,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     ppc_vsr_t t = { };                                                       \
     int flags;                                                               \
                                                                              \
+    helper_reset_fpstatus(env);                                              \
+                                                                             \
     t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
     flags = get_float_exception_flags(&env->fp_status);                      \
     if (flags & float_flag_invalid) {                                        \
@@ -3023,7 +3034,6 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
 
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
                   0x8000000000000000ULL)
-
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpswz, float128, int32, f128, VsrD(0),          \
                   0xffffffff80000000ULL)
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpudz, float128, uint64, f128, VsrD(0), 0x0ULL)
@@ -3046,6 +3056,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     ppc_vsr_t t = { };                                                  \
     int i;                                                              \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
+                                                                        \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
         if (r2sp) {                                                     \
@@ -3115,6 +3127,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
 {                                                                       \
     ppc_vsr_t t = *xt;                                                  \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
     t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);                 \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
@@ -3148,6 +3161,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     int i;                                                             \
     FloatRoundMode curr_rounding_mode;                                 \
                                                                        \
+    helper_reset_fpstatus(env);                                        \
+                                                                       \
     if (rmode != FLOAT_ROUND_CURRENT) {                                \
         curr_rounding_mode = get_float_rounding_mode(&env->fp_status); \
         set_float_rounding_mode(rmode, &env->fp_status);               \
-- 
2.37.3


