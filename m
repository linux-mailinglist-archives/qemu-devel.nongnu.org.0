Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697651FC98
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:21:19 +0200 (CEST)
Received: from localhost ([::1]:35566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2O6-0004bE-MN
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22e-0007YQ-6L
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22c-0001K6-By
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id d5so19112727wrb.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BIbbh4ECZCDM5wPUP3NeE8Zmw3wBRxjd4KnilvrbrYc=;
 b=OmaCwLWEqQ+U8KN6P9vWnPRQwLuN/khdFN6anC4BYUI9w4U1PSQqNyYKtaTR8nDBBQ
 Q//Kw4L6085U/EQfb84cUhWIO/sJTUNQ8QUgjf3Se6UXSlVMeksX61TjNWfJpdEBIua8
 92i67BUHkpob3rEMs2DBcrrUihCfz5/o04uH9Yb7Gacm0ekydKzO03kcgSfrNYH5xWJE
 JfYeOywi/4HfR/jXm3hxeEp8HxpCnftPr6af2yMPivqNnumKuRGLa/JGT7s9VQAKLazA
 u7Gjxtbbx5e7Bz0MpLXjMu2hbEeij73E8vRlKJNdb73AHE8LFRvRv5sc9qAEpe+jK+Dv
 ISfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIbbh4ECZCDM5wPUP3NeE8Zmw3wBRxjd4KnilvrbrYc=;
 b=nbGO2BLRPTMukdlYaJJRVVXHA0bQ2XdaamMz/oxtOe06IKxhMKr9Ws7IJJ7jJNQtIT
 AUVtkvu2VqdK2GpkeqhEHA2ngCTB0bGXxboSKgjaM4VtsJS1hh+/lL/m/NFoSj1iBdmR
 CvKdzZ4e2p2m83pnPBlOFzAykfyYI+BXROa+9e0icD8Usbhl0JK8C8Ui8yMNGYuuJ/EP
 NjofsN7PmTp7duDKei+iTrx4RDsB85Gwun4FzNhd1HzRS+r0KggZQOd1LlFgidKDFEv4
 yV1ZuiQvfVyhoSITyQNmA3uAPI70n/IFeJ+edsub3KqYRPf/TyA2T6wIbnAQrwMgi9RY
 3TWA==
X-Gm-Message-State: AOAM531/CRRCip+yVYUVhbvqoDoe03Lk6tiWVWEK8zMNlv0+vKpXf5J/
 DCBx+X2O8s9WL7a24ko/w+vtDCeupnJDUg==
X-Google-Smtp-Source: ABdhPJxtxT+PU62nUtaImOop47nS50qvcE8jvxSxVsHeB5CrpiMf3wOPqDPhVhSUlyrXtl9ikTc5Xg==
X-Received: by 2002:adf:d0d0:0:b0:20a:d93f:e252 with SMTP id
 z16-20020adfd0d0000000b0020ad93fe252mr13546232wrh.78.1652097544917; 
 Mon, 09 May 2022 04:59:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/32] target/arm: Enable FEAT_RAS for -cpu max
Date: Mon,  9 May 2022 12:58:34 +0100
Message-Id: <20220509115848.3521805-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0acac6347c5..81104080003 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 88d3cef93e8..35881c74b20 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 337598e9490..c5cf7efe95c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.25.1


