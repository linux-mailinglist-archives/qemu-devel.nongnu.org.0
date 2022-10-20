Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C92606BA3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:52:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olePA-0008Or-Rx
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:52:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleAB-0008Qx-Pz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA3-0007xa-Il
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:11 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA1-0000ya-Tl
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:11 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso3244091pjn.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baaju4aj7L4HzLV2vbLThQkoFij3/vaMLp/lMiDo+UM=;
 b=lA9UPzaDusMswbXBHfTAZfhirWX/cdO35kvUE8CeI7KJ9UvxjLcR61C2v9zF1NB6WD
 4zJv0GpgGA2JoiCrowGx/dLUCFvmqyVnHN9cjYe4g2rCNd3T/j/tbIuxzAVJYs7s7MjY
 h+3lqjR37YtHmFNth/4KzR3GC9lz5jhAHRuAvr8hS7XESfZZ5hIi8bDsp/Vs6AeaR6lL
 WNoRI4Oi2bv4pWG39T3qC0iv+69hFiUP9KnjnnIiyIbpyd2DOJNy/XXPBxmBO9tkwd5Z
 0iXRVPtE6ZM3fUwi0nKJhSfms1oxD9DO+sFIaVJ9vEAuqLz+dK0lFkwPuPN2tO5QnTRO
 oHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baaju4aj7L4HzLV2vbLThQkoFij3/vaMLp/lMiDo+UM=;
 b=ZnYUl9t3gfLi8l/fgR0UlFqNEd0pqIDgqPArMghNLZvkFE4X3gQNWFjY5snDx4luK7
 IRoypeUcl+tE0zEl4/u4OpL4hUVM76YZVMIaLkSpCxX+bbJNW4PKHJaQ+dVfYBpSSRqm
 wk6gBau7vV1RT/r/TK4cVkhWMzunsSxV6kbIx1soDXwPag/ErD8+wKT9e4edsGSWFTxs
 aKht97k0gU4enU87S5aCFNQDbinlD6C2MDhbQeYoOSN1yPwaTaMLyOU1CBtptnvtQW0y
 Q4CLXJJn8qlNBE3MCCI/ffX/lexrSSRV6ND4bKQR2L0yfRb2N2KPFQaIGTw53hQNZK/e
 qSgg==
X-Gm-Message-State: ACrzQf2pTwB/rjOohpVn0NMViAtg7V4IyOSSpeD5htNm8iDZ5DaP8JoX
 JkGjWgBwgkwDY0Z0n7ocwNF3PeX4fhGa4lPL
X-Google-Smtp-Source: AMsMyM7SIyoxoh+7ZMafPerxb1+EsgQsS5kYPlMgwJWLYrywfZok/b4qru3NzbfT5XqWMNKWKyPRjA==
X-Received: by 2002:a17:90a:4ec6:b0:20a:96cd:2a46 with SMTP id
 v6-20020a17090a4ec600b0020a96cd2a46mr18876074pjl.171.1666305429062; 
 Thu, 20 Oct 2022 15:37:09 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 13/14] target/arm: Implement FEAT_HAFDBS, dirty bit portion
Date: Fri, 21 Oct 2022 08:35:47 +1000
Message-Id: <20221020223548.2310496-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Perform the atomic update for hardware management of the dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Move the DB update before attributes are extracted and merged.
---
 target/arm/cpu64.c |  2 +-
 target/arm/ptw.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fe1369fe96..0732796559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 209ea7024b..1c1f0bfa1a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1463,6 +1463,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
         }
+
+        /*
+         * Dirty Bit.
+         * If HD is enabled, pre-emptively set/clear the appropriate AP/S2AP
+         * bit for writeback. The actual write protection test may still be
+         * overridden by tableattrs, to be merged below.
+         */
+        if (param.hd
+            && extract64(descriptor, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            if (regime_is_stage2(mmu_idx)) {
+                new_descriptor |= 1ull << 7;    /* set S2AP[1] */
+            } else {
+                new_descriptor &= ~(1ull << 7); /* clear AP[2] */
+            }
+        }
     }
 
     /*
-- 
2.34.1


