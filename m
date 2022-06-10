Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A83546ABB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:44:47 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhkc-0008CF-Gc
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBA-0007ti-4Y
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007II-1A
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso1368130wms.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jGmiRIM8sBqhYKDszmqKuZEm8XU+zLyNsnQMu6jqnPs=;
 b=nI6/4LpFo9PElCjcf3klAgDE7gvQAMEzueqvJ6apFClQjrkAgncLxFWA8nuGSTTEoA
 9cafNiYv/y/SbGl6SeSfSq1HKgjtdhp490haXV8AseqH/Kp0qp4BkskXeazs8WZbW3Hc
 mWg8COYkaE5/tN8mSj2v00svGFnTUDBGNzj7v6K7CEin772INXkkjWm9iEjmQMjOYDob
 dt2etacNemtxC/RfFgVLpOkeEMT8O3KPYx4wwmG6B6CdE0IkRUueYzl8+Jxchw76BwGm
 uxrpHi9+/YdOUbJWk/179hlpzV+fTQWNJ+79IcQ5wWltg4wcrEyWFe9xqS5Z0BYC4CKJ
 qgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGmiRIM8sBqhYKDszmqKuZEm8XU+zLyNsnQMu6jqnPs=;
 b=gYlqR5a56I92+XMOsXaa2DRlGlk/OmhW/l/mIrWqJlEUYN4w2w8CExCbYhKtvokQZH
 nzx2nYW4WuAKkW37gub6Mw9FARuKPGl8jmdXFLPd/jbIfuADGyDk7k2MJIld0MiMej2I
 phyLALtnK57rjC8XbT4LKIGluREDUxH49kQOBDiqXRltXX6cT7ylJ+wkkGhSjhiIWpff
 Nr+6IRCQ44yf59pViZnW0r5153wYOwEndAvM+nNk/k1Bhw/2HTFgut4DiXXkJRHzhHgp
 52TOS9e5ccPE3KnnxBeHQbUYCOkA7vCJVcHwKkLzb6zLj9vx+W/+S9qqseLgOoncqAlI
 WoPw==
X-Gm-Message-State: AOAM5338CnJsNI0ZoV7KDr+MzuoEcL0y8RtyVYmWxzupj0hj1DcShXeS
 RiTtlJKP2cVq2+uZqjSJFj+X5jR9Ynu32Q==
X-Google-Smtp-Source: ABdhPJxL6Pbx2ClP/KSG9iAEUufVG+CozedWfdnAI7huvwUtBILDHxI+AZPYkIvfzgaL5o2O3Qhffw==
X-Received: by 2002:a05:600c:128c:b0:39c:4c58:f37a with SMTP id
 t12-20020a05600c128c00b0039c4c58f37amr469824wmd.7.1654877282255; 
 Fri, 10 Jun 2022 09:08:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.08.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] target/arm: Adjust format test in scr_write
Date: Fri, 10 Jun 2022 17:07:35 +0100
Message-Id: <20220610160738.2230762-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Because reset always initializes the AA64 version, SCR_EL3,
test the mode of EL3 instead of the type of the cpreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609214657.1217913-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b95aa534741..ff9f9fe6ee4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1738,12 +1738,14 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (ri->state == ARM_CP_STATE_AA64) {
-        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
-                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
-        }
-        valid_mask &= ~SCR_NET;
+    /*
+     * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
+     * passes the reginfo for SCR_EL3, which has type ARM_CP_STATE_AA64.
+     * Instead, choose the format based on the mode of EL3.
+     */
+    if (arm_el_is_aa64(env, 3)) {
+        value |= SCR_FW | SCR_AW;      /* RES1 */
+        valid_mask &= ~SCR_NET;        /* RES0 */
 
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
-- 
2.25.1


