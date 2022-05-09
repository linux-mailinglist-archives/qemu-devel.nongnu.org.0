Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B8451FC7E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:18:30 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2LN-0007wL-Mn
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22b-0007Rv-FA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Z-0001JH-Mu
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so8121477wme.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7pySLzbCv+tkaUGvN3VNAC3sQSHs+Dm5J6SjR0nFzKc=;
 b=s80sxpH91V2tjpTaxW7zK5aY/KJHza9mQ1FiaVeT9qCwfLi6mZ5oglve8Ep3aynca3
 p1+MnmAhDtcmKJtkE3IeUeB8PoQD9ttItzlUWiCYrZ5fsQSK/c7SvDfgX7ZUiOB7DBeR
 dzklElN8uZ1xD/M5yo33KxfWX/hQ2lWjmIlQgoG1OrBUkZkwQKhbUxK/7YIXIjCDGYw/
 0k2ndYxnnLXAbEXUuF7l/qRui5w2D9Dv82faX5S0PMyhAH9lgdcvnJzeHO5RC+cJ/t+K
 NIvsHm2qcoKvmLcnE2jOrE2H0MHwcwaeIqYAdQFPTk1bqdBT3qXsefBpCiNIMV2iSS7n
 a2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pySLzbCv+tkaUGvN3VNAC3sQSHs+Dm5J6SjR0nFzKc=;
 b=nHi+2Gtq/dirKtEUcCWKXsgt4UkaOI9PBjgfpDhJIQK+eYer6LGj/vncSvKfZbHYIw
 c53EbC4os/woKb1hl59feO4b8vj0T0ayhlXwlXLwITGbP8wNV+sQhe6LSciwvftRX4hM
 rcv/YHJbt3eInf4HWoVgxbvZ/DsxirauSwWqVW//yuZfHQLIfnL9nH+Kw/ZHOnZ4NYMs
 MA/TZfJ8wQEUac6dke831yZZ2um6AOGr+HbUG4EeMCZeR0ETBQ2IhUnLyCIudXTGO0vs
 be/PkEgH8OCC3bjeW4urOW0pe3OH+CPRkRDbZtjdOqyi2Z9tOz+34iu+ipNtD2xS89mZ
 dJhQ==
X-Gm-Message-State: AOAM531LrijgMagIYwiL4fnjRn/i3iIc+w4ThNB9N0EPEW+OyIlSgRXZ
 4YB3ojC3kKpLx6UsyCX6AVgOYoi7zyt4Ow==
X-Google-Smtp-Source: ABdhPJz8mTuHCcmBh9+WOOEvZ8b8nZyoP5uFWMrrxqp55JZtM74zHQcxaIfK1syqrJC1GVKiBybGng==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr21958884wmq.166.1652097542369; 
 Mon, 09 May 2022 04:59:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/32] target/arm: Enable SCR and HCR bits for RAS
Date: Mon,  9 May 2022 12:58:31 +0100
Message-Id: <20220509115848.3521805-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c5e42bc08..b6faebf4a75 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1769,6 +1772,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5126,6 +5132,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.25.1


