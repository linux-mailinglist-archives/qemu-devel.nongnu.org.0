Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC951BD1A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:24:27 +0200 (CEST)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYeo-0003Tp-Fo
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWl-00059P-Qb
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWk-0003IE-62
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso4709153wmh.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WcGb4SYoeOpCKBA3Iri0N3zedF8sXwlwuq0AwAakMGQ=;
 b=o9gsUH2dezjCiILvHhVjOm5314mwxH8xeSLTI+qdjVJCYlb//n03U7T51rsB90XEz2
 nQPlrPyfNrE78sE6f0uA/rls0lzTkbQlU157F0/EZF1c42A8Dpad7dTUAjh8iF2517gJ
 7iqIjGTv9a0qQTu31NUNU64qp9hBWiyHJl56IdeFbUyhHeyq/w2cKd7w1MnqKu8DcVTS
 Qtvu9iQwLWF7oROSLEJi8nXNUQ0Uk0qJ3mWhyoCbYq3F6B8ofwPOl6KEPvkm3bjWlSWs
 ELCy1o3z7FRzuKFG0Kt/AGoYW19E8lpGw2P1vdHZa/7QxXnyBcmtja4U6vxQeD6UI8Nu
 gcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WcGb4SYoeOpCKBA3Iri0N3zedF8sXwlwuq0AwAakMGQ=;
 b=TTP2eJiL5EFQLeiKYvLr4kjDJKo54Gc85wqoPkRtOLnb01n01yTxmpBS0YoeybTAE1
 vw/nFbg7+SBQ9wpffSeU8TwExyEjzkZX8OfBxoQxNlDe7tXtAlMBTFmEt2zRJQXq0NtP
 uoZFymyxCX5FmG+0KqwnUMgMM+WG1ktz8RMby0nQDWQCNgDA7Hks8y5vvHrcNWbJooWX
 +uIMxQ1+IDSgxBtNyU7uwgsV4YhEg2rGZhbg9rZ4hSqoLrrH0Jqo5ls9HP5cnXlYvyGQ
 XytEBzVCbN4R4zFFxexJb4PeZJO/sNxrcGyl7UXCumqGWSgvql9UFtYYicVCwThs7SwY
 IEcQ==
X-Gm-Message-State: AOAM530CVnCqCb5g4ssUY+CD/LAQ6ijWdJu3DsSvOfGhpBILramMT4JP
 OkBWqvx4gq7UlK46TDQMN2ndfnGsv6hV0w==
X-Google-Smtp-Source: ABdhPJxkIjRWJdUQqZCxAC1wvVbKNKeIBV+KpErgJnNFmWNP04thlT/DFgXILe87iel7sRDyRM9BmQ==
X-Received: by 2002:a05:600c:4ecc:b0:394:3222:23be with SMTP id
 g12-20020a05600c4ecc00b00394322223bemr3517218wmq.175.1651741920685; 
 Thu, 05 May 2022 02:12:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] target/arm: Drop always-true test in
 define_arm_vh_e2h_redirects_aliases
Date: Thu,  5 May 2022 10:11:35 +0100
Message-Id: <20220505091147.2657652-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

The new_key field is always non-zero -- drop the if.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-11-richard.henderson@linaro.org
[PMM: reinstated dropped PL3_RW mask]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50ad2e3e37b..70dc1482dd7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5914,7 +5914,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
-        ARMCPRegInfo *src_reg, *dst_reg;
+        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
+        uint32_t *new_key;
+        bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
@@ -5933,19 +5935,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         g_assert(src_reg->opaque == NULL);
 
         /* Create alias before redirection so we dup the right data. */
-        if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
-            bool ok;
+        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
+        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
 
-            new_reg->name = a->new_name;
-            new_reg->type |= ARM_CP_ALIAS;
-            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
-            new_reg->access &= PL2_RW | PL3_RW;
+        new_reg->name = a->new_name;
+        new_reg->type |= ARM_CP_ALIAS;
+        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
+        new_reg->access &= PL2_RW | PL3_RW;
 
-            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
-            g_assert(ok);
-        }
+        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        g_assert(ok);
 
         src_reg->opaque = dst_reg;
         src_reg->orig_readfn = src_reg->readfn ?: raw_read;
-- 
2.25.1


