Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D28A39BD0F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:25:46 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCdl-000602-O4
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHW-0007aN-NB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHP-0005h7-Rq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id m18so9836576wrv.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBvCfaGTlADJ93Rev0o5Ivgyc3KA6JcHQPgwZFaWAco=;
 b=jFn7/emm2wEAbeqKtehC4ildRuKyLj4XMDN3iPwIHRYhGb3yWor9sGmXqXgRf88OwS
 zSPRkto9317bz6L5sy9Sai2C3ni6sHpcFf7Oz+rXsZSVSm/BqVTPnKMuTau7/1x80rni
 OJg02CCg932HUosPXBlSjnlqNBVejSJDB+WqUVkJkZfwam9FM4QNYMFwHRNngUkTNBma
 Eb2Yxi7cheizAMbEdH2Njd3uKLvNuscNEzw4V5rOrxq/iq+JUSolwn0Gk3wgwVgGX/o7
 3TrQcxKOwuyVSlqHL9ZDvSINSaQq01MH+zE8tgdUJESTx1W1MguNvBSQwty4oi9s7FZg
 4rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBvCfaGTlADJ93Rev0o5Ivgyc3KA6JcHQPgwZFaWAco=;
 b=Xh9inQWHFnV7XY7nGs3p+pOmle2XLJN1yIJbd44jkluuKDsTQgpF8DWsgwG0yXqbWN
 5E0ObnXE+LsI5A9ajfp0hWiKt+zuISVxPwTHCA2P2BJ2/saUYFuw8Z3ygzbGqnTdPsc8
 +pWxh85fJ99HYqdUhC+ll1EZarhaYgEPwMBQC42Zl8QyuEZP9Um3QpOQqcscZ8C6b9D7
 E5fBhbgBTUGq8fdKj1qqbS3Lc2sRndw4DnGIGkgggGyZ1AZ5BWsTAdeDsInUI2+2Rz/D
 9g1makDMXwftJfmILghT+WzpykoB+Vw5BscoLBQiMMbLwL+VZ254Fo5G0NRWPrY4OhfC
 ic7g==
X-Gm-Message-State: AOAM531V4KggVsDlr+mSHHZPso5Fwtrkwh8uo3iWHlj1PMDe9tDoYc80
 NJHjM97lYFPP89pvWLJ3n4KgiQ==
X-Google-Smtp-Source: ABdhPJx8dOrR1MH5XXZ8eTHK2PQtJ2MAQLxmcAlxzHxI6fEulSC1VyymwSB7NKGKbo8T7F/YXD2qsQ==
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr4578743wra.378.1622822558358; 
 Fri, 04 Jun 2021 09:02:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w23sm7610085wmi.0.2021.06.04.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 941A71FFB4;
 Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 29/99] target/arm: move cpu definitions to common cpu
 module
Date: Fri,  4 Jun 2021 16:52:02 +0100
Message-Id: <20210604155312.15902-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 41 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 29 -----------------------------
 target/arm/meson.build  |  1 +
 3 files changed, 42 insertions(+), 29 deletions(-)
 create mode 100644 target/arm/cpu-common.c

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
new file mode 100644
index 0000000000..0f8ca94815
--- /dev/null
+++ b/target/arm/cpu-common.c
@@ -0,0 +1,41 @@
+/*
+ * ARM CPU common definitions
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "qapi/error.h"
+#include "cpu.h"
+
+static void arm_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 09503db37b..f54ece9b42 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -28,7 +28,6 @@
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
@@ -697,34 +696,6 @@ void arm_cpu_list(void)
     g_slist_free(list);
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-
 static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
 {
     /* Return true if it is not valid for us to switch to
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 5fb34c1af1..8d6177c1fb 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,6 +2,7 @@ arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpregs.c',
   'cpu.c',
+  'cpu-common.c',
   'cpu-mmu.c',
   'cpustate-list.c',
   'gdbstub.c',
-- 
2.20.1


