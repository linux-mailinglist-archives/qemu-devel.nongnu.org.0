Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF182CAC66
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:31:57 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBNU-0000i0-It
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBK8-0007Fz-N7
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:30 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBK6-0006G1-Pu
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:28 -0500
Received: by mail-wr1-x442.google.com with SMTP id l1so4493820wrb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=UYYotVt9g3dES8zZJVex2L+HmrLthhsBuB6B6D2n/an1yzfqUP55adpiDt5boVtxqD
 UHisyGRFkze4EScQXo9eTrVi/F6Cq8GMKjWp1gLnvTbnebXy2yFbVKAUJtapjBL0q0DK
 sHDIqTETDZUMypdFNLjyZ3B6H9ebtFUX5lyvPy2Gk5X3h/JAEVQllSRjc5egXFKb5JLA
 7NmE2M/L+gzYF5tj+igjKTGnYuhOAmFI0HVWmwKaF6WDRkWOqaW4AFUlRmrks2sRtOBi
 0oeKXg4hytpamNg/Q5XHdspcaQuvuGF8XgC99o/1AVhR4QXslejiUDimloaF6u9jIOGC
 edZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=ZZ8VMqYmjexI9aDTbiG1DR6k5uv1zs04xOU2tg5Bjh1TtoSEXCC5I3c3ozO57hXNRE
 58rk1VkBATPV08sDEFhAHUt6pZNvf957PFUOj621bOXL1ol6wFUn61/9is/NJ85sDLq5
 gct5CeZhwKzRjw060R5+D9OlKuSGXE4aVeeoBg4bvsUvCCPIAqayBKwX78ebS4qylZrt
 GjddhJDvyfp7dGycJV0eH9Vr5/JzojKTTcaU1JWeMxVhpjIMpacBgQ6DIvoaK0a0UJw0
 7OrBKBZftM5yX56oZN3mv/KQsIWfDIm6Uk43UepabNg9yXsQkgYzh0qxVMbCmOkaC1HO
 XLFQ==
X-Gm-Message-State: AOAM530XB5toXaQ0D9y+fRhJI9ZLRKrwYxuTXLDC0oML7JmVo3tD7/Yf
 6J7fCgEpuF+6yalCGPkIxqU=
X-Google-Smtp-Source: ABdhPJyzoDmLZYaXgIMU0as6T4JjfosMba3eKV4pghmJqDARJ9/5xML35hbeiMzKZ15LReu5PU1Xsg==
X-Received: by 2002:adf:8030:: with SMTP id 45mr5841904wrk.407.1606850905518; 
 Tue, 01 Dec 2020 11:28:25 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id i8sm1260856wma.32.2020.12.01.11.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 3/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
Date: Tue,  1 Dec 2020 20:28:04 +0100
Message-Id: <20201201192807.1094919-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_SET() macro which
checks if a CPU register has bits set.

Use the macro to check for MSA (which sets the MSAP bit of
the Config3 register when the ASE implementation is present).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e1d7e7677c..b7c6d30723a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -992,17 +992,21 @@ enum {
 #define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
+    do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
     GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
-- 
2.26.2


