Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6582D0863
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:59:42 +0100 (CET)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3wL-0000HV-Vv
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3ec-0006M5-0M
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:22 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3ea-00082t-JS
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id i2so11043569wrs.4
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xm/MxUEH7jkD1QG6cSrOIpJqx9OHIRmXgkVnHFu8QuE=;
 b=KyiSOuCQWG/R8m4WJmpVDlX6Irzi5kjH0pJ+KfpX4HifpbhVAWwyPEXoqrKyeWHWSL
 p4hwddyHrcVMm0pCUDsbjd2UcHADLhNdEbUJNc6Dh0axxwiW8bhuyz+bd8UD8rgZiuf3
 F2SHdWOe7OxS6H54N0jXVa0s/0tVzpPE6A5xssnRJjV1LNVNA2snFmcjxGC3mq6AEDx+
 MafT2MUI8kkAGgXkTuOEooO7M1mrxWCCtacSYLbAT4IsEjzSpeQufSqKJxiotDruilGd
 S9mM+6XXORONzD6ICCiCD0OPInGpWiHXFOUiD1dw6RVnYKTTibdJNfjr/sJXL5ptmjHV
 mRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xm/MxUEH7jkD1QG6cSrOIpJqx9OHIRmXgkVnHFu8QuE=;
 b=t2max5DKc+O8RMSR3ZWZF+V/pxyGFjA48k6tMHhr9uyaMHhr0cQ9LvlBYEZFv8t5Ul
 XCBy/AztIx+wHNlkpQN5l83LzHFALSWjFW6/WqF8Ks4BCS80wBciuwDpFSHiZUg8hOsY
 2FS+G8avkPeMJ8+ATStsK8E4QkTfPuWj+krRoxpQaWz/fur5EXrWEh2PbbuQp6QqpTo2
 BBbw48ImPZN4X0rqJP+SvqRZtGmfaEv2ypf8VWsjUbWPg98EkV0djZjkoHTIry7tskMq
 q+Nowg9SvZghoJZoGX3/kIfqjQoW2Ztrutl5h92oh9HV5ixiklRlm52ZITt+Q/x7W/KF
 9+SA==
X-Gm-Message-State: AOAM530N4BDtI602m8WVx/tspYBaWwf9cnY8rIP2Zbt9Vb2ZJK1JpRJi
 DgJ9NoNmzbUy0Mld8VXaHoZn0t7oOJs=
X-Google-Smtp-Source: ABdhPJzXt3ifQfM2cwjMdevwVqsOb/NkKyOt1a61/Zmv8kSIR8bdzs9XS/k1lZiuUpSeu/NFS7gg8g==
X-Received: by 2002:adf:ed51:: with SMTP id u17mr16909273wro.61.1607298079086; 
 Sun, 06 Dec 2020 15:41:19 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c4sm12542853wmf.19.2020.12.06.15.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:41:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/19] target/mips: Rename translate_init.c as cpu-defs.c
Date: Mon,  7 Dec 2020 00:39:47 +0100
Message-Id: <20201206233949.3783184-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is not TCG specific, contains CPU definitions
and is consumed by cpu.c. Rename it as such.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
cpu-defs.c still contains fpu_init()/mvp_init()/msa_reset().
They are moved out in different series (already posted).
---
 target/mips/cpu.c                                    | 11 ++++++++++-
 target/mips/{translate_init.c.inc => cpu-defs.c.inc} |  9 ---------
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename target/mips/{translate_init.c.inc => cpu-defs.c.inc} (99%)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 899a746c3e5..8a4486e3ea1 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -102,7 +102,16 @@ static bool mips_cpu_has_work(CPUState *cs)
     return has_work;
 }
 
-#include "translate_init.c.inc"
+#include "cpu-defs.c.inc"
+
+void mips_cpu_list(void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
+        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
+    }
+}
 
 /* TODO QOM'ify CPU reset and remove */
 static void cpu_state_reset(CPUMIPSState *env)
diff --git a/target/mips/translate_init.c.inc b/target/mips/cpu-defs.c.inc
similarity index 99%
rename from target/mips/translate_init.c.inc
rename to target/mips/cpu-defs.c.inc
index f3daf451a63..ad578cb8601 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -922,15 +922,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
-- 
2.26.2


