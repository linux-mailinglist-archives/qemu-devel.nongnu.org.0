Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1A44394B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:03:55 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2or-00044p-MT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eq-0006gv-Id
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:47013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2el-0002mY-L1
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:31 -0400
Received: by mail-io1-xd2a.google.com with SMTP id i79so273150ioa.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=xW66KkOERG8vF6g8p4i77zHeNKm4xyF/asZ0Hqjw80oVOfq4GxPJKQ6AhwogEEeWVh
 v5P/u2dBX00ZZBldYix4PkCIDI2b8Ska+tCWEEzeygBJw1kxkVBQD6VkefmEkwnb31Tm
 9kSiSKxgjSOmgrexhPElwABuoV2/XpcDTzweslqBAMQ+e2dbaaeECwAlY7pk398wzBfP
 osd9QtKgtwNQAOj3e/CCV1ZTv31/QQiLBwx67H52U6apgY7isuUS55bOVK/NNZghyoyP
 h3BQvWMycoRGTM2bbsvCiXVBUa6nLpvHW6RGiCowpN2GVgClg3U3KkKwPOvSI4Hkx4S0
 zb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=ZRHbsSMcEg7Enon3KCDIqJgFFWdBydGUaugXqIct6eu05M0yTOAl3rqv8TwePlEznN
 BUHE23ongcYzxiFmenJMu14DRQiKloBkgVFcrARYmkHOj404Ef2A8eIs04p58oMjg7HX
 5x6DBEOFiqiLdI0G+1r3o8aURVGsdRyqCrrD3niX11rdARTVSxEHuwkDuaGqcjxGVD7r
 VSeI0ZP+90QYhOQe7k6iuBeGPYWgK5fDw9V9BufkdYdqhsP9k0xM4oD6IQGIlKQmimb3
 FLN/teWN9mwFUE0qZtghLslL4ps8Z7ZRHv2Zf0xuVC2o2Nw+emYHKTOMVOZXsJyzgKOH
 BidA==
X-Gm-Message-State: AOAM533DXEb7yiwAs6eaLx3/oOXfiktrAyvjdk6fbnTzrqLANp4HRJrr
 9aqeYkV7CSID+vE/UtgpWsfU7ii+WwSmlA==
X-Google-Smtp-Source: ABdhPJy1Y8E7TpfQDGmxjQghpBhRF3wKmM+s78reJg/82FIUa3gBFM01uOcRkfCfbJlFT0w0Tt1UZg==
X-Received: by 2002:a02:7154:: with SMTP id n20mr29728590jaf.77.1635893606384; 
 Tue, 02 Nov 2021 15:53:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/30] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Tue,  2 Nov 2021 16:52:25 -0600
Message-Id: <20211102225248.52999-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Sean Bruno <sbruno@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
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


