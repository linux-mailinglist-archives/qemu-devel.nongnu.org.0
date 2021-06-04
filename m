Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B2839BDB3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:54:46 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD5p-0004eC-K0
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCIP-0000gO-Lx
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHw-0005w9-Uw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id h3so5688469wmq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmT2fJZ1uVMYQwf4DRBAass7AtI+GiCA7uzNGZJ41H4=;
 b=aJ3Haq27l0iwFoE1JmwazN5DPDWmaUuaHsv+xhvf3wHRhwjr+9bVy/TbWVhgNdkPuw
 8apDTzuGa3tBoVdM2hDMreL7RW5q2f6Yw6J/HvMzpWmNdEPzcZ4yVpiwff/ER8QHuzqf
 bmJtN2xUChF2RQFHMIt0/qhIu4/DPmH4Ewti5qT4SMFvE1m90Rpm87ZW3I6c4YeUS9YA
 juZ41HPWv2cRaWScnDy/1PbbQyViWPbRKFkr6uuJ0ffeAkLMZml02WQSENFgDDrAHv7x
 RYrbufQMbINQ/eZ1DTem8dsRAcMLfmgJIo/0RKlXnQnUYpzAVocc0CrmCOwQ+mQJW1cl
 0SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmT2fJZ1uVMYQwf4DRBAass7AtI+GiCA7uzNGZJ41H4=;
 b=cHVDYFPWRKFwd/Zl7QJO8EOg6LxcgwKEyMACL2EyIgReHSkP4y5C1BfdMH59OGkJzs
 JgFVaD9VQlkG8BnjynIADPhA7GlCGiOjYhfJPymEubwCTqLJhLvjUKopJrHc7hcVsvCR
 rI3CTpPFQOKqjqNylXfkvfaQbvLVxnSvmFew+1yIrTeWXz/FJ1x+9raRGr60lGzogYtM
 Sbg1PvBZSDVF3FjM4Q9A9Ohhy8cBn6JvEJE+5oGmzs+90f75xHpO5I/miWLaslArlvGb
 cuviN9YbDhh9msV655iqE4ZD/pGaoLsdzKlE+NYs13BiZft+2VYYBriFnj8z2CXsAnDz
 GTJQ==
X-Gm-Message-State: AOAM531T3HVegAKC1eKjfN6BXOsyaFoFUvl2IYSm96a5dPfKp92vHNFT
 VPJusBHSkKyafyjlXepIRH2vCA==
X-Google-Smtp-Source: ABdhPJzETa4MczoRGs7mYQ0dXnKrOtMxvES9MyWi4u+wA7dj9vd6Y/oCpSpW9KkSVn3FTXPKVneP8w==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr4220413wmh.63.1622822583730;
 Fri, 04 Jun 2021 09:03:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d5sm6880344wrb.16.2021.06.04.09.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C398B1FFBE;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 39/99] target/arm: move arm_cpu_list to common_cpu
Date: Fri,  4 Jun 2021 16:52:12 +0100
Message-Id: <20210604155312.15902-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 42 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 41 ----------------------------------------
 2 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 93aea216cc..f4a3780e9e 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/qemu-print.h"
 #include "qom/object.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -353,3 +354,44 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     }
     return env->cp15.sctlr_el[el];
 }
+
+/* Sort alphabetically by type name, except for "any". */
+static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
+{
+    ObjectClass *class_a = (ObjectClass *)a;
+    ObjectClass *class_b = (ObjectClass *)b;
+    const char *name_a, *name_b;
+
+    name_a = object_class_get_name(class_a);
+    name_b = object_class_get_name(class_b);
+    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
+        return 1;
+    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
+        return -1;
+    } else {
+        return strcmp(name_a, name_b);
+    }
+}
+
+static void arm_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    const char *typename;
+    char *name;
+
+    typename = object_class_get_name(oc);
+    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    qemu_printf("  %s\n", name);
+    g_free(name);
+}
+
+void arm_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    list = g_slist_sort(list, arm_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, arm_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index b9ea043f20..0e3f403e56 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -552,47 +552,6 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void arm_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void arm_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    list = g_slist_sort(list, arm_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, arm_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /* Sign/zero extend */
 uint32_t HELPER(sxtb16)(uint32_t x)
 {
-- 
2.20.1


