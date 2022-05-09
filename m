Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3151FC5C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:13:45 +0200 (CEST)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2Gm-0007Qr-3V
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22e-0007a4-QV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22d-0001Ga-5Y
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t6so19116578wra.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=almVrNVpuLpoIepWO4cILFV+4VahPiB3xxYGOPFdNE8=;
 b=NjffDT3iobI943d2HUI4yACEbIYkLq7x/n5WyxYoWnYJVao3PWpnxQXy0Pj4FZKv6e
 PmORjCjNvZt+icfquGi+tzSJFg1AHDhxig36AF8VbB1sTkfMATVQW1o2VxU5ETcJQnL9
 L0pyhPt/RJ7c7sQ3Ll58V0IF+npwaXurC69tBWBALuJ26nvuraMCg6i3H7XzdUbzXQTJ
 vKuPyINM8OjPTqLhByAfcx34R3foN9hw0dKta0msnOdY/PJWDvYltXgelRAvQoo+TFTc
 wDxdvn2fprivszOTVL7Gm2fyOXCeaYJ4tTIUHDBJ0UqODn0sovh7q1poDtKAaLymJ71Y
 ugKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=almVrNVpuLpoIepWO4cILFV+4VahPiB3xxYGOPFdNE8=;
 b=CBuLuB4NFjl1CL/Fai2iQ4JdbYFRBi3i5z4XXnu5CNZPioAG+L6k+ofAaDs5AuQxM0
 tIwAcvSZnn+FSAM8xGQfwgO877YFmiU47HF6GLQLjZzCxKYuoEj1Q/ZjXbkpxrv+OvS0
 JfV23a1iQrTjP5QDHljQpJO68bKecSmTjSKq7LDoHEYKfrHY3xpXz6/lGNKG/v4X4KUR
 ML6UmmIkJi6Yu9HNg5br3WpiuHVRwmAnK5LmzjWI6oYx2DIj34l6sFL8VTM0cGWgIrue
 2z6obZbUYmP5m+iYjL9PTjVsZwWgpofVvJ0bgJJ/vyQVWI5g0nWZDNRyDifS07GxGBs5
 BPow==
X-Gm-Message-State: AOAM531XMJcPjvQJPaIXdk/qHvVt8fHHYU2aAPxLrcUe6bf/F0msVIn7
 qCwNrGTF6bfMLTdmXh2DWSS6xKrxj6PA7w==
X-Google-Smtp-Source: ABdhPJzHvUcqqgCJs8YDvoZCvuERGLzRDMk7fDas2u7w2GzQKfbjhspl6SMRCLA9g/PMasjkmHLtgA==
X-Received: by 2002:a05:6000:1810:b0:20a:d512:96b9 with SMTP id
 m16-20020a056000181000b0020ad51296b9mr13450377wrh.611.1652097546525; 
 Mon, 09 May 2022 04:59:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/32] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Mon,  9 May 2022 12:58:36 +0100
Message-Id: <20220509115848.3521805-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b200012d89b..b2a3e2a4373 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10410619f90..25fe74f928b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c5cf7efe95c..762b9617073 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1


