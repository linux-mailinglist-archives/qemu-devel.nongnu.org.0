Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D706D36DE51
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:30:31 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbo18-0004ih-R1
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneU-0001or-PN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneS-0006vV-M0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h15so11589989wre.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gr9GSZLN2Z3Rv6FaBMCzoy4GAGj9QQFeN+MV0y3f2mo=;
 b=fu5RK9xg6fb6QuIsp/bLoRF+3HXRyryxGk2AVBGu3mHt1Dd/cJvN0LKw8ANZA19iKz
 fC/2sHwk2rhD3TjgtE6A8M1VTqXpUwmagKMJQARLXknVIl/PM7M3Pwddfa5lQ53LKnCm
 6zFibQ41VUGNj6HKefwxP5N9INx/bLt1er2pSgLkPTn7h1Qxh2clXZ/wQDmbYFrD8v/4
 9gxdNaM7nfplkZj4ctLzdPKxybz7NsaKvgsefxL9lZ5hlF6Sd5XSEN7jY2QTpuHW60r2
 Op9D5bKiz3KvLnhkxMRABdYqTYG5Rp6NBCWDCxXfAN6tXT9tezDH+5AeR4NoG6ZgKyuj
 8dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gr9GSZLN2Z3Rv6FaBMCzoy4GAGj9QQFeN+MV0y3f2mo=;
 b=fesHqjNSKeOEnzGq89DxKVAOTLXXIvUkQPk6nuKTmoLMWeP+ENBNBaYS1zzSSzmfuM
 Vh85YmHFspD4Fg5YIi447gxIvtJUwj/C3gBU6BFthar6hZBcI3OxR9IQLtmaRgxD0qwZ
 4VTGuz+vBhoMWzruTOLhky5MzgZclLxiC1bzJJETtTIz/9UaT02RmU29D816pRL+UKX7
 Oel2iNYeF8J7sdeMme5T9HS2JNnAnCkcYUbgUk6LAh4Wg6vqMDqBn7aL8aFFC+03HE+e
 ZfcrvMUHwApYT9UJNltSFluC5u28luPxyew+3a/wCItinZ2CGtBzhC4Wn5BnRkJY8Hoi
 KiMA==
X-Gm-Message-State: AOAM532A0ujhZU/Lhm92NsBZimzfZM1oXKUoDe5+iI3u84+soBZTA2e6
 vzqSlQNsbxHgsTvUZY33ZTzyV18bMkgvNw==
X-Google-Smtp-Source: ABdhPJyQpT9wzq0QssRq77/wd7IQjU3D/yT2w0NxTPCPl9hmlxpEdXGuZmYWMcFzt19SXwoDxVygnA==
X-Received: by 2002:adf:efca:: with SMTP id i10mr37032536wrp.316.1619629622395; 
 Wed, 28 Apr 2021 10:07:02 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f11sm7351858wmc.6.2021.04.28.10.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:07:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/30] target/mips: Move TCG source files under tcg/ sub
 directory
Date: Wed, 28 Apr 2021 19:04:08 +0200
Message-Id: <20210428170410.479308-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease maintenance, move all TCG specific files under the tcg/
sub-directory. Adapt the Meson machinery.

The following prototypes:
- mips_tcg_init()
- mips_cpu_do_unaligned_access()
- mips_cpu_do_transaction_failed()
can now be restricted to the "tcg-internal.h" header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                         |  2 +-
 target/mips/internal.h                       | 11 -------
 target/mips/tcg/tcg-internal.h               | 11 +++++++
 target/mips/{ => tcg}/msa_helper.h.inc       |  0
 target/mips/{ => tcg}/mips32r6.decode        |  0
 target/mips/{ => tcg}/mips64r6.decode        |  0
 target/mips/{ => tcg}/msa32.decode           |  0
 target/mips/{ => tcg}/msa64.decode           |  0
 target/mips/{ => tcg}/tx79.decode            |  0
 target/mips/{ => tcg}/dsp_helper.c           |  0
 target/mips/{ => tcg}/exception.c            |  0
 target/mips/{ => tcg}/fpu_helper.c           |  0
 target/mips/{ => tcg}/ldst_helper.c          |  0
 target/mips/{ => tcg}/lmmi_helper.c          |  0
 target/mips/{ => tcg}/msa_helper.c           |  0
 target/mips/{ => tcg}/msa_translate.c        |  0
 target/mips/{ => tcg}/mxu_translate.c        |  0
 target/mips/{ => tcg}/op_helper.c            |  0
 target/mips/{ => tcg}/rel6_translate.c       |  0
 target/mips/{ => tcg}/translate.c            |  0
 target/mips/{ => tcg}/translate_addr_const.c |  0
 target/mips/{ => tcg}/tx79_translate.c       |  0
 target/mips/{ => tcg}/txx9_translate.c       |  0
 target/mips/meson.build                      | 31 --------------------
 target/mips/tcg/meson.build                  | 29 ++++++++++++++++++
 25 files changed, 41 insertions(+), 43 deletions(-)
 rename target/mips/{ => tcg}/msa_helper.h.inc (100%)
 rename target/mips/{ => tcg}/mips32r6.decode (100%)
 rename target/mips/{ => tcg}/mips64r6.decode (100%)
 rename target/mips/{ => tcg}/msa32.decode (100%)
 rename target/mips/{ => tcg}/msa64.decode (100%)
 rename target/mips/{ => tcg}/tx79.decode (100%)
 rename target/mips/{ => tcg}/dsp_helper.c (100%)
 rename target/mips/{ => tcg}/exception.c (100%)
 rename target/mips/{ => tcg}/fpu_helper.c (100%)
 rename target/mips/{ => tcg}/ldst_helper.c (100%)
 rename target/mips/{ => tcg}/lmmi_helper.c (100%)
 rename target/mips/{ => tcg}/msa_helper.c (100%)
 rename target/mips/{ => tcg}/msa_translate.c (100%)
 rename target/mips/{ => tcg}/mxu_translate.c (100%)
 rename target/mips/{ => tcg}/op_helper.c (100%)
 rename target/mips/{ => tcg}/rel6_translate.c (100%)
 rename target/mips/{ => tcg}/translate.c (100%)
 rename target/mips/{ => tcg}/translate_addr_const.c (100%)
 rename target/mips/{ => tcg}/tx79_translate.c (100%)
 rename target/mips/{ => tcg}/txx9_translate.c (100%)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index ba301ae160d..a9c6c7d1a31 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -608,4 +608,4 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 #include "tcg/sysemu_helper.h.inc"
 #endif /* !CONFIG_USER_ONLY */
 
-#include "msa_helper.h.inc"
+#include "tcg/msa_helper.h.inc"
diff --git a/target/mips/internal.h b/target/mips/internal.h
index dd332b4dcef..18d5da64a57 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -82,9 +82,6 @@ extern const int mips_defs_number;
 
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
-                                  int mmu_idx, uintptr_t retaddr);
 
 #define USEG_LIMIT      ((target_ulong)(int32_t)0x7FFFFFFFUL)
 #define KSEG0_BASE      ((target_ulong)(int32_t)0x80000000UL)
@@ -151,12 +148,6 @@ struct CPUMIPSTLBContext {
     } mmu;
 };
 
-void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                    vaddr addr, unsigned size,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, MemTxAttrs attrs,
-                                    MemTxResult response, uintptr_t retaddr);
-
 void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
 void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
 void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
@@ -209,8 +200,6 @@ static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
     return r;
 }
 
-void mips_tcg_init(void);
-
 void msa_reset(CPUMIPSState *env);
 
 /* cp0_timer.c */
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 75aa3ef98ed..81b14eb219e 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -11,15 +11,21 @@
 #define MIPS_TCG_INTERNAL_H
 
 #include "tcg/tcg.h"
+#include "exec/memattrs.h"
 #include "hw/core/cpu.h"
 #include "cpu.h"
 
+void mips_tcg_init(void);
+
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                  MMUAccessType access_type,
+                                  int mmu_idx, uintptr_t retaddr);
 
 const char *mips_exception_name(int32_t exception);
 
@@ -46,6 +52,11 @@ bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb);
 
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type, uintptr_t retaddr);
+void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                    vaddr addr, unsigned size,
+                                    MMUAccessType access_type,
+                                    int mmu_idx, MemTxAttrs attrs,
+                                    MemTxResult response, uintptr_t retaddr);
 void cpu_mips_tlb_flush(CPUMIPSState *env);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/mips/msa_helper.h.inc b/target/mips/tcg/msa_helper.h.inc
similarity index 100%
rename from target/mips/msa_helper.h.inc
rename to target/mips/tcg/msa_helper.h.inc
diff --git a/target/mips/mips32r6.decode b/target/mips/tcg/mips32r6.decode
similarity index 100%
rename from target/mips/mips32r6.decode
rename to target/mips/tcg/mips32r6.decode
diff --git a/target/mips/mips64r6.decode b/target/mips/tcg/mips64r6.decode
similarity index 100%
rename from target/mips/mips64r6.decode
rename to target/mips/tcg/mips64r6.decode
diff --git a/target/mips/msa32.decode b/target/mips/tcg/msa32.decode
similarity index 100%
rename from target/mips/msa32.decode
rename to target/mips/tcg/msa32.decode
diff --git a/target/mips/msa64.decode b/target/mips/tcg/msa64.decode
similarity index 100%
rename from target/mips/msa64.decode
rename to target/mips/tcg/msa64.decode
diff --git a/target/mips/tx79.decode b/target/mips/tcg/tx79.decode
similarity index 100%
rename from target/mips/tx79.decode
rename to target/mips/tcg/tx79.decode
diff --git a/target/mips/dsp_helper.c b/target/mips/tcg/dsp_helper.c
similarity index 100%
rename from target/mips/dsp_helper.c
rename to target/mips/tcg/dsp_helper.c
diff --git a/target/mips/exception.c b/target/mips/tcg/exception.c
similarity index 100%
rename from target/mips/exception.c
rename to target/mips/tcg/exception.c
diff --git a/target/mips/fpu_helper.c b/target/mips/tcg/fpu_helper.c
similarity index 100%
rename from target/mips/fpu_helper.c
rename to target/mips/tcg/fpu_helper.c
diff --git a/target/mips/ldst_helper.c b/target/mips/tcg/ldst_helper.c
similarity index 100%
rename from target/mips/ldst_helper.c
rename to target/mips/tcg/ldst_helper.c
diff --git a/target/mips/lmmi_helper.c b/target/mips/tcg/lmmi_helper.c
similarity index 100%
rename from target/mips/lmmi_helper.c
rename to target/mips/tcg/lmmi_helper.c
diff --git a/target/mips/msa_helper.c b/target/mips/tcg/msa_helper.c
similarity index 100%
rename from target/mips/msa_helper.c
rename to target/mips/tcg/msa_helper.c
diff --git a/target/mips/msa_translate.c b/target/mips/tcg/msa_translate.c
similarity index 100%
rename from target/mips/msa_translate.c
rename to target/mips/tcg/msa_translate.c
diff --git a/target/mips/mxu_translate.c b/target/mips/tcg/mxu_translate.c
similarity index 100%
rename from target/mips/mxu_translate.c
rename to target/mips/tcg/mxu_translate.c
diff --git a/target/mips/op_helper.c b/target/mips/tcg/op_helper.c
similarity index 100%
rename from target/mips/op_helper.c
rename to target/mips/tcg/op_helper.c
diff --git a/target/mips/rel6_translate.c b/target/mips/tcg/rel6_translate.c
similarity index 100%
rename from target/mips/rel6_translate.c
rename to target/mips/tcg/rel6_translate.c
diff --git a/target/mips/translate.c b/target/mips/tcg/translate.c
similarity index 100%
rename from target/mips/translate.c
rename to target/mips/tcg/translate.c
diff --git a/target/mips/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
similarity index 100%
rename from target/mips/translate_addr_const.c
rename to target/mips/tcg/translate_addr_const.c
diff --git a/target/mips/tx79_translate.c b/target/mips/tcg/tx79_translate.c
similarity index 100%
rename from target/mips/tx79_translate.c
rename to target/mips/tcg/tx79_translate.c
diff --git a/target/mips/txx9_translate.c b/target/mips/tcg/txx9_translate.c
similarity index 100%
rename from target/mips/txx9_translate.c
rename to target/mips/tcg/txx9_translate.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index e08077bfc18..2407a05d4c0 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,11 +1,3 @@
-gen = [
-  decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
-  decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
-  decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
-  decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
-  decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
-]
-
 mips_user_ss = ss.source_set()
 mips_softmmu_ss = ss.source_set()
 mips_ss = ss.source_set()
@@ -20,35 +12,12 @@
   subdir('sysemu')
 endif
 
-mips_tcg_ss = ss.source_set()
-mips_tcg_ss.add(gen)
-mips_tcg_ss.add(files(
-  'dsp_helper.c',
-  'exception.c',
-  'fpu_helper.c',
-  'ldst_helper.c',
-  'lmmi_helper.c',
-  'msa_helper.c',
-  'msa_translate.c',
-  'op_helper.c',
-  'rel6_translate.c',
-  'translate.c',
-  'translate_addr_const.c',
-  'txx9_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
-  'tx79_translate.c',
-), if_false: files(
-  'mxu_translate.c',
-))
 if 'CONFIG_TCG' in config_all
   subdir('tcg')
 endif
 
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
-
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
 target_user_arch += {'mips': mips_user_ss}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 2cffc5a5ac6..5d8acbaf0d3 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,3 +1,32 @@
+gen = [
+  decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
+  decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
+  decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
+  decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
+  decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
+]
+
+mips_ss.add(gen)
+mips_ss.add(files(
+  'dsp_helper.c',
+  'exception.c',
+  'fpu_helper.c',
+  'ldst_helper.c',
+  'lmmi_helper.c',
+  'msa_helper.c',
+  'msa_translate.c',
+  'op_helper.c',
+  'rel6_translate.c',
+  'translate.c',
+  'translate_addr_const.c',
+  'txx9_translate.c',
+))
+mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
+  'tx79_translate.c',
+), if_false: files(
+  'mxu_translate.c',
+))
+
 if have_user
   subdir('user')
 endif
-- 
2.26.3


