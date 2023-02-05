Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C068AF18
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObZk-0003Ug-Lk; Sun, 05 Feb 2023 04:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hHrfYwgKCh0LFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pObZh-0003T6-VB
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:41 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hHrfYwgKCh0LFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pObZe-00017O-A9
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:41 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so5002328wms.8
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UjRaFYtVUZqC0NEA0rur78DkyweEGXZXJJbd80wD/+w=;
 b=fA3MHr7klX4U5yFiopPsAmgYxH4abl6mHe6hKRaGiwQx3dOnTdqgCZyA6bYlYEe97p
 6P7fZbuRU/1LVnpipU5Xnpw9Ps+8QU3eeAgFahzTk5ilThjM+S8eoys6ctqTXpeBjowD
 KP0OOD43azEYlhiFBJkN42IDrs7ViTAzYWxiFQTtuVGVi3bmiQHUuSK0QvFHNGvOSJTq
 YvYqVghQ6pklKoqIFBrHz9Jbgf/cxEsNVxjFjza5VUUedLp+VV+fzQOES9gmLwIO4DlH
 fboUIirzx4t7jMKdB6Fsze6dOwhKQz7fP+YYZyFrhuwnZpqg3tMURUDrETDiP7Z6ZYBe
 2QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjRaFYtVUZqC0NEA0rur78DkyweEGXZXJJbd80wD/+w=;
 b=ZqcMdYIlxkY61d6FV6ZBpeH7KHcVbKhN7b0Nt8/ssXPx2vvqbcAW8lMqUqBCkUWl6+
 mc9RBGYB5GSuwipZWxn54e0AmSD8vJAbrBjp28kf3t6dOfvAA/oVoibxo76Psb3/kOla
 +f5U1+c3d2YZn/XsMFLuMamk0AYrWS6rzdCIWItPdH8M8tor++8zGQvwB8MLTfeJXQzH
 mrBIKzTBMcvcdNKiESnEiYZDUuJlbSljdr+mZ74HdUxdE+8ts8oCnUwzNfMmNJAuUF1Q
 Qs909sSl+SmWPRdXAdoJZTQ8HAI9gAj3LskeB3DrJ+gjru/ZG6HmofNRoutrCpgqS3Mt
 GFpA==
X-Gm-Message-State: AO0yUKV/uBEPGIu/glsKzc5qLTj762g1nMUX22W25FBct6V2rgu32FE5
 8wsZjXBAWkqXtTWJM4FmZlFnttduBXs/8EvJ+kXNSKC67hQAUD6G2ev/6tB+QHJzZ6p3+EdzUwr
 /A8/7cllN5mVFZEmQK758FdWrAPSdXmggK6GYT5lD/Z01r9CHW9GSt3z/oX/XRafa7A==
X-Google-Smtp-Source: AK7set9wck6vW0Ohhy1cbm4uIXe0H6JmewQkwSn2MackV/IW/I3PgBcLw2GBViimcWwpytd8a+6L2uYTTsznog==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:46cd:b0:3db:110f:2691 with SMTP
 id q13-20020a05600c46cd00b003db110f2691mr795316wmo.65.1675590276522; Sun, 05
 Feb 2023 01:44:36 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:58 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-4-smostafa@google.com>
Subject: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3hHrfYwgKCh0LFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for adding stage-2 support. Rename smmu_ptw_64 to
smmu_ptw_64_s1.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..4fcbffa2f1 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
 }
 
 /**
- * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
  * @iova: iova to translate
  * @perm: access type
@@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  * Upon success, @tlbe is filled with translated_addr and entry
  * permission rights.
  */
-static int smmu_ptw_64(SMMUTransCfg *cfg,
-                       dma_addr_t iova, IOMMUAccessFlags perm,
-                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
     int stage = cfg->stage;
@@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
         g_assert_not_reached();
     }
 
-    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
+    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
 }
 
 /**
-- 
2.39.1.519.gcb327c4b5f-goog


