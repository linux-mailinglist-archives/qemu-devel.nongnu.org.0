Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C92CAC68
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:34:05 +0100 (CET)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBPX-0003FW-TD
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBK3-0007CM-3f
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:23 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBK1-0006Ek-Ki
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:22 -0500
Received: by mail-wm1-x344.google.com with SMTP id c198so6132425wmd.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=BVfHjpWkLDqM7nCQK+4Xtiz7bsQjMx04EVMZOwdAhCAOjNp+nWAmsFkkw5Q92/JARF
 XXSS7ZRmFxuG/YcL/4hrGmg01pL91iHknZER+L2VUueypzhIdJPK26I3/w0S25DZFGpe
 P7hCBkyB87taCA+K3iV+gRpLxhD4Fk20CzP2IcunjvSHJJ/tGy0ZFjFH1gBrKPw0EwLg
 2GxEVKKdfcqA+cKM1LSg4BiN3+caZJyTqUGQeUoYadsCxBuoF8N651cpMacuZ9hsCxG7
 OvK4Ta9PlR6QgD2XNJDKJ0V6RXGR5365Wdd1XNYLNgU+tjNzkadkmcFVB4MBgPwpOzth
 jBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=XvQ0D3TwLcafbtQ1y3OneyOqJ3HQGnXa2ih/3mIC3WbCHBwqRfZyKNn7LS519Tctwo
 0ZfMffqBvwjDX3g244qSyCR3AFmpjH81lSx4Kf7xw60aTZdjKAYzgtJSre0E5npyW19B
 Ky3YCUrz7XHl8eKPke5d9fpkvOGcvELWDfyUtz3Z+toa8A1QI0KArchD6EWldxtFwh7f
 yD+ocjgMd0DdjpMZl7DCBSVBK0FgGnC6cXj/wE+sl+yyeBltGL4ga4LuJBAG1dW7FFNi
 zCLKNcip/jyR1AFrxJmsGNO5eK8+XszIt1qYhUWzDCZOPdf3b2RET1Q5EpA2bSNapo5Q
 Gd2Q==
X-Gm-Message-State: AOAM530WJpjyedw7xnV2vrsW3OJ6jad865oK7nzNGLmSXuzpNUyyLpgf
 4kYnvNoTiBzchj++4FJZViNtCRNAVog=
X-Google-Smtp-Source: ABdhPJx0VX9OVGWI+nH6tMZvaHLTczYXdwgza1FfNb8+2J4PRqrwXaqcyYvJZtiD+qyHF8ETCHgOHw==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr4227966wmb.79.1606850900269; 
 Tue, 01 Dec 2020 11:28:20 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r13sm888398wrm.25.2020.12.01.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 2/6] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Tue,  1 Dec 2020 20:28:03 +0100
Message-Id: <20201201192807.1094919-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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


