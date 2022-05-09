Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0A51FCAF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:25:06 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2Rl-0000qS-KL
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22e-0007Zw-Q5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22d-0001KE-4k
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c11so19084579wrn.8
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OhRdJfnini9q7/jjQO5HIr9d+z6cd7iuez+VhkZ7LaE=;
 b=kEmkA9vK4xkoYPXwWkGpx3j3OSYeHGJbvjI2STEhovWpPHgkZXe+yOVysKeT34kFDW
 pz2MoLeyNIowaTDYaX6gSxmHLPJJIHziDADiiO/nmFakOFyT6RDHpEftT6Tyw+LQvz9A
 leKlpQhczJkkzv50xroaPz7cECzFBkyF+Du5Au+Vtb6H5REPl20L08yNrl++K4tiqT0Z
 k5WtCQwOfwrr2zevmsTBaa12COxaESnE2aIrY0l35R2cgcSgWQOhaeHtWJGOsuuM8ZWo
 fM8KAwF3+8Fis/A/fCcPhADQj6tQZqhFFJPu3IDnFrFf4PV5s+3a1hnrIqEHDFAmq6qd
 JnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhRdJfnini9q7/jjQO5HIr9d+z6cd7iuez+VhkZ7LaE=;
 b=axuyVYSIU9tyqKJwDgGtLp0KRiuIBGbE/Y2z0oxoYN/MfMO1gn5KAtEsaDg6GDMtor
 zpohSI4k8yFtFv5WOS9myxQT2yzCbZyIfSGAR1hUz5gYoz5cxX98npgDju7scj0ABRyh
 xpRwbv5nBImhBS2peCxANKowZ93NifK0CC2ALb+qiDUq1EieINEnM93mjjvamV3ACeE/
 lttk74TPgYUjDc4SSV0sS5o6kTK2fIh31LabXQVoiSpb9voUcP2BDgqH8fET/326VT0J
 F+ULP53yRIFZyEJG1ktGH+0+YPsAzPvYGEZ0zZcIBk1VH1yxwk1jm0WgF7wnzrAnlIe6
 VuPA==
X-Gm-Message-State: AOAM532nS6C9Yo3hc3awA2EtitGck4ufF9U0JYvNNn6OJic2sREzaKTh
 66vpDwCrBkpuDHJEwg+WDkbUXwjYTwC9eQ==
X-Google-Smtp-Source: ABdhPJxPSnAovJumKE4gVp9Anfyu/ylkJ8p7DM3Pqpx5wJ58y0YCD+Hzvcwx9PwqSr3T/1yn05W9Bw==
X-Received: by 2002:adf:f40c:0:b0:20c:c5e3:7e12 with SMTP id
 g12-20020adff40c000000b0020cc5e37e12mr4992467wro.1.1652097545762; 
 Mon, 09 May 2022 04:59:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/32] target/arm: Enable FEAT_IESB for -cpu max
Date: Mon,  9 May 2022 12:58:35 +0100
Message-Id: <20220509115848.3521805-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 81104080003..b200012d89b 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b20..10410619f90 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.25.1


