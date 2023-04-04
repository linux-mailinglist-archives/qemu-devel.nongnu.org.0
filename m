Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7466D55D5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:22:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVMr-0001pt-Uc; Mon, 03 Apr 2023 21:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVMf-0001oU-Iv; Mon, 03 Apr 2023 21:21:38 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVLd-0004mM-Sg; Mon, 03 Apr 2023 21:21:37 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id t13so22533162qvn.2;
 Mon, 03 Apr 2023 18:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680571218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbNNAu6sioZa4QEMdyfnNXIk/zn+0eeWx+CgkgrwYeg=;
 b=IQDoblr3JwTF9BoPrChQJprwQ7crh64vdKzeqlAwPsfw8LLfEkhBjYdFFXBoAxSpoO
 46eSSYIRxCqHU5Dnlt1NbkbuT7vLnYsgZRiCAIiEqXdU/OSeP8yXdQtthB1fdcP18/0U
 GQtoAggYjM7WXcVK/6mwM0MeoB/VD3IxHq+OPgG7eJmfstArnXs64iroKqTm1SzxpYWh
 UeZO7E3M6N3b/syu0bfKIRp4G7ZE/IsGC6EF2FcNgkbmZzMwQfXBS91WKhxBiv8wdbfY
 6qNK+wB5wl4P6+bVu/11cYdeLr3dp5KcLAxKGozQ2JhCQXWy6oeWSb+EFODo4/qplBPr
 ev1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbNNAu6sioZa4QEMdyfnNXIk/zn+0eeWx+CgkgrwYeg=;
 b=NPGcc29FqAXV9/N0wNRRjPxwI3Z92dyAG9F+8V4Sm6TRCLU/TpE+k18dEq8vReXkoN
 5LCkh4SyFWHZR9JlfuBzxb7V36KVZ1ORw9vGfyWnMtsovmcFPgwbtqxbrgQID2rTHisZ
 rBkJSlMv8wOoUTartWRds82BOAHAXcJldrXkadhPDcuY7+jl1kZlx0FTo68HD/DaRpGN
 f7FCxaGS4Nya8E17kMUcWXXzEOWXDELTIQW/eUvcPGC6c0MZNaRuXPiJDIWYeDsEC/+F
 B2wj6/2+VNpxSMVxqY5VlbfE+9nQP58s8dqNpv1yfCgsKZ+IKN5LYUcycz1IAnKd6dst
 Acmg==
X-Gm-Message-State: AAQBX9demEDr9e50yLVknk43rH3D39A9eZCXuUe5jc6MEjbZgu7c3wp/
 YvVC5rFpdrQBmPPUx+PepAcga9tTlpcxew==
X-Google-Smtp-Source: AKy350YBPp0ptRoYmprwnyRz/rNyDgrN7ClGm3emLEGXBaQ9JuujDkjouKnrW1WCX37enG0kFxubEw==
X-Received: by 2002:a05:6214:d83:b0:5df:3310:c1f9 with SMTP id
 e3-20020a0562140d8300b005df3310c1f9mr996086qve.5.1680571217796; 
 Mon, 03 Apr 2023 18:20:17 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::3e69])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05620a248400b0074865a9cb34sm3229909qkn.28.2023.04.03.18.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:20:17 -0700 (PDT)
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
Date: Mon,  3 Apr 2023 21:19:55 -0400
Message-Id: <20230404011956.90375-3-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404011956.90375-1-dinahbaum123@gmail.com>
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qv1-xf2e.google.com
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
index 849bac062c..daf4e1ff0d 100644
--- a/cpu.c
+++ b/cpu.c
@@ -292,6 +292,26 @@ void list_cpus(const char *optarg)
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
index c47e7adcb1..da5d9b4bf9 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -810,6 +810,13 @@ void s390_cpu_list(void);
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


