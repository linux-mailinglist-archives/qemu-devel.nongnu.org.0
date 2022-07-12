Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B654857283C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:05:19 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN4I-0003Oo-Sz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMti-00062a-Nc
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtY-0007Bx-4U
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id h17so12875487wrx.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yYFdIlyDjp/T5kAByU4Pq0kNQi/e1CAH5ddJew33Nw=;
 b=WkrruTIBUSUTcXBuFGcgqs8X8liSjDmTLlEGj6S5irRvp5sCnu3qHJ4DrUKsMoPrfC
 p0LNrex4s7G5A12Aw7L/lsLZ2vxKdhIiCgF4xzdDn72KqTpAKRgPRQSwjUsZqAtrhRoa
 JqlvAtF9jrXiSLWdCOgrVXHCjNDI80jM+jpjVEfBikaOMyUeho/K3F9D3k8eemkvfGmZ
 r9hwIBspAFwH5iEJk3idN3BA0mLVSH8XuXW4wDALHYCLnu4EW/AD9sdL4wUKiRtae9nM
 8tvYFb/UF2Ysyq0/8xwIhJAPWKYHc0emt7WFf7XdoyN3LBkfh0SWcQ3gOs7x1VWIgdoi
 zmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9yYFdIlyDjp/T5kAByU4Pq0kNQi/e1CAH5ddJew33Nw=;
 b=onR8spUVHjqASQEuQbLssCaxHetRcQHof0L00K0Ngq1ZDKZcWSTI5EHwvUrEpfBnzG
 +2I2dlcLBD8xg1eFyg9vc72PjZp3paF1EhAMT4214i17wGT/FI4SXUqTHfEXGklS+hFG
 6jEt9TZM6VPSEbTyQUTC9IXWhL1iIJcuDaN9Xz2wDq2jzsanku26LDs7qzyKgen//taX
 MVNjVVncI2/nyO4APxI5hr9ArL0WzZBLKuFNv3uTFe3v4EGTFMrfA8C8pBSQ3R9aZL0A
 T+Jt5SxyNln7AXCR/L+Ju+3NRT+Zndj8k/TbxeXm7VQpzM1axKurvAekk+IGMFhwgvTT
 3MHQ==
X-Gm-Message-State: AJIora84S7fl4I4LuzJCZRXDUhUYP+i/vg2CtaI5w/Lq2RqU6tQjQSLx
 +hpwqCDmKdgyfG5y/1pDxuElcR8+lK+aPGbM
X-Google-Smtp-Source: AGRyM1uUqg0RPHttI4zXGNMqQCVwgyW1gJcUO5VtbTSBjMUOGIvTxt4rqbswU6L32G/gcjAIysDNmQ==
X-Received: by 2002:a5d:4310:0:b0:21a:26a5:69b with SMTP id
 h16-20020a5d4310000000b0021a26a5069bmr23224312wrq.269.1657659251164; 
 Tue, 12 Jul 2022 13:54:11 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a2e87549f6sm46121wmm.21.2022.07.12.13.54.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:10 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 04/12] target/mips: introduce Cavium Octeon CPU model
Date: Tue, 12 Jul 2022 22:53:39 +0200
Message-Id: <20220712205347.58372-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds Cavium Octeon 68XX vCPU which provides
Octeon-specific instructions.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <165572673785.167724.7604881144978983510.stgit@pasha-ThinkPad-X280>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 582f940070..7f53c94ec8 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -921,6 +921,34 @@ const mips_def_t mips_defs[] =
         .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSP_R2,
         .mmu_type = MMU_TYPE_R4000,
     },
+    {
+        /*
+         * Octeon 68xx with MIPS64 Cavium Octeon features.
+         */
+        .name = "Octeon68XX",
+        .CP0_PRid = 0x000D9100,
+        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
+                       (MMU_TYPE_R4000 << CP0C0_MT),
+        .CP0_Config1 = MIPS_CONFIG1 | (0x3F << CP0C1_MMU) |
+                       (1 << CP0C1_IS) | (4 << CP0C1_IL) | (1 << CP0C1_IA) |
+                       (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
+                       (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
+        .CP0_Config2 = MIPS_CONFIG2,
+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
+        .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
+                       (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
+                       (3U << CP0C4_MMUSizeExt),
+        .CP0_LLAddr_rw_bitmask = 0,
+        .CP0_LLAddr_shift = 4,
+        .CP0_PageGrain = (1 << CP0PG_ELPA),
+        .SYNCI_Step = 32,
+        .CCRes = 2,
+        .CP0_Status_rw_bitmask = 0x12F8FFFF,
+        .SEGBITS = 42,
+        .PABITS = 49,
+        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
+        .mmu_type = MMU_TYPE_R4000,
+    },
 
 #endif
 };
-- 
2.36.1


