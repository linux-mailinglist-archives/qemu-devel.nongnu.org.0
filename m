Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312359C390
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:59:44 +0200 (CEST)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9q3-0001Lq-4l
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LM-0007Vk-N3
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:00 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LG-0000iG-OZ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id jl18so10251796plb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1eh9DETdW0GbelT1RBsxHXY98fMacnuqD6EL7eauGgo=;
 b=uh4Mnjf1Tj+JoUM49nZJOdbZYwEzSE4XOAJOFM41uoIBywpVKK/exeLo8jOe6skHvu
 i36lc9g8D4KhQzmo/1ZNbDL+brtcxOig2A2vi3SsEiHiiB6snnwaMQyrfE1b0CcW+ID7
 GcY9pN+vFTSXBYe8AVfvtXlGFFh0k5zPplAsCuMQttK+ZluAFA8dyRY1skHe4Ns5r8c6
 PzHsVi6Ss+IxbVMSAJAfaxvymEmjzi9YHby5ioPYPSFkGDrUZcJDf9s26WPch5pPz8A+
 TBMZnSZsyh198fapgEb1yEE2cwL6NoqRAoSqdHfr3F1MqBwCYbUqSM6aG3HXEQrsYKxt
 QtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1eh9DETdW0GbelT1RBsxHXY98fMacnuqD6EL7eauGgo=;
 b=k7S2ub+mQkKdXSWg88IwmG4S2E1A0FwJxDlIZbi32ohvgCv8caatRariTcILFsZoaN
 jRXe7LsXhwAUYsKHMSOKuuk4/oWFZkL4ReGrP30PuKGtQI25DCCNR4rReb1kMR0bb0wI
 R9tQe/ursDsNRx/w+rl0cJsTSDx1WDGMgLrj+mnaPoFY9qg2GyVQetNzrLzr7mH5BHyS
 FmwkBJZkAUwStdhzhsNc1JJ2jneCEgvRY9aW4Th7G6r6SzofEH9UF4YaHS/sO2yaK0C+
 6fYZ8zjyFmI9E6fsloS3rp38qqE6rsOw+5CMgA/NGzjhRv3D/PHdSvb5hqXGBjHxDSN+
 Nppw==
X-Gm-Message-State: ACgBeo2KvKZ2RWpVHxssfbC0Ef/n+lzzC07/Hd8QLU4JUDzlc+ZMnhKZ
 ldQfvA4MuvgAtWUvj6q9pthrTUenruoNWw==
X-Google-Smtp-Source: AA6agR7AVDO+glixXjDV2C+oRmQe/mMbmMIZpxCh5XFb5Rf85NI1VvTYUITWJfUlXZ+XoOiWBCq8Ug==
X-Received: by 2002:a17:902:d48f:b0:16f:a73:bf04 with SMTP id
 c15-20020a170902d48f00b0016f0a73bf04mr20911488plg.43.1661182073118; 
 Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 13/66] target/arm: Add is_secure parameter to
 get_phys_addr_v5
Date: Mon, 22 Aug 2022 08:26:48 -0700
Message-Id: <20220822152741.1617527-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Remove the use of regime_is_secure from get_phys_addr_v5,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5628581ddc..4609278b42 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,7 +414,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -433,8 +434,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -472,8 +472,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2512,7 +2511,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     }
 }
 
-- 
2.34.1


