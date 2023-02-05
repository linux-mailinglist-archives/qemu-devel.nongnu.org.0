Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795F68AF1F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbE-000646-MX; Sun, 05 Feb 2023 04:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30XrfYwgKCmoaUWabINIOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--smostafa.bounces.google.com>)
 id 1pObb2-0005Bk-8f
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:46:04 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30XrfYwgKCmoaUWabINIOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--smostafa.bounces.google.com>)
 id 1pObb0-0001aS-8B
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:46:03 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so7270616wmj.7
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRoJgll/EyuZGD8r8LLdIHU2kvhC0CMvLDar5BN6+Ig=;
 b=PtCvWF6QBFPtI4XBqrLDoU3F6/12zdCXMY+qZqxTZcqk8N/1OH9g3dp/qYLYNI93LA
 fcN/Sr2jY+9YWYmT/a2GThcp3dObOQfbS4XbQVoZuXc63l5pwN0FCbWYq/GI8A/4xUIa
 tj0XGiCnDTs1vTJ7gt1EecyiDHJ2OKcvuFzsSPvlGYsjAFYyse7+qBSoraDNnDhpB+82
 d4D05KL6/sLLPEQ6AiVBVxRSYQuWRIJNMROm0wLixgUDIT8EDi+8n8a390fHE11O/5Xj
 0BhYTA2VoPEju/BnfavlGz6eviTkOQiuOKGgiImG8OZp0xOL0yNv4UkC6HB4c4SuN5yl
 KNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRoJgll/EyuZGD8r8LLdIHU2kvhC0CMvLDar5BN6+Ig=;
 b=XcjGReLhQlKzB3iZzpETCuFOTJQgjycd266AklB9eCBjYJd9wY6nId8JM1g+9B4SN0
 VjmDWUJQ6h4/9uDnTNkr3soKzUgLaiBlgsBlq0hGfgXA4aEE9xQRG+TCcQUE6MnXwkOJ
 lUhQ/kPHjDVo/kytAgmf8LeTV+fjGbkz+GJqrbettopX55zbrG4cXJmPLNxlaeWNFsR5
 wrJC2/hAwPgBZ2MdpTZSZYfd5VOxQI/+mrS1N8NiVa9D9o4vbaQwI5KQpofC2TPulkJi
 Bo36R9RUwlr6JoHFO1PWTWu56RntchrQLWkPFbNLK6+oxYULKrJSVURZbjnj5cO7T8+g
 C6ew==
X-Gm-Message-State: AO0yUKVDMJzexTD+lrtn/l4L8xQLJBGrsayfejMhAsJ9MT3Sj/YwYVGT
 NIf2mG2bivfxrPIBc7p8TIdFryMmUVjUeNG7j4rKX32nqbk+sMVWdTYdgxVWvCWUUFe6flWM1Fv
 T5ts9weD61MRMcMt0sfESfi9hozoW8kk6f6kgxvxMUJgYgwwLydygBMu3ts4TXUUh4g==
X-Google-Smtp-Source: AK7set8giTMGiIS2cYO2y5P2n7D/+CkUBbhPivhnqu2UgYPSBNkkT3+ynFkOjPgaAccABKZl65af681ELNcfTQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c84a:0:b0:3db:2f03:2571 with SMTP id
 c10-20020a7bc84a000000b003db2f032571mr599647wml.183.1675590353543; Sun, 05
 Feb 2023 01:45:53 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:10 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-16-smostafa@google.com>
Subject: [RFC PATCH 15/16] hw/arm/smmuv3: Add fault configuration for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=30XrfYwgKCmoaUWabINIOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
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

As stall is not supported, if S2S is set the translation would abort.
For S2R, we reuse the same code used for stage-1 with flag
record_faults. However when nested translation is supported we would
need to separate stage-1 and stage-2 faults.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 2 ++
 hw/arm/smmuv3.c          | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 3ccb9d118e..ccdae81db8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -528,6 +528,8 @@ typedef struct CD {
 #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
 #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
 #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
+#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
+
 #define STE_CTXPTR(x)                                           \
     ({                                                          \
         unsigned long addr;                                     \
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e0976ac236..5f792d96ab 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -446,6 +446,11 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         }
 
         cfg->s2cfg.affd = STE_S2AFFD(ste);
+        cfg->record_faults = STE_S2R(ste);
+        if (STE_S2S(ste)) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
+            goto bad_ste;
+        }
 
         /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-- 
2.39.1.519.gcb327c4b5f-goog


