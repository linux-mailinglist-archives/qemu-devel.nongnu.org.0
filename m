Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF51BBFD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:27:03 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXlH-0006mW-1Q
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWk-00055A-7r
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWi-0003Hq-KO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id j15so5248983wrb.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N2UffwlLDOoC/zClIRs7vxRVjajQoB+uc9PlF30Umps=;
 b=YtYd66k6pBaf1JcEAJdQEzT0zTti8Nu2hRbQ35Ev1CY14Y7ZXeLjF9tpdirNKhgHq3
 9k6P1fRHhv4Dsye8LQV6gbxjZsIONEYOMluAjgdL3J+Jg6zNyF4YfHF6jImSNAwvvtYl
 0hC91ZYHVajScp9mVHeuki58nnRcOgYct2oF3jKUJUhRVDupKT1ndEbMtigdDn7GxAun
 FpWeUt8zzgKU5wxEGbnsljEM7KHMU8oMXvMhkJJ11TQSGSLNLIXyUjSTs+eNlIq0z0I/
 8Kp9jKPltVNbdvkjA0TG151j6lppf3PhpRWkGnidEufM83qn21Km9kyyWHTYy+r2x8SJ
 PP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2UffwlLDOoC/zClIRs7vxRVjajQoB+uc9PlF30Umps=;
 b=Afv2/boZ6o/QwxlARWRgpmQDRbnHBMiiecra0rZweOQdwFGrwCHPA73N5S6JEYXLUk
 4ZyBpHnnQ5ZAVUMHNJg/3O1MqhD9npqMOV9ynlyiXfGccNKN6t/RYvaC2EyJHewc+PJm
 pTNIw2rRxtmfoM9YmuMFSczIY2AbXqv12jHItTGai7j3H17Bni1lNxrK6ERnPgdEg44O
 +882+C2rDlW4dwd4BcEB6w5jDoqy24qekR5lSG5pThbYvH+ae7xW6gx+PNiqgJf9RSPm
 60zNmQnDxXw/czxA227ZufxTx7UJ2AoEQqfdDzaHk0CjHl7GT//y6xAgSboEpLYL02cF
 anAQ==
X-Gm-Message-State: AOAM533DNGRuKJ5TLHZ8Np6qOBPhIpMca7KuiH/71oN+X9qcVQPmaxGE
 C4gvpiRJr/w+d/Kz5OtpiwpGSOJt2YkCCw==
X-Google-Smtp-Source: ABdhPJxJc5wWBIAx1UADiKNNAlSq1zMvOYFNuru3VpP4WA7Ii7vOkwwGcKz8gVFIFlj5oRQhH0l6xQ==
X-Received: by 2002:a05:6000:156e:b0:20c:5218:8907 with SMTP id
 14-20020a056000156e00b0020c52188907mr19702720wrz.297.1651741919135; 
 Thu, 05 May 2022 02:11:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] target/arm: Name CPState type
Date: Thu,  5 May 2022 10:11:33 +0100
Message-Id: <20220505091147.2657652-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Give this enum a name and use in ARMCPRegInfo,
add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 6 +++---
 target/arm/helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 858c5da57d8..4179a8cdd5a 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -114,11 +114,11 @@ enum {
  * Note that we rely on the values of these enums as we iterate through
  * the various states in some places.
  */
-enum {
+typedef enum {
     ARM_CP_STATE_AA32 = 0,
     ARM_CP_STATE_AA64 = 1,
     ARM_CP_STATE_BOTH = 2,
-};
+} CPState;
 
 /*
  * ARM CP register secure state flags.  These flags identify security state
@@ -260,7 +260,7 @@ struct ARMCPRegInfo {
     uint8_t opc1;
     uint8_t opc2;
     /* Execution state in which this register is visible: ARM_CP_STATE_* */
-    int state;
+    CPState state;
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a19e04bb0bf..d560a6a6a92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8502,7 +8502,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, int state, int secstate,
+                                   void *opaque, CPState state, int secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8662,13 +8662,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
      * the register, if any.
      */
-    int crm, opc1, opc2, state;
+    int crm, opc1, opc2;
     int crmmin = (r->crm == CP_ANY) ? 0 : r->crm;
     int crmmax = (r->crm == CP_ANY) ? 15 : r->crm;
     int opc1min = (r->opc1 == CP_ANY) ? 0 : r->opc1;
     int opc1max = (r->opc1 == CP_ANY) ? 7 : r->opc1;
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
+    CPState state;
+
     /* 64 bit registers have only CRm and Opc1 fields */
     assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
     /* op0 only exists in the AArch64 encodings */
-- 
2.25.1


