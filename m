Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8ED47B451
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:27:57 +0100 (CET)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPGG-0004K3-9x
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:27:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDi-0001hg-B1
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:18 -0500
Received: from [2607:f8b0:4864:20::429] (port=41917
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-00070E-E0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:17 -0500
Received: by mail-pf1-x429.google.com with SMTP id m1so8641239pfk.8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=igydWZSOj9B2sZrf0+9GvzkY2Hpwfh8INrFRQfg93CcbFptOI4KAQ5+5ZDi6J7B1Ix
 Zp+A0uL0xQtK/Exhw/dK2+tBDbh2tgu4QSumdSJb1gIplIDf39PZdNBaTW96WMk/TfIg
 SGE+mO4KrsnXpqqw55r0hu4m7BjsvYU6gDCJ8he92rUHwWs+CLrUvigD2cV2jKohbtNL
 aKCxM+jYPD5AmqJB8ryI5htcj0FIhza75kO5FFDSPt7RjlQVfCyKaiSoXdErGPV4iLu9
 eKmJvZQWtQP4oXbcXDWRF00xfURZIuYoVOdjJungkNXzk0VTibJ4dKzYg4Q+5niyJf9g
 QZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=slnISpKEtLaNGrbLEFb7dCRQojy8G/MFwSRwaEics1F81xox/Y7tDsduDT/qycmUDs
 SD+M05m7KNXkGcYzjAkUykLoNSZm3PnsZazGPU2n5djdGOzrYHOWGk5zu7crprXJYlsQ
 8zfboCTreT4GWn1WUNsHCQCYVaGLkf93ZmRgqiiISrlmgHWu6wKqZ2ZUzzyjVdY5xA5E
 RKivMB2b7h/DW9tdzPBm4j+bBHE4ElHiZJ7s92Ffvg6kN4SGuMuNgWEVbLqiXrejiHAB
 dkCg9PgdQMsaIH/UiyTwQaJrMUU8Fi06mDNmkiikucRzaVMrGT7LVIB4Qhs8cR5wrllU
 fHfQ==
X-Gm-Message-State: AOAM531AAORZC1WCWYU3Ynxels41180rOizw9IH2iUZ4iTRzepYKcSpA
 tAIoD84BXwhtlYo60kS58JQ1e+Qs+lLG2g==
X-Google-Smtp-Source: ABdhPJyXjuMIlIHlPwrhs8TlWmO87KNWR3KxjGIPSFK7/YscEqbVmj4jer3kveWQiQE7JoyZBN+ZoQ==
X-Received: by 2002:a63:40c5:: with SMTP id n188mr2082025pga.118.1640031908620; 
 Mon, 20 Dec 2021 12:25:08 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] bsd-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
Date: Mon, 20 Dec 2021 12:24:52 -0800
Message-Id: <20211220202500.111897-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.
We use this as an extra marker for both host and target errno.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 832671354f..141e08456c 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,6 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+#define QEMU_ERESTARTSYS        TARGET_ERESTART
 
 #endif /* !  _ERRNO_DEFS_H_ */
-- 
2.25.1


