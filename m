Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9536283D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:06:10 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTn7-0000cu-Ev
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThH-0003Od-Ry
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:08 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThE-0004DG-2D
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:07 -0400
Received: by mail-pg1-x52e.google.com with SMTP id d10so19803572pgf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAT589pnDxjsejZEwpNb+hvhHMZiaAtFUTqs+quVzLQ=;
 b=wV7ePzSdvnHVQJmO4USWdwfZ9xtnaLJ46EirDvOQ+qx2EOuTiPuDTKWLrDvKXEK2XG
 v4RL8Z+OPeJGMFQOfS4uDYaoJIBytDabgsPZIlfj66uE0BsF3uginvJ9VPFj5YP9bu+o
 5bzUOe4pgOKAK+zryPLNGjSFTEUYZHxDXgPW6mRxjns/ZpYfSui8HTpS+Za5DygE5P6V
 Zn7Ig7/N/jqYX+Cp6qoeJAxW7nKZbAf3YaWU338d5GLF3W4MkAwqx6OHN5Ne6tpCn2ql
 Bw9218ipWDTBm1B1au9NEpyuVbx3C1+gVtjAtvSwEwEyQORtf+3xhdIgBc+WdBE7592b
 +/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAT589pnDxjsejZEwpNb+hvhHMZiaAtFUTqs+quVzLQ=;
 b=TgoZGGn5SZdP8dQqiAVE3ZrWYlA7qwr9NhjdqPOi4sx3LQXTVi2unTQSa5N7GnuLZ2
 zMg7N5Yj6YDtWcwXWLnCrU1QqcJEMSVSJl01lgZxuRO/o0u7k7ROfrzT7AicjOQYylPO
 Wo5uxROQg1Isz8yRgY2nhUJllVV+iQae0q5DXFnGv89KnJvNpmnEcXCmXc+Qz+464uWM
 Byx+h3CLQbtuhpkblX3s3PJ0hKMm7WbLLxgWKyqZ6xTTNGUdvkHosbmGxH7aui7hjSgF
 SrBCNIYg6ehsFyG9OH295Br3pqTYUmQtds+rUjrxw1rK+r3HsM8RyIkKnhE26rQVPVtM
 0NZQ==
X-Gm-Message-State: AOAM530h2MhdyCb2tTaXfUF9jfSVbMdQsJrWTiPNXuFWir3uFVQD+HtF
 5MoLfxKQXPS9M9THHSJ0tilB/RvwXtNRjw==
X-Google-Smtp-Source: ABdhPJzoEy7UDP15V1An1i2OutRab/Gf1OzYY+blgMI+5QPosrV/wjvWU0rRUYROj2y7c2bm57yf7A==
X-Received: by 2002:a65:4481:: with SMTP id l1mr494882pgq.42.1618599602664;
 Fri, 16 Apr 2021 12:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Fri, 16 Apr 2021 11:59:31 -0700
Message-Id: <20210416185959.1520974-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7f..304e0a6af3 100644
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
index d9220be7c5..556b9d4f0a 100644
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
index 62b1c2081b..9feb572792 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8879,7 +8879,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
         dc->debug_target_el =
             FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
+        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
-- 
2.25.1


