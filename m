Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02036DE35
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:24:56 +0200 (CEST)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnvk-00063G-0F
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndn-0001Hv-8e
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndl-0006cw-2o
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so6446561wmq.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lgWpDVtHLK5W5X4ptXi3w0BPexnbmIruOxVJ55tAs4=;
 b=KEUMGpNLOWKZsMwBZLtNU9zxJuYgxNH7+2pJ28GqEQ87zZxBDdQDiCBM42miyaBhw0
 EHLuiiP7NRAvp6hVA+cU9+9gSjCvlS8KXHe5uBvSxvZp7WSWwAusWvJweXAJrHyR4PX8
 5C9+0jHBeFM5ImDmkLO65qYEULQOFe/OwMKQD/NyrtyCv1nt7ukSPHJiS90KIhP7b2Ir
 EUyMHTmgIg8G33JY5gbxsaggZFYhTMD0Dz4k48EAreEiZiMhEKXvOAFHLo+UbC1bgZV/
 H+IPqLEZ/4Hoege6f7uewJLr1nbBHJ/lQIsyXnEXDy4Hx2tmvepepywE2ICtgWnaAT11
 qmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2lgWpDVtHLK5W5X4ptXi3w0BPexnbmIruOxVJ55tAs4=;
 b=RVmEyR0x8pqC04n2x9C3yGFCtUpQPPYzH3ZufKNFqL3RXS8pAl5A0ncHoQCO6ZpW3Z
 /ZSeKcLSHlTCqRsgrfhI92k4tM8xP+oE9uwmXh9xtFtt+4Eag5DdpphG7T5tNboC9kx0
 AxEtGQmc0bjf4AfDhL01mNWsvqtRbXOxRNJbt6Eq9/0uEjbJ/Vtn0MIYfM3xzGUH7k18
 AT0dgK/G8lmbb17Ynft+/COyRLyE2tgXX02gvLGfGT3U2bU/REYL4xq/pKBp5a6jX1MH
 pcwxrZ0nPibfEi3mXjA6lVRPl4tvhAlALpXaspgdMlKnjpz0NOjH/HwS0jmANpjBF/yE
 w1VQ==
X-Gm-Message-State: AOAM533wO/Uj47VxlWUssakYTY4aHcO8UysEBb+6Y3MeKGhiFeXWH5sA
 Nh9lfGseCKLTdw2iKIV2XCppJQ8UuY02Vw==
X-Google-Smtp-Source: ABdhPJwFPhWRY5eVEjoeQzHnn9Dr0Thm6wpoTeqHcwUfKYFQfxpDMpdWhOD+auf/j/Ae/aytDuvT4w==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr9935056wmi.6.1619629579141;
 Wed, 28 Apr 2021 10:06:19 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o10sm439289wrx.35.2021.04.28.10.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/30] target/mips: Restrict mmu_init() to TCG
Date: Wed, 28 Apr 2021 19:04:00 +0200
Message-Id: <20210428170410.479308-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_init() is only required by TCG accelerator.
Restrict its declaration and call to TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 3 ---
 target/mips/tcg/tcg-internal.h | 2 ++
 target/mips/cpu.c              | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 6bac8ef704a..2c9666905df 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -233,9 +233,6 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
 void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
-/* helper.c */
-void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-
 static inline void mips_env_set_pc(CPUMIPSState *env, target_ulong value)
 {
     env->active_tc.PC = value & ~(target_ulong)1;
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index b65580af211..70655bab45c 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -20,6 +20,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a751c958329..c3159e3d7f3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -708,7 +708,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 
     env->exception_base = (int32_t)0xBFC00000;
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-- 
2.26.3


