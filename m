Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC951BD5E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:41:57 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYvk-0006LC-BQ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWr-0005Gf-7D
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWp-0003Hq-0O
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id j15so5248983wrb.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W8ytmsmn3zVtAhYPboUfBL7b0W6ZRe4BJqXc5Vj3xX4=;
 b=zFiiWBkq8fnF8dVkVi03MYDwdZlhu92NT2zZQ328Y9Z2MZfrRePJAaua42XgFsR1pX
 TLqiFYyvSF8NaZmo1DkZY+IbVSjuFypydvrxHeGQYUxrd5HO+q7CYwLpGwJVkBE5RmU6
 xDzvhCHhV/ymIhyxR/MNuEahjj4TvO1sdlYX3YfaGLjQa0PP+MWtbzp5JEUM/VwKRJBV
 Px2fdcy7ANI4bIHQ2av5c+4iLn2Axqsz5+8j+/oMHlXjAy8TY42k16FigCx2S3zDA31Z
 GzZHM7r5J0XM/b02zgxXpW3CQH/bUuIXmmWttz7/tFnv34vQgqffFlcra+vA0kyW+ojm
 y1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8ytmsmn3zVtAhYPboUfBL7b0W6ZRe4BJqXc5Vj3xX4=;
 b=SzzkMANYobWaO6Ki6Kd51e7ayQNZ6hiRlzyaw008UH3lKH1DCi22gs40/pxZztf4ro
 /sakdTyI1sQh2rtaeQImBAXntc9DqnewWNPzZHoPbVlE1QhLGWd9IJZG0ygeXRZABe3m
 iaE9tI8wgtdDZ9euKLiMuUXTLev/vvvPqlk3tJrPx+2YIbDS02nVbE3YDgaf3IkqW9Z3
 O+Guwjo8v6E4Ndfo/CT6mIHJubV8xT2aS36ZSiUSTDk5On8MjwymDT5iMfhgeoRPfMnM
 6/EQ0FlcPwrJ1ks8BPZzvyvo5sqk1Khlm8MhhunPNs+AMt3YSKJU9slCJz7LNsn9jxo1
 gSWg==
X-Gm-Message-State: AOAM5319h7SnCcxqvoNDKLMPVltg4ln6wYU6uYwM+F7y8mZ4falxo9jP
 Lqcm9SfqaPeXgRAajKs6WhzjH/vzimmENw==
X-Google-Smtp-Source: ABdhPJz2Y1bZP79X3cfrPQq2cNNehr4Ve06ysuHXc4dr6f7geQIgBj1f9pcQ59IoYp0vHvIoCimjSw==
X-Received: by 2002:a5d:5960:0:b0:20c:5a12:20ed with SMTP id
 e32-20020a5d5960000000b0020c5a1220edmr16943406wri.303.1651741926119; 
 Thu, 05 May 2022 02:12:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] target/arm: Perform override check early in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:42 +0100
Message-Id: <20220505091147.2657652-19-peter.maydell@linaro.org>
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

Perform the override check early, so that it is still done
even when we decide to discard an unreachable cpreg.

Use assert not printf+abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 941b777dea9..fa1e7bd462c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8538,6 +8538,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         g_assert_not_reached();
     }
 
+    /* Overriding of an existing definition must be explicitly requested. */
+    if (!(r->type & ARM_CP_OVERRIDE)) {
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
+        if (oldreg) {
+            assert(oldreg->type & ARM_CP_OVERRIDE);
+        }
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8622,20 +8630,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    /* Overriding of an existing definition must be explicitly
-     * requested.
-     */
-    if (!(r->type & ARM_CP_OVERRIDE)) {
-        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
-        if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
-            fprintf(stderr, "Register redefined: cp=%d %d bit "
-                    "crn=%d crm=%d opc1=%d opc2=%d, "
-                    "was %s, now %s\n", r2->cp, 32 + 32 * is64,
-                    r2->crn, r2->crm, r2->opc1, r2->opc2,
-                    oldreg->name, r2->name);
-            g_assert_not_reached();
-        }
-    }
     g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
-- 
2.25.1


