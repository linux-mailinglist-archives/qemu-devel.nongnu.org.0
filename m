Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E92EE926
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:49:19 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe5m-00020F-Vn
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjT-00029d-LD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjS-0005wP-6T
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d26so7088556wrb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpgHQHdilrFY/Au0x7qNpr3WUr1jSj6gUqKW5wcmkNw=;
 b=e7okNRHBZtMqgGM6d5VNmV9C7y+TdjUXNAA8R5c9aj9y+IDIowU9RL2Hqz+LPtcyMC
 0L1s7+txvq7SZt9mQT7Kf8+YW0qXTa4X52bjKfCvZD60Y27a+NdtCwqjP5yXe8+OS42o
 D9TOnCzW2D5L00uWnL2WPnta0DxDCKGH4rokFeIkPGhXzAMxPcuh/49gKSrZtqQbpHlB
 MQkAhbqs/NdILIs/1iRc5oMJCsYwRResxCBWCf7YDkxKwdcPJG0wtwpC69Ck8TrbHLWW
 RL/C0tPAI/Uvs/xqHllBw7hhYYPX5czkP22v/7L3/i3p5J/5AfaOAIJuR6ArKuEaN9AY
 fBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gpgHQHdilrFY/Au0x7qNpr3WUr1jSj6gUqKW5wcmkNw=;
 b=aEXzwWMNeyne6ejUEii03p0pWrN0oo4YJr2ctFzvF3Zm4PJhgsABC9ssecESZG50hc
 J4Yo7d//VAYhGMBLleiRbG411gGKGJ6MNNtCfZd5HD4NUpxTpvRXVHw1bw1vFs1lZwBD
 OkItFT4nVl6UMkoLUF3Bj0lZRzEJBfqhk4aLflFuV7nZ1N/MriQnqGM4Gcq2P6xWOrl0
 Kpk41vRT8iJ+ub1eODQMR5H9SsT6ppln9Bkt7yHF+owqlS7FA3a6FNoIagZmhgONRujW
 mLgWNC5Kz8opbBMG1+IOBC3aA7WFahF6UWR8WNHaZq24AZsADC+zjOtjdMtYsFj/IBm9
 fDgA==
X-Gm-Message-State: AOAM530659n2RpNGgEJUlV+aqO1fVE1LMsqRI6HekKXA7nMV9Ur0EIyt
 2rDGjaBH+/5lD40uHB/0TW+f/B5zr2w=
X-Google-Smtp-Source: ABdhPJxkJD3JxPHzQTm/T+0q95uHk/ybzsKYtj/FjAirlGxa6q54t6h5V2wZ+EtDdMERaIxkpjsp/w==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr699194wrm.60.1610058372562;
 Thu, 07 Jan 2021 14:26:12 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r13sm10551180wrt.10.2021.01.07.14.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/66] target/mips: Simplify msa_reset()
Date: Thu,  7 Jan 2021 23:22:25 +0100
Message-Id: <20210107222253.20382-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call msa_reset() unconditionally, but only reset
the MSA registers if MSA is implemented.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-3-f4bug@amsat.org>
---
 target/mips/cpu.c          | 5 +----
 target/mips/cpu-defs.c.inc | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 45375ebc45c..4c590b90b25 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -531,10 +531,7 @@ static void mips_cpu_reset(DeviceState *dev)
         env->hflags |= MIPS_HFLAG_M16;
     }
 
-    /* MSA */
-    if (ase_msa_available(env)) {
-        msa_reset(env);
-    }
+    msa_reset(env);
 
     compute_hflags(env);
     restore_fp_status(env);
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 535d4c0c702..fe0f47aadf8 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -978,6 +978,10 @@ static void mvp_init(CPUMIPSState *env)
 
 static void msa_reset(CPUMIPSState *env)
 {
+    if (!ase_msa_available(env)) {
+        return;
+    }
+
 #ifdef CONFIG_USER_ONLY
     /* MSA access enabled */
     env->CP0_Config5 |= 1 << CP0C5_MSAEn;
-- 
2.26.2


