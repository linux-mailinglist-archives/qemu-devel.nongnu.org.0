Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879C510360
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO83-0006JB-7R
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5U-0002vW-9c
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Q-0003lF-49
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j17so18442209pfi.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaB7fhzMyy2+IqbDxRpXo2ZA5fKxHogw6KAk6LVPn8c=;
 b=i3graDJfIREqFUYkftKwnhLy2jnE1kl0ib8UbRAgwNs/Vk6wLFQtP+JvjC12/pYWDJ
 8dSIDsHTdB2ze9ATUJQVS6xEGD8HPiuDQDkvXu6h4QfeW+Whf1dDM4uCVBZ41MF4czdI
 xMxuBhMqIb9VUjxFm8llU/G1DKVICnO85hiIupMfMLAsoFPxc6kyNZzIv70kadzER+UD
 m1tRxSggVNL80uCPAJWdgJXlVcTBb5yZngwCDqdcWqUcQErOu97GlCYSCWbQfFQ0YgzG
 sC/ldIOsND70468khiRJ/xuq4sTDAC4dhPLID+RWKPZUotk1BSfcryh3VvyLhYzU+Vki
 j6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaB7fhzMyy2+IqbDxRpXo2ZA5fKxHogw6KAk6LVPn8c=;
 b=frJNW6t/oY2dj/VNye2sGSugpy7iagicK/xVxPxrX8UXGYNwtRzG/qwbTRmqYC6d9E
 X5VqdwFrYd34aY28PwX8CBWcuAH2TkPiRaG67BKf/pEGEYz+H7wVi5yaQ1L+6BNH8YoT
 bfhyr0Xrt4aiSrNe3JIj+hfjHeIEA4Pk9UP9B3YaLWo+puxqcEbo3Uc80iUl/mx5tWDr
 Id00UG055XoZ5fv2RCpZwAsg9iXhA6hvOR9t5GUPuygwV8sqe7cfvO4of7zSlaRSgm6V
 /b2tR/jFELn5vAkN9sd7aV5gM9i81a4a9rA1JbQazXKz0YJJLBo22J7gMtnawSz3ycR6
 9uoQ==
X-Gm-Message-State: AOAM531IaaSO7JXlQ1eaFMTGp9o9qtLlV4gbuYMlP9Dc9e/PTnItIIX9
 BuktpPSALs5o9qqg1XhygLXcTq/qfyEtKw==
X-Google-Smtp-Source: ABdhPJzXqgcGRVw5d9luY62RU4crT8c0lMRV5uWayGZGiGKuKGh2t9J3j//eDTPwHMTuJ6SAx03iCg==
X-Received: by 2002:aa7:8e44:0:b0:50c:fc0e:8d25 with SMTP id
 d4-20020aa78e44000000b0050cfc0e8d25mr20068157pfr.81.1650990646223; 
 Tue, 26 Apr 2022 09:30:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/47] target/arm: Use tcg_constant in gen_probe_access
Date: Tue, 26 Apr 2022 09:29:57 -0700
Message-Id: <20220426163043.100432-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index adbcd99941..c6ab0433af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -240,14 +240,10 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
 static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                              MMUAccessType acc, int log2_size)
 {
-    TCGv_i32 t_acc = tcg_const_i32(acc);
-    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
-    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
-
-    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
-    tcg_temp_free_i32(t_acc);
-    tcg_temp_free_i32(t_idx);
-    tcg_temp_free_i32(t_size);
+    gen_helper_probe_access(cpu_env, ptr,
+                            tcg_constant_i32(acc),
+                            tcg_constant_i32(get_mem_index(s)),
+                            tcg_constant_i32(1 << log2_size));
 }
 
 /*
-- 
2.34.1


