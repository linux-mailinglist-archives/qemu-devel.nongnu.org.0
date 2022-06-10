Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75881546A3D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:20:13 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhMq-0003NR-7o
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBE-00089k-EK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB7-0007IM-Ir
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so1356349wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=73I9mSJrfj4k0UebE4ABLGvyy06k/REBdeI0QA2SvRY=;
 b=gU16C/hRF9+ZMUqcDr2hWmiSLj8MyVXhaZ668CS/QKMh66B0GoZQbfu7NY9PbodUsB
 5OGQxPFACryDOSsl+IxiwfAgzXhFhwau2/zrQY0bUX6oh6MFjcKfSCzSCreCY8+PeNMm
 rVhXIYRjzl3IxBJJFzbZqYfB20XpCA6ilGuePKsUp4Fv/1tEVv7Ime4VICtMXEZCDSr/
 ICnvkXyMRH+r7zhUKV87GDI9wPNg5b7ud8ugpXFBYIMKmfegahASb52N7pYZSwn0dSSD
 k9htR+PeLtVVpfUj5WSxTykjc8lbZVrs0pRir8zZCjJ+egWtEp+J7J60CEYLmuqDr1rm
 vTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73I9mSJrfj4k0UebE4ABLGvyy06k/REBdeI0QA2SvRY=;
 b=UPtU4ekJ3YmqVYr/ZrSnZUKzjMhvHr588jxZs2h3VIN3cccFhvrMswGnYYdWSC1WH3
 d03yfk4i015biCKfKajWZjejPH6bx5pcgPJamg4UF8tvd/5miDVwiVwPOPVPWwqAp4uj
 3iMsYr4wAc/n+vCSW5pcfiIMiSKO33eqnxI4536L5AWuCFO2vidsz7ETIloeeWXGZEN5
 XXNEEWa8Mnwy1Q44/5YLsdGC/9XzB/YbLi3PN3efzZ4X4gdmklTlEs5js1L2BV7TEi1j
 KrjgHFk8cCNJjvLxGvxB7Xa4MNyoETSHsWvMwqJSikGCJTiR1kll72TvwAnyiBYcH5sN
 /oRw==
X-Gm-Message-State: AOAM530BWexWkUID9fS6TBHbMC8Issua67DlZRqTbmN5YDAhze58IzQu
 Q2tF8Uc2/J8Zc0bqvMZYqIBJ6Xq4f8gtlg==
X-Google-Smtp-Source: ABdhPJwt56gFYmM7N8lRgCYRhhz9IYKzYBdQ0fedNshYD6uB9zTdETA6oWoxXkBp7ld0DVyd2daWxg==
X-Received: by 2002:a05:600c:583:b0:39c:3637:b9f with SMTP id
 o3-20020a05600c058300b0039c36370b9fmr445620wmd.79.1654877282949; 
 Fri, 10 Jun 2022 09:08:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.08.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
Date: Fri, 10 Jun 2022 17:07:36 +0100
Message-Id: <20220610160738.2230762-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
targeting such a cpu, e.g. cortex-a76, it is legitimate to
ignore the bit within the secure monitor.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609214657.1217913-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 161ac9fa2ee..df677b2d5d2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3854,6 +3854,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff9f9fe6ee4..6457e6301cd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1747,6 +1747,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         value |= SCR_FW | SCR_AW;      /* RES1 */
         valid_mask &= ~SCR_NET;        /* RES0 */
 
+        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
+            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
+            value |= SCR_RW;           /* RAO/WI */
+        }
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
         }
-- 
2.25.1


