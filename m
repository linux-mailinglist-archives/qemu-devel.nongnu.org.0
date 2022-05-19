Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2E52DC03
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:53:59 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkLX-0003a4-35
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0006GO-RD
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5B-0000ru-VB
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id j24so8228240wrb.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SwlSNMVyYJRRVMWIULpkVvT++is//M7hOpaH8y7DNvk=;
 b=T+8vAD3htLu7gOSPfsTUx0o3faiJGffU8oPM9KCuabZpJifmzApDTtBl7E5BNEu2PW
 ah/xiKbtkBcI0V6R+G6kTJMxGD6Ajbl94kCDxcKB2vxG5daDWs6cmgFq0L5Ny1DsN/uK
 PNDBKUsrTLlsyJQWUaWhszby46a+gbkPbmY7wReljpy7y1N6rvNc9OncaWcVoxDVXhbM
 qpQaH2fH8YxRGdssE2KVID20PDbZXY6oV3geZ3b6uEHzX/VJRI+uNedSN/kJ8i3Izkmv
 QyMDC+u7PciC3F4ukXH4OI5g/cGhBV1vsGGRUPf+QHroqmaOnlVWtkdqOAUgHDa+oXkI
 hZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwlSNMVyYJRRVMWIULpkVvT++is//M7hOpaH8y7DNvk=;
 b=fUwARvSalpzG5G5/pxCz1t53AbmcaopzxAf2Y7ewLvunG1TWrARGtyp0fQop1u4ZnM
 VhmjK7+/R8JS0CNp0AiaFJuj685bNPQ5uoRPDQu75ocPaCq4+AMOa4ZFOTr5mv0Er7hs
 vF/OYMytOSFgqqcCQC19WdMECaYTwpE8jwunUl4XiVGcK6DwTaWpiGXNW8krLhFuikvJ
 w8rRUsPvbEGh7p9s40YTV5c/OqBPRxnq4h+M8yzXotSfpPkq4hxeDlbwl5o/CDYjkFrk
 V9K/azVip8QeIbooUBm0hpROHw6u+ZEnlmS+4zx7OfaucguiGFYcke0n1NOdzH7oqX6J
 USFQ==
X-Gm-Message-State: AOAM533zJsnyTYeL+n7PQq2DH+j6t7IgrCJWa7h2Fhq+qrNZaQMyEiWM
 8xkXB5n2AXrH2rMQKle4lFLIGxbANLTn4Q==
X-Google-Smtp-Source: ABdhPJwEFNtgXe5u1qkujCc0eIjqHrt8wz57ezxJZnNCBS34+ZG+zy23s7n/3d2mD34Qmi1AfMJZxQ==
X-Received: by 2002:a05:6000:1f94:b0:20e:744a:214 with SMTP id
 bw20-20020a0560001f9400b0020e744a0214mr1120228wrb.65.1652981824623; 
 Thu, 19 May 2022 10:37:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] Fix aarch64 debug register names.
Date: Thu, 19 May 2022 18:36:42 +0100
Message-Id: <20220519173651.399295-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Chris Howard <cvz185@web.de>

Give all the debug registers their correct names including the
index, rather than having multiple registers all with the
same name string, which is confusing when viewed over the
gdbstub interface.

Signed-off-by: CHRIS HOWARD <cvz185@web.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de
[PMM: expanded commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 073d6509c8c..91f78c91cea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6554,14 +6554,16 @@ static void define_debug_regs(ARMCPU *cpu)
     }
 
     for (i = 0; i < brps; i++) {
+        char *dbgbvr_el1_name = g_strdup_printf("DBGBVR%d_EL1", i);
+        char *dbgbcr_el1_name = g_strdup_printf("DBGBCR%d_EL1", i);
         ARMCPRegInfo dbgregs[] = {
-            { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
+            { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
               .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
               .writefn = dbgbvr_write, .raw_writefn = raw_write
             },
-            { .name = "DBGBCR", .state = ARM_CP_STATE_BOTH,
+            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
               .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
@@ -6569,17 +6571,21 @@ static void define_debug_regs(ARMCPU *cpu)
             },
         };
         define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgbvr_el1_name);
+        g_free(dbgbcr_el1_name);
     }
 
     for (i = 0; i < wrps; i++) {
+        char *dbgwvr_el1_name = g_strdup_printf("DBGWVR%d_EL1", i);
+        char *dbgwcr_el1_name = g_strdup_printf("DBGWCR%d_EL1", i);
         ARMCPRegInfo dbgregs[] = {
-            { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
+            { .name = dbgwvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
               .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
               .writefn = dbgwvr_write, .raw_writefn = raw_write
             },
-            { .name = "DBGWCR", .state = ARM_CP_STATE_BOTH,
+            { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
               .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
@@ -6587,6 +6593,8 @@ static void define_debug_regs(ARMCPU *cpu)
             },
         };
         define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgwvr_el1_name);
+        g_free(dbgwcr_el1_name);
     }
 }
 
-- 
2.25.1


