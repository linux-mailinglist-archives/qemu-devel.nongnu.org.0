Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197544792E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:12:16 +0100 (CET)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw11-0006Ot-DZ
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhv-0006dC-CQ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:31 -0500
Received: from [2607:f8b0:4864:20::130] (port=38899
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhs-0002sq-AU
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:30 -0500
Received: by mail-il1-x130.google.com with SMTP id f10so15558847ilu.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=eiVxz+QmIfcs5KTbfm+88K3m7ThPM8mUsUBwt6WVFG4zSyMBNgw1YVplNdXmuqq72g
 RjJ0+w3DvBwS589N6brmmnnJeUgUpEHKBjMasoe2IxNeiciDb2Te4ftnRKGdrAMJHbeS
 wqW80D3yrpCNcx6qaFgcM6RFb5srYSeA/muLepPIBe6dpqQ3WwN3Vxvwh3rsIQ+lAMkv
 BlaL3mBdT1eKJa2a+z8ub84qeFza31350gE7sb9J0bqPZjXcuVi4Jw3gL7hnLhRNNzFo
 zA3KrmhtaNfdOFKfco7GGqy0AZ7VVSV5qc4ifCCoxLLJ6aWafLuHGjXn7cnq41qe8rXG
 B99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=C+Eu9K463W+f7L6oeHxRSVlINRkxCv/HSS26Ln4J6/H77Lh389W19D0L+uDAukr+2L
 3dnLTvmkTMHGYYekh1Td2U9PZ8YkgijyV8eN+uATykSfF4nJI6FZ38pqxlforOnvc2uh
 KQoMf1dHFitU7+dV0gNX/QXc/VmD3vFUMOA9Ksr1SSYnMRiXhMXdlHwSvGCfJtJHGQkr
 DYgwvK5VM8GX//EnFyb5JoN1dooZFovoO1T8yQU6x5S0AweThJQBAGST/k/LaIPcAMXG
 Jy1SVxGRy3rI8jqHFKSb5O29qMjdv3UH+WPa7/kVJX5M+1ui8kId1iRLaln1orHEz9AM
 GM6w==
X-Gm-Message-State: AOAM530Y0auHGxWd0G82INqymbAYvZBShZKfov9tUkB/WGTAJHUXtJQV
 WeFA6BW6hEtmwW2hICk1YnJGblyP6nAV2w==
X-Google-Smtp-Source: ABdhPJz3guPC/pEA9MvhgsmaJ6M7s8ZsdXEh6vzbmswT2Y8w6UKKMMnFPgDhEvp4TfxzFpOJt1evYw==
X-Received: by 2002:a05:6e02:1c2a:: with SMTP id
 m10mr31678861ilh.275.1636343547065; 
 Sun, 07 Nov 2021 19:52:27 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:26 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/37] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Sun,  7 Nov 2021 20:51:17 -0700
Message-Id: <20211108035136.43687-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


