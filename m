Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81DB48829D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:50:55 +0100 (CET)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66yD-0002b3-3U
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:21:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ih-0005K7-W8
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41721
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ic-0003Pc-9N
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:05 -0500
Received: by mail-io1-xd2f.google.com with SMTP id y18so10100596iob.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++7dSM6FOSmYgDBj5XseBjuyEkBOfEOXIVkqPoKsD28=;
 b=uMfFRUX95Eqn6hNLJh0tz2++CanMMADMxmtrqMeW9UXk88mrJmF1sW5Ddf2Z9u8FxJ
 8O1ZOpc9wUIHdmcjhmkQnZ29VMuisjQcPXD2qrdFT5kUm/VGHagvYhpOT26kvSYxzXTG
 5IrSQJ6sCJ8zt3tDM8WATPQW9qAc4pusGXF5KWoJkW3MDM89POVep0Uh45ypiLNB6FGm
 TYvtpxCOCbsCysZO1R8RcIWPzit6LXQI5KY1c33EpbPIasvJe4NstB3UnDefoTkXDMnI
 WP97Hnt2j8fo5saFUk7cJJvg5twktU9OIFPAo4iSdeeCNo7lRpKLkz/SNw+YBjWKFhP2
 NNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++7dSM6FOSmYgDBj5XseBjuyEkBOfEOXIVkqPoKsD28=;
 b=rpXkYz2HA3UMNvJZyP8koRFbghhE6WA38/j8PVQr6j+xIQXMaMaUMB9l3CY0QxOGPg
 hlyzj5FZSf5XKOyUy6aBBuF75TNC1xAAYZQME8t51cjicDrh9Di52CAXUoBUF11BEKGU
 p0RTQ8If/qiztTyWWXjwT1BBY9HonwzSIdiL4kbjMFY+Wkkw7U7URhmJ4LGPbAGe+Be0
 3QXXmD/O846zP+ZPDKJfZdAkKtq/SxzH/8LKwe/NjiMok81DHKdMh1lLLotRMMmUxEP6
 ci/6EDMUH5SwYFl/hpUIlIRMdk81sGKOP7P+fV5Dwx1tiCQydLAm0RL+Rt6D6mbfXMfH
 N8Gg==
X-Gm-Message-State: AOAM533YnjkLBpUJucEr0GGmaXl/8+v2/4qhK6U1m/nCrPxCDjkM90oR
 2w9l0kSZs79bbMXyBtth0Govg2HpF5ek3cgi
X-Google-Smtp-Source: ABdhPJxNehLA6zndt5JJYSIRcAPE60nQ/mS5pzqZ02RGuTUYnJ/TceFskDRK+Wyux4e18HkxsMeLIQ==
X-Received: by 2002:a05:6602:2e8d:: with SMTP id
 m13mr32436394iow.68.1641627480497; 
 Fri, 07 Jan 2022 23:38:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/37] bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop
 implementation
Date: Sat,  8 Jan 2022 00:37:18 -0700
Message-Id: <20220108073737.5959-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>,
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
index fa45d9335d6..2484bdc2f7a 100644
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
2.33.1


