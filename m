Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B83636B3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:43:15 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAVu-0003KR-Vc
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALY-0003I1-BK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALX-0004dv-0q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j5so30549429wrn.4
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=px3eEb7r/QydV4xXtYEkw/2gg3rnb7J0yUIfpZsnplo=;
 b=SDrWDHJk0+n7wVibndFg0LiF6Ze20QlBsNYTwNa9bdNBZwHV+VNIHQFP7aCPKpYJ0p
 VpqvBzSqmzj5mZtU8oGDY5nR1qCCfQNocp7Rf5z9StRk9m5V+SSdfLUSO6cprSgqPKfY
 RUJGGn2Ff6isk8W+BjQTj0Mrct/5U2ufQTVaOICFz25PdDUzpXxlE+lglbL4+/HDUcGF
 S07roY4cBRGTmfQM8sBjLWIhZMKDWv9xU2q+7nWOpZ+t9Vr4y1oUGjOTt6J/Z65A+6Ii
 h7pmrXU+y/OnnmBVehWI14tv7PtgqzudUIBMpkTtZehKEJO2/u0uW0PfxRAt9g7Vktyb
 xDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=px3eEb7r/QydV4xXtYEkw/2gg3rnb7J0yUIfpZsnplo=;
 b=KvhhwvK+DamCPEbtMf6pJd3FqF5qf4t0Q7TZv120+1nNsm2t8Ex4XiQ0DtonZHNdV1
 lix3bdp5Ey7Q9wKNN7HBc93mZDbtJ1xntjj2hbcTXxAJSOx1QJfziZGswlTMLsLlwQkk
 c2X1Xx8EA3ZGasnkuwkJba3E/ZAeZvVfXX5LAwCEUSd6LEQz43ZnS0AElp4zK7qNODOR
 ZW+9z5ANU4NcPNUQCtca3E8rBoausXDR3G8DeLG6ZjTNpelHRF7vKokPFqzutUNMXi4L
 FamIrfp2jtvoMX0CJRjMBWGrA1Zx4hfzwPvUZxIy69ZezXlKOkEYqUKYp3C9F21e5frN
 zBow==
X-Gm-Message-State: AOAM532N3f+UwvUJqhJWm7C++KPhxZyyTlC2s6o1FR/2TptV52LJNBGv
 k+o+vVwXqGSzrHHzdmMKzhjfuUmiX1P/OQ==
X-Google-Smtp-Source: ABdhPJxVB23JiM/U2RfbR9Q/MHrm029AmF3kX+cWl82uWO03kTXpepiPb1dyYp6qg3D8Sbmgj0I2fg==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr9756395wru.69.1618763549253;
 Sun, 18 Apr 2021 09:32:29 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x15sm16745248wmi.41.2021.04.18.09.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/26] target/mips: Move cpu_signal_handler definition around
Date: Sun, 18 Apr 2021 18:31:19 +0200
Message-Id: <20210418163134.1133100-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have 2 blocks guarded with #ifdef for sysemu, which
are simply separated by the cpu_signal_handler definition.

To simplify the following commits which involve various
changes in internal.h, first join the sysemu-guarded blocks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index b3427fcc517..294560c9d2f 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -151,14 +151,13 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type);
-#endif
+
+extern const VMStateDescription vmstate_mips_cpu;
+
+#endif /* !CONFIG_USER_ONLY */
 
 #define cpu_signal_handler cpu_mips_signal_handler
 
-#ifndef CONFIG_USER_ONLY
-extern const VMStateDescription vmstate_mips_cpu;
-#endif
-
 static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
-- 
2.26.3


