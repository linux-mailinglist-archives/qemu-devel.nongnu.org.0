Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8A370876
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:48:04 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcueo-0001d2-Lc
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaW-0008CS-9V
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008Uv-2G
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id q9so821916pgl.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/pItQsQ9Y9zVqgnbFnM4eZJR/WZu0GVfOi6XxB0n7E=;
 b=kpRSPAtXi7O7WOWdenbCrc9wMzeOWWyollsPXENx+VTONlkVNgddxTkl2dU5/ZT0uL
 shBzvMzTJrjWWSG6DOYiBZ6cfUyd8ioGSxN7V2XHpHRSsAHtg15CRS/swVWuypMoEEFF
 sgJ6yiRFfqxv2ZEU8F+Xfn17ph9CFspu3wr9MMh1olIiA6WVfu5NEzkiRwYFTi/6ZkJT
 VnV+8N1uiNh30p7ZyNdJHBlvVJ67rjKPblGKqVFSqTweLQn/UbemeFapXbCMvny5e0V1
 3C/YK/iqK2xxQJSuwSdNqZGjQQGN/gMfqLiNP+RYGmbCGRvzlOmuwiqOyDPKjLgJtQ6n
 wzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/pItQsQ9Y9zVqgnbFnM4eZJR/WZu0GVfOi6XxB0n7E=;
 b=k8cXTHN9kBOn5I92y2zo/wXfCN445xij61WTUErxtgaF+ed1TND9Rf1nQqLkl8PmBx
 c8G7L1pPgqrqBpjvajXSdsRwLd8+j1c/r0YWYf8REVRWpx/ddF3ebTjMzhF7jQo4Wt2D
 Xdo5unHk1kvOprw4fuvvtuoB5f/rYRy7BkEh1bB8rkQwq3JLP16zC52FTtqZ/C48oU9X
 MDJ928Hv2XXE3aY4kUtdMbg2PBIgEV9FNrTMN6Y5rnRH+QYEdhGqcwtNZDJNH6SqXqmD
 SshXIH/UW6rHLjpoiTqapP9QF7DCpAm4+C/sZJYxRSDeT7PnSvkYt9y1dbx6Atoxmk+0
 KqsQ==
X-Gm-Message-State: AOAM530uaLdDwkbTvuio0Ytf4znNDz24c4affSs23kfSxFe8oyQEZp0A
 x4QkfbAIENJ48+yHuf23iGF7NUXYzTrjqw==
X-Google-Smtp-Source: ABdhPJwTkxYosED3Is4+F9vDHU9cesbhae2GLETemoKO+wdiTpP2qeySovVlJIU1RSj1QAPnh7t9uA==
X-Received: by 2002:a63:ea04:: with SMTP id c4mr10095687pgi.243.1619894610668; 
 Sat, 01 May 2021 11:43:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/31] Hexagon (target/hexagon) remove unnecessary inline
 directives
Date: Sat,  1 May 2021 11:43:01 -0700
Message-Id: <20210501184324.1338186-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-4-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c       |  9 ++++-----
 target/hexagon/decode.c    |  6 +++---
 target/hexagon/fma_emu.c   | 39 +++++++++++++++++++-------------------
 target/hexagon/op_helper.c | 37 ++++++++++++++++++------------------
 target/hexagon/translate.c |  2 +-
 5 files changed, 46 insertions(+), 47 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index b0b3040dd1..c2fe357702 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -69,10 +69,9 @@ const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS] = {
  * stacks at different locations.  This is used to compensate so the diff is
  * cleaner.
  */
-static inline target_ulong adjust_stack_ptrs(CPUHexagonState *env,
-                                             target_ulong addr)
+static target_ulong adjust_stack_ptrs(CPUHexagonState *env, target_ulong addr)
 {
-    HexagonCPU *cpu = container_of(env, HexagonCPU, env);
+    HexagonCPU *cpu = hexagon_env_get_cpu(env);
     target_ulong stack_adjust = cpu->lldb_stack_adjust;
     target_ulong stack_start = env->stack_start;
     target_ulong stack_size = 0x10000;
@@ -88,7 +87,7 @@ static inline target_ulong adjust_stack_ptrs(CPUHexagonState *env,
 }
 
 /* HEX_REG_P3_0 (aka C4) is an alias for the predicate registers */
-static inline target_ulong read_p3_0(CPUHexagonState *env)
+static target_ulong read_p3_0(CPUHexagonState *env)
 {
     int32_t control_reg = 0;
     int i;
@@ -116,7 +115,7 @@ static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
 
 static void hexagon_dump(CPUHexagonState *env, FILE *f)
 {
-    HexagonCPU *cpu = container_of(env, HexagonCPU, env);
+    HexagonCPU *cpu = hexagon_env_get_cpu(env);
 
     if (cpu->lldb_compat) {
         /*
diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index 1c9c07412a..65d97ce64b 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -354,7 +354,7 @@ static void decode_split_cmpjump(Packet *pkt)
     }
 }
 
-static inline int decode_opcode_can_jump(int opcode)
+static int decode_opcode_can_jump(int opcode)
 {
     if ((GET_ATTRIB(opcode, A_JUMP)) ||
         (GET_ATTRIB(opcode, A_CALL)) ||
@@ -370,7 +370,7 @@ static inline int decode_opcode_can_jump(int opcode)
     return 0;
 }
 
-static inline int decode_opcode_ends_loop(int opcode)
+static int decode_opcode_ends_loop(int opcode)
 {
     return GET_ATTRIB(opcode, A_HWLOOP0_END) ||
            GET_ATTRIB(opcode, A_HWLOOP1_END);
@@ -764,7 +764,7 @@ static void decode_add_endloop_insn(Insn *insn, int loopnum)
     }
 }
 
-static inline int decode_parsebits_is_loopend(uint32_t encoding32)
+static int decode_parsebits_is_loopend(uint32_t encoding32)
 {
     uint32_t bits = parse_bits(encoding32);
     return bits == 0x2;
diff --git a/target/hexagon/fma_emu.c b/target/hexagon/fma_emu.c
index 842d903710..f324b83e3c 100644
--- a/target/hexagon/fma_emu.c
+++ b/target/hexagon/fma_emu.c
@@ -64,7 +64,7 @@ typedef union {
     };
 } Float;
 
-static inline uint64_t float64_getmant(float64 f64)
+static uint64_t float64_getmant(float64 f64)
 {
     Double a = { .i = f64 };
     if (float64_is_normal(f64)) {
@@ -91,7 +91,7 @@ int32_t float64_getexp(float64 f64)
     return -1;
 }
 
-static inline uint64_t float32_getmant(float32 f32)
+static uint64_t float32_getmant(float32 f32)
 {
     Float a = { .i = f32 };
     if (float32_is_normal(f32)) {
@@ -118,17 +118,17 @@ int32_t float32_getexp(float32 f32)
     return -1;
 }
 
-static inline uint32_t int128_getw0(Int128 x)
+static uint32_t int128_getw0(Int128 x)
 {
     return int128_getlo(x);
 }
 
-static inline uint32_t int128_getw1(Int128 x)
+static uint32_t int128_getw1(Int128 x)
 {
     return int128_getlo(x) >> 32;
 }
 
-static inline Int128 int128_mul_6464(uint64_t ai, uint64_t bi)
+static Int128 int128_mul_6464(uint64_t ai, uint64_t bi)
 {
     Int128 a, b;
     uint64_t pp0, pp1a, pp1b, pp1s, pp2;
@@ -152,7 +152,7 @@ static inline Int128 int128_mul_6464(uint64_t ai, uint64_t bi)
     return int128_make128(ret_low, pp2 + (pp1s >> 32));
 }
 
-static inline Int128 int128_sub_borrow(Int128 a, Int128 b, int borrow)
+static Int128 int128_sub_borrow(Int128 a, Int128 b, int borrow)
 {
     Int128 ret = int128_sub(a, b);
     if (borrow != 0) {
@@ -170,7 +170,7 @@ typedef struct {
     uint8_t sticky;
 } Accum;
 
-static inline void accum_init(Accum *p)
+static void accum_init(Accum *p)
 {
     p->mant = int128_zero();
     p->exp = 0;
@@ -180,7 +180,7 @@ static inline void accum_init(Accum *p)
     p->sticky = 0;
 }
 
-static inline Accum accum_norm_left(Accum a)
+static Accum accum_norm_left(Accum a)
 {
     a.exp--;
     a.mant = int128_lshift(a.mant, 1);
@@ -190,6 +190,7 @@ static inline Accum accum_norm_left(Accum a)
     return a;
 }
 
+/* This function is marked inline for performance reasons */
 static inline Accum accum_norm_right(Accum a, int amt)
 {
     if (amt > 130) {
@@ -226,7 +227,7 @@ static inline Accum accum_norm_right(Accum a, int amt)
  */
 static Accum accum_add(Accum a, Accum b);
 
-static inline Accum accum_sub(Accum a, Accum b, int negate)
+static Accum accum_sub(Accum a, Accum b, int negate)
 {
     Accum ret;
     accum_init(&ret);
@@ -329,7 +330,7 @@ static Accum accum_add(Accum a, Accum b)
 }
 
 /* Return an infinity with requested sign */
-static inline float64 infinite_float64(uint8_t sign)
+static float64 infinite_float64(uint8_t sign)
 {
     if (sign) {
         return make_float64(DF_MINUS_INF);
@@ -339,7 +340,7 @@ static inline float64 infinite_float64(uint8_t sign)
 }
 
 /* Return a maximum finite value with requested sign */
-static inline float64 maxfinite_float64(uint8_t sign)
+static float64 maxfinite_float64(uint8_t sign)
 {
     if (sign) {
         return make_float64(DF_MINUS_MAXF);
@@ -349,7 +350,7 @@ static inline float64 maxfinite_float64(uint8_t sign)
 }
 
 /* Return a zero value with requested sign */
-static inline float64 zero_float64(uint8_t sign)
+static float64 zero_float64(uint8_t sign)
 {
     if (sign) {
         return make_float64(0x8000000000000000);
@@ -369,7 +370,7 @@ float32 infinite_float32(uint8_t sign)
 }
 
 /* Return a maximum finite value with the requested sign */
-static inline float32 maxfinite_float32(uint8_t sign)
+static float32 maxfinite_float32(uint8_t sign)
 {
     if (sign) {
         return make_float32(SF_MINUS_MAXF);
@@ -379,7 +380,7 @@ static inline float32 maxfinite_float32(uint8_t sign)
 }
 
 /* Return a zero value with requested sign */
-static inline float32 zero_float32(uint8_t sign)
+static float32 zero_float32(uint8_t sign)
 {
     if (sign) {
         return make_float32(0x80000000);
@@ -389,7 +390,7 @@ static inline float32 zero_float32(uint8_t sign)
 }
 
 #define GEN_XF_ROUND(SUFFIX, MANTBITS, INF_EXP, INTERNAL_TYPE) \
-static inline SUFFIX accum_round_##SUFFIX(Accum a, float_status * fp_status) \
+static SUFFIX accum_round_##SUFFIX(Accum a, float_status * fp_status) \
 { \
     if ((int128_gethi(a.mant) == 0) && (int128_getlo(a.mant) == 0) \
         && ((a.guard | a.round | a.sticky) == 0)) { \
@@ -526,8 +527,8 @@ static bool is_inf_prod(float64 a, float64 b)
             (float64_is_infinity(b) && is_finite(a) && (!float64_is_zero(a))));
 }
 
-static inline float64 special_fma(float64 a, float64 b, float64 c,
-                                  float_status *fp_status)
+static float64 special_fma(float64 a, float64 b, float64 c,
+                           float_status *fp_status)
 {
     float64 ret = make_float64(0);
 
@@ -586,8 +587,8 @@ static inline float64 special_fma(float64 a, float64 b, float64 c,
     g_assert_not_reached();
 }
 
-static inline float32 special_fmaf(float32 a, float32 b, float32 c,
-                                 float_status *fp_status)
+static float32 special_fmaf(float32 a, float32 b, float32 c,
+                            float_status *fp_status)
 {
     float64 aa, bb, cc;
     aa = float32_to_float64(a, fp_status);
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index d6b5c47500..5d35dfc8f3 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -46,8 +46,8 @@ void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
     do_raise_exception_err(env, excp, 0);
 }
 
-static inline void log_reg_write(CPUHexagonState *env, int rnum,
-                                 target_ulong val, uint32_t slot)
+static void log_reg_write(CPUHexagonState *env, int rnum,
+                          target_ulong val, uint32_t slot)
 {
     HEX_DEBUG_LOG("log_reg_write[%d] = " TARGET_FMT_ld " (0x" TARGET_FMT_lx ")",
                   rnum, val, val);
@@ -63,8 +63,7 @@ static inline void log_reg_write(CPUHexagonState *env, int rnum,
 #endif
 }
 
-static inline void log_pred_write(CPUHexagonState *env, int pnum,
-                                  target_ulong val)
+static void log_pred_write(CPUHexagonState *env, int pnum, target_ulong val)
 {
     HEX_DEBUG_LOG("log_pred_write[%d] = " TARGET_FMT_ld
                   " (0x" TARGET_FMT_lx ")\n",
@@ -79,8 +78,8 @@ static inline void log_pred_write(CPUHexagonState *env, int pnum,
     }
 }
 
-static inline void log_store32(CPUHexagonState *env, target_ulong addr,
-                               target_ulong val, int width, int slot)
+static void log_store32(CPUHexagonState *env, target_ulong addr,
+                        target_ulong val, int width, int slot)
 {
     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
                   ", %" PRId32 " [0x08%" PRIx32 "])\n",
@@ -90,8 +89,8 @@ static inline void log_store32(CPUHexagonState *env, target_ulong addr,
     env->mem_log_stores[slot].data32 = val;
 }
 
-static inline void log_store64(CPUHexagonState *env, target_ulong addr,
-                               int64_t val, int width, int slot)
+static void log_store64(CPUHexagonState *env, target_ulong addr,
+                        int64_t val, int width, int slot)
 {
     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
                   ", %" PRId64 " [0x016%" PRIx64 "])\n",
@@ -101,7 +100,7 @@ static inline void log_store64(CPUHexagonState *env, target_ulong addr,
     env->mem_log_stores[slot].data64 = val;
 }
 
-static inline void write_new_pc(CPUHexagonState *env, target_ulong addr)
+static void write_new_pc(CPUHexagonState *env, target_ulong addr)
 {
     HEX_DEBUG_LOG("write_new_pc(0x" TARGET_FMT_lx ")\n", addr);
 
@@ -132,7 +131,7 @@ void HELPER(debug_start_packet)(CPUHexagonState *env)
 }
 #endif
 
-static inline int32_t new_pred_value(CPUHexagonState *env, int pnum)
+static int32_t new_pred_value(CPUHexagonState *env, int pnum)
 {
     return env->new_pred_value[pnum];
 }
@@ -332,8 +331,8 @@ static void check_noshuf(CPUHexagonState *env, uint32_t slot)
     }
 }
 
-static inline uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,
-                                target_ulong vaddr)
+static uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,
+                         target_ulong vaddr)
 {
     uint8_t retval;
     check_noshuf(env, slot);
@@ -341,8 +340,8 @@ static inline uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,
     return retval;
 }
 
-static inline uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,
-                                 target_ulong vaddr)
+static uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,
+                          target_ulong vaddr)
 {
     uint16_t retval;
     check_noshuf(env, slot);
@@ -350,8 +349,8 @@ static inline uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,
     return retval;
 }
 
-static inline uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,
-                                 target_ulong vaddr)
+static uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,
+                          target_ulong vaddr)
 {
     uint32_t retval;
     check_noshuf(env, slot);
@@ -359,8 +358,8 @@ static inline uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,
     return retval;
 }
 
-static inline uint64_t mem_load8(CPUHexagonState *env, uint32_t slot,
-                                 target_ulong vaddr)
+static uint64_t mem_load8(CPUHexagonState *env, uint32_t slot,
+                          target_ulong vaddr)
 {
     uint64_t retval;
     check_noshuf(env, slot);
@@ -939,7 +938,7 @@ float32 HELPER(sffms)(CPUHexagonState *env, float32 RxV,
     return RxV;
 }
 
-static inline bool is_inf_prod(int32_t a, int32_t b)
+static bool is_inf_prod(int32_t a, int32_t b)
 {
     return (float32_is_infinity(a) && float32_is_infinity(b)) ||
            (float32_is_infinity(a) && is_finite(b) && !float32_is_zero(b)) ||
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 2317508fa5..f975d7a5a1 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -585,7 +585,7 @@ static void hexagon_tr_translate_packet(DisasContextBase *dcbase, CPUState *cpu)
          * The CPU log is used to compare against LLDB single stepping,
          * so end the TLB after every packet.
          */
-        HexagonCPU *hex_cpu = container_of(env, HexagonCPU, env);
+        HexagonCPU *hex_cpu = hexagon_env_get_cpu(env);
         if (hex_cpu->lldb_compat && qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-- 
2.25.1


