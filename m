Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C936F8A8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:48:21 +0200 (CEST)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQh2-0006O7-Tf
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU0-0007Sk-RR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTy-0001Ft-Rp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l14so149432wrx.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tx1KqMlpbKJTay1wgKZV7vrwjIu05gATaQsruPdTpKU=;
 b=ytOfALO7bTb1dIgPzN/4c2Ip9xrHcXM/GdG3wLGP/sGje3ZriX1xrLPZUWmLf3PTbp
 XATL3BxPhQ2ovusxNoed7X+uSUnppmQJ8kQ0I5gmqhy9QgEohGGNl0IB10COUeGnygUg
 3c34W+JJoJXz9h7X2gCYYmsFzsZ9dXKnkdkBmawwk5yjteN51hnhQW8F2zs9KGk21cjW
 S7bxjDZiScMuoifD3WGf8/gvP4r4B5hatAAgtUshGIhAU0sZIx7UK0J77QIGEj7f0H/2
 +3mqYCVbWJPAl0SVEySA9WBKQJoCOXT80W00Z7gs5p6Bv9eTDSwNz5fdpIZke0COBx0A
 Ggjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tx1KqMlpbKJTay1wgKZV7vrwjIu05gATaQsruPdTpKU=;
 b=Ey3BcEoMDF3Sg8t/i6TADqmdOcoUkGmbBsU8eXMyoqefNUUu/5LBfVKgd3khzqDLRV
 Vfh3s9XnODWC/QEuLZ6Z9WHKobYXQW8v2/bvmWztuyH11hozA+bCt4JLBl5Z3XSG+Iei
 XMoo3EF+fH+dhHtQdI+OCv39+VYRsEFeHTzempRIZQ0ZkJ7yKaBQWQ412Q+6HLLEAwl/
 Imy9N39d3EtnKb4FRgD/aWFmvFJCtjBNslh4v/IMmYxrvvDESTzk6g+EC/deYhw58TD4
 65TCmhT6NVyAgarugRhXnn0BDvMEwfwTmuJIj4tvFsP/XZgu42IvFYN7nXj7gOB36r0f
 c0yw==
X-Gm-Message-State: AOAM530oHGAoU6Qq19a4tfoq4aD9CKQJ+oii0yLhqzyxU6IZbkLy76Sm
 K3tRnLGV9vvu/njxLpJ9969zpHDltP4F67fV
X-Google-Smtp-Source: ABdhPJy86vJrf0besTl0gXob4SQIcgTtqCHbmDZ8iSEZoaNtWLwXqjb6rlNjpUG03ytTLEZeRqEs4w==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5967933wrq.137.1619778889387; 
 Fri, 30 Apr 2021 03:34:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/43] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Fri, 30 Apr 2021 11:34:07 +0100
Message-Id: <20210430103437.4140-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7fa..304e0a6af30 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3423,7 +3423,7 @@ FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
 FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
+FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
 FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5a..556b9d4f0ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13003,7 +13003,7 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 68809e08f09..2de42529530 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8895,7 +8895,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
         dc->debug_target_el =
             FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
+        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
-- 
2.20.1


