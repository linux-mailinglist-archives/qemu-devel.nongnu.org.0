Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92F578922
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:02:08 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDV4J-0002qV-Fn
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSx-0008Ug-Mz; Mon, 18 Jul 2022 13:23:37 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSt-0001uO-4l; Mon, 18 Jul 2022 13:23:31 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso25485738fac.7; 
 Mon, 18 Jul 2022 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8MxUulcexnbMlS+fESNVtXDUXSNPrPKDymk+wPWckEk=;
 b=YGoqzb4xGnb6G6+BwLbCPSm7jcGRa8SN+7oSVP082SFaSfgRK2ZCsh97S6TXa4KXMl
 Jo9jpj7c2SKIMVqN0Hj7T/CTGcYWew93sPnV4Vvt9RHTvzGD6xBBJhRaqj+qtUcFOrkP
 jDT6QqTwO0dXdIyHNZz7I3nhMbM3C5ywcgg8Z70DMPBI95kAu+9hr6SCPNvD4DTI1eVw
 zJRxTPSyGLgGm1ySQhXi8FqplP7V6tmDtVezVHk1iQ1nU4lFNG7sYDIIZwFadLGvYqOj
 W8k42QFN+9maSXk2+tKW2vCJmQ6aqLJ+0UxRyO3b7FGA5iFEcO0QPULHE/6Nw2Wu8fNr
 v9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8MxUulcexnbMlS+fESNVtXDUXSNPrPKDymk+wPWckEk=;
 b=fysgv7UFE5Cn9ERoNQhQJs3+oY+sTRkGl1xQ7nYCFtNU3AjE9Ug4U8kdVKA1WsxAVy
 UckHcCqHKhWVVHx9p9BmmbYJGQ3jh2j9N4Mqw0hoPCFwcdUae3HX++2bmf1tDNMt3WcK
 2ZL9X7nFlUMLzH0jjYcIyZPQv6YQ5DYA0UWgEFX9G7ZVyNrwzdzWfU7sIBoekCcNAhCV
 4jGk+n4TQwv/+1QQ127Fjbd+SaqFrw/VJrLn+r19lmesPCPdGitydKuqXysDYgRXZ1m/
 CnnJxhTxQkRP2EBwi8cBAtJYJvmgtO5OOpyxlWIlEhzoZTwoFWaxmQUoU1rW65rm6B3N
 9wvQ==
X-Gm-Message-State: AJIora8MaLoGFMaHpA9qLxZU9DtuhxubTj3ReuLUylr42i8OQjF4mqrE
 okMOzWLvfNytxRYp4+SeD5ib01jg1SI=
X-Google-Smtp-Source: AGRyM1u5ElVPWvKkybOmnUUgAk8x2K2SmcfYEhDYP5MMr5YTLIxtFGLcQsg4Y/5f+xDoQlbLvFRj0Q==
X-Received: by 2002:a05:6808:152a:b0:335:4be5:612f with SMTP id
 u42-20020a056808152a00b003354be5612fmr14200071oiw.254.1658165000538; 
 Mon, 18 Jul 2022 10:23:20 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 27/30] target/ppc: check tb_env != 0 before printing
 TBU/TBL/DECR
Date: Mon, 18 Jul 2022 14:22:05 -0300
Message-Id: <20220718172208.1247624-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

When using "-machine none", env->tb_env is not allocated, causing the
segmentation fault reported in issue #85 (launchpad bug #811683). To
avoid this problem, check if the pointer != NULL before calling the
methods to print TBU/TBL/DECR.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220714172343.80539-1-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 18 ++++++++----------
 target/ppc/monitor.c  |  9 +++++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 4f2355e941..d1493a660c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7471,17 +7471,15 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  "%08x iidx %d didx %d\n",
                  env->msr, env->spr[SPR_HID0], env->hflags,
                  cpu_mmu_index(env, true), cpu_mmu_index(env, false));
-#if !defined(NO_TIMER_DUMP)
-    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
 #if !defined(CONFIG_USER_ONLY)
-                 " DECR " TARGET_FMT_lu
-#endif
-                 "\n",
-                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
-#if !defined(CONFIG_USER_ONLY)
-                 , cpu_ppc_load_decr(env)
-#endif
-        );
+    if (env->tb_env) {
+        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
+                     " DECR " TARGET_FMT_lu "\n", cpu_ppc_load_tbu(env),
+                     cpu_ppc_load_tbl(env), cpu_ppc_load_decr(env));
+    }
+#else
+    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64 "\n", cpu_ppc_load_tbu(env),
+                 cpu_ppc_load_tbl(env));
 #endif
     for (i = 0; i < 32; i++) {
         if ((i & (RGPL - 1)) == 0) {
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 0b805ef6e9..8250b1304e 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -55,6 +55,9 @@ static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
                                     int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_decr(env);
 }
 
@@ -62,6 +65,9 @@ static target_long monitor_get_tbu(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_tbu(env);
 }
 
@@ -69,6 +75,9 @@ static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_tbl(env);
 }
 
-- 
2.36.1


