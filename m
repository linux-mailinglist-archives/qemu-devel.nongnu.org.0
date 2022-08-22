Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9459C450
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:44:06 +0200 (CEST)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAWz-0006KX-B2
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9On-0004ga-Dd
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oi-0001dk-PS
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:33 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y127so7716257pfy.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YLRJNbQ3E77TTRtGqNy9Q3lDjAcTISkeMsUGwY5ybLI=;
 b=ue4DIYW8qU+umDSf7jdtVrDafEpAJSfykiE58J0UmH57HyuSVxLxhsRwavU5cjXVtD
 ZAP7G8J9+EWzD7+eUg5KqWFXm2TRUNXzdYhpgliDXNqhxEaLCCAEdBknv2oODmNl0oUv
 0RZGI1WGRkT4/h3q9hdnAtJJynLHY1BQaQeHDuGa+5xD3gblCk9d9Wvru0qgfvCcmJqA
 GH1NJaJej7Yo8W5S763WbdJ6liH716GoH9d72io2aOk7CNLqDnKQLlqKSZ3pqTl7fzsM
 TVkdgVyjFUfnXglR84SAvfA7CoPzQe+CNMFwRa3fgtlt3F6lzezOvYAFsmhDJZ0Npefk
 misA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YLRJNbQ3E77TTRtGqNy9Q3lDjAcTISkeMsUGwY5ybLI=;
 b=I4InAaH5Eqfqx1rrs3HLtXfHnGY0le8Ue7II7M2MVFfNNOOcIiBsTnntfDm+MqtWnW
 4xih9BJCpdzUtdCQ2klSLBYe4POMhZXfjTL6uUfFLa5+wl2OSMSXmV1vIJovWbH+ZK42
 3roBoMNvy1csHcHofDsZkf+hR0i5ooznxLOY15RCaYHImSs48dOBgWkWVLftPNKbFLbz
 /Z80pIxTaIGUu54/pqcHqLxmxMy429OqZjL7Wnwt4nBJQTd09csgbWpMBRFKbpQjKYcT
 rwdpy5F+Ox1PXBh43g39d9NWXSDLz2XuYds/CcaBlKXxDqOV4OkSz2D1V0TSImWLi0g+
 FqKQ==
X-Gm-Message-State: ACgBeo3+Bp7rPuDmvA/+iq5YwNYUmZnz0Ox5cBJfuIR6SFvCw/nkPjkI
 qzqcX/LEJCD0nxkDpR8VP8d3fYdUVn4xBA==
X-Google-Smtp-Source: AA6agR7cCJ2tkNOHngQ+86M9de1e9CvxfnEU4gpmxLFtNDqERDYkBdd2VteIK6dfkHLWPuDKPNatIg==
X-Received: by 2002:a63:e342:0:b0:42a:411:fa34 with SMTP id
 o2-20020a63e342000000b0042a0411fa34mr16628730pgj.89.1661182286506; 
 Mon, 22 Aug 2022 08:31:26 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 49/66] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
Date: Mon, 22 Aug 2022 08:27:24 -0700
Message-Id: <20220822152741.1617527-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
Flush the tlb when invalidating stage 1+2 translations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 20 +++++++++++---------
 target/arm/helper.c    |  4 +++-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 98bd9e435e..283618f601 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 10
+#define NB_MMU_MODES 12
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 76391dc47d..4ab0cac8b6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2963,6 +2963,15 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
     ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
 
+    /*
+     * Used for second stage of an S12 page table walk, or for descriptor
+     * loads during first stage of an S1 page table walk.  Note that both
+     * are in use simultaneously for SecureEL2: the security state for
+     * the S2 ptw is selected by the NS bit from the S1 ptw.
+     */
+    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
@@ -2970,15 +2979,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    /*
-     * Not allocated a TLB: used only for second stage of an S12 page
-     * table walk, or for descriptor loads during first stage of an S1
-     * page table walk. Note that if we ever want to have a TLB for this
-     * then various TLB flush insns which currently are no-ops or flush
-     * only stage 1 MMU indexes will need to change to flush stage 2.
-     */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3009,6 +3009,8 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(E3),
+    TO_CORE_BIT(Stage2),
+    TO_CORE_BIT(Stage2_S),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 887f613b40..765638f002 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4236,7 +4236,9 @@ static int alle1_tlbmask(CPUARMState *env)
      */
     return (ARMMMUIdxBit_E10_1 |
             ARMMMUIdxBit_E10_1_PAN |
-            ARMMMUIdxBit_E10_0);
+            ARMMMUIdxBit_E10_0 |
+            ARMMMUIdxBit_Stage2 |
+            ARMMMUIdxBit_Stage2_S);
 }
 
 static int e2_tlbmask(CPUARMState *env)
-- 
2.34.1


