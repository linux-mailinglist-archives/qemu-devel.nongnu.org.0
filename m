Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B366BFDEC1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 14:18:48 +0100 (CET)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVbUt-0001dT-Dh
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 08:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iVbO3-0004V8-96
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iVbO1-0004Q9-6U
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:43 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iVbO0-0004Pv-UY
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:41 -0500
Received: by mail-pf1-x442.google.com with SMTP id x28so6670189pfo.6
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTtCqGcFjzZbuh6vMFCG0KnvT7OIWYmijX3kRnpAThE=;
 b=Z0QWpRLEWajjU/2U7Kx3aZA78FMAs4BhPNtwxEbaj7Si6y+SJ+e1kEaqiFA8o0RpD4
 BNBn2juvQ+cJgt6q4Xb1IxNK6NUHUgJkEHwnIpoh+soOl2Haq3AVPjvoSRRPW/UI893P
 AmfhFBMR3MvxZvQ5iwKB5V4SF1afZ1fd4IVyT0SRo3r3z/BFZi2S1qRl2j47Vi8GBod6
 Ep83YnnexUio8ARbq0CPkrXBPIwCNO655KAVmjXMdZ4kEF0pVACeN7GliBJEa8mgzFTP
 uS5Ii6yzRxhEF+/YqfxIMQRXJJZRCbBYRpoalEHWMTalIHZ3t2dJ9J6KxXt7FS4YNmnt
 XBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTtCqGcFjzZbuh6vMFCG0KnvT7OIWYmijX3kRnpAThE=;
 b=N/ALjSLRPXU+lfskxV7NpWPZ6cTBZOcx7uQG4zRZwWthgcCZ3cwNdnFjqsGNU0bT06
 +kSQkYXVvKwj4fSEx56ku+wUdgR6tRpWEiI8NROkKr57VAuygRW+HWe19a/TeEZbAt/y
 D7pfSvILPfg4r9jB4y2BYI5REG1dbdMvBzTPprK3BwQKOInKMi/LkmBTf7ic3owfyNyJ
 bogMMc0HLcFIjItfgED0RCQh2vhKW924pU2HNNyCT2JPLFlhR2LMyiCkouvFFmmV2ypg
 os6NZl0t6pZWWzVR/HtJp+tZg1vYJO2x1LEFMwqoKjLtaf7MH3fn3JjQHBkyOusaIcMN
 ZCvw==
X-Gm-Message-State: APjAAAWKwhePeXY6Nmpzn5OGDrvk07vLlyqBpbMkfhLfuQNYsQQahwla
 T/laH2P62bPFeGe0zAxrK0dSrBmxVJ4=
X-Google-Smtp-Source: APXvYqwz0empvu1ACll9aB86sdUAysKxl2C/SwojwkV0UU/y7K0MZs4MZGXxLaGDUwPQqloFovcOOQ==
X-Received: by 2002:a63:9d41:: with SMTP id i62mr16754292pgd.310.1573823499488; 
 Fri, 15 Nov 2019 05:11:39 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id w138sm12007249pfc.68.2019.11.15.05.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 05:11:38 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] qemu_log_lock/unlock now preserves the qemu_logfile
 handle.
Date: Fri, 15 Nov 2019 08:10:38 -0500
Message-Id: <20191115131040.2834-5-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115131040.2834-1-robert.foley@linaro.org>
References: <20191115131040.2834-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: peter.puhov@linaro.org, alex.bennee@linaro.org, robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_log_lock() now returns a handle and qemu_log_unlock() receives a
handle to unlock.  This allows for changing the handle during logging
and ensures the lock() and unlock() are for the same file.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
v1
    - Moved this up in the patch sequence to be
      before adding RCU for qemu_logfile.
---
 include/qemu/log.h            |  9 ++++++---
 accel/tcg/cpu-exec.c          |  4 ++--
 accel/tcg/translate-all.c     |  4 ++--
 accel/tcg/translator.c        |  4 ++--
 exec.c                        |  4 ++--
 hw/net/can/can_sja1000.c      |  4 ++--
 net/can/can_socketcan.c       |  5 ++---
 target/cris/translate.c       |  4 ++--
 target/i386/translate.c       |  5 +++--
 target/lm32/translate.c       |  4 ++--
 target/microblaze/translate.c |  4 ++--
 target/nios2/translate.c      |  4 ++--
 target/tilegx/translate.c     |  7 ++++---
 target/unicore32/translate.c  |  4 ++--
 tcg/tcg.c                     | 16 ++++++++--------
 15 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index a91105b2ad..a7c5b01571 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -53,14 +53,17 @@ static inline bool qemu_log_separate(void)
  * qemu_loglevel is never set when qemu_logfile is unset.
  */
 
-static inline void qemu_log_lock(void)
+static inline FILE *qemu_log_lock(void)
 {
     qemu_flockfile(qemu_logfile);
+    return logfile->fd;
 }
 
-static inline void qemu_log_unlock(void)
+static inline void qemu_log_unlock(FILE *fd)
 {
-    qemu_funlockfile(qemu_logfile);
+    if (fd) {
+        qemu_funlockfile(fd);
+    }
 }
 
 /* Logging functions: */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c01f59c743..62068d10c3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -156,7 +156,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 #if defined(DEBUG_DISAS)
     if (qemu_loglevel_mask(CPU_LOG_TB_CPU)
         && qemu_log_in_addr_range(itb->pc)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         int flags = 0;
         if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
             flags |= CPU_DUMP_FPU;
@@ -165,7 +165,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
         flags |= CPU_DUMP_CCOP;
 #endif
         log_cpu_state(cpu, flags);
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif /* DEBUG_DISAS */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9f48da9472..bb325a2bc4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1804,7 +1804,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(tb->pc)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("OUT: [size=%d]\n", gen_code_size);
         if (tcg_ctx->data_gen_ptr) {
             size_t code_size = tcg_ctx->data_gen_ptr - tb->tc.ptr;
@@ -1829,7 +1829,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         }
         qemu_log("\n");
         qemu_log_flush();
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index f977682be7..603d17ff83 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -138,11 +138,11 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("----------------\n");
         ops->disas_log(db, cpu);
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 }
diff --git a/exec.c b/exec.c
index ffdb518535..c994a00f10 100644
--- a/exec.c
+++ b/exec.c
@@ -1223,13 +1223,13 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     fprintf(stderr, "\n");
     cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
     if (qemu_log_separate()) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("qemu: fatal: ");
         qemu_log_vprintf(fmt, ap2);
         qemu_log("\n");
         log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
         qemu_log_flush();
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
         qemu_log_close();
     }
     va_end(ap2);
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 1f81341554..39c78faf9b 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -247,8 +247,8 @@ int can_sja_accept_filter(CanSJA1000State *s,
 static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
 {
     int i;
+    FILE *logfile = qemu_log_lock();
 
-    qemu_log_lock();
     qemu_log("%s%03X [%01d] %s %s",
              prefix,
              msg->can_id & QEMU_CAN_EFF_MASK,
@@ -261,7 +261,7 @@ static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
     }
     qemu_log("\n");
     qemu_log_flush();
-    qemu_log_unlock();
+    qemu_log_unlock(logfile);
 }
 
 static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index 8a6ffad40c..29bfacd4f8 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -76,8 +76,7 @@ QEMU_BUILD_BUG_ON(offsetof(qemu_can_frame, data)
 static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
 {
     int i;
-
-    qemu_log_lock();
+    FILE *logfile = qemu_log_lock();
     qemu_log("[cansocketcan]: %03X [%01d] %s %s",
              msg->can_id & QEMU_CAN_EFF_MASK,
              msg->can_dlc,
@@ -89,7 +88,7 @@ static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
     }
     qemu_log("\n");
     qemu_log_flush();
-    qemu_log_unlock();
+    qemu_log_unlock(logfile);
 }
 
 static void can_host_socketcan_read(void *opaque)
diff --git a/target/cris/translate.c b/target/cris/translate.c
index e752bd0609..cb57516a44 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3273,11 +3273,11 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 #if !DISAS_CRIS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(pc_start)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("--------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start);
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 #endif
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 77e932d827..7c99ef1385 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2502,14 +2502,15 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
     gen_illegal_opcode(s);
 
     if (qemu_loglevel_mask(LOG_UNIMP)) {
+        FILE *logfile = qemu_log_lock();
         target_ulong pc = s->pc_start, end = s->pc;
-        qemu_log_lock();
+
         qemu_log("ILLOPC: " TARGET_FMT_lx ":", pc);
         for (; pc < end; ++pc) {
             qemu_log(" %02x", cpu_ldub_code(env, pc));
         }
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 }
 
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 778cae1e81..73db9654d6 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -1137,10 +1137,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(pc_start)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("\n");
         log_target_disas(cs, pc_start, dc->pc - pc_start);
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 }
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 761f535357..cc1ad15656 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1766,10 +1766,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 #if !SIM_COMPAT
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(pc_start)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("--------------\n");
         log_target_disas(cs, pc_start, dc->pc - pc_start);
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 #endif
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e17656e66f..82107bf270 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -892,11 +892,11 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(tb->pc)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("IN: %s\n", lookup_symbol(tb->pc));
         log_target_disas(cs, tb->pc, dc->pc - tb->pc);
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 }
diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
index 68dd4aa2d8..fd406f4f71 100644
--- a/target/tilegx/translate.c
+++ b/target/tilegx/translate.c
@@ -2377,6 +2377,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     uint64_t pc_start = tb->pc;
     uint64_t page_start = pc_start & TARGET_PAGE_MASK;
     int num_insns = 0;
+    FILE *logfile = NULL;
 
     dc->pc = pc_start;
     dc->mmuidx = 0;
@@ -2388,7 +2389,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     dc->zero = NULL;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
-        qemu_log_lock();
+        logfile = qemu_log_lock();
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
     }
     gen_tb_start(tb);
@@ -2418,9 +2419,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     tb->size = dc->pc - pc_start;
     tb->icount = num_insns;
 
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (logfile) {
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 }
 
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 0e01f35856..0f6891b8aa 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1994,12 +1994,12 @@ done_generating:
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(pc_start)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start);
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
     tb->size = dc->pc - pc_start;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5475d49ed1..0511266d85 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1085,7 +1085,7 @@ void tcg_prologue_init(TCGContext *s)
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
         if (s->data_gen_ptr) {
             size_t code_size = s->data_gen_ptr - buf0;
@@ -1110,7 +1110,7 @@ void tcg_prologue_init(TCGContext *s)
         }
         qemu_log("\n");
         qemu_log_flush();
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 
@@ -4041,11 +4041,11 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
                  && qemu_log_in_addr_range(tb->pc))) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("OP:\n");
         tcg_dump_ops(s, false);
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 
@@ -4086,11 +4086,11 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
                      && qemu_log_in_addr_range(tb->pc))) {
-            qemu_log_lock();
+            FILE *logfile = qemu_log_lock();
             qemu_log("OP before indirect lowering:\n");
             tcg_dump_ops(s, false);
             qemu_log("\n");
-            qemu_log_unlock();
+            qemu_log_unlock(logfile);
         }
 #endif
         /* Replace indirect temps with direct temps.  */
@@ -4107,11 +4107,11 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
                  && qemu_log_in_addr_range(tb->pc))) {
-        qemu_log_lock();
+        FILE *logfile = qemu_log_lock();
         qemu_log("OP after optimization and liveness analysis:\n");
         tcg_dump_ops(s, true);
         qemu_log("\n");
-        qemu_log_unlock();
+        qemu_log_unlock(logfile);
     }
 #endif
 
-- 
2.17.1


