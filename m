Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A657A61C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:09:38 +0200 (CEST)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrf7-0006Pm-SX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWL-0006BU-IE
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:33 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWJ-0006B7-Ua
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:33 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10d7170b2fcso4258156fac.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2zzB5VOxoMIq4rlx0ft919864A3qEcunZls1gpJJ+3w=;
 b=LlrG4I5J4vs27gH2iF/5t3mfJRafB3uRcKiumXfBHA3mj4qpVkYFtYzIRyDompge5z
 eiI7+7iXb4qTf8X4GlRf9yY6A7S8RBpvN4ZIU1jtBKuaYaynlxGpqfW/60PlNgmTO1wv
 9h38yHvHIrt2PdR7dP9UVi55fhmi3OpPB6OGOO/tf1mQ+FtHBeiJ23+jZg/K+3B4e/38
 gnVD8LlBra0vgZ6gXNi3TUAWyPx6rCsjMtU2+OiW+VZZXeHyugzF0L2GG4KN+wwp2sUp
 kImw0UF+OII97opOfVvoVHabNWJdXDT8HwYHO1ESCDnwGBb5lXlF8P0/CkYYmhEo7aot
 aJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2zzB5VOxoMIq4rlx0ft919864A3qEcunZls1gpJJ+3w=;
 b=Nl17WGQ+b3wH0wlwbI54r5RkYMyTNSnUmCThxmyo5El2zrA3FuKgwdp792StwyHue8
 fSuKO7ZbINsnGV5bhuGOzwI/rKX6905cu/Ywg+gFo9NA0k/mobIbucs1Cy0fQmyfybga
 vj+4D+Fhjh0U+Zlbt1HHwf5XckbHmIq7klGb6qeu95N1XiG1BFMIgmSd7hz0e0tNBhXF
 pwKHlrKdg6w2Zr/aZ3ahGhR4J3DENa6bTTGFoLVlUADBv+Pb0ZUs33vVzmMHFeauwgwR
 PO7GyPjD7zgBo6g4y8dDjwkVdhfqHVUw40OMe7rZ8TXRtaetbXo4r29Aq/tcw7zmVzzB
 RgEA==
X-Gm-Message-State: AJIora+SOPXXWBNBaXh3g0hvvJ1vLgHfG9v4iwPXqpk9X2qXpgaFoANZ
 yD6bvhGOFJBQTUwni1p7MLmwkFIWVJRxHNQ1
X-Google-Smtp-Source: AGRyM1u8SDIIhFB8l5vSIXGoSWScjErZdllSiJDstonmpd5bz6QfvC/TD8Xt593ftOqjDtstZSDd1Q==
X-Received: by 2002:a05:6870:4344:b0:10b:8499:395d with SMTP id
 x4-20020a056870434400b0010b8499395dmr353713oah.214.1658253629324; 
 Tue, 19 Jul 2022 11:00:29 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 05/21] target/loongarch/tlb_helper: Fix coverity integer
 overflow error
Date: Tue, 19 Jul 2022 23:29:44 +0530
Message-Id: <20220719180000.378186-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Replace '1 << shift' with 'MAKE_64BIT_MASK(shift, 1)' to fix
unintentional integer overflow errors in tlb_helper file.

Fix coverity CID: 1489759 1489762

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220715060740.1500628-5-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tlb_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index bab19c7e05..610b6d123c 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -298,7 +298,7 @@ static void invalidate_tlb_entry(CPULoongArchState *env, int index)
     } else {
         tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
     }
-    pagesize = 1 << tlb_ps;
+    pagesize = MAKE_64BIT_MASK(tlb_ps, 1);
     mask = MAKE_64BIT_MASK(0, tlb_ps + 1);
 
     if (tlb_v0) {
@@ -736,7 +736,7 @@ void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
                 (tmp0 & (~(1 << R_TLBENTRY_G_SHIFT)));
         ps = ptbase + ptwidth - 1;
         if (odd) {
-            tmp0 += (1 << ps);
+            tmp0 += MAKE_64BIT_MASK(ps, 1);
         }
     } else {
         /* 0:64bit, 1:128bit, 2:192bit, 3:256bit */
-- 
2.34.1


