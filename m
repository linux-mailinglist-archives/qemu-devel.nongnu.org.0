Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19D31E821
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:53:23 +0100 (CET)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfzu-0003ZI-Co
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu6-0006iN-Mg
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu3-0007DZ-NE
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so2273506wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soDGbh249xLp4FfxaOzhIPdsxS6zjpocVf6odP/GVEE=;
 b=WWANPjG4wXwbpshD2lLgLPNiqdufN4zVXig0iJfAjUQYh11XW+Kp/QmfIHBscCWbqV
 qX1zSKd2kGQ9nmC4yCJBFOf1z1c6s+iIiwUowWc304QZ6OUBrjb0YD68AXZ3zFOCXyqq
 4jhrJCUhIOlIjhKY7s7TUYpOvNzbrzqaZKfoRpCiTMhTnqeOA0pqvIZjSwuX9IKfuRTf
 OZiSHOlmC7+I25rPzbOa2EOvx/WSymXOLwxHELUkyiOAtgI7vokWRks3CCCSmxLdxeGz
 QhYaXe0gQSme+Fljmlgs+FfouaU6aPasSLOI3d8ftXGaM1TZ8BmoQCpmbtomSCTkmnet
 5s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soDGbh249xLp4FfxaOzhIPdsxS6zjpocVf6odP/GVEE=;
 b=S762vG3v9lci27PLtYF3X/sumYU+8XGA0ZCDI+wxVdmN2nF19aAs/NR5tuS6g/3wPW
 0Xy004NMJ4Zpa9utV7QqhBdaFnyYom664sfmlXgW4ity5DGMDgATow15GODLuVSNmzBt
 X1ubq9zNW9krRB+gdNGSUK/9Auau85coQFEGYnFujVCmX9sJ24iAhZiFOXVLelgtiuXQ
 I2SuxmFCvobckJ5eUYV+fpwA4rl6Sr1daT1N72m8KozgKJYFW6NW6bIBvLzPg6DEOxrK
 YxoH6uIpPn3UVsGtt6pcLJCu7gVnaAA6NEjqOfAeGGgBjZxYqnQF11EVED17emuDqyay
 egMw==
X-Gm-Message-State: AOAM530Owe+MP1yjEKV/Io1PXSilfAFhSQurFF4K8gWZWqqm/kGHwIff
 Ypdh79XS8zt2xm+e0svxMf5rkQ==
X-Google-Smtp-Source: ABdhPJyO9tYpGCGSV4TcCQBBvNJDzgW8tXQIguSGxtfukL9zH4xzT3NIbDh4pTbUbg32QcKQygGqog==
X-Received: by 2002:a1c:6806:: with SMTP id d6mr2842123wmc.119.1613641638382; 
 Thu, 18 Feb 2021 01:47:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d29sm1417503wra.51.2021.02.18.01.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 910BA1FF93;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/23] contrib: space required after that ','
Date: Thu, 18 Feb 2021 09:46:50 +0000
Message-Id: <20210218094706.23038-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
 qemu-devel@nongnu.org, zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: space required after that ','

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-5-zhouyang789@huawei.com>
Message-Id: <20210213130325.14781-8-alex.bennee@linaro.org>

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


