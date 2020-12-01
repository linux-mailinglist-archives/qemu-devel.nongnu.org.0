Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E992CA401
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:41:26 +0100 (CET)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5uH-0003bX-P2
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oo-0007A5-En
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:50 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5on-0000Kh-3c
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id k14so2680358wrn.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peB8qd/25ySBYkHI6JBy5L3HjqEnlPmoKCMB+bI8b8Q=;
 b=aUYBwZ/9nbPxFTgpnPufV0gTclYu69igcmAnWd9JH8yT/smsjC080xj7Wbeb28KmDQ
 nsSYXF7Az2SpMGBk59eY6APj5Ri6OauLY0LLt5aZPB5ovIgYZof0BYzHSemFvvjxTXrJ
 /EzQnAahZMq/p5AMkwyf/XgNnlR/d50bn8+OfH9zpGs+lYRxk0tGZjwTIJ607jjzaTM0
 77OV3BQoqo3bSTKBECmBiXGdQDX7VoJKnG8BdIB70SypugygLMiyYaEHkfmYvXFajFFo
 MiIu5ae8F3SWqYFeuY4vlr8umOkGd4O0xPT/BRRKmQU48fll3k0c73oojAHZNYQZofDP
 7NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=peB8qd/25ySBYkHI6JBy5L3HjqEnlPmoKCMB+bI8b8Q=;
 b=XXGXz9HlVAUk1tnTPiFZpnl5BQYn6Kbbmb/lLvOynevkHMm/FfVy3Mdcp40AsWkSJQ
 kIoIV/9mOTqj8HOvyNWKW2K6Wj/V4tih+Se5D3vDifG8MUfkLmIu6mO9FEyYxrfh06RG
 bIjUzgL05UrPlgGzG+caSADtCCTZ2r5hXbgmZ7Edu4Xgqf0PSL73ezQGpyN2dPBid3Q8
 Ts4yCchi+MGLsuphJ+4eRp88/XCzSwNisgxffz2vCXiZ90I8by9leEjyDaBSTtarPiCf
 cR9mWpaEW9eEoJ0VM0mqhp3lHQDIh0iMGozQF80R0jeQQUh9E0m79M5VF+EUWxJ+9WK8
 R91w==
X-Gm-Message-State: AOAM530r9enEyYX2tcNmPm2cpPoEbwXW0ufr3rYo3Vo68OMmX5wnfhSp
 lra7FaYczxfD2/6zqwTdlB4=
X-Google-Smtp-Source: ABdhPJxT2gtQs9fTM2+vzeROEvd32eLNitrzENRK4EQ6oK/+OlKEd1n3h0m4/BIj2fEmAkQql3gY2g==
X-Received: by 2002:adf:dec1:: with SMTP id i1mr3881219wrn.129.1606829742998; 
 Tue, 01 Dec 2020 05:35:42 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e3sm3211557wro.90.2020.12.01.05.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
Date: Tue,  1 Dec 2020 14:35:22 +0100
Message-Id: <20201201133525.2866838-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_SET() macro which
checks if a CPU register has bits set.

Use the macro to check for MSA (which sets the MSAP bit of
the Config3 register when the ASE implementation is present).

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


