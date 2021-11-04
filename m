Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21154454AB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:14:15 +0100 (CET)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midVO-0004ba-Oc
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNg-0006Wc-8G
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:16 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNe-0000xm-1A
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:15 -0400
Received: by mail-io1-xd2f.google.com with SMTP id z206so7072222iof.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=Aep7I0AFEOJdWz7ORLLsHk2dAaAVCXYD7FvYJarVRcdNPuTpxYAXtjSfJ95V73R3en
 lOnGqYQYADHW/Kmh9r4TnIzcKou7QtNdnzry/nIi36DVCDkv+AUXI8KXBWlqd50NxDeK
 q2iiCxw9CoAOIVQ9yvZZCsjqF1FsPx+CP6VCDWkFvjLtoy7uQLsBFMaso/6G6fLQjZhG
 e2+aEgIBCMwxZn+EzciAzqBLR/CDZK7P2TtiXJxMPNyBJZBw+/iVF4/Dbnz0uTt3W2Ke
 tTP88l/5mk0EOR0SpBRScAEmg46v6ItdckVVb5RDZBHgT/vAoVbNFyLPN0FU9ZX2FTCK
 JQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=E4HP029PMaYiLdZe57GhLgPa/nlueyDT/HtJANB600oUmn1JwpSt9lSFygJsm1/Tk8
 fOuf4piSFyehnIsw6jhh7AKh44a0dnWuXd1jVHZxC8og5BSuCWVgRJ7d/Qq60bWj3LEN
 G1i3kC4Te5NrUFnYu/WTf8H4tSnY5sTqUQks8+ex9bOgLiJtP+kqVWjCyjO4FxNmOvoq
 DaUUDawfA09uw2dO5lNTKSq59CtGredH/240K6qgGpF8D9bbs9Taanap0UigL/rpXGV1
 7LEXSg/P7IfgykHmiECr/pZdbhmD2Yg/rlUjpeGSlH+bDru7b7y5UETCh15tNaS8gJ3P
 9i/w==
X-Gm-Message-State: AOAM5330ELM59fssflRFX3sqJd0DHGYtA1DMBb2jJw1xwVsQUQR34wE5
 k4yJeCF+kTk9nh+NMY4mvNQhhwP+b4bdNw==
X-Google-Smtp-Source: ABdhPJxfZ4eU9HYuD0XDcjzdLF/AZ/SGczESVoLWkFGBDQKu4AcQtedLzPlqSLtsFaD4T/fUoAqUNw==
X-Received: by 2002:a05:6638:c49:: with SMTP id
 g9mr4070026jal.54.1636034772726; 
 Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/29] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Thu,  4 Nov 2021 08:05:13 -0600
Message-Id: <20211104140536.42573-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Sean Bruno <sbruno@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
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


