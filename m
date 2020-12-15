Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74492DB6FB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:13:48 +0100 (CET)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJVr-0008FM-L6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHX-00040y-PJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:00 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHW-0003oG-CY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:59 -0500
Received: by mail-ej1-x641.google.com with SMTP id g20so30079935ejb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CkPJcd6xJbMtrAkYBIpDMUHZeAN46ko14KRtiJapA4=;
 b=BiQ2ycjsxQHoeJ2ijcxRmvB57TPrTeX5ViuRES6OZFetdzaT9AOzR2TawHUGWuQv8D
 npUNOkwDu/1Dcys6loUgqcXWYP9mrw1DqBHpDwsNtf00lQqYLqXIatAhGwA8Jp0Alj+2
 b/w0mDwRvb5SieQVa6SpAm36h63x3N5//j+CS0xfAH2Fo34wz8bQu1Lxe9sGz5i1mKKk
 VFXboKx8Llpn5KIa8VLLy2cAn/ma77mM97VtslIJKwbhpFvUMgVRqrsqMleMi427ejAG
 Rhwn4E1aGvCzu37vOQMqRTckjJpU72dpgaEs5woeDuWsNRZTxY2DfrIlHech18Kj73Eu
 NO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9CkPJcd6xJbMtrAkYBIpDMUHZeAN46ko14KRtiJapA4=;
 b=elo+/sZcUj1v0uCVEixQsbn6cXspSnoEc8rI4g6ozXYE7EBHDChdY7ZqOlWdgGuWyJ
 lCvvjzAC3ZAkMC0KcdVNulLqXfYZr+iH6iFn3/PgSctIZU9NYRc0HVq1qPY84M/wQyxL
 9oYzXVtK9zKv4+iWYBuXJCUBtn0qUCyOwz0jna2rn3IbQYXE4FAECnF3SHg4kK8jZIsU
 +cE65gDCNczYaI4Ubv1Wa6Z3fNlQL6v6q5Q96JWJ2FaKofqAi0CW8ZqWJJR6OrpmL+UH
 R7POkiP2DFpBCxQEPvUe18+j692+2lBT3bUYvWXVmBG0FnJA3d4UtoCJL2fNm3kKC16h
 Y0mw==
X-Gm-Message-State: AOAM530s+TXfdB+ICgWV6Lx1oGEfS3SKAQTewNSNKxNgYPP9hO7rl2GJ
 FeAiELt5wAHohpmNn29sC18=
X-Google-Smtp-Source: ABdhPJyZlHppOI2Oq3wCyB7RtVd2wgnPpWTwgBne8+vso2vjRRs+QQxQcUYlhx4l3UGpsUSEF85sVQ==
X-Received: by 2002:a17:906:26ca:: with SMTP id
 u10mr15722070ejc.165.1608073137198; 
 Tue, 15 Dec 2020 14:58:57 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f11sm20315906edy.59.2020.12.15.14.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
Date: Tue, 15 Dec 2020 23:57:43 +0100
Message-Id: <20201215225757.764263-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The msa_wr_d[] registers are only initialized/used by MSA.

They are declared static. We want to move them to the new
'mod-msa_translate.c' unit in few commits, without having to
declare them global (with extern).

Extract first the logic initialization of the MSA registers
from the generic initialization. We will later move this
function along with the MSA registers to the new C unit.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  3 +++
 target/mips/translate.c | 33 +++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 942d803476c..f7e7037bab8 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -161,4 +161,7 @@ extern TCGv bcond;
         }                                                                     \
     } while (0)
 
+/* MSA */
+void msa_translate_init(void);
+
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9b5b551b616..2dc7b446e9a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31550,6 +31550,24 @@ void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
+void msa_translate_init(void)
+{
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
+        /*
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
+         */
+        msa_wr_d[i * 2] = fpu_f64[i];
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
+        msa_wr_d[i * 2 + 1] =
+                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
+    }
+}
+
 void mips_tcg_init(void)
 {
     int i;
@@ -31565,20 +31583,7 @@ void mips_tcg_init(void)
 
         fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
     }
-    /* MSA */
-    for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-
-        /*
-         * The MSA vector registers are mapped on the
-         * scalar floating-point unit (FPU) registers.
-         */
-        msa_wr_d[i * 2] = fpu_f64[i];
-        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
-        msa_wr_d[i * 2 + 1] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-    }
-
+    msa_translate_init();
     cpu_PC = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.PC), "PC");
     for (i = 0; i < MIPS_DSP_ACC; i++) {
-- 
2.26.2


