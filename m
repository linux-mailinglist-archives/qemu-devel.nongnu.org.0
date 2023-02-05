Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD068AF1B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObb1-0004g7-DV; Sun, 05 Feb 2023 04:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sHrfYwgKCkk3xz34lqlrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--smostafa.bounces.google.com>)
 id 1pObaP-0004Ok-K8
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:25 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sHrfYwgKCkk3xz34lqlrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--smostafa.bounces.google.com>)
 id 1pObaN-0001QG-4t
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:24 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-527af7b329aso12161507b3.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRFJww90BUb3SebItMFe77THxpL0L81NBuaMTBOPsY4=;
 b=cvO7KQT9EzRiO+XZsgehiFqfQNp06s7ci+periLusBSsgi3odxxwJgz/zLGOqItUvg
 pCfKJy5esNngHLGSOPI/7tFtRS0SxAhLOmu8PgpXPvfXeqalf4u8sqRFDLtoUtXUTVUt
 Tv+FDaNp9HMg3ZDsuLIKY5ZvnoO9/P9NiVKoyR1pMA6WUaq+ILCj54S5GqX6ZNj4nOCw
 4iI2plJ2hKNfrbEV1kPnJ7TzxfbnJ+JXig/f6e9su6mBR15ohVwLuIW00UWcDIDxmIXa
 Zur5Elh0aWjCl9+0xkZK0WnvHzNM6LWLjzvfq1Sw3D/PIgSzAdoNV7FW1nTWm+SuXP+l
 L1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRFJww90BUb3SebItMFe77THxpL0L81NBuaMTBOPsY4=;
 b=jUfvnyzDZaR4XiEcgPZCyCuvyGChtyEHyT1Ewt06AHXuG0wdQkPHsmhzub9aMKQ6/K
 qwoRQLiP7nhgdq0gAU99Unl9TGhVMCL3DodHjZ3Y/mniAuwUHYvYxHoh3mSSTwyk433e
 P2MGA16DcGfICs7uaZBQWJHmm/BWL+FRdOl9fm9658c3/Q5vr0CAcu2ZRKKVRfvnKc1N
 HsWX0a5YWReZEgfDdcXVuRAK7q6+XUL0rgLoQubxYMx2logxzplax7xl9vlTWewsIL8Y
 PK/RTjGVX5M24qRK05ZJl/7g9XYZmrdbuYqvPGhh0Z/Lu6lp1/+0SYeHyu08Na394fKh
 EH8w==
X-Gm-Message-State: AO0yUKWgoYH8U5aiK4DtI/FI685o0zhJKBct69oswv99/LrsCZWRp40a
 6H391/Um6rILW/Qf3Ov0wSu9wTuqOrdnPS+lOtVp5mEHmDdwYNGoAAXhWMLG2k4wsCt7jTmOwhM
 T3yhYrXgN+1XqWXDI+qY/L45QXnjoAIFQufIBxwYLE8gEsYGRcyIg02FuMTQnpQqq3Q==
X-Google-Smtp-Source: AK7set9Q0afFUVGfF6zMcQJ3GlQdSXcQDL6QGsIJV8TOriSC7p3VN/3xzuQHxK+RUvh40J9Xxr57Tx/Q9sm6Gw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a81:6d84:0:b0:527:ac61:1f19 with SMTP id
 i126-20020a816d84000000b00527ac611f19mr378941ywc.410.1675590320419; Sun, 05
 Feb 2023 01:45:20 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:04 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-10-smostafa@google.com>
Subject: [RFC PATCH 09/16] hw/arm/smmuv3: Don't touch CD if stage-1 is not
 supported.
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3sHrfYwgKCkk3xz34lqlrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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

If stage-1 is not supported, SW will not configure it, so don't try to
access it as it might have faulty addresses.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 7884401475..c18460a4ff 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -653,7 +653,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || !STAGE1_SUPPORTED(s->features)) {
         return 0;
     }
 
-- 
2.39.1.519.gcb327c4b5f-goog


