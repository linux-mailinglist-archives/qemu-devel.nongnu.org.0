Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0722F7C7C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:25:27 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0P6U-00089p-Nd
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqZ-0006LL-U8
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:09:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqW-0006cI-5F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id v184so3339317wma.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdUcvH/D3i7eMpyjSu9D9spoJoxmIAl4kuXpl0wBNfY=;
 b=VPWGkmg2YK+cJ50FQezrUKzECGeNO71bRKNcnFyrEQn/uURgTqBCfSr5GJQAGy9uKA
 TUYODv+feWflpZqfCYXkQf7rbuQLSac4W4zLX/qwUAfLNV0rRh6KBkbSGNfg5DySe3RI
 ePv4h1C25t5ITOdVYcW9XbivoXr9wSXRVdPAukICsATWoRQsdJ8KxBUrbrhnfU9EEXAo
 mYVmsoqPvtiMSgYKeNZAHNphYm8XYZBMs67s2mY8AXJGA9hgyaqnlzK7fmuDpUEmPuGR
 MYgFeObcrDlSR2aXwBNHYjzW1jI+jjnoajqx6Ut8FFl9iL39cZprfmcb/U/RVkynvJmE
 Y7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdUcvH/D3i7eMpyjSu9D9spoJoxmIAl4kuXpl0wBNfY=;
 b=JPxoK1myJdBv/NxcRSX5y3BUwHE101eQDGGp8NPrjcSYVwo13DIK6ZSIC/D6KQOEbU
 pZdTTZlVKMArEKsUkADdMjeI857VmXXJ+0+BzA/6k5Bs4TsfvV9yy0jq7b0ufC1qeQvn
 cr+IiuLEOnrF4RsRuQQYo/ooTOOrJMvIykriAgBEnOkia+lr5O2sWxUQhL7L6FkVc7Tz
 Ci42X6O3Xzrmbm2gP7PSqhcfSzc7TGpduTRJh3zDyAPb5FA+phE2YBBiRBWVtpKxnt5U
 6CJGi5nqHcDVHxbjSlW+D51g+l5h9rU7M4FFfK3rMajFwtLrcHEt+rI+F4PQfbr1mt7x
 L+fg==
X-Gm-Message-State: AOAM531fSVDw1xWgZ2vFNrBQx/gFHCEARymg3mKSq0FIDWVE8GT7jjLp
 UZSFq3l15zOHfQ46M2qLcF4weQ==
X-Google-Smtp-Source: ABdhPJz4Hd+8yGzgd2WjjBFazDaQK/OSWI9St7RlXXvIqRiypY25ZKIxvwHJ61ZciPZGOebGSDi3uw==
X-Received: by 2002:a1c:2c82:: with SMTP id s124mr8456613wms.81.1610716134533; 
 Fri, 15 Jan 2021 05:08:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m14sm14328242wrh.94.2021.01.15.05.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CB3F1FFAF;
 Fri, 15 Jan 2021 13:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/30] semihosting: Support SYS_HEAPINFO when env->boot_info is
 not set
Date: Fri, 15 Jan 2021 13:08:23 +0000
Message-Id: <20210115130828.23968-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
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
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210107170717.2098982-5-keithp@keithp.com>
Message-Id: <20210108224256.2321-16-alex.bennee@linaro.org>

diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index ac1271545e..293791f721 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -137,6 +137,36 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifndef CONFIG_USER_ONLY
+#include "exec/address-spaces.h"
+/*
+ * Find the base of a RAM region containing the specified address
+ */
+static inline hwaddr
+common_semi_find_region_base(hwaddr addr)
+{
+    MemoryRegion *subregion;
+
+    /*
+     * Find the chunk of R/W memory containing the address.  This is
+     * used for the SYS_HEAPINFO semihosting call, which should
+     * probably be using information from the loaded application.
+     */
+    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
+                   subregions_link) {
+        if (subregion->ram && !subregion->readonly) {
+            Int128 top128 = int128_add(int128_make64(subregion->addr),
+                                       subregion->size);
+            Int128 addr128 = int128_make64(addr);
+            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
+                return subregion->addr;
+            }
+        }
+    }
+    return 0;
+}
+#endif
+
 #ifdef TARGET_ARM
 static inline target_ulong
 common_semi_arg(CPUState *cs, int argno)
@@ -175,7 +205,18 @@ common_semi_rambase(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     const struct arm_boot_info *info = env->boot_info;
-    return info->loader_start;
+    target_ulong sp;
+
+    if (info) {
+        return info->loader_start;
+    }
+
+    if (is_a64(env)) {
+        sp = env->xregs[31];
+    } else {
+        sp = env->regs[13];
+    }
+    return common_semi_find_region_base(sp);
 }
 #endif
 
-- 
2.20.1


