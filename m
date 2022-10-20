Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E222606386
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:48:41 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWpx-0000lx-4G
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:48:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWjz-0005sC-Gl
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZJ-0001ar-PF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYx-00013N-81
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so2181944wma.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zL6NvFFoXw34CaShyzMhMR6FMiAsPqnYAfn/5Y9V3K0=;
 b=zVVguPXGH2hg7GzDr8KAeCZ2x53nBhfGa5/W00XwRtop259DK96NCEc6Ra3j7EJDtn
 kfrDRCBEJm0YISiStu2cMTSOtPiRljDB3/2pwgviBYb5CG2QqbmnzHYH/07PQ2P4MSFI
 3pNilHXVL03kB+og9lFMvAGz5is9+b40S+2NXBA1Sv1QOWt1ecI94vJx1+ggre8SsIuV
 dghZhnGlC8jj76S95PtZaWa0LuA7W6p5jzQdxGvNHDbt4g5sZHMqzMWJ5fH1Zqw7kSiD
 Lzt1sgb9rWmIp4zkwjDeDvRrfIfcmj0dvrDm4PMT+JOXphWCyDO96Z2iWM7CRW/1AXPE
 m4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zL6NvFFoXw34CaShyzMhMR6FMiAsPqnYAfn/5Y9V3K0=;
 b=BskDuLI0JW3pYe9fPCtJljeViLY2ln7hwbJgqDcsP28eU3RGOo8VTG4QAtQdEK457s
 tUubSoViG+lVnnh6RlH1HCQ8N49zkE6FtjOh53BHwiCZ7oWlfMLu+04AJYaiBVo8JlBJ
 z/sJztyMRrumAuW+fDVC63j3NmjXQPaoEfFcPqWxhj6ydGi+8POAfN+p7Qe/tnsvlz2E
 sZBakK4eLm9LsYdNaOfuAtTwsz8sNDmODfHwInKoJdlGHH0ULQsA+lerifOkCZbBZ+hC
 wzOv48wM7is1o5Fs8OkVtmdzWR6jIMniC6gYpCX+dtfA22Rpbh8LXu9W5IXwxBMRtxYw
 n9JA==
X-Gm-Message-State: ACrzQf28+BkDa5GO9Y/Mh6L0yTNaTMvFRCfxwyQHtcDwHMnI5ZsTrpzH
 Gl39SwUJfDl3jY8VDVOEXZyq+KEa5Ctvgw==
X-Google-Smtp-Source: AMsMyM4Hx/wjYusb300IvegsWk/bUCt6Szf4eRpyj4rXoCvbrsa1m3zJvL5XuZ+O+0q8iYSpNwyRMA==
X-Received: by 2002:a1c:ac81:0:b0:3c6:e566:cc21 with SMTP id
 v123-20020a1cac81000000b003c6e566cc21mr9340121wme.0.1666268527422; 
 Thu, 20 Oct 2022 05:22:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Thu, 20 Oct 2022 13:21:36 +0100
Message-Id: <20221020122146.3177980-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dd6556560af..6c5ed56a101 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2432,7 +2432,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
@@ -2443,9 +2443,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
     bool is_secure = ptw->in_secure;
-    bool ipa_secure, s2walk_secure;
+    bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     bool is_el0;
     uint64_t hcr;
@@ -2520,7 +2519,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
          && (ipa_secure
              || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
 
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
-- 
2.25.1


