Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DF55B926
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:32:32 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m2g-00039w-QN
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltH-0002Ib-L9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltG-0004sC-4R
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:47 -0400
Received: by mail-wr1-x429.google.com with SMTP id i25so6823011wrc.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kS8fRWuNDkuiztpWqjEa2CzwXqjYXf6gCvCK68jBTPg=;
 b=BzMjXpTnG1r8sIb1BY8QHBRR0Xw+wDPzgOa8OO8hbe8S8eVBtqYMwcTsrAruC5dxVm
 7ZDknc/n1/YeBieAqha7/x5ALaZ7TpQaWA7dfOGomL4J4tPxMcQuPyfpoSoH/ExT+bhR
 UwpJOpgjL4X5cOuDWwodgFl4gFkmbBpouYQ39f2a4RACKNqTZW8y06MYE1nidDz60YOZ
 DrnBdhzBv/cC69dr5JQuXSjjzswrC8SMsLNFPb5zF7tGFYwKYt0NX10l3BK3+cUsBJDd
 rhT51pJbPd1lfmFMiC77sU8AL7Gw73Ml5IjCT15z6+tTQLkFcQlBCJ4eqyuJMe1vwLOl
 5vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kS8fRWuNDkuiztpWqjEa2CzwXqjYXf6gCvCK68jBTPg=;
 b=1zkwcglAIPzsOOZJWEbndUwVx5KG1mmoaix4mkDesK3gJ3kphRbFWvDTwmkdTr5gqV
 vLap3wyaOQN7VdLZfCyc7TW07z6cKu5Lc1hWe0FkiEpKDYkG+SXXPjGFF5yzkUSOH75t
 DmQGpnPV+qwvJ0ZZ9me3Qc4NawIWJ5IoiTLs/unj23VMZvBQqzHaMeQdpJv/jc97EfQK
 Q0vuZTxKEVaNVS/XmxYrmAQH2DCy9vJ/Kz+/VeBoZrWid4QTYK11QH9OZSNPN/uu+nsg
 gmcfu5vcwfGrCslHHOQ3ENnP8ukzaIuAheV75TyOaOg1JSecSNIf7hNXFoS/eHRgD3Cy
 Vhkw==
X-Gm-Message-State: AJIora9Aalv8GS5xEx4hcIl1Y8JDtbnsOk/xLxrioRQZyGcNuqy96oLK
 8WwLoskeVzT+v/oJOVp/Jv9K7st3utRA6w==
X-Google-Smtp-Source: AGRyM1sTYthDP2VNi0TICMi6fmghEunuCiq4FUSLfHkKVdbJSf8ql4IvKrj6v9WEDhW0vgd92frHvA==
X-Received: by 2002:adf:ecc6:0:b0:21a:3dca:4dd7 with SMTP id
 s6-20020adfecc6000000b0021a3dca4dd7mr11256268wro.366.1656325363718; 
 Mon, 27 Jun 2022 03:22:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/25] target/arm: Add ARM_CP_SME
Date: Mon, 27 Jun 2022 11:22:18 +0100
Message-Id: <20220627102236.3097629-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

This will be used for controlling access to SME cpregs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        |  5 +++++
 target/arm/translate-a64.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d9b678c2f17..d30758ee713 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -113,6 +113,11 @@ enum {
     ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
     ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
     ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckSMEAccess().
+     */
+    ARM_CP_SME                   = 1 << 19,
 };
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9a285dd1774..8f609f46b6a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1187,6 +1187,22 @@ bool sve_access_check(DisasContext *s)
     return fp_access_check(s);
 }
 
+/*
+ * Check that SME access is enabled, raise an exception if not.
+ * Note that this function corresponds to CheckSMEAccess and is
+ * only used directly for cpregs.
+ */
+static bool sme_access_check(DisasContext *s)
+{
+    if (s->sme_excp_el) {
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_smetrap(SME_ET_AccessTrap, false),
+                              s->sme_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1958,6 +1974,8 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.25.1


