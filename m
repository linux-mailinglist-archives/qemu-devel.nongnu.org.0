Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADA183680
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 17:46:55 +0100 (CET)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCQz0-00022b-U6
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 12:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxJ-00087r-8m
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxI-00050W-4w
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCQxH-00050E-Uq
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 11so6846076wmo.2
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QK4dzhyO4XfCFTtdIqIDvgzZK3gkopcUV7QImuCHmpc=;
 b=PDR9SCbR6Qs8mvA5YxLyiUyUPlyatvQr4afZ439jLUUUFa6WT2UGlJq3WUfU9IdZCJ
 UffG4oDCf4aS6xRbnu5JDXAEM9Ih5bnaaAC3ZbThGPB8xqlps+7UYGQHO8/XdGikjm5c
 ALDM5tfvApcJAv8Mz2HEVGwQZ11KpLXKyyJXUSIsjF+BsEI/MqfJqxET5RzOZYBz1e2p
 16tIJJAZNb7XAP4G91uqcjFKV0tp6/c5upOtGdYwCbP4EHrRHVdkOBtQcKzdX3KP4ytg
 GA46Wl/pQRNdAvx5z2QdSL4UiROlA3WfT2y4buZHFn3TjcK+H9f4ixsuTDXLclpFRKId
 9YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QK4dzhyO4XfCFTtdIqIDvgzZK3gkopcUV7QImuCHmpc=;
 b=M4AjmnqgFan3vdubNErgE//cF/Uiy5pYOrJm2TMm08t2bLMK//jTQAiil+kjAmoHIC
 0YjtXKl+AnsuGpqBWULZCqcIQEtCJeht84kIXxndnw5QHUhtTV/yeh6ZpW3Q2fdNQHwj
 X2o9RsKUhkHbBlxu5bPtqOsahAUc6YohnMBSiuPnwpo4+T818dcaxIzudpBEKkFX1HLD
 5L89DKKrnNey0wMY15KkGx1bfDludfY1crzxnp0czh3xxYSD+fhY2fX/qoBSSaG4PBS5
 lv+7vYSeomgtbbTqVuy06ItsHrSNFrbk1mofKNgrjy0OBf3ek1QsjF3xkClM8tacCwEq
 XQ/w==
X-Gm-Message-State: ANhLgQ27D3fWnzUoN3dXlI9rbEU+jRGhRlH+j+psFoWB3vDPHJZ55XQ1
 IC/Ld7PrEGiqBl15fWJc0p05FKOAMMtkcA==
X-Google-Smtp-Source: ADFU+vtDwSWvtmVyL7PB6weLNva/hrV0ozEobLPQj1t86f+pF90Jc/RE7V13BG9M/nfmtk27PDSSfQ==
X-Received: by 2002:a1c:9e85:: with SMTP id h127mr5427745wme.145.1584031506574; 
 Thu, 12 Mar 2020 09:45:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm36838640wrp.85.2020.03.12.09.45.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 09:45:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/36] target/arm: Fix some comment typos
Date: Thu, 12 Mar 2020 16:44:27 +0000
Message-Id: <20200312164459.25924-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164459.25924-1-peter.maydell@linaro.org>
References: <20200312164459.25924-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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

Fix a couple of comment typos.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200303174950.3298-5-peter.maydell@linaro.org
---
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bc64077ec7c..fc1192d1204 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12490,7 +12490,7 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
 
 /*
  * If we have triggered a EL state change we can't rely on the
- * translator having passed it too us, we need to recompute.
+ * translator having passed it to us, we need to recompute.
  */
 void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4715ca0d2ad..9f9f4e19e04 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7296,7 +7296,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 
         if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
             /*
-             * A write to any coprocessor regiser that ends a TB
+             * A write to any coprocessor register that ends a TB
              * must rebuild the hflags for the next TB.
              */
             TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-- 
2.20.1


