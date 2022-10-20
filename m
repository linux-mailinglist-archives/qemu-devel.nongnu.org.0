Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D2606B95
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleM2-0000Co-BN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:49:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleA9-0008MQ-9Y
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA0-0007pQ-ES
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9v-00015w-RS
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:08 -0400
Received: by mail-pg1-x52c.google.com with SMTP id l6so860814pgu.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GurYN5eM5ASmrAS3IhHR+unhisIkdfoZKXFyT1rxT6E=;
 b=oBObJo/SuGrzvYu8v74JYIYpSShHPLlCRFALgt+AAAHK/VxmrPn+Gcm9uIfq3JnrP7
 9H7bir4UQGYsNwmKaeSjqJ5VSIYXKiw1+p1uM1iEs+qGXjeO+1n3Sn+bz431Y0o7p+hB
 1+3HsZiZj3lchECBJTx7WuLSIyz5I+Fmcss3H5mvpXEhDb8xHLAZKNsq14YRMz7db+vD
 izNATLNZ8Sj1E5MAAWwngxFJSeyEm5qFzWTRbx0mPkzCGk5+CZMT/5w/IV/0XSX7ixXm
 hq1/CQg5/5AX8dWbyU5xnkO+apixXrzrBIstuht3OR62KfWKru8pfVqb+Z1YtpA37LeY
 7nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GurYN5eM5ASmrAS3IhHR+unhisIkdfoZKXFyT1rxT6E=;
 b=XPYpS76buFEvPtYpMFwSr5pMjEpen8La5G9qRPZ0GfUxLkTLOL8rjtVFiaoMj4UCKy
 opLtAtnj6qNx/Mk7CgafvVrSbea0szp904hYi/7XqxNpGNorHIf4EsY64x0DHj36t/mT
 E1VdK20F2v0xIPL6w0ewNw/UGm/WxUfFggwuTnsOokWkyiefkFhpn2qmZe+8L8vcG3+N
 Ll/DOHcW5BpE68XGnnHh5z0s5pEYanqP8b8/AHhS8f5/hLdAdaKneaRcwqhOnEQV2k4J
 Hre0Kfwicz2HvZwLfRD0Lfzw7K6vU5uKcxEn1VxYb5N8PREwh6e/lh5OLRqNV75e08Jz
 jNWQ==
X-Gm-Message-State: ACrzQf1aSXcOVsalB07bqX+NjOBF2j2OVxvhgdfI3TdwBdCNpALCy3I8
 M3d8AA6P9FOrmjqArSLktnxGQrJBn6gjjP5M
X-Google-Smtp-Source: AMsMyM6a5ZC+OtssXbWe1+smJb2HNh+muntX8y6ZCQRc9en+CnlZGyvQNkw8G5q++g71ZXttFYCe6A==
X-Received: by 2002:a05:6a00:a8f:b0:563:3a3f:9d5c with SMTP id
 b15-20020a056a000a8f00b005633a3f9d5cmr16186633pfl.50.1666305422377; 
 Thu, 20 Oct 2022 15:37:02 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 11/14] target/arm: Tidy merging of attributes from
 descriptor and table
Date: Fri, 21 Oct 2022 08:35:45 +1000
Message-Id: <20221020223548.2310496-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace some gotos with some nested if statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cb2e9072ec..165e70d044 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1341,27 +1341,25 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     page_size = (1ULL << ((stride * (4 - level)) + 3));
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
-    /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
-    if (regime_is_stage2(mmu_idx)) {
-        /* Stage 2 table descriptors do not include any attribute fields */
-        goto skip_attrs;
-    }
-    /* Merge in attributes from table descriptors */
-    attrs |= nstable << 5; /* NS */
-    if (param.hpd) {
-        /* HPD disables all the table attributes except NSTable.  */
-        goto skip_attrs;
-    }
-    attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
     /*
-     * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-     * means "force PL1 access only", which means forcing AP[1] to 0.
+     * Extract attributes from the descriptor, and apply table descriptors.
+     * Stage 2 table descriptors do not include any attribute fields.
+     * HPD disables all the table attributes except NSTable.
      */
-    attrs &= ~(extract64(tableattrs, 2, 1) << 6);   /* !APT[0] => AP[1] */
-    attrs |= extract32(tableattrs, 3, 1) << 7;      /* APT[1] => AP[2] */
- skip_attrs:
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
+    if (!regime_is_stage2(mmu_idx)) {
+        attrs |= nstable << 5; /* NS */
+        if (!param.hpd) {
+            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+            /*
+             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+             * means "force PL1 access only", which means forcing AP[1] to 0.
+             */
+            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
+        }
+    }
 
     /*
      * Here descaddr is the final physical address, and attributes
-- 
2.34.1


