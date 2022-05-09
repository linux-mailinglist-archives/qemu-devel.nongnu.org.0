Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44E51FC69
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:15:16 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2IF-0002F5-A7
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Z-0007Kw-QC
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Y-0001Iy-4l
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id k2so19091116wrd.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xq4iM0BZvoq8/HgoELbIYA7Nz6YX3WBJKHh4C9qCekk=;
 b=YnZ+dLdFO1w6+l3YjhRNd5NQJqdvO2432QMMUh1CDRc9RTx56xWW+6RtxvaAJAP5OY
 tbze/z+u2CM5ZvwkFGSvbMx6WTyfGIISc7+xF7kEUr82fEs1b72JUj9XwBad1YhH/66b
 shmgD73107weCRObpB0sowHZ0eALafMRDwXelIQJX8OO12jN83bdG1LyZtQU3CnKnmGD
 OlASbUmg5YP2ng3pyVwqKJ78XhZ446fQszYhBYEwLX/YnempiknJNEuZdGNlGmXVYTqZ
 eBBrqWPlgp547ZGwwyIOJolb/nhwu6xIXJifxwQF8eHcruC8fDdeIEl2Zyr6vKXrr45t
 AG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xq4iM0BZvoq8/HgoELbIYA7Nz6YX3WBJKHh4C9qCekk=;
 b=ZJ9Gz4dtoOxhpvIAPMVm87kXN/Z3zMrQ98OhCzdbnTsUOlm4Bsr2k4EYTy7VyTwwGi
 uEDgHIG7kI3bGjA5+R/C2MXWtIX0cEArmjtVBvLexh7ZRF9Or8gPW7YKKkCc8wN9xKsu
 0M4jE4XMl4FcDBy4VRGrLFvznd/VgW85Alc8Leeg3eZj91s5fKfZud2nVXzPFavksz2j
 emxDrEUnbFC8QQbITaRT3O25l6pymHFWc/d12AAbQ9QaADXhl0A9+mEuYlEE/cVcTmrS
 L5PCkryTNgwkglhDfGkfZ/KfAIJ9Gd412D+6+5tj9F5dv5G/SC8PmEaS75f4QA+glj+w
 LRCQ==
X-Gm-Message-State: AOAM530q511aYPHaAHuj4tiZnRxvPN2iUwLpSrSU4uog6xndtioLVRNx
 zlPs+syDAN+WUMy0NdjE6OwB+rSmalCijw==
X-Google-Smtp-Source: ABdhPJyfEnO9NTdWA3cikiGmted523EQrW8IsYgEaOQYWHuZav4hDyt+Xh/TJxrjbZrrNrxtAzJ9Gw==
X-Received: by 2002:a5d:5085:0:b0:20a:e090:85ad with SMTP id
 a5-20020a5d5085000000b0020ae09085admr13388304wrt.235.1652097540757; 
 Mon, 09 May 2022 04:59:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/32] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Mon,  9 May 2022 12:58:29 +0100
Message-Id: <20220509115848.3521805-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 965f35d8c9a..0acac6347c5 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 202fd5c46e4..88d3cef93e8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,7 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2c..337598e9490 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1


