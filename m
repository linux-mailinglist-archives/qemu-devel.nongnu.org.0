Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DA2D916E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:38:56 +0100 (CET)
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobt9-00051s-Ip
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmx-00055V-GW
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:31 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmw-0003IJ-5R
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:31 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so14718836wrr.10
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=XYwhtSKJtPmtCaJfCNH8nHyFvP0oAIEByXIQXQLkWS0QfByXJlKmlGEjnksg4YOyWK
 cfbdyhBuJewgAQwZf0dszuPnPrSdhE2h9kfYqqrc91MR0Lya+hjYLWFXJ0XsuDxbuTTa
 yKNloWFqUQ/QOUZBYDL+kbz0/CobGKs3sUKXe2tRkCbDPvGM2ZQjoxTVx9yWEGNBIg5I
 Rp7Au9b4O9MD1fYaPXIVPiT4uk4ZBIxxHmGtQdphxEsmlU6jVNyQRh6fvGDoQCo2LXy5
 pIEn1uZZNgNItVenqq6AkjaIV0Wc/vEunpTDLkUwACneVMgM4/eDlx86huXBubsHsB6P
 TT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=hZ9ErI9IWF1bcQtaaZYB2MZ4TjZqSue68R0S6/NTxrqPKRzLI70UdsSOpdidt1IOo0
 yvvciAnJg891hzpJ/Wjw9mckiB6wlsyh8BZ6PATJGtzoqTRfAfQSyiTvrtlfWaCJUrUx
 +YL1bK8tUXQNznb5y5byepUM1GsNUJ8WK1bQgYrEODOFQPfO5eMZsvvx1vKLEL8zfkUj
 py4BXfMEh8yhz6avk4gSTiR7sersAXB+ekzjqekXgjJQPLV1BCnlUHLZ3GLKPFw+9VsG
 QpWRxiUIXsHPb87owp7vg0Yimj1IrvtUJIvgre4asO18JCfTXWmSWcui+/DiynFiXc4L
 Jx5A==
X-Gm-Message-State: AOAM530TvwlTrNvHlX1C3sTSgLckcphvdaZ4D6/O/nMtwme8ES0Kbtrc
 bqkeNVS3rU40DNbZ0gt3AvgIaRVFNpc=
X-Google-Smtp-Source: ABdhPJyVVaTZvbU9CJA794iUkcS7oQTrcBT+3jGfgCgzE5JsqdbbtEKmyUbDIzyjLQOjWZN0l4H9GA==
X-Received: by 2002:adf:bb89:: with SMTP id q9mr27067056wrg.250.1607905947700; 
 Sun, 13 Dec 2020 16:32:27 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s205sm29084228wmf.46.2020.12.13.16.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Mon, 14 Dec 2020 01:32:11 +0100
Message-Id: <20201214003215.344522-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
References: <20201214003215.344522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to add macros similar to GET_FEATURE().
As this one use the 'insn_flags' field, rename it
GET_FEATURE_INSN().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index aae28fd929d..0e1d7e7677c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,7 +989,7 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
-#define GET_FEATURE(_flag, _hwcap) \
+#define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
@@ -997,13 +997,13 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
-#undef GET_FEATURE
+#undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
 
-- 
2.26.2


