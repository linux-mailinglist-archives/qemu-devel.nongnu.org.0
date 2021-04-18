Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B519E3636E2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:57:19 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAjV-0001SO-56
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMZ-0003yj-Su
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMX-0004v3-Gj
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id u20so12326724wmj.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAo6xlslHbLIPGXUT4caMQoK1xF2uE263T2bu471e0o=;
 b=jB6wtLLBogrQQV/zbS58+f9GpBZ9Ga1w/tpQ4587BNSZwr3vsPG8NkuPU1743GY9UG
 MqOWmV1KGPo+t0QzTTfKjvZlt8QbS4++A8lv4CegRKJ3y7SVbYaq8JygAJh73G4J7Djb
 MyUMP3SjMBIFrzU1wP6WM+WZ7ABrjTC6IQ/GvrYkSG7VnuXTl9tBEAchydoHxvFvmB3g
 aecM2WABiO6OarCPGjIpAwiKGXl3IfmGm5taMbf2uEgslMoKX4rSmcfkskqKFkYxT9cL
 G3ZVCLzojU2QIXXKQ3Zo+E3QbiyhvazjJ9Qp4YqmeyKkjInMc5G9zHer0JNHGb4dfkDI
 ywkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tAo6xlslHbLIPGXUT4caMQoK1xF2uE263T2bu471e0o=;
 b=rHrXpZ4JcJ0VTiTvf6K41x+H4IHQL+coPzl4MFv3tZ8lJMEVrb2V+FPsiq5UWsyTxk
 Zr1wwuoZONb0cWWcg5139MrxKgMx9SpodndgFO/X7RhZKB/E0iAxN2cR2LozI/2oFGKT
 Q+1T4DCJv+2WtHCEY0NjZ0Ii/DHw31tnk7DpQH/ImFNdl6CBhCaF2gp1uUgr9RT9PM5y
 O4lkhk83OOR6mPSZ0wT3Os2CMdbFnaZSviVooGBJSi0SjvoFdQpoUFv8sACJDIoJYTcf
 UhCtQdN2kI2jiO71QgWO6lPo0PSAu8Bk/kDzhQaBHzRbLtNdnbSuT7EDxWQb8Y/avUBZ
 0jpw==
X-Gm-Message-State: AOAM530yTzuPPXNrIlZECjQTUhUXUevGWHVqiG3fo1dGGTaqmJa4Vrgv
 JTm+sCfE0RNJNSdHNhUln3Et767lyQ2vFg==
X-Google-Smtp-Source: ABdhPJzYaX45P0GfYW9jTinPdPfhX2+sikqHp2gmYrhnq54/tesTPWVEpG9Wn3WBvVMena8h1VVLSg==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr12797173wmr.174.1618763611580; 
 Sun, 18 Apr 2021 09:33:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b16sm17510856wmb.39.2021.04.18.09.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] target/mips: Move TCG source files under tcg/ sub
 directory
Date: Sun, 18 Apr 2021 18:31:32 +0200
Message-Id: <20210418163134.1133100-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
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
 24 files changed, 40 insertions(+), 42 deletions(-)
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

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 57eec83384a..0228f37b78c 100644
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
index 70f0d5da436..ae9b35ff706 100644
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
                                   MMUAccessType access_type);
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


