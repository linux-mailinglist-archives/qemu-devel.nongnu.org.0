Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827968AF15
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObaF-0003tz-Iw; Sun, 05 Feb 2023 04:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oHrfYwgKCjknhjnoVaVbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--smostafa.bounces.google.com>)
 id 1pObaA-0003lU-Bs
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:12 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oHrfYwgKCjknhjnoVaVbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--smostafa.bounces.google.com>)
 id 1pOba7-0001MB-Jm
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:10 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so36166wmq.9
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QHWID9O8NLHXx/axWLc3JttO4n1YSG79UIlshS4LLuM=;
 b=aEtuMD7GEb6DDM6nNtYx/cIesP3Y4VbOOqVy9qfkzlOroAiIg7EJO7Q683/NqULwQq
 k2/5OEMjR4SXUeXRHvkAKwYMQIhRNZrTkJs6U1WF25Kc28Y6iE4lXr+8Ib4MHl0VL72N
 O1+jGspeP7wUp7FVETvDe1jFP7lAkqolWOagsoF8WVai+2g5GtVTQ7zFYpwe6A07oYK3
 aQo7cdCWw5Nhp/O3x4l6RIIlAOS9St6b4tP/3924IrflJSD7q5cUzokH9OJIqVbUfRjl
 Fx3sDo9nh+x/CnQsh1GGg9R+T5ufrIpODiNsVsj6JwdeHYAYhEMV19GVVQBYClowXL0y
 xbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHWID9O8NLHXx/axWLc3JttO4n1YSG79UIlshS4LLuM=;
 b=ln60n1Uqo+b6k6QgxSBIiHbqM5i6SOuQxgOFDjX9evQSHxyFtB6rHPFJm9Zh86Bf+4
 PJbMVhty/XGjiALVltInejrtYeD0j70V4clSxV9c2fZKTKiopnsfF9uJ8FIIBKBQOkXh
 lWFpOu7JLXj7Y/uP/qQceIvbphTtoqwSEXUfpf1GGOKMVqc6YTuBoexRijAXrTzOYYGs
 CbbqJunuJZD67lThyajTHNiKzb50u/+qeq7EWYgigxpTk0DuDA17l6Lw32sjdT8v3gaR
 FntfgH12ksWBhqwe6UFgpnYT/Xm9Fuvt6hZQB/ZECi3n5iBAuAhdNFYO4qLpukkV7bBo
 nK2w==
X-Gm-Message-State: AO0yUKX98Wfk2L6qkIxAAX49SzVdN8LmaoKbgOFV+oW87/Cto9YEceU2
 SMp95uiaWe4reIiXhdK6I7qHbKaBqJ5CyBFG7ZwrTPLd3N9KOJ0/lqZM239GMgxQojD9ITtDqr5
 Buv927lYZ/9KOEPypBxzFLL7NnDrmKQftnaPcf+bWmUy9yyuB1RnagkK+okEKq9Q2YA==
X-Google-Smtp-Source: AK7set9WH08sEL7xYIRYu7T8jrQpGQRtGykcCyAz6bd+q18QgX7XIRTsX9Y0FtM4XcTiWKTR1pcL/U8EsxyIkA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a1c:e907:0:b0:3cf:6f23:a3e3 with SMTP id
 q7-20020a1ce907000000b003cf6f23a3e3mr151647wmc.1.1675590304687; Sun, 05 Feb
 2023 01:45:04 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:03 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-9-smostafa@google.com>
Subject: [RFC PATCH 08/16] hw/arm/smmuv3: Support S2AFFD
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3oHrfYwgKCjknhjnoVaVbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
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

Parse S2AFFD from STE and use it in stage-2 translation.

This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
"[181] S2AFFD".

HTTU is not supported, SW is expected to maintain the Access flag.

This flag determines the behavior on access of a stage-2 page whose
descriptor has AF == 0:
- 0b0: An Access flag fault occurs (stall not supported).
- 0b1: An Access flag fault never occurs.

An Access fault takes priority over a Permission fault.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c     | 10 ++++++++++
 hw/arm/smmu-internal.h   |  2 ++
 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          |  2 ++
 4 files changed, 15 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index df0d1dc024..541c427684 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -434,6 +434,16 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
                                      pte_addr, pte, iova, gpa,
                                      block_size >> 20);
         }
+
+        /*
+         * If S2AFFD and PTE.AF are 0 => fault. (5.2. Stream Table Entry)
+         * An Access fault takes priority over a Permission fault.
+         */
+        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
+            info->type = SMMU_PTW_ERR_ACCESS;
+            goto error;
+        }
+
         ap = PTE_AP(pte);
         if (is_permission_fault_s2(ap, perm)) {
             info->type = SMMU_PTW_ERR_PERMISSION;
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index b02c05319f..7d3f76ce14 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -66,6 +66,8 @@
 #define PTE_APTABLE(pte) \
     (extract64(pte, 61, 2))
 
+#define PTE_AF(pte) \
+    (extract64(pte, 10, 1))
 /*
  * TODO: At the moment all transactions are considered as privileged (EL1)
  * as IOMMU translation callback does not pass user/priv attributes.
diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index ec64fb43a0..3ccb9d118e 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -524,6 +524,7 @@ typedef struct CD {
 #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
 #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
 #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
+#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
 #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
 #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
 #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c49b341287..7884401475 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -436,6 +436,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             goto bad_ste;
         }
 
+        cfg->s2cfg.affd = STE_S2AFFD(ste);
+
         /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
-- 
2.39.1.519.gcb327c4b5f-goog


