Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB551C9AB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:53:39 +0200 (CEST)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhXe-0001Zs-PH
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZP-0003r2-M5; Thu, 05 May 2022 14:51:23 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZO-0004q7-4f; Thu, 05 May 2022 14:51:23 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso3518570otj.5; 
 Thu, 05 May 2022 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgoxkURypwIbLDY3Z92W4Ub2bDcBdBdi030FbyLdqy0=;
 b=SLjoowvCQK6I00DNrQeMVycZGBtI1XckgfNnpLVUMUQJ+blbLOvcEUnQWIa5KRUEBA
 k5qaQDvXzFN89GmKRDS1lePw5LGA3QEgtwaBBrrHneazxNyfsT70KE8tZ4GOXX4Ycdv3
 je2OZQ3+uHnQRnUP98B78QfQg7yidA7S95sl3F/1IkbVH0aFhZujlU/Q1qJjTWK6V7lM
 tlRJukOXi6GwGOLhf0pAZ7vHUDQvWbcjMzWIS8NNlDj8J/D8vCgHSAjOHq4LdtfyrtVq
 hbP7K8d++WdIV4Dew7yT/JVIi28wuk6wZmQ4LgLHcKFTzC/ZkJLIJf8J8bdQHl2VNJYs
 iusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgoxkURypwIbLDY3Z92W4Ub2bDcBdBdi030FbyLdqy0=;
 b=PdAj+W+FUeNe/FSNap2iCekfbm1W/r9GYbPNln1LCmg3imYPj1y39jfZwvo9kTNTl+
 2RewSS/tTWc4jM6mjKQHEEFhX5cNmZzl/yc6lfhqxFG05/gyaM8mu7ypn3OI/gzlpCAF
 YH8M7p+XgBZTsY+pM6ZdQ1kczntsiDL2cWx9F8CuXChthsvILpyAKvQoE8T2vIENLM9a
 T+MUGLIT/5sQ2+6oIorkQIL0Pt2JrDCw/el2pIlPTomS2Fb/kXoh+C2VirzCWI0RJOSn
 bYVJ4USlxaDctWjkdtwKPB3YMCjk22twW/zDnTKjiOuGUXYgYlIWDLxeLuNauJJgBVpI
 rWrA==
X-Gm-Message-State: AOAM530Z6cqkTxc/00ecNwHfvCZ1vYZjUpsdNfOj58KVIfG3LBH9JGZk
 mNWjDQ5WyT7yz7xmxKwyl3AyMgQGiwU=
X-Google-Smtp-Source: ABdhPJz3AqVZYSVB4TspzCL3goVvodPDVmSLhJFw4xZKQ2VUMQ3a+ob3CqGId4WPBTdMfx3SRh1i/w==
X-Received: by 2002:a9d:f25:0:b0:606:1c42:6b49 with SMTP id
 34-20020a9d0f25000000b006061c426b49mr7297249ott.368.1651776680705; 
 Thu, 05 May 2022 11:51:20 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 24/30] target/ppc: Remove msr_ep macro
Date: Thu,  5 May 2022 15:49:32 -0300
Message-Id: <20220505184938.351866-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_ep macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-17-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 2 +-
 target/ppc/helper_regs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cd672dec93..5e804f0373 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,7 @@ FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
+FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
@@ -486,7 +487,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
-#define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index b150b78182..97cd263131 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -240,8 +240,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         /* Swap temporary saved registers with GPRs */
         hreg_swap_gpr_tgpr(env);
     }
-    if (unlikely((value >> MSR_EP) & 1) != msr_ep) {
-        env->excp_prefix = ((value >> MSR_EP) & 1) * 0xFFF00000;
+    if (unlikely((value ^ env->msr) & R_MSR_EP_MASK)) {
+        env->excp_prefix = FIELD_EX64(value, MSR, EP) * 0xFFF00000;
     }
     /*
      * If PR=1 then EE, IR and DR must be 1
-- 
2.32.0


