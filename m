Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A502468AF17
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOba6-0003eH-NY; Sun, 05 Feb 2023 04:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nHrfYwgKCjUjdfjkRWRXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--smostafa.bounces.google.com>)
 id 1pOba3-0003dV-Nx
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:03 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nHrfYwgKCjUjdfjkRWRXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--smostafa.bounces.google.com>)
 id 1pOba2-0001AR-1f
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:03 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 iv6-20020a05600c548600b003dc4b8ee42fso4590453wmb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o9691ENMF1SN9+65UB+q+xz/jKM3ACw3IwZ/j1lsTsQ=;
 b=GUKnC9b+ZvFEWAyvE17jRUo5bMkV9FfWybedAcdOEXVv0Hdsf2mDRmNUuZk41dyQX0
 l3fDQU40V0gx8OLcv5tT3A2gbLG0JxEYdK37SCm3mM2KxSb7b7yWl9bPMU0GODLknOpQ
 EfVc9mG5gv5jaaSgKKYtvR3qP4r5NY1XkTeUlAL1auWKYea1UULZJQQK/oUTZlNHRaGA
 G0bdY3uR/SAQIyyQJAUwHTRSYyUIoQtmiolEIGS2M2d/REKd8J+ioVhgCke/dX50XE7f
 dtVTTpiJoEvPlEZjEYU3i0eaqjH/uT9BGUD1G78D34JCtr8NtodoftStmxmom3cAirMV
 ZH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o9691ENMF1SN9+65UB+q+xz/jKM3ACw3IwZ/j1lsTsQ=;
 b=vobnrZqF1G1m65ca8vUT3lB2jVY8cEd1w+Y88QnjIyIPLiDzmqysMiqxcw9GrMghjw
 clmTyLmHkNCLyiCRZBWqdZ2IvqRMk0LXnAbES0CpVYZdw4Z8NYKn3lYmIkjvgAaD73jJ
 +Mq1z9m4IXHYn1Cb/H81QhiSfCafVUw1RTMDqghIsO52hQn7yo0rsdOzpjIieRdjAklT
 FkO+vtexkPKRQu1JPAHSqdJP5+l+acB48XLwsaNmZ6v8KDFZPvYihLSGExRQL8+/QcQ8
 fQEFe9HzE06SYWhPima+Wnsbdei4KU27dWAEYqp2+rkCM9kwaMlVJMpUTwJ4RSCdP86h
 xqYA==
X-Gm-Message-State: AO0yUKXeebDAW5mAfOaMtxlFE1+zVGuWDkLErc7z+HSSqdgI0TMeBk5L
 vN4K0p9l2XxzVlHJ0MP92nJxzzqio7GvDoJhgohicGQyxwzipRx1JFAiMA7Mw6yu+feJBc4BmzI
 xiD2J64ErKHM9ar0yod4h4qc3xgSckXjlXiBBbEmj5xh3VhbeM50HsOYQFudNffvwtQ==
X-Google-Smtp-Source: AK7set+7HuQhBw01cfm4LooEXmJQ/gNQm0VHVWjCqN4rUYBxk9Qmt8BeVFoz0KIlUYC5CrZn1s/cz4cN4fh9Sw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6000:12cf:b0:2bf:dcdc:afbb with SMTP
 id l15-20020a05600012cf00b002bfdcdcafbbmr484413wrx.642.1675590300084; Sun, 05
 Feb 2023 01:45:00 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:01 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-7-smostafa@google.com>
Subject: [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3nHrfYwgKCjUjdfjkRWRXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Parse stage-2 configuration and populate it in SMMUTransCfg.
Configs in this patch (s2g, ttb, tsz, sl0).
Checking validity of values added when possible.

MAX IPA supported is 48 bits and only AA64 tables are supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 43 +++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  1 +
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 54dd8e5ec1..6633fe40fa 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -366,7 +366,48 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         return 0;
     }
 
-    if (STE_CFG_S2_ENABLED(config)) {
+    if (STAGE2_SUPPORTED(s->features) && STE_CFG_S2_ENABLED(config)) {
+        cfg->stage = 2;
+
+        if (STE_S2AA64(ste) == 0x0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 AArch32 tables not supported\n");
+            goto bad_ste;
+        }
+
+        switch (STE_S2TG(ste)) {
+        case 0x0: /* 4KB */
+            cfg->s2cfg.granule_sz = 12;
+            break;
+        case 0x1: /* 64KB */
+            cfg->s2cfg.granule_sz = 16;
+            break;
+        case 0x2: /* 16KB */
+            cfg->s2cfg.granule_sz = 14;
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.vttb = STE_S2TTB(ste);
+        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
+
+        if ((64 - cfg->s2cfg.tsz) > SMMU_MAX_IPA_BITS) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 IPA too big! TS0Z = %x\n",
+                          cfg->s2cfg.tsz);
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.sl0 = STE_S2SL0(ste);
+        if (cfg->s2cfg.sl0 == 0x3) {
+            qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 STE->SL0 0x3 has no meaning!\n");
+            goto bad_ste;
+        }
+
+        /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
     }
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1e666e8b6d..7906e359d9 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -28,6 +28,7 @@
 #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
 
 #define SMMU_MAX_VA_BITS      48
+#define SMMU_MAX_IPA_BITS     48
 #define SMMU_MAX_LEVELS       4
 
 /*
-- 
2.39.1.519.gcb327c4b5f-goog


