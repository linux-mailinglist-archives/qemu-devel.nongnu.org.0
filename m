Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2346B8F25
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1TE-0000C6-Ev; Tue, 14 Mar 2023 06:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pc1Su-0000A1-RH; Tue, 14 Mar 2023 06:01:08 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pc1Ss-0002Ob-GS; Tue, 14 Mar 2023 06:01:08 -0400
Received: by mail-qt1-x836.google.com with SMTP id d7so16020569qtr.12;
 Tue, 14 Mar 2023 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678788064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/nfq3nRfuNFJzOhx1eUcP2fB7Gic1+OBhEGEUosltA=;
 b=nXmWyg+tui03O2TxpJrOBHpn3O2Q8WsMKD3i4zvd9FxolgyL1A/7QOt3chano0w0W6
 nLvyKE1kUS48IgaLvCnovrFrcFt0oL3IIVb4MpLnUid7Bvfimbfe4hQJx7+MgWwlGzLg
 tweq3eCoifp3cPO0Gdo9sLiw2L6ihP6oD39XwoeDf0bjR+TJadje1uMoP//PrKR2h2kH
 u9/dZCT2ti6acVmJfxbF/lQfMAl7o/agTxm50t/cmWX0dowxYWBx6J8z+r9M2OmCCM8C
 t2rwwqNt66Ba3RkRO+Oqgcemi1fzrF+eVQpPvx1CsnmiFgINJ9CPsM74ifiun3KKXc5Y
 Tagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678788064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/nfq3nRfuNFJzOhx1eUcP2fB7Gic1+OBhEGEUosltA=;
 b=29Zfyxzx0MRcM0v6iWBQfEe2jC3khoMZxYDCkIc3NKUSToCWFuHVe0vfKnz2u7+0Y+
 uw1kjceMkJW0sp+aLounm13PMw9RiLsKm5JHCWEt0XIgGbYnIAsg/vNmVbWTfq1qGPdp
 TiE0ejn88TWkfBaD3nSN+Nf1I2mi14A38udMDeryfi8pgP6H+JvKFR2VlXUzOWyPsc6L
 mzokMp3K6oRtpNDd8QHp6ijxKb46jeCcvoo5HTEeaF8bD+g1JlUvHCwUruJLiXadQYzs
 OnVoG6gTT7h/DIxPAHWG7zA/tha5ghhzdT8kHKPust/KRMY2dlFvTktgU9XLl9uhKwws
 43mw==
X-Gm-Message-State: AO0yUKVu/6Ju+CKyfl9LIXr5VNIMwdATgDxtFYJThLARyvFFrCW1Ss0b
 3WhUyRtdVN0Uywtk53LPFTtgzvKFRUBwGA==
X-Google-Smtp-Source: AK7set+VGoBCNtuaPdiboZbCxO3lhnRD8R+P9jFK3Ev5nPFCn7JEUJMSM6gu3Uejyivh/En9UHiuGA==
X-Received: by 2002:ac8:57cd:0:b0:3b9:b619:42c1 with SMTP id
 w13-20020ac857cd000000b003b9b61942c1mr61965412qta.27.1678788063896; 
 Tue, 14 Mar 2023 03:01:03 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::675])
 by smtp.gmail.com with ESMTPSA id
 j15-20020ac8404f000000b003b323387c1asm1288812qtl.18.2023.03.14.03.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 03:01:03 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v2 2/3] cpu, qapi, target/arm, i386,
 s390x: Generalize query-cpu-model-expansion
Date: Tue, 14 Mar 2023 06:00:25 -0400
Message-Id: <20230314100026.536079-3-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314100026.536079-1-dinahbaum123@gmail.com>
References: <20230314100026.536079-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x836.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch enables 'query-cpu-model-expansion' on all
architectures. Only architectures that implement
the command will return results, others will return an
error message as before.

This patch lays the groundwork for parsing a
-cpu cpu,help option as specified in
https://gitlab.com/qemu-project/qemu/-/issues/1480

Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
---
 cpu.c                            | 20 ++++++++++++
 include/exec/cpu-common.h        |  8 +++++
 qapi/machine-target-common.json  | 51 +++++++++++++++++++++++++++++
 qapi/machine-target.json         | 56 --------------------------------
 target/arm/arm-qmp-cmds.c        |  7 ++--
 target/arm/cpu.h                 |  7 +++-
 target/i386/cpu-sysemu.c         |  7 ++--
 target/i386/cpu.h                |  6 ++++
 target/s390x/cpu.h               |  7 ++++
 target/s390x/cpu_models_sysemu.c |  6 ++--
 10 files changed, 108 insertions(+), 67 deletions(-)

diff --git a/cpu.c b/cpu.c
index 567b23af46..c09edc4556 100644
--- a/cpu.c
+++ b/cpu.c
@@ -291,6 +291,26 @@ void list_cpus(const char *optarg)
 #endif
 }
 
+CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
+                                                    CpuModelInfo *model,
+                                                    Error **errp)
+{
+    /* XXX: implement cpu_model_expansion for targets that still miss it */
+#if defined(cpu_model_expansion)
+    return cpu_model_expansion(type, model, errp);
+#else
+    error_setg(errp, "Could not query cpu model information");
+    return NULL;
+#endif
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                     CpuModelInfo *model,
+                                                     Error **errp)
+{
+    return get_cpu_model_expansion_info(type, model, errp);
+}
+
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(target_ulong addr)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7..ec6024dfde 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,8 @@
 #include "exec/hwaddr.h"
 #endif
 
+#include "qapi/qapi-commands-machine-target-common.h"
+
 /**
  * vaddr:
  * Type wide enough to contain any #target_ulong virtual address.
@@ -166,5 +168,11 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 extern int singlestep;
 
 void list_cpus(const char *optarg);
+typedef void (*cpu_model_expansion_func)(CpuModelExpansionType type,
+                                         CpuModelInfo *model,
+                                         Error **errp);
+CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
+                                                    CpuModelInfo *model,
+                                                    Error **errp);
 
 #endif /* CPU_COMMON_H */
diff --git a/qapi/machine-target-common.json b/qapi/machine-target-common.json
index 1e6da3177d..44713e9935 100644
--- a/qapi/machine-target-common.json
+++ b/qapi/machine-target-common.json
@@ -77,3 +77,54 @@
 ##
 { 'enum': 'CpuModelCompareResult',
   'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+
+##
+# @CpuModelExpansionInfo:
+#
+# The result of a cpu model expansion.
+#
+# @model: the expanded CpuModelInfo.
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelExpansionInfo',
+  'data': { 'model': 'CpuModelInfo' } }
+
+##
+# @query-cpu-model-expansion:
+#
+# Expands a given CPU model (or a combination of CPU model + additional options)
+# to different granularities, allowing tooling to get an understanding what a
+# specific CPU model looks like in QEMU under a certain configuration.
+#
+# This interface can be used to query the "host" CPU model.
+#
+# The data returned by this command may be affected by:
+#
+# * QEMU version: CPU models may look different depending on the QEMU version.
+#   (Except for CPU models reported as "static" in query-cpu-definitions.)
+# * machine-type: CPU model  may look different depending on the machine-type.
+#   (Except for CPU models reported as "static" in query-cpu-definitions.)
+# * machine options (including accelerator): in some architectures, CPU models
+#   may look different depending on machine and accelerator options. (Except for
+#   CPU models reported as "static" in query-cpu-definitions.)
+# * "-cpu" arguments and global properties: arguments to the -cpu option and
+#   global properties may affect expansion of CPU models. Using
+#   query-cpu-model-expansion while using these is not advised.
+#
+# Some architectures may not support all expansion types. s390x supports
+# "full" and "static". Arm only supports "full".
+#
+# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
+#          not supported, if the model cannot be expanded, if the model contains
+#          an unknown CPU definition name, unknown properties or properties
+#          with a wrong type. Also returns an error if an expansion type is
+#          not supported.
+#
+# Since: 2.8
+##
+{ 'command': 'query-cpu-model-expansion',
+  'data': { 'type': 'CpuModelExpansionType',
+  'model': 'CpuModelInfo' },
+  'returns': 'CpuModelExpansionInfo' }
+
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 1cacfde88e..cfc8b0c7f8 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -130,62 +130,6 @@
   'returns': 'CpuModelBaselineInfo',
   'if': 'TARGET_S390X' }
 
-##
-# @CpuModelExpansionInfo:
-#
-# The result of a cpu model expansion.
-#
-# @model: the expanded CpuModelInfo.
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelExpansionInfo',
-  'data': { 'model': 'CpuModelInfo' },
-  'if': { 'any': [ 'TARGET_S390X',
-                   'TARGET_I386',
-                   'TARGET_ARM' ] } }
-
-##
-# @query-cpu-model-expansion:
-#
-# Expands a given CPU model (or a combination of CPU model + additional options)
-# to different granularities, allowing tooling to get an understanding what a
-# specific CPU model looks like in QEMU under a certain configuration.
-#
-# This interface can be used to query the "host" CPU model.
-#
-# The data returned by this command may be affected by:
-#
-# * QEMU version: CPU models may look different depending on the QEMU version.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine-type: CPU model  may look different depending on the machine-type.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine options (including accelerator): in some architectures, CPU models
-#   may look different depending on machine and accelerator options. (Except for
-#   CPU models reported as "static" in query-cpu-definitions.)
-# * "-cpu" arguments and global properties: arguments to the -cpu option and
-#   global properties may affect expansion of CPU models. Using
-#   query-cpu-model-expansion while using these is not advised.
-#
-# Some architectures may not support all expansion types. s390x supports
-# "full" and "static". Arm only supports "full".
-#
-# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
-#          not supported, if the model cannot be expanded, if the model contains
-#          an unknown CPU definition name, unknown properties or properties
-#          with a wrong type. Also returns an error if an expansion type is
-#          not supported.
-#
-# Since: 2.8
-##
-{ 'command': 'query-cpu-model-expansion',
-  'data': { 'type': 'CpuModelExpansionType',
-            'model': 'CpuModelInfo' },
-  'returns': 'CpuModelExpansionInfo',
-  'if': { 'any': [ 'TARGET_S390X',
-                   'TARGET_I386',
-                   'TARGET_ARM' ] } }
-
 ##
 # @CpuDefinitionInfo:
 #
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c8fa524002..e591e7c362 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/error.h"
@@ -99,9 +100,9 @@ static const char *cpu_model_advertised_features[] = {
     NULL
 };
 
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                     CpuModelInfo *model,
-                                                     Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     CpuModelExpansionInfo *expansion_info;
     const QDict *qdict_in = NULL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae988..d5dcc2ef11 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2660,7 +2660,12 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
 
 #define cpu_list arm_cpu_list
-
+#ifdef CONFIG_SOFTMMU
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 /* ARM has the following "translation regimes" (as the ARM ARM calls them):
  *
  * If EL3 is 64-bit:
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 28115edf44..c01c85839c 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -176,10 +176,9 @@ out:
     return xc;
 }
 
-CpuModelExpansionInfo *
-qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     X86CPU *xc = NULL;
     Error *err = NULL;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d243e290d3..7ab633c642 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2209,6 +2209,12 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #endif
 
 #define cpu_list x86_cpu_list
+#ifdef CONFIG_SOFTMMU
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 
 /* MMU modes definitions */
 #define MMU_KSMAP_IDX   0
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..e67a2b386e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -799,6 +799,13 @@ void s390_cpu_list(void);
 void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
                              const S390FeatInit feat_init);
 
+#ifdef CONFIG_SOFTMMU
+/* cpu_models-sysemu.c */
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 
 /* helper.c */
 #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 63981bf36b..ef3845f11c 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -213,9 +213,9 @@ static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *model,
     }
 }
 
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     Error *err = NULL;
     CpuModelExpansionInfo *expansion_info = NULL;
-- 
2.30.2


