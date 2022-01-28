Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E304A0445
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:38:17 +0100 (CET)
Received: from localhost ([::1]:44872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaoq-0001BP-W2
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf3-00007s-O8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:09 -0500
Received: from [2607:f8b0:4864:20::136] (port=42585
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf2-0001Y9-4t
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:09 -0500
Received: by mail-il1-x136.google.com with SMTP id u5so6739981ilq.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kr3WAg3LFuIjGK7Kv0poOIctPcCnCwAaBtFgS4qf/b0=;
 b=EGQfi2OYtf+Tjn38X5SRr6Yi23jyF+NQmZG1OJc0T+6vvMA7nHzliBhipgdKwpzy6p
 +LheHwiBWWDciAnMm3G3+VAkvlkStJnr1JKuvSU1jerVst5uZ/70kSbPsE92BUj9wkI2
 cw5O8LO2XhoJMs0kchJa0HYVMrsHECxqZbU8xBcHCSfVUIG7Vbm9HGZ+3tB3eKtBkQNT
 ZFr6rS7jBD8XGrF+VO2noPYdAjY0Hku1lFnVV2PZtSVMwYhMA63XUhZPNkTD2chw6W1p
 SLO1tAp9dI+Ce0Bf+KOOqgza1zupJSZq5fiQxIuwP/Ip2ZstTkdwJPWPa6Kk31sLS7gs
 Z6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kr3WAg3LFuIjGK7Kv0poOIctPcCnCwAaBtFgS4qf/b0=;
 b=Ro4T3HoY6Rl3OldmjKawcBdJ7jn7yQwupxXZSjMXLVMdu14ISJWXYaETg4mF0hdKBL
 d5eiYrxaBsfPGvFjBgN8sr3dxSYz7NnGDUFses701PJ8fb1VZpA7gSOb5NsWFrEQ91mv
 EZ3aUGt7LDhphX3+pVjGMtM/rVJuwB98uENRjNtKwYTLlBasDwA5b1ygtKIL9Iwpsks/
 kwxM2RNsycJ+TJakuvnQ1c/KcuLnnuWaYoshPrIAfX6xEcUWGmRtEVS7QvZiDPKlGqel
 JBGT2kkjyUPFN/b7i84i0JD1HczpOXJCJwluXD7qppyE3s+EEejKjmL3Irs9iNDXv0wZ
 wAyA==
X-Gm-Message-State: AOAM530IxMrv8kdGL1o2JAgn47U0Pyk4yYEKtbPFhqcAMxbr3HcwRslJ
 1+B+32R5hQodq3Dtu8J35hNDXqFknEW2Gg==
X-Google-Smtp-Source: ABdhPJxALKHTo8wJbrF1qraw/ziKtKMLqbqkDwlXTU0CEWR135lyC1zWD3qI9u3MTzNxZoSKa7tTwg==
X-Received: by 2002:a05:6e02:1c4b:: with SMTP id
 d11mr7573955ilg.273.1643412486977; 
 Fri, 28 Jan 2022 15:28:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/40] bsd-user: Bring in docs from linux-user for
 signal_pending
Date: Fri, 28 Jan 2022 16:27:31 -0700
Message-Id: <20220128232805.86191-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently unused, so no code adjustments are needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4dd209e402d..671b26f00cc 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -86,7 +86,14 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    int signal_pending; /* non zero if a signal may be pending */
+    /*
+     * Nonzero if process_pending_signals() needs to do something (either
+     * handle a pending signal or unblock signals).
+     * This flag is written from a signal handler so should be accessed via
+     * the qatomic_read() and qatomic_set() functions. (It is not accessed
+     * from multiple threads.)
+     */
+    int signal_pending;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
-- 
2.33.1


