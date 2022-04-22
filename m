Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB850B5E7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:07:17 +0200 (CEST)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhr88-0005NX-SC
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAI-0005YM-Da
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAG-0002uj-3q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso4850292wms.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XMB2cuJAMepvczrd8k6H1C+FfGlgxfpWHFi4NbZyvtk=;
 b=SQkCOTVEJjf4QvNGEmezwwghpiaLVd2jQyJLtAzF/b/fXGT9oXNTkxqUZcgSsjakEd
 ZIQ6bonWeTDcTB8X/HswQ+zsnO6p+5f7Z9HuQvPYuZrNy/PLx4EAc3sTb//n1CM7BdSt
 fSsnepeLtOMlWgC80L1WJh3rDSSNvkP0VPRDroV+e75pkCHpddQejYLEK9l2dzJN3Shs
 kBc1eksNCBrEvxIW+tUKFF6lDTyaJ26LGwDH47EV/OnHUCRhS4olMCH/DjMv3iezHoQd
 4DP9o+A+HkA/9BpmygMRnjRLcPdPRVy/GEhqHOAZnlImdecnZWdypqfjOo/F2tlVMEBr
 siqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMB2cuJAMepvczrd8k6H1C+FfGlgxfpWHFi4NbZyvtk=;
 b=3wCkf+Cnu//u+N705ndKbqGXe9kqZVlII/dBHPyjh9VKWBoHwlOa6L2w6YnwiArRYq
 /F/q367JItIm0ciT4x/gdF8beVygc8xAH0a1fJS/Loprek0eg1HOUuXl6UCOummbbLL1
 bvgKvUGxk8jHMPp7WF6QFKIwgRXBlI4LLUDOJ0KBCYiw+N3Hy5Ggt6JJMPVEQ28MA306
 AnKEi9IfKttmsCcZCsR8sd32Dx15ycEvVaFSQqolIlkSb5NMRna/mbSz37GEVURRSl7T
 r4EobnPDD+QVZ/HmaNPrVi0Io+yOCtpN6uYFTRa4QjI4qcdWoK7NTYXMrG6rlCMh0rNR
 +ALw==
X-Gm-Message-State: AOAM5307NlEUG6pflODUi692ED4c7v40LLPkLoepAIp9NA7Go6lO5hV0
 QPncsUqkR9INsnYcfSzU8m5uyXpabOsAEw==
X-Google-Smtp-Source: ABdhPJw1sJAxC322OOh2R23hzBmylTEtfNOoIKLxzhv51U73tKFHzObTXQnkidxNlNdEQJXQhwQNQw==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr12283016wma.75.1650621922848; 
 Fri, 22 Apr 2022 03:05:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/61] target/arm: Split out set_btype_raw
Date: Fri, 22 Apr 2022 11:04:22 +0100
Message-Id: <20220422100432.2288247-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Common code for reset_btype and set_btype.
Use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1ae465687ad..13a3527345f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -128,29 +128,28 @@ static int get_a64_user_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(useridx);
 }
 
-static void reset_btype(DisasContext *s)
+static void set_btype_raw(int val)
 {
-    if (s->btype != 0) {
-        TCGv_i32 zero = tcg_const_i32(0);
-        tcg_gen_st_i32(zero, cpu_env, offsetof(CPUARMState, btype));
-        tcg_temp_free_i32(zero);
-        s->btype = 0;
-    }
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
+                   offsetof(CPUARMState, btype));
 }
 
 static void set_btype(DisasContext *s, int val)
 {
-    TCGv_i32 tcg_val;
-
     /* BTYPE is a 2-bit field, and 0 should be done with reset_btype.  */
     tcg_debug_assert(val >= 1 && val <= 3);
-
-    tcg_val = tcg_const_i32(val);
-    tcg_gen_st_i32(tcg_val, cpu_env, offsetof(CPUARMState, btype));
-    tcg_temp_free_i32(tcg_val);
+    set_btype_raw(val);
     s->btype = -1;
 }
 
+static void reset_btype(DisasContext *s)
+{
+    if (s->btype != 0) {
+        set_btype_raw(0);
+        s->btype = 0;
+    }
+}
+
 void gen_a64_set_pc_im(uint64_t val)
 {
     tcg_gen_movi_i64(cpu_pc, val);
-- 
2.25.1


