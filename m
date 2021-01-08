Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D22EFB7D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:58:01 +0100 (CET)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0hk-0004Qi-SY
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cf-0007Et-U2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cc-0008Ms-UT
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id d26so10377804wrb.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsSv1UGfrn6J078VHJLG9y3rVAHQSQMbrGcG3mLPQZw=;
 b=L5JXEzLzxTnWMqPZyNbYAKT/SAPlDtX/OdShp/OZLVrdQ8+xLcZofhWqyjDA+ad7DC
 GH0oLYUtlwFenRF5/cMdv3HGIyebHCXY5XQchNzMf39V8gHN3HOX+DvqG9Udk+8sZrl0
 h8zuYq3i6imYayWAtQZnnF7mY3YtoV6W5GqGX9xtki1TtRCYXF63gGnG08txBFXeG+9t
 XUiZIhhbA42QJU6m4rfvEJ0V362LHjzr+rur/o6BKTRhR4CZJuW6bsK8XvTRvXliOTzA
 A8S2MZzqTQSb8cCZJUYqLy5b8Xr1cfRkgG+sRO3le80u3sLLwIY/zCVQkB63FbgNQQ1p
 SczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsSv1UGfrn6J078VHJLG9y3rVAHQSQMbrGcG3mLPQZw=;
 b=mvr+mvkwsDcGGDgVStzoEdjbZ3X9f65lXLNNmXJlPmR/y1dlRYkydtX/Lzm4kGIyPf
 IArI1ay0NpPUIYkrGDzDz6MyTNRkhBRYxylitAgtqX6cqDYY5w17z6MH+ui1ufJshJUM
 VfHRb7YKh/HyH113FZkIZrLKCjkMhUua4kINo+pEm1+KrHfij5c2nErwn3+IIbUyKXgv
 OyjyRrm2YMMCwOwNOu67dLXZvlGcKCr5yfRBUpfHDtjCMNXC/SHJ/S8XPAvwe+G/n3Xq
 8zZIt6QE8CpXy2YIYU4/ukDZiedn9ukoPfno7o24NeJk7F7cTmCy957o0+5YtKzmPr7F
 qWeA==
X-Gm-Message-State: AOAM533V0gxUBEGG0MZzet001w5UwJS8y8F+nMyCNgBCGOK8hg9qS5bL
 8uFok6KKn717SxyTJndvxcXPPg==
X-Google-Smtp-Source: ABdhPJz8/HxEI20KqQ0yBadn3+cNZamp4kjkor2chVno/NPZ/UG9swVP/vpcF9trfAPJGG6NS8mSpw==
X-Received: by 2002:adf:b359:: with SMTP id k25mr5778435wrd.98.1610146361694; 
 Fri, 08 Jan 2021 14:52:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w189sm13559085wmg.31.2021.01.08.14.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:52:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 773F11FF9E;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/20] semihosting: Support SYS_HEAPINFO when
 env->boot_info is not set
Date: Fri,  8 Jan 2021 22:42:51 +0000
Message-Id: <20210108224256.2321-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210107170717.2098982-5-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/common-semi.c | 43 +++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index ac1271545e..293791f721 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
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


