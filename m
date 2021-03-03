Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2932B97F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:38:36 +0100 (CET)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVSF-0001iq-H6
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQb-0008TJ-7V
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:53 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQZ-0002ps-DP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id e10so24360029wro.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnSGMCd2oTmwo2vSuC8sn+Sw5LdMPM7rvDdngVJ3Vpc=;
 b=l7YLMSTXH1L2EhLS/wpOol4cxnwNY+b6qg4d1oL0nwUoHJF4/9gIKUziXUJbxPF8Er
 y2A/FQlt0bP6rYhQ9hYqXOVLbq2VOsaPLCxYD+t9xtBDIPxl9KRMvlIo7vPbfc6FZmqe
 7ANjZ077NrONFmzK8E9YnvzcJyDzYkKL6sa/N1DFqPbAasoHTv2yRF99bW2lpZO4ZxZH
 UAI5w5VCswgqU0ErH6m1CShRyqniM+UpyQoqXZa0jZgNrfNbaUgefKEJjSJc6wOmcyUi
 mSbAdYO8Eqi6hW/XvUfSBiIh43fDyKUn82DmdZLv5SBRwiyXsRTkNiUh5y6IRNXKUS4q
 wGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnSGMCd2oTmwo2vSuC8sn+Sw5LdMPM7rvDdngVJ3Vpc=;
 b=DfzCIs+hKP71aFvOzrsyjugcKz9Nzvrmx4IPnyXQOX4ooxLVsW3f6oMZEyp0Jet4xw
 f0nKol7nKlB2e8g3YGjShDqJzBwHgpJ/gbBKxfR2npbJiopdjF9gPp0dVJgUYFqJo3eA
 62ujS7UC0XkSTEnmYBJyMU/MpWvfBf5RAWLFsqceUZsXRQe6DEDzwRfXon3419t/BFYf
 8zZJbWzDamtrH3AOokeef6i/FWQH2mDiDrLqgMQa9GO8LGNCF1g2y9fsDf7Y09cFirtX
 pzKnhZBOvx8LV8XB6B1xtWAzkEZgh4yXtTYM7kOFIFUN/ZLh0Yf7AHzR6JsTVIQSMS2A
 ABNg==
X-Gm-Message-State: AOAM531C6X9C9e1/KMW5YTx+UKVgJ8ff4PCLPH1iDPGzHlMchiqGdrdE
 kgtkDHA+UO/AJQ3/869cUl5ptQ==
X-Google-Smtp-Source: ABdhPJzjfn8ZGclDW0qOWpMkkVTkGxv3y4tdAyXeYN21guSZuG9roaTtcaNBrL1aLUfecjPPxGX9uw==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr28825898wrn.352.1614793010061; 
 Wed, 03 Mar 2021 09:36:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y9sm30040997wrm.88.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94A5E1FF8F;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] device_tree: add qemu_fdt_setprop_string_array helper
Date: Wed,  3 Mar 2021 17:36:38 +0000
Message-Id: <20210303173642.3805-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A string array in device tree is simply a series of \0 terminated
strings next to each other. As libfdt doesn't support that directly
we need to build it ourselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-4-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-4-alex.bennee@linaro.org>
---
 include/sysemu/device_tree.h | 17 +++++++++++++++++
 softmmu/device_tree.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

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


