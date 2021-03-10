Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D28334322
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:35:49 +0100 (CET)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1oK-0003Zk-Nl
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1NP-0001li-QN
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:00 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1NN-0006Rv-PU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:07:59 -0500
Received: by mail-ej1-x633.google.com with SMTP id c10so39685315ejx.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdRJRL3+3BE/JH14YpiGu383dDrAlP7VpAQihL8OqOE=;
 b=LFK799t9OUVqJTmgr0NxCRH06m+pOQ2WGKcfwcGPqJWlC2USG4niI7oxd7PnmVgMiH
 KelHXgSUDeHu2307CpSvdMV+AUD7ErKezEum4T9mnsafPiBc9umQ+Rxi66LfhDjEG9sd
 QRiaSK36ueE2xbwtZ6mwVQfe88UYZmS5HAAQ0L/z1BsKjwzDnbExkrwxqwpwUC1PoFo4
 yfetP8xIVBumzHcatPC9SZnHoktu+hnUvmkxBI6PAAsXHVh+4vYzG50aVMDfUU0DP3xf
 d92w1RGXro75SrAzqkRa27DMKEQ9U0LlU/9/8URSWTlbk3Y84KzdlpnAuXabYU7KMTDD
 r1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdRJRL3+3BE/JH14YpiGu383dDrAlP7VpAQihL8OqOE=;
 b=NQtsvq8pg3UkI4y6togsbFSNveeDIPEIklXgNdkXEikWITWZQ/SMPT3PaGaHFdr7NX
 H1u+PDGRfqE9aiCLUJZYz0uvzroVXUmRVWWalqRNp0z7xAH97PLFkNh303jaga+iDYww
 cJifQ95sZixek/+guhYm+skfPTdQeKrcgLCoC2Hb9gz3+CZP10FS9/3EzgCq5J2TEfQg
 HJzW+xIN2woFxjuxXWxWfhkpHNjjO8mioAZ4znjsK1P3vQtqNAU2VDWhld2F6ZV4N/2f
 vgMlcYnllvZKWE2S+wDqq6vR7lr5eS6otO7g1f8IGmR2Jn3IQlJe3m5rS5DnLUpjTdGE
 Lwpg==
X-Gm-Message-State: AOAM531LGl06GjikSzic/POS5IU0+EAF6Ygemq1dTL1RLLPdaQwGV2I8
 zxQR4AfySI+Mmk55Pau8ss8E7g==
X-Google-Smtp-Source: ABdhPJz7g+5ULJ/0KsDTaVZVnzHb6WhyTh97a3Lua8M387fMYPqMzJYHTqRsq6lZRza9M5yXHKwXug==
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr4474861ejc.343.1615392476168; 
 Wed, 10 Mar 2021 08:07:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q1sm10101442ejt.65.2021.03.10.08.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:07:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C9D11FF98;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 09/15] device_tree: add qemu_fdt_setprop_string_array helper
Date: Wed, 10 Mar 2021 15:59:56 +0000
Message-Id: <20210310160002.11659-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A string array in device tree is simply a series of \0 terminated
strings next to each other. As libfdt doesn't support that directly
we need to build it ourselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210303173642.3805-4-alex.bennee@linaro.org>

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 982c89345f..8a2fe55622 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -70,6 +70,23 @@ int qemu_fdt_setprop_u64(void *fdt, const char *node_path,
                          const char *property, uint64_t val);
 int qemu_fdt_setprop_string(void *fdt, const char *node_path,
                             const char *property, const char *string);
+
+/**
+ * qemu_fdt_setprop_string_array: set a string array property
+ *
+ * @fdt: pointer to the dt blob
+ * @name: node name
+ * @prop: property array
+ * @array: pointer to an array of string pointers
+ * @len: length of array
+ *
+ * assigns a string array to a property. This function converts and
+ * array of strings to a sequential string with \0 separators before
+ * setting the property.
+ */
+int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
+                                  const char *prop, char **array, int len);
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b9a3ddc518..2691c58cf6 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/bswap.h"
+#include "qemu/cutils.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
@@ -397,6 +398,31 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
     return r;
 }
 
+/*
+ * libfdt doesn't allow us to add string arrays directly but they are
+ * test a series of null terminated strings with a length. We build
+ * the string up here so we can calculate the final length.
+ */
+int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
+                                  const char *prop, char **array, int len)
+{
+    int ret, i, total_len = 0;
+    char *str, *p;
+    for (i = 0; i < len; i++) {
+        total_len += strlen(array[i]) + 1;
+    }
+    p = str = g_malloc0(total_len);
+    for (i = 0; i < len; i++) {
+        int len = strlen(array[i]) + 1;
+        pstrcpy(p, len, array[i]);
+        p += len;
+    }
+
+    ret = qemu_fdt_setprop(fdt, node_path, prop, str, total_len);
+    g_free(str);
+    return ret;
+}
+
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
                              const char *property, int *lenp, Error **errp)
 {
-- 
2.20.1


