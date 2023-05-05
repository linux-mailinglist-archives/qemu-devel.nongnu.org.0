Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFAC6F7A72
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujx0-0002vN-Cc; Thu, 04 May 2023 21:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvp-0001i3-Px
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:31 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvn-0008Aa-SV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:21 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6439f186366so104921b3a.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248892; x=1685840892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DX46uaUVEZ4Q/jGQoG6en7oJG1cfP+lGPydwFve/Hp0=;
 b=e7LrWxG7Hup42TrP2AN4QCloJ3T4uET+MQwXzTZbgyIx2TE17FGpydKURTx3UatxAd
 FePk02qkm8seSz/S1PtTtwoulZDCz9Ui3enINl0o9RiIC2vseIlMUmR5xAnxQ2G6thF4
 WyIMi2N7NDAhBM1VgPXs8LM1n3ovdeZTjMFRoFwrbLqh10fV6O5Ip3imvwo1LLWfLBhY
 KtAcoi9VBlctXmxYhaofUZGc/OKSx4HpjM7mqoZUVAuvyy4RP9VFbsckUdCFArRUqmrD
 SFleZmTf6aSSV4ii+7mpkZtjDF0yjMLobnHUnpeq5jXKA9EIWgyFcQOtdb3J+jlJozEh
 vAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248892; x=1685840892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DX46uaUVEZ4Q/jGQoG6en7oJG1cfP+lGPydwFve/Hp0=;
 b=bqvKuARpqa/mZoOOUEWysYTQOEd0EOm1H/e8dBN1d1xYr8C1TYVP/feXmC9hMJfYQ0
 a8SnsxIsBYyT4e7wHYSW6G+Zo0FPV8AiGgIEaaXLI47gpoPL5n1eXSy+WZGyFSj/ZTp3
 CECnU+itsUR+NpqBT9Z3yvjA1wOjvWvBA9HKMad3zq6u7I3pvOxQujlBkUl81iOELZhd
 vmsOORPuIzikywIqAC3QHaGji1yrriYDsR7BAvAnkcyRVbpGwv3hAwJ7Br5ZLbC4Vg/k
 SlRyc+A4molzon7fAAhI40mRDvDjxuhaYrS5oF82oiO9xiLtrV33qoNrZvcKrKVJIH9z
 XE9Q==
X-Gm-Message-State: AC+VfDyUcX5/u1mTcjPdMuD04faM92RcOCCAIuEgCGgo83iZFoiO1+Fo
 OfEiTMAkatBggsy257WXeQb1hNw+3p1/nA==
X-Google-Smtp-Source: ACHHUZ6dK6L17vRm4DJa2cmgM5y7tE9ZdU6M8BJUwnuUu7xB5nqFTHF/AHZhQk2tbgEwNzIZfQX3Jw==
X-Received: by 2002:a17:902:ecc8:b0:1a6:4127:857 with SMTP id
 a8-20020a170902ecc800b001a641270857mr6259510plh.5.1683248892223; 
 Thu, 04 May 2023 18:08:12 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:11 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 85/89] target/riscv: add TYPE_RISCV_DYNAMIC_CPU
Date: Fri,  5 May 2023 11:02:37 +1000
Message-Id: <20230505010241.21812-86-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

This new abstract type will be used to differentiate between static and
non-static CPUs in query-cpu-definitions.

All generic CPUs were changed to be of this type. Named CPUs are kept as
TYPE_RISCV_CPU and will still be considered static.

This is the output of query-cpu-definitions after this change for the
riscv64 target:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
{"QMP": {"version": (...)}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}
{"execute": "query-cpu-definitions"}
{"return": [
{"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
{"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": true, "deprecated": false},
{"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
{"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
{"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": true, "deprecated": false},
{"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": true, "deprecated": false},
{"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true, "deprecated": false}
]}

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230411183511.189632-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h        |  2 +-
 target/riscv/cpu.c            | 20 ++++++++++++++++----
 target/riscv/riscv-qmp-cmds.c |  4 ++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b9318e0783..b29090ad86 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_CPU "riscv-cpu"
+#define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
@@ -66,5 +67,4 @@ struct RISCVCPUClass {
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 };
-
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32c04214a1..befa64528f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1788,6 +1788,13 @@ void riscv_cpu_list(void)
         .instance_init = initfn            \
     }
 
+#define DEFINE_DYNAMIC_CPU(type_name, initfn) \
+    {                                         \
+        .name = type_name,                    \
+        .parent = TYPE_RISCV_DYNAMIC_CPU,     \
+        .instance_init = initfn               \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1799,23 +1806,28 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+    {
+        .name = TYPE_RISCV_DYNAMIC_CPU,
+        .parent = TYPE_RISCV_CPU,
+        .abstract = true,
+    },
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 128677add9..5ecff1afb3 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -33,11 +33,15 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info = g_malloc0(sizeof(*info));
     const char *typename = object_class_get_name(oc);
+    ObjectClass *dyn_class;
 
     info->name = g_strndup(typename,
                            strlen(typename) - strlen("-" TYPE_RISCV_CPU));
     info->q_typename = g_strdup(typename);
 
+    dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
+    info->q_static = dyn_class == NULL;
+
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
 
-- 
2.40.0


