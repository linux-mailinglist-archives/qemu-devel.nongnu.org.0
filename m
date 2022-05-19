Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BB52DC0D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:56:07 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkNa-0007qb-Nf
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0006GW-RN
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5B-0000rj-4S
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id t6so8207742wra.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cDg27z3KyHbPbarrHVcyFJzaD45Oepe53yYZfpMG7LE=;
 b=ZlRIbuI8lrw532z67hIFFpfziEMHYHtDIw3rR16lNaMAyBKwBvpMNu8o2dRCIzIBa7
 S4S8ZoI3OqQ+iYweK7QkXIDm8JBT3XsCDq895OZzh/vjhH7ouxLpHnfSfGB7BqRBDy9f
 uNYpK9DhcB3XyRw/oCoZgFjf+JZhrFzxlli591iHE9XunitQErumlesxWIwNRnF/t3uH
 i8sjHb81+knzgXnASw6XYRje5LiahWBoh3Fhg1HW4zWc0Z7nSi1FNiwvKQ2utYx0vUuK
 B5dmrgTphprNy+5tqkJ5lNgH1jtFP2aWNmwbXnNBsu7z31UZlQzJXw3m1pzPzWBq3cmV
 ApCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDg27z3KyHbPbarrHVcyFJzaD45Oepe53yYZfpMG7LE=;
 b=Nyb9ctgeQzHUKil5+fHPh4iE/Qq7fQTylM3Z6JbIE0kc2k0+Ocn6rlucNnscd6n6JB
 QTP91ju5dPR/hT62Ub4OhluCARng4Warm5cu860qGNPkhWkQa0ePHXLmi7ADMd3YZM8t
 WAUQAWiL8KLad+S1V/TUl0VIJbb8fbhwOROgOZpp5H4ZcWqc3gvIKAHVFupjVE0nzzIg
 8s4wy0DUPB5dK8QYApxVhDwfH68KKDk4xAI7W/SHNoa71Wv2ROSYJa3EWyAUppsckh46
 2xQ5evxe0c183jmu+5H/p+5wb0QTo5Ch909dS2ptL3zlEbUrKdubGYCjVw5h0zu2kVma
 FYSg==
X-Gm-Message-State: AOAM531i5UNkBQ3n2tiU61FmSuU4NnRIGbMJhcGNdF6+EDAKDeLCFGXa
 FQuHSCgCBfv9mnRYHfsRWZaFmby5zH6Q/w==
X-Google-Smtp-Source: ABdhPJzlk5zGWEWFBWwaER5v8ogdeFNwml+6u6OPeB9o/wbbIk+LZjQmukIzEchqs1ce14qqfSuy2Q==
X-Received: by 2002:a5d:6286:0:b0:20d:9b5:6a97 with SMTP id
 k6-20020a5d6286000000b0020d09b56a97mr5042200wru.165.1652981823828; 
 Thu, 19 May 2022 10:37:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] hw/intc/arm_gicv3: Provide ich_num_aprs()
Date: Thu, 19 May 2022 18:36:41 +0100
Message-Id: <20220519173651.399295-13-peter.maydell@linaro.org>
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

We previously open-coded the expression for the number of virtual APR
registers and the assertion that it was not going to cause us to
overflow the cs->ich_apr[] array.  Factor this out into a new
ich_num_aprs() function, for consistency with the icc_num_aprs()
function we just added for the physical APR handling.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-7-peter.maydell@linaro.org
Message-id: 20220506162129.2896966-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 66e06b787c7..8867e2e496f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -49,6 +49,14 @@ static inline int icv_min_vbpr(GICv3CPUState *cs)
     return 7 - cs->vprebits;
 }
 
+static inline int ich_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of virtual APR registers (1, 2, or 4) */
+    int aprmax = 1 << (cs->vprebits - 5);
+    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    return aprmax;
+}
+
 /* Simple accessor functions for LR fields */
 static uint32_t ich_lr_vintid(uint64_t lr)
 {
@@ -145,9 +153,7 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
      * in the ICH Active Priority Registers.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint32_t apr = cs->ich_apr[GICV3_G0][i] |
@@ -1333,9 +1339,7 @@ static int icv_drop_prio(GICv3CPUState *cs)
      * 32 bits are actually relevant.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint64_t *papr0 = &cs->ich_apr[GICV3_G0][i];
-- 
2.25.1


