Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E631AB84
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:07:23 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAudu-0003hQ-H7
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaV-0001xN-Oi
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaP-00067v-Lz
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so2910568wrx.4
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVrlGRbiwj9CaOf2YfdgmhLGm6Ks9Z9IMl/LqrbHLyE=;
 b=TgsvP/ZBCYU+6STHQF4zdj2AkHGWORm/Z+Ix5oCnqkOSh+CAEChL2OylSEu2Or6tGH
 0CuJ1dbE9Hdvv67YwQzMVnq2C07acpGAmfuGSgNeyBYe9fIQk96/Z93wN8zZHUYLfwBC
 EaEzrGjefxsevksyoxZPJooW4s6wuUn5wZiMWqUQoajfbtKH4newXBrVL/XCnrIjnxHJ
 gfEARXu9OwcDgDtAhI05qehEUIc9J4w4fGEJU2uWAqhNA3xrGhiPoKBCP6e7ya7E0qHs
 9Ob/2phph6/Ozozo7qXSz/0MUN5mJejoCNH3IKo+qU6oDx9KDcP2Hix2hjQPn6KTgw77
 U28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tVrlGRbiwj9CaOf2YfdgmhLGm6Ks9Z9IMl/LqrbHLyE=;
 b=k3qt+9umDjDm6dN3/GgwDsXhU+dckLh+KhP4HA/FVh4XYny8mgSGGTGbiGLqB68m7R
 xsmo8rBLI8phxhqVqfa6NVPQAsdBrrKN/5JgiG2heFovNfXWwTc+endZGGLG16/bTiEY
 ifEe3hN/fAsKhbMkwZzOXlmMYYyJsMeEvIMkjW1mpSEUL4gwBC+//NHVyS07hQi9suAS
 fn3Xm31QoxG4TG3xQeg//lf8+xPkg+9joAafwcbiDdtCbhNLmd9KZpg1OtVbYZMe06Kp
 3FVq4qLj9MQ1ZIXBxkMfcKaZbe7/PD8Xx3lmenRVQS9PJzJuX1Xou7jg5i/4XGtRPwNW
 mmjw==
X-Gm-Message-State: AOAM5318w9L6sk7+H39NBPivhCCSd8tz9xFwDVuD3/GZGjV+guvUAdnf
 d+C1zl5QinoYsBloXYt2JQeKYeHHD70yVVZT
X-Google-Smtp-Source: ABdhPJy0rsDqs7UkXOKrPuK1fHE3mW9dfaHIsgqpM2ksmbUOmsjSrSFZcc2C3Y1P4LVkhkaslmEv6w==
X-Received: by 2002:adf:f083:: with SMTP id n3mr5511353wro.323.1613221418245; 
 Sat, 13 Feb 2021 05:03:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm4054006wrr.62.2021.02.13.05.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A28C1FF93;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 07/23] contrib: space required after that ','
Date: Sat, 13 Feb 2021 13:03:09 +0000
Message-Id: <20210213130325.14781-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: space required after that ','

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-5-zhouyang789@huawei.com>
Message-Id: <20210210221053.18050-8-alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 2f892da17d..9d6fa33297 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -68,7 +68,7 @@ static InsnClassExecCount aarch64_insn_classes[] = {
     { "Reserved",            "res",    0x1e000000, 0x00000000, COUNT_CLASS},
     /* Data Processing Immediate */
     { "  PCrel addr",        "pcrel",  0x1f000000, 0x10000000, COUNT_CLASS},
-    { "  Add/Sub (imm,tags)","asit",   0x1f800000, 0x11800000, COUNT_CLASS},
+    { "  Add/Sub (imm,tags)", "asit",   0x1f800000, 0x11800000, COUNT_CLASS},
     { "  Add/Sub (imm)",     "asi",    0x1f000000, 0x11000000, COUNT_CLASS},
     { "  Logical (imm)",     "logi",   0x1f800000, 0x12000000, COUNT_CLASS},
     { "  Move Wide (imm)",   "movwi",  0x1f800000, 0x12800000, COUNT_CLASS},
@@ -91,17 +91,17 @@ static InsnClassExecCount aarch64_insn_classes[] = {
     { "Branches",            "branch", 0x1c000000, 0x14000000, COUNT_CLASS},
     /* Loads and Stores */
     { "  AdvSimd ldstmult",  "advlsm", 0xbfbf0000, 0x0c000000, COUNT_CLASS},
-    { "  AdvSimd ldstmult++","advlsmp",0xbfb00000, 0x0c800000, COUNT_CLASS},
+    { "  AdvSimd ldstmult++", "advlsmp", 0xbfb00000, 0x0c800000, COUNT_CLASS},
     { "  AdvSimd ldst",      "advlss", 0xbf9f0000, 0x0d000000, COUNT_CLASS},
-    { "  AdvSimd ldst++",    "advlssp",0xbf800000, 0x0d800000, COUNT_CLASS},
+    { "  AdvSimd ldst++",    "advlssp", 0xbf800000, 0x0d800000, COUNT_CLASS},
     { "  ldst excl",         "ldstx",  0x3f000000, 0x08000000, COUNT_CLASS},
     { "    Prefetch",        "prfm",   0xff000000, 0xd8000000, COUNT_CLASS},
     { "  Load Reg (lit)",    "ldlit",  0x1b000000, 0x18000000, COUNT_CLASS},
-    { "  ldst noalloc pair", "ldstnap",0x3b800000, 0x28000000, COUNT_CLASS},
+    { "  ldst noalloc pair", "ldstnap", 0x3b800000, 0x28000000, COUNT_CLASS},
     { "  ldst pair",         "ldstp",  0x38000000, 0x28000000, COUNT_CLASS},
     { "  ldst reg",          "ldstr",  0x3b200000, 0x38000000, COUNT_CLASS},
     { "  Atomic ldst",       "atomic", 0x3b200c00, 0x38200000, COUNT_CLASS},
-    { "  ldst reg (reg off)","ldstro", 0x3b200b00, 0x38200800, COUNT_CLASS},
+    { "  ldst reg (reg off)", "ldstro", 0x3b200b00, 0x38200800, COUNT_CLASS},
     { "  ldst reg (pac)",    "ldstpa", 0x3b200200, 0x38200800, COUNT_CLASS},
     { "  ldst reg (imm)",    "ldsti",  0x3b000000, 0x39000000, COUNT_CLASS},
     { "Loads & Stores",      "ldst",   0x0a000000, 0x08000000, COUNT_CLASS},
@@ -202,7 +202,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     counts = g_hash_table_get_values(insns);
     if (counts && g_list_next(counts)) {
-        g_string_append_printf(report,"Individual Instructions:\n");
+        g_string_append_printf(report, "Individual Instructions:\n");
         counts = g_list_sort(counts, cmp_exec_count);
 
         for (i = 0; i < limit && g_list_next(counts);
-- 
2.20.1


