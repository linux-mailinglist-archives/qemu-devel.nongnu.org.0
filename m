Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6B2D9082
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:28:11 +0100 (CET)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXyU-0005Ej-0G
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrk-0002WQ-4N
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXri-0005YA-7y
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:11 -0500
Received: by mail-wm1-x32b.google.com with SMTP id a3so13417397wmb.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H63X5j82a+LliFWq3Jbhu57DqrlxgL6DTtMOErZtbQQ=;
 b=lPbs7U1Oj6rFYBbgUiPOqTZ6521oG6m+tJxriuzaHqVF5erscvscVQ3dhMqHQsbHNQ
 5r9lEXG2Gscm2RVAf9pZE28wmVUPfVz1xp/azb5nsQ+p8xRdcz+/rFA5qDhVfAa3RqV4
 moCXUB4u6iiAHyqx3vEkswuoqCZJ8b4afHlsipDajERjcJBYzGwLIQ9hINcsUjMtS9Oy
 xp7SflzOtoo6X2jQA+ewdqeXJvIXeZnC8PtpfnS+k6j6Cnd8mXs03HgnrF2P4Nx9nALF
 D/D8YdWZxqKzUbigIhvS9SQBnkXcnFZ/0Xr5dUbBbgMSxPsXAcwf2RFJvxZ3CJKe8XSI
 AeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H63X5j82a+LliFWq3Jbhu57DqrlxgL6DTtMOErZtbQQ=;
 b=E0BSVCRoiYh1LFFDxk0nUXBCLoyM2sSg8dDfp8LxNdpYS9GREuSbdVjN6trR1tPGfM
 08aVBiFKn9UqUgav+Zd6SUWQ4mZpBINGhye+W8SY1B/N+oosCFiIa6AhDsIuOBLddYHj
 kA9cg31ZXmKiUJb+fJEHVCFzPG71TGtpmmQTM9rSYG4M9gbQz7+ZrhGzhGlnpYxbfFZN
 kquf0LYCamqyPSZW2wMN6W47UiU8DlS93KsnrThqHyG4gbbpImUIVKptJ4fcN5er7MCA
 GwUVdXIH83PwFu70pnOU+VupIOf4B51WZqfQDXyXIgYmFvS3rNiFcQHDSG6hkI9WuEjD
 Gvtg==
X-Gm-Message-State: AOAM5332mx3YLKDAnbIq3LF5yZGo1Xd+Ib2go4XpR+EE5WvNGP3rytBl
 4nCBBfqJStF+gVfcry8H2plXL0AVZs4=
X-Google-Smtp-Source: ABdhPJz3/rQrsUemKBe0Gm+tyYr3IRJvrRwSyn2Alp0P+Zr8a+YhxOpvSZRX/WsAXlj7ubTDzVcY9g==
X-Received: by 2002:a1c:6383:: with SMTP id x125mr24420960wmb.46.1607890868670; 
 Sun, 13 Dec 2020 12:21:08 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q73sm28249910wme.44.2020.12.13.12.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] target/mips: Remove mips_def_t unused argument from
 mvp_init()
Date: Sun, 13 Dec 2020 21:19:36 +0100
Message-Id: <20201213201946.236123-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mvp_init() doesn't require any CPU definition (beside the
information accessible via CPUMIPSState). Remove the unused
argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201204222622.2743175-2-f4bug@amsat.org>
---
 target/mips/translate.c          | 2 +-
 target/mips/translate_init.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index e87f472a8d1..f218997f049 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31763,7 +31763,7 @@ void cpu_mips_realize_env(CPUMIPSState *env)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-    mvp_init(env, env->cpu_model);
+    mvp_init(env);
 }
 
 bool cpu_type_supports_cps_smp(const char *cpu_type)
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 79f75ed863c..5a926bc6df3 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -989,7 +989,7 @@ static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
     memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
 }
 
-static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
+static void mvp_init(CPUMIPSState *env)
 {
     env->mvp = g_malloc0(sizeof(CPUMIPSMVPContext));
 
-- 
2.26.2


