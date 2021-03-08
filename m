Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B433104B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:03:39 +0100 (CET)
Received: from localhost ([::1]:45906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGTy-0004wW-Hg
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO5-0007H6-0w
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO3-0003uw-4m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so3859256wmd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdRJRL3+3BE/JH14YpiGu383dDrAlP7VpAQihL8OqOE=;
 b=jG+Ocu+pvktYB4XAD03JfHf645e595o4p1nYB4PsmZGQpJ9zsozfOikfy7Qeieq4Y+
 Q4xnlskGVQ4g4Ift9Ak7uDfXqbSX9nfmLXoo3d3EDTrGH8j9DZ072zYQbE3RFoyU0ljA
 lricDeaQwrkgeERXq79kZ04+qS9OGmtT9cDbcTDiZw7pob0KNB47vqUhT4YLP+QGoeHu
 j4bi58loqf1POne+kc4MVoIm+xiEwwEeG3o+FCtS3nvs6BC0XPTaInSRhI00fSRlgNc9
 Fvn6He6ipHGSZYAXGHWLlo8tFrpQThyNUGaSUmGUGgcGRyOTm9+ZjGiNoEMALQYjd/Ya
 6MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdRJRL3+3BE/JH14YpiGu383dDrAlP7VpAQihL8OqOE=;
 b=r/XAThMLxJuGK1Pb1Fx+p+1D38fC9ojjAum2wVV/5kYplVvwHsJBLDSNlnNqxWR0vo
 spzeaTRI5Ui3tI4AbsrkYmEVN+DNlvX+KsC6Qyh+fCiH9MEkGdAVtg3HBigJkZ0RGvPY
 3hZu12gkSYy/LEpaZoMJXVySXn4mFb8I2YwBdI8EaKA9BPCJeyDHzgmTVf1ca9oJs9to
 MwMwuBX5jxCZIPVhftLWhMO8DnQ9c5RlLBYyS0ivbtHOgXqhbtQuoBrk23a1j54Q3OgO
 CrzHgcl1Is7W5vWcYtf6eBzfD306C3rfbf+d6GPPXWvGKbr8QdXQPvB4MOdgzYEl5sIE
 Lq7A==
X-Gm-Message-State: AOAM531zgY3IfXRTlfmWaM+mneVcOpxrWOZBWgdFI8Luag2tfeGRw38p
 cLAgmpX1hY3o9vuBjiuqC5CWMg==
X-Google-Smtp-Source: ABdhPJw1NdB4QTQJyDL/FC9b28CAzvSH7zJHJK/OR5K9BU8AexCGoT0eMXBixAKzv5DY+gzaqe93aw==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr21838401wmi.107.1615211849713; 
 Mon, 08 Mar 2021 05:57:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm19444723wmj.1.2021.03.08.05.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:57:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED12A1FF9B;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/18] device_tree: add qemu_fdt_setprop_string_array helper
Date: Mon,  8 Mar 2021 13:50:58 +0000
Message-Id: <20210308135104.24903-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


