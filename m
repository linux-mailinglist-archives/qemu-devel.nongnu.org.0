Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4381445ECD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:41:41 +0100 (CET)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miq6m-00046W-0W
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplw-0004Qh-3O
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:08 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipls-00048W-P3
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: by mail-il1-x130.google.com with SMTP id s14so8245789ilv.10
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=VPByo9HSGRWQMPnFe4gpIC5P1pp52UMI+mhoFA6vLrAiYRYztBkpFVCwrneHQestxc
 RytprFGqceDKPPMq1lKopmu6F12H+fk9g05fsNwFpW2qPTT8ZlcvZjLwqN7+bXd3m29a
 Eg4lgRgOZOVqBmxTEJOy/Zm1Wsouhz/RGCsLRLoLfAik7Th3KcXZ6xmLf29fGXj0pqBa
 CUvuMWEwvX6TQXBQON0VgNOrgMIa0096FibzmmLLhMQW7BVZ87NA0iVk2Jg5n4SNZsQX
 63Rx0yGk63Zii2v1lwO9tS3cOndcBI6gk4Io4jj96UZT8Qj9j0Yisf7d7slPOWA17T7V
 iFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=e1rzPYVvn55CT3bYrZugF/LJordB+A0gTBX43tSViPtvEBG8OKTvvmnhymTGmFQIjm
 ctNAeT/6G65HAX+4Br2Aj8/7p7ok85Y88K85C+AsHi4zyG1KP2h/KsYb0rdtSBVCHAAJ
 nUds71QAj6gRj/RVzyNq19SUR/pQGNg34bsZn99NRyXAw7CqO9owKJc4D+gHUhYo9xhm
 nl305WNrDCw2cgPEDD3hnwFZPTSMJD7RqUVV16KjoWLZK5g2ILhmhJjeCWbDFCcyAycW
 GtgvVqhBBmF/WBHYkCkG4lqnLIAzHaiHYy21Z23u+D6RkZNd2n9riiSPfL2nMFuhY0mp
 /pQg==
X-Gm-Message-State: AOAM531+LaFZGMmAJLHqWQl7JxFUQR8ofOuIRrJTz/M4d8YTrHYQZU2i
 +gCrENkk+Tixv3JhuCvNdbu1S3A/e21pRg==
X-Google-Smtp-Source: ABdhPJzfc+BIQNUDZL4sUrXb6FSJA9lhy4K8vLjwmTO1RSz9/AuTI4pY4nc11OPMFuefwZ5SwbLxZg==
X-Received: by 2002:a92:d411:: with SMTP id q17mr23469321ilm.116.1636082403517; 
 Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/36] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Thu,  4 Nov 2021 21:18:58 -0600
Message-Id: <20211105031917.87837-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Sean Bruno <sbruno@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a boiler plate CPU loop that does nothing except return an error for
all traps.

Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index fa45d9335d..2484bdc2f7 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,28 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_loop(CPUARMState *env)
+{
+    int trapnr;
+    target_siginfo_t info;
+    CPUState *cs = env_cpu(env);
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+        switch (trapnr) {
+        default:
+            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                    trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            abort();
+        } /* switch() */
+        process_pending_signals(env);
+    } /* for (;;) */
+}
+
 static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
 {
     if (newsp) {
-- 
2.33.0


