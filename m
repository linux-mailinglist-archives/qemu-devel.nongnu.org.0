Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC295699AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnB-0007uX-HK; Thu, 16 Feb 2023 12:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnA-0007sy-1N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:32 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn8-0007oo-GV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m10so2544966wrn.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7RlBfSYt1zg9bweFFHbEwDZ61Sd/0Ke4XEfLYhGOXrY=;
 b=jg+R5bWZFtrrhjlRAlARtFQpQpnub0Z3ZqAjiKT+nRWSxOCB/Y09Zln8rsWCMqcGJR
 LG2xVfInyB2cMMcF0wpCFwwLl/0gDor/XCqMrcsiOqS6ovqQMBBMkPHHVAh7RO7KVrCs
 OAB76p9Ncx5Lj382Q3RiTHG3lUL02rNYmjIpHcH5iXsil/lTs1sZzSaqtVtAWelofXhP
 RwDLoJQgXburpH6sao95ZtBFfYS5wQh+OQ6r8SxSfl0cW+eQBu43l/5gzzSyDNkEJauW
 80E9Ju7h3FXyj72fbKR30HSiMW/O4tIGdYGRgL9JMIv0wzR4a9WvTm+1+9/97uAxAFBj
 twyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RlBfSYt1zg9bweFFHbEwDZ61Sd/0Ke4XEfLYhGOXrY=;
 b=eK0rorBDaScovXQl5UPu3c27fGkTsBWYDHPFHjXGMGcHRGpyHrm+AKz5XP/dAsF5L3
 BsLvNrdswjeFEqCI9Mb9nvqZfVeLN6fxQGmEfvLCZ4rnhNdivs0Dbue3UW1NzOaYrRXu
 ccn2xL9JBKAtKAFYj2PBNQQPB0DxsUTKB3aq02rTAGZpUIYZKrPJl2KkDpTSvlb+03aD
 O+0rUv7+uRbPvAt92NXcHFgzse6koIqKHYJPpNMXLVVu1cBcrM7Qzy0LiwuNDQw71TYB
 WMbbL3r1p/+W3TmVpSvZIx+kESvqnPRuYfxGQfIsVFfmqZBm3ZdwN+VePek7q/qOpgFK
 wQkw==
X-Gm-Message-State: AO0yUKXZPowY0ZFToV3ejklNiUJHckgsMtwE+wh8LuUgsxER/5QqrmA3
 cPDuAtnRabwMdmadeIzbBvvjNJsLu0fomx9X
X-Google-Smtp-Source: AK7set9Ph8Isl/2AQsUY6z9boLIhHh/8WAOYm1soqnrlWdSbmi2XJ5sxHE4kQdjI+tB28/i1GG4tlw==
X-Received: by 2002:adf:eecc:0:b0:2c5:483f:ec84 with SMTP id
 a12-20020adfeecc000000b002c5483fec84mr5481650wrp.45.1676567488912; 
 Thu, 16 Feb 2023 09:11:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] target/arm: Constify ID_PFR1 on user emulation
Date: Thu, 16 Feb 2023 17:10:57 +0000
Message-Id: <20230216171123.2518285-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230206223502.25122-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c122..22670c20c00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7021,6 +7021,7 @@ static void define_pmu_regs(ARMCPU *cpu)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
@@ -7038,7 +7039,6 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return pfr1;
 }
 
-#ifndef CONFIG_USER_ONLY
 static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -7998,8 +7998,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_NO_RAW,
               .accessfn = access_aa32_tid3,
+#ifdef CONFIG_USER_ONLY
+              .type = ARM_CP_CONST,
+              .resetvalue = cpu->isar.id_pfr1,
+#else
+              .type = ARM_CP_NO_RAW,
+              .accessfn = access_aa32_tid3,
               .readfn = id_pfr1_read,
-              .writefn = arm_cp_write_ignore },
+              .writefn = arm_cp_write_ignore
+#endif
+            },
             { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.34.1


