Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAC7317357
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:29:17 +0100 (CET)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xz2-0006Xc-1f
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xho-0006Ld-GG
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhY-0003Hf-B1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so3189896wmi.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0dd8w0ozAtK/o2h3emwaj/X9ik48CwXQg6fa8mR0bQ=;
 b=fVXT+5JODp4OzzUrngoC6e9m5ail8EpuF7IhwsOvvjVTCNz97ZXGKMZ6UIGAAgtplb
 W1GxQISulJiEghz2se1k7M5Rb79Y0x2aOdZsGczRosKOUPLHQC70NLzQqjP6R2yUAA4r
 3lvvVJLT0dsogJpcxNdaJwh/ncJI03vEKP9ZFPD6fGlQEnGoBFyqJkyHJ7uZg5oSeqZV
 WR6hn6X78UUzcCpEoiuML+d+6bNaE6rjSj3ma7QaRrdkzWW70dWFoBLggUiZafYVFgOj
 rBvGnU8j7qmkdGpFiKkGyA4jCzRSq7PVmhQyo0EirQm6Sa87wrigQS2f8lWT0d30bHb3
 +ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0dd8w0ozAtK/o2h3emwaj/X9ik48CwXQg6fa8mR0bQ=;
 b=Po9C7pulPCl6Y/QdUeyBOQWMcAdnQGXdXTJx2acTgfRCAwwJ/NPmEBON+DJ4rgxo2Q
 FBiyX6rGViZ4QLcJxgnT29DeVAsmpsdnBHlKkWQy1zye6G8ZOGY69zeVrxfBUnkeZ23u
 45wGfs+qrsukJuxKWD33nmtS3uNAPZ5ZFDkeEM+Xx++gFR6ta24Ex/KsywT51uzp2Kui
 JrAmYovXM3fF0Lzq0AUU07YMcwOMa6PMbgM5oCiXAb/1G5O1uDJ0pCk3f0z29/EHh7hm
 ff5sZ9CQ43KZ82xTXpPKuXXyYmLGbXsJMH8bMl/mykN3D32uH3CGGIm3Zp82JU5q7l/G
 QKAA==
X-Gm-Message-State: AOAM530zKhyEdNXfNQ5cPH9uYuSZc4LoD/FFKpeoWr8q59qsMbz5JjEK
 R9ksYTfybhk0x1pjh/AE+G7pPA==
X-Google-Smtp-Source: ABdhPJzBDEu+XStdYir4WvzL6HunKTBlFWnXw82ingAK+kChNrgKQGvP8zwiBAngRd+C9/vZPDnkdA==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr1228826wmf.9.1612995070723;
 Wed, 10 Feb 2021 14:11:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm4638314wmh.9.2021.02.10.14.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3478C1FF93;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 07/21] contrib: space required after that ','
Date: Wed, 10 Feb 2021 22:10:39 +0000
Message-Id: <20210210221053.18050-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


