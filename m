Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D26D55D2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:22:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVMq-0001pN-4R; Mon, 03 Apr 2023 21:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVMf-0001oQ-C3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:37 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVLd-0004nI-Uu
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:37 -0400
Received: by mail-qt1-x831.google.com with SMTP id a5so30201495qto.6
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680571220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nH44gKhnd6jTrJixhq/2x3ykzYR2+mFbRafyoLa4n/w=;
 b=PnFtgAlCIg6VLY9Y9UBlznn1SbUyT+Z1UDDZe1ppXYJyYH0RPEL7e5mYei14bfi+Fe
 fXBPwARiW3nCAlzsDBHqd5NeU/yukpikk5/sj50pGIHRtcyCBwMuftWtVYnIYaq4452o
 /QuzC9DWjg4qXBXM4MJ4KgudYu8BnsPaRxpjkg7MWmB+QWYVfY4UTJpx9vqnN6K0wxtm
 9b4Nl55oQfI+pQQ8rsIrkdd4eycudqwe3S5oOwKEi8Oi/0o62U1pceVR8OWA4hzLX/s4
 uH1mJJh/WZnrTv8n/SZOua37RPm7pSHko7mmNsBK1fQJ11w3nE+XDUuWnKXKH7ofB27V
 0aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nH44gKhnd6jTrJixhq/2x3ykzYR2+mFbRafyoLa4n/w=;
 b=MvPD3ANn7mjReOxAjJZ9gF/JYDbzjL20UWz4R2Lr/+BrZeTXTEe92X4euI3jWrw6AA
 davqqo/gX+6ZbY5ceCB1LHVipd8yBTn+HvtJQAMRM5e4b14Z0zDUmAtMZ/YeCKbaPpKO
 +OblccxwlELixyUZM8iw1m0J197RnPP3QYyL0KqRi9zX9HeC2HvhH8DPwHuzHrfbZCKf
 pUQasnn96Nh/rLg+5rCZGJq8Rvy22VQ6loAheg2EQi1Ny05t0rBRIg62yrsH6IfSr60l
 b5TctUAU9GH1kJm8/oUox4i8AFX1CvhvDKmcWXCfl2uSrPFvAysqdPC3gRTRGQyuCafA
 kODA==
X-Gm-Message-State: AAQBX9dAcuAKiLRTyelY+MqU6rA6aL/08yjPxUFJF4s9hteoGWdWLBr6
 Gak8L+30i+gWJJpH7BISu390b7GIm9NIlA==
X-Google-Smtp-Source: AKy350bH5VtlBW5HJs2aJnLOa/kL+AmOtBmuNkD0WEAg3g6QSOA4UT4vsAlkECvgovyepS9Wl/J/nQ==
X-Received: by 2002:ac8:5cd1:0:b0:3bf:cea5:7004 with SMTP id
 s17-20020ac85cd1000000b003bfcea57004mr864800qta.51.1680571219877; 
 Mon, 03 Apr 2023 18:20:19 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::3e69])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05620a248400b0074865a9cb34sm3229909qkn.28.2023.04.03.18.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:20:19 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 3/3] cpu, qdict, vl: Enable printing options for CPU type
Date: Mon,  3 Apr 2023 21:19:56 -0400
Message-Id: <20230404011956.90375-4-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404011956.90375-1-dinahbaum123@gmail.com>
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x831.google.com
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

Change parsing of -cpu argument to allow -cpu cpu,help
to print options for the CPU type similar to
how the '-device' option works.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1480

Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
---
 cpu.c                     | 41 +++++++++++++++++++++++++++++++++++++++
 include/exec/cpu-common.h |  2 ++
 include/qapi/qmp/qdict.h  |  2 ++
 qemu-options.hx           |  7 ++++---
 qobject/qdict.c           |  5 +++++
 softmmu/vl.c              | 36 ++++++++++++++++++++++++++++++++--
 6 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/cpu.c b/cpu.c
index daf4e1ff0d..5f8a72e51f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -23,7 +23,9 @@
 #include "exec/target_page.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -43,6 +45,8 @@
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 #include "qemu/plugin.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qobject.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -312,6 +316,43 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     return get_cpu_model_expansion_info(type, model, errp);
 }
 
+void list_cpu_model_expansion(CpuModelExpansionType type,
+                              CpuModelInfo *model,
+                              Error **errp)
+{
+    CpuModelExpansionInfo *expansion_info;
+    QDict *qdict;
+    QDictEntry *qdict_entry;
+    const char *key;
+    QObject *obj;
+    QType q_type;
+    GPtrArray *array;
+    int i;
+    const char *type_name;
+
+    expansion_info = get_cpu_model_expansion_info(type, model, errp);
+    if (expansion_info) {
+        qdict = qobject_to(QDict, expansion_info->model->props);
+        if (qdict) {
+            qemu_printf("%s features:\n", model->name);
+            array = g_ptr_array_new();
+            for (qdict_entry = (QDictEntry *)qdict_first(qdict); qdict_entry;
+                 qdict_entry = (QDictEntry *)qdict_next(qdict, qdict_entry)) {
+                g_ptr_array_add(array, qdict_entry);
+            }
+            g_ptr_array_sort(array, (GCompareFunc)dict_key_compare);
+            for (i = 0; i < array->len; i++) {
+                qdict_entry = array->pdata[i];
+                key = qdict_entry_key(qdict_entry);
+                obj = qdict_get(qdict, key);
+                q_type = qobject_type(obj);
+                type_name = QType_str(q_type);
+                qemu_printf("  %s=<%s>\n", key, type_name);
+            }
+        }
+    }
+}
+
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(target_ulong addr)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index ec6024dfde..8fc05307ad 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -174,5 +174,7 @@ typedef void (*cpu_model_expansion_func)(CpuModelExpansionType type,
 CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
                                                     CpuModelInfo *model,
                                                     Error **errp);
+void list_cpu_model_expansion(CpuModelExpansionType type,
+                              CpuModelInfo *model, Error **errp);
 
 #endif /* CPU_COMMON_H */
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index 82e90fc072..1ff9523a13 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -68,4 +68,6 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
+int dict_key_compare(QDictEntry **entry1, QDictEntry **entry2);
+
 #endif /* QDICT_H */
diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..10601626b7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -169,11 +169,12 @@ SRST
 ERST
 
 DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,
-    "-cpu cpu        select CPU ('-cpu help' for list)\n", QEMU_ARCH_ALL)
+    "-cpu cpu        select CPU ('-cpu help' for list)\n"
+    "                use '-cpu cpu,help' to print possible properties\n", QEMU_ARCH_ALL)
 SRST
 ``-cpu model``
-    Select CPU model (``-cpu help`` for list and additional feature
-    selection)
+    Select CPU model (``-cpu help`` and ``-cpu cpu,help``) for list and additional feature
+    selection
 ERST
 
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 8faff230d3..31407e62f6 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -447,3 +447,8 @@ void qdict_unref(QDict *q)
 {
     qobject_unref(q);
 }
+
+int dict_key_compare(QDictEntry **entry1, QDictEntry **entry2)
+{
+    return g_strcmp0(qdict_entry_key(*entry1), qdict_entry_key(*entry2));
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea20b23e4c..af6753a7e3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -500,6 +500,15 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
+static QemuOptsList qemu_cpu_opts = {
+    .name = "cpu",
+    .implied_opt_name = "cpu",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
+    .desc = {
+        { /* end of list */ }
+    },
+};
+
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
@@ -1147,6 +1156,26 @@ static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    CpuModelInfo *model;
+
+    if (cpu_option && is_help_option(cpu_option)) {
+        list_cpus(cpu_option);
+        return 1;
+    }
+
+    if (!cpu_option || !qemu_opt_has_help_opt(opts)) {
+        return 0;
+    }
+
+    model = g_new0(CpuModelInfo, 1);
+    model->name = (char *)qemu_opt_get(opts, "cpu");
+    /* TODO: handle other expansion cases */
+    list_cpu_model_expansion(CPU_MODEL_EXPANSION_TYPE_FULL, model, errp);
+    return 1;
+}
+
 static int chardev_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     Error *local_err = NULL;
@@ -2431,8 +2460,9 @@ static void qemu_process_help_options(void)
      * type and the user did not specify one, so that the user doesn't need
      * to say '-cpu help -machine something'.
      */
-    if (cpu_option && is_help_option(cpu_option)) {
-        list_cpus(cpu_option);
+    Error *errp = NULL;
+    if (qemu_opts_foreach(qemu_find_opts("cpu"),
+                          cpu_help_func, NULL, &errp)) {
         exit(0);
     }
 
@@ -2673,6 +2703,7 @@ void qemu_init(int argc, char **argv)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_cpu_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -2724,6 +2755,7 @@ void qemu_init(int argc, char **argv)
             switch(popt->index) {
             case QEMU_OPTION_cpu:
                 /* hw initialization will check this */
+                qemu_opts_parse_noisily(qemu_find_opts("cpu"), optarg, true);
                 cpu_option = optarg;
                 break;
             case QEMU_OPTION_hda:
-- 
2.30.2


