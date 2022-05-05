Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47E51BCBD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:04:56 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYLv-0004hk-27
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWg-0004v4-GA
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWe-00039c-MM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b19so5210540wrh.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YjElCrdn3SbyJTPO/xD9X6anEjzd2DD/bUoEpuTw2Og=;
 b=jW9A5bjXRH+ElNJJaw28EZLD6vj/3dCXgloKdehl4ei/9aIz2JjIKj0MQha7UrzJNk
 0PxXdiCIH2F84AzOorgrluEpmhup0AEzBIT2b1nAjfsGvA316lQvwW4mLd1StDyYx/za
 DPCkbllE+aYCgzGVQ6RRzBCA4XWfkFlL3VD0A7DOl058wpZ+uktQt6G+XpTgAgt9deM+
 SP+5URG0pT3wBjdtDJeo8hsJ05TlIpQtKsUn2rFmNlAWrpGZE5vAUqsnE1tL76XEsI+W
 SnWyIkzG6esKXBSTK9vf7LLt2SYo+T+Z4OHKT4GMF38yFWjOqT4xoHoNrz1xO9iITpjM
 gVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YjElCrdn3SbyJTPO/xD9X6anEjzd2DD/bUoEpuTw2Og=;
 b=SpntCB5wwW8Xspp+Qe1mFELD48oLG5hQ3zOXv1kt9pauDRXHHxmKNb7iU3DUXWEiee
 0fBNlsmf2zjewMDpIrEiBDKGbBl2b/OBMcr5VpzQvTGbrg7us/Mtl2XOztkF7ZHfd0jn
 TJ15pgqRKgzndLHUFAXiN7zEX5OXZKlU3WM0mjJYFvJ9gygUD0oTjjaoZdBCf/di6GZ8
 1uINf7I9ngzR9EMp0dHC3kJJ39D/KOd0CrkFMFQCaUxFlq/X8l88AbvQicbJcccyVgQe
 iu79KWi/MpDJOOuBhazJ2n6IuopXDBWsm3j11zVWZkfrDs+aK6GDl7HMdzAwK17zGjD4
 ZMsw==
X-Gm-Message-State: AOAM531CoYpx5tMqhZg/p+oam217bcq1i10VrilPwdWporJgoJlRlL/O
 +pMhkEayggn2Y09uM7WfaFFXEIJMuxG9Ww==
X-Google-Smtp-Source: ABdhPJwh26tp5gPjQVDW8nnXX9xCUCZZezTPUJlPk0bxji4Kmp4ivWuGk7jgI+iULnYp3SUJCGwqng==
X-Received: by 2002:a5d:4f8b:0:b0:20c:6970:fb3c with SMTP id
 d11-20020a5d4f8b000000b0020c6970fb3cmr12687783wru.554.1651741915789; 
 Thu, 05 May 2022 02:11:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] target/arm: Make some more cpreg data static const
Date: Thu,  5 May 2022 10:11:29 +0100
Message-Id: <20220505091147.2657652-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

These particular data structures are not modified at runtime.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a68f14fe8e2..ca6ba9bd820 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7860,7 +7860,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = cpu->pmceid1 },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo v8_user_idregs[] = {
+        static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
               .exported_bits = 0x000f000f00ff0000,
               .fixed_bits    = 0x0000000000000011 },
@@ -8000,7 +8000,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_RW, .accessfn = nsacr_access,
@@ -8008,7 +8008,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &nsacr);
         } else {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR",
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL3_RW | PL1_R,
@@ -8019,7 +8019,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     } else {
         if (arm_feature(env, ARM_FEATURE_V8)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_R,
@@ -8172,13 +8172,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
-        ARMCPRegInfo crn0_wi_reginfo = {
+        static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
             .type = ARM_CP_NOP | ARM_CP_OVERRIDE
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
               .exported_bits = 0x00000000ffffffff },
             { .name = "REVIDR_EL1"                },
@@ -8223,7 +8223,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
         };
@@ -8302,7 +8302,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_VBAR)) {
-        ARMCPRegInfo vbar_cp_reginfo[] = {
+        static const ARMCPRegInfo vbar_cp_reginfo[] = {
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
-- 
2.25.1


