Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854503155F6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:33:23 +0100 (CET)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XpC-000889-Ed
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjw-0002kR-Ma
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:56 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xju-0007lS-JW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so23274571wrz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TPpkuVowT3XsKdUIr+oG7/FvD0rzuMPKtWzVkORBqZU=;
 b=iALTTT+AvLXMnAdpbzE1niXlnHVH7Se0qef9oAy4hwM1Y125fB1x+7HzTmJs/Uo+ZU
 1c6tKu3gw5y9s/M1E8R2kaxEd2IGBXMWEsd8XCrqjDcn3/cIjhCCSlab0kt/b3kdv2rE
 q4Uugo5v403szdPslyO/oWo64H8tFAr5SlkuGpNouf5dsrVFKqYP6L+rF+tMIFLhAsYl
 n103RCPvGHLkySjfV1Xs9aBQUkRNoMshwTWGEy0yjf5rOsVWTfKZdxEnQ3tzB3W2e03g
 x5w9VM6r0geLknxOzeowafSqij6MciMwNSO3bX0kd89eOF8Ab2yWvd2rdHAkv/n6/Q5p
 b7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPpkuVowT3XsKdUIr+oG7/FvD0rzuMPKtWzVkORBqZU=;
 b=WFp4+R3NP0L/xpyvkXGTyYgn8FpBi5goE+WWxhk+lUcHbHADJfad77oE5YRBi6Gf9b
 KDRsMmZjEAtnnQTq4g39eQRyzMZcHMmA8X1RLF66WBzzPsSB9iycqMuhOGGZVd0FAyJz
 /VeMgoG1lnYeMPRXxoGS4m2Mn6/tSDjR0DWUW1/HqKVY8J9VEML86cCzxhceqKliF3iy
 E7OB5kq/u6S6j3EQMhY6whh4G236IODJicfUaCwPZujqViv1QUX3Zo6UXGaLcdvV4vxx
 PqbJNJNOu6EIvuMNPZZ3SVemyHAXCqQ+YO8uFLfG4RgZNZp4t1yAtHuqiT2hyV8OUK4m
 D3aA==
X-Gm-Message-State: AOAM530nYEIHifU2HGfNBQnDXZw++pwVKOCBQ1vJE2cUL+KvMhSXXP1b
 mIPaYi6P/GmkMinfoYWlDDVxZQ==
X-Google-Smtp-Source: ABdhPJyKQjP4iYfGhdMmmaaa/NLv1sZLgRQ87hKWScONmeKXp8+zO4N/Vz5JKdvdLnARDARbypfXjw==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr18133736wrv.182.1612895272952; 
 Tue, 09 Feb 2021 10:27:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm4976510wmq.39.2021.02.09.10.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 979EC1FF87;
 Tue,  9 Feb 2021 18:27:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/12] exec: Move TranslationBlock typedef to
 qemu/typedefs.h
Date: Tue,  9 Feb 2021 18:27:37 +0000
Message-Id: <20210209182749.31323-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Walle <michael@walle.cc>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This also means we don't need an extra declaration of
the structure in hw/core/cpu.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/tb-context.h     | 1 -
 include/hw/core/cpu.h         | 4 +---
 include/hw/core/tcg-cpu-ops.h | 3 +--
 include/qemu/typedefs.h       | 1 +
 target/arm/internals.h        | 3 +--
 target/cris/translate.c       | 2 +-
 target/lm32/translate.c       | 2 +-
 target/moxie/translate.c      | 2 +-
 target/unicore32/translate.c  | 2 +-
 9 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/exec/tb-context.h b/include/exec/tb-context.h
index ec4c13b455..cc33979113 100644
--- a/include/exec/tb-context.h
+++ b/include/exec/tb-context.h
@@ -26,7 +26,6 @@
 #define CODE_GEN_HTABLE_BITS     15
 #define CODE_GEN_HTABLE_SIZE     (1 << CODE_GEN_HTABLE_BITS)
 
-typedef struct TranslationBlock TranslationBlock;
 typedef struct TBContext TBContext;
 
 struct TBContext {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 38d813c389..c005d3dc2d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -74,8 +74,6 @@ typedef enum MMUAccessType {
 
 typedef struct CPUWatchpoint CPUWatchpoint;
 
-struct TranslationBlock;
-
 /* see tcg-cpu-ops.h */
 struct TCGCPUOps;
 
@@ -375,7 +373,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    struct TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ccc97d1894..ac3bb051f2 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -30,8 +30,7 @@ struct TCGCPUOps {
      * If more state needs to be restored, the target must implement a
      * function to restore all the state, and register it here.
      */
-    void (*synchronize_from_tb)(CPUState *cpu,
-                                const struct TranslationBlock *tb);
+    void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
     /** @cpu_exec_enter: Callback for cpu_exec preparation */
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index dc39b05c30..ee60eb3de4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -120,6 +120,7 @@ typedef struct ReservedRegion ReservedRegion;
 typedef struct SavedIOTLB SavedIOTLB;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
+typedef struct TranslationBlock TranslationBlock;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 448982dd2f..7d26ce0c9d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,8 +172,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                 const struct TranslationBlock *tb);
+void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index c893f877ab..65c168c0c7 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -132,7 +132,7 @@ typedef struct DisasContext {
 
     int delayed_branch;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 } DisasContext;
 
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 030b232d66..20c70d03f1 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -93,7 +93,7 @@ typedef struct DisasContext {
     unsigned int tb_flags, synced_flags; /* tb dependent flags.  */
     int is_jmp;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 
     uint32_t features;
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index d5fb27dfb8..24a742b25e 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -36,7 +36,7 @@
 
 /* This is the state at translation time.  */
 typedef struct DisasContext {
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     target_ulong pc, saved_pc;
     uint32_t opcode;
     uint32_t fp_status;
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 962f9877a0..370709c9ea 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -34,7 +34,7 @@ typedef struct DisasContext {
     int condjmp;
     /* The label that will be jumped to when the instruction is skipped.  */
     TCGLabel *condlabel;
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 #ifndef CONFIG_USER_ONLY
     int user;
-- 
2.20.1


