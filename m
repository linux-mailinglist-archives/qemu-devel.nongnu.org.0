Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448BE31911B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:33:55 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFqk-0000nE-AA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdM-0005iO-Ee
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:20:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdD-0005EL-Oh
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:20:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id u14so4971714wri.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R65y4SBWGHf83/lkymoxqOczXrRrz5R3bZoR1vTdS4s=;
 b=OWTGajGfVbw4fCsYO3v4vddVcuO7px3NM68LIa9yRkSVmsHeVY4bkrU9/2QcbjxzJr
 VcK8a+LqFCjujYpwgMBmZYx1nr0R3zWlAsyxk05immU69nf3odOcHC3zXl3UdT3W+pP+
 UvQiV3poOL7pKqxPyPZyCxm8U4tk8Shx8YSzr9ucxH1Il4gUjM4wNoFRh+uhcRttyUrH
 KYkAno7BPJq8sJkeI9axdoZma5w//RmTNNJlT9hfV+mSo31QZ+S0HPcOcMR/yF778Z0n
 3MGGS0jVgAu8xrE8GDiW64N2zhNUG+m8K6Tq2X8kzTCQ7/sPfvWnPSTLauQy3nrs5Mnu
 eJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R65y4SBWGHf83/lkymoxqOczXrRrz5R3bZoR1vTdS4s=;
 b=eblPr2M5DaX5enbuwCuYjAWyt5vs1hykZJrDg+JdAnA6LO8K9beUs9KDNc8s7pt401
 mxUNS2+AfL7ugoSNLQIbPGevseADvCoepnyf078rrySrcCh9RdMdduPC4eqFf+deBDLS
 cjdp89NjBjFg39eIvpudOm5nNZ+qOyiGGYAEMlXOKjInlJ0oKILE4X4jAqCf+JTwnTKH
 vjw6unQyxntL+q6v5yZwr+iFhGcIwNkLvNZACovrHhWqalP33D49E6nS0xU4bsQtayLf
 I+LljCNzO9x+wTzq6H8gMC4MrIJTp/9T/vBz8AsT3wROYUVJHMkqnI7OsjjBlgdZQoJx
 EGrQ==
X-Gm-Message-State: AOAM530cNEEEZhjp5AxiS6dRUbdap3CcyUPs3strpGAK8eIedgJ+dr65
 4e6b3Cu226zgv6D+aNH35PCXmA==
X-Google-Smtp-Source: ABdhPJywKrSlQGvz6xL9wq/N3CEq2PsAYq2P+QL9BXzIbFPCJoxtsMQMD8v6tA1/gOUYVLDiz937UA==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr629694wrq.4.1613063994310;
 Thu, 11 Feb 2021 09:19:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm5930649wrm.93.2021.02.11.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1B7C1FF8F;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] device_tree: add qemu_fdt_setprop_string_array helper
Date: Thu, 11 Feb 2021 17:19:41 +0000
Message-Id: <20210211171945.18313-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

---
v2
  - checkpatch long line fix
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


