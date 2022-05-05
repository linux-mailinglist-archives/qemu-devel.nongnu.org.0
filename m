Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA851BD3E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:30:19 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYkU-0000IT-5a
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWn-0005CB-CJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWl-0003C1-6Q
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id d5so5217645wrb.6
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SjjyaPs6OMir0qoBbc7kdJL63HtWlrJst0Uy7ZOsTsk=;
 b=XhGUE1qiNtk50sHhwvlqPT2YlWr7g7Szn1wqBbaZpDaDgFTyrj7nGnBOzf3Nf30EkO
 ADjVq22yTkYcg/25QBUd5CWhiutBFxK1aY5gi2LnLJoQHyNmMn0VXXtNNSlkHjeb4iiw
 vY+JuQXWFlrT0E6WFDqktkHiBh12EOO2ZFkthN9bp+wsnYoRlIwxaX1mS4yef7u4WM77
 6I0vXZljzs+HZ6IwTsKhYbp92Sy8kbYHnWbTDKAGHCru2Qzj78GjmmKNRv/JgxKPQFvV
 kJhp5NXdacbnyDwATvhttYgKQFMO95RpAb6mpq+QGygCquPmZOVYEsSqw5uugkPw3gKC
 XEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjjyaPs6OMir0qoBbc7kdJL63HtWlrJst0Uy7ZOsTsk=;
 b=EgxseGn4qYmyDYyvO654ptGAdGbe/6VzOyNLviYmV4so2tKYbz4qdAMnCrbXR+TJg1
 vHRrn0Qr8QUXd7/hE1kvN3GErqQOQD5bN/SyZ1YafYeySq4IXz/3Ah0Yx6QqLAXpgB9W
 cnO8frUuAkFhMa1qHv7n9htiWAWu0MGB0xrelzjccHIABhury1+wiPlV7GXfZld9dWCg
 HrBeSRg8F3ErxE0TAJUFFVMzmcMJ0A1uTFMpfoNiwiJ19hONK5ictxXPUnfMB5P/HbRk
 Xy16KU7tBVV2ZK1ktX4GCduoE2p+NwrBN/s0gnxMnOIpM4qkfUSAs2UA9jGa+3eob3oh
 7uBw==
X-Gm-Message-State: AOAM531jJ8P9iIf/WpiKhFJVGBOSbEQKElXtGbWZXriJEkWr/E21KwzH
 bvy7gXrppAGOqxc/XSpNfV1uDOD9Z6e/cA==
X-Google-Smtp-Source: ABdhPJzf9uOES74xHr8eU/FagYNiz9B9c7HVrM5QHZXXVMz3nBLgLk5p1uWzvsC5ty1ZtqeTvvssJg==
X-Received: by 2002:adf:d1e7:0:b0:20c:61a7:de2a with SMTP id
 g7-20020adfd1e7000000b0020c61a7de2amr14896318wrd.332.1651741922299; 
 Thu, 05 May 2022 02:12:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] target/arm: Merge allocation of the cpreg and its name
Date: Thu,  5 May 2022 10:11:37 +0100
Message-Id: <20220505091147.2657652-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Simplify freeing cp_regs hash table entries by using a single
allocation for the entire value.

This fixes a theoretical bug if we were to ever free the entire
hash table, because we've been installing string literal constants
into the cpreg structure in define_arm_vh_e2h_redirects_aliases.
However, at present we only free entries created for AArch32
wildcard cpregs which get overwritten by more specific cpregs,
so this bug is never exposed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    | 16 +---------------
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 602c060fff7..01176b2569f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1071,27 +1071,13 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
-static void cpreg_hashtable_data_destroy(gpointer data)
-{
-    /*
-     * Destroy function for cpu->cp_regs hashtable data entries.
-     * We must free the name string because it was g_strdup()ed in
-     * add_cpreg_to_hashtable(). It's OK to cast away the 'const'
-     * from r->name because we know we definitely allocated it.
-     */
-    ARMCPRegInfo *r = data;
-
-    g_free((void *)r->name);
-    g_free(r);
-}
-
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
     cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
-                                         NULL, cpreg_hashtable_data_destroy);
+                                         NULL, g_free);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2bc81dbc5ec..d92fd23445b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8506,11 +8506,17 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t key;
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2;
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    size_t name_len;
+
+    /* Combine cpreg and name into one allocation. */
+    name_len = strlen(name) + 1;
+    r2 = g_malloc(sizeof(*r2) + name_len);
+    *r2 = *r;
+    r2->name = memcpy(r2 + 1, name, name_len);
 
-    r2->name = g_strdup(name);
     /* Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
-- 
2.25.1


