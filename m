Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB7450B4D3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:16:36 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqL5-0007N5-DV
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Z-0004Dw-TZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Y-0002ZW-9H
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id m14so10319455wrb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C8wjiFGqRwiBdgaooMAg0hTWNbKduRpOV7Hjw4Kt2zU=;
 b=SEM4rSF875JoPfwvIsDtkoCpZ3KwO+zL+5DboekT+Bf2CWbO2j+44p5Snx7fRq4Av2
 alhkiWMgYzPhYYYZUDLBwMIKGbm0r6hCYEOba4dJFL8PdS5cSVCBewud6wY26qMnptc2
 rWK85TS9JP8sw1LuMWL8B0qAUzEdMh5ViLvhqPt2yMGBSRXbrEbQh6ZRcPE62XsisfI3
 QJAJm2g45GRuzbcayZYC2JcUt+n1xR2mOy7BdxHRacqC+aFW3e5l1v+qq4XONHHB/Bgi
 ytVzzc7Gb2609DTFTbO5+/mCQn7/wIcsom3pC6JdIkD7ZnJ7zOaR/kWd0wUZ8wZQIfuJ
 Ht5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C8wjiFGqRwiBdgaooMAg0hTWNbKduRpOV7Hjw4Kt2zU=;
 b=zZh6BBTbr+c/Flxe2dNi3yOZaqONwMFOANYW7kRil5znhn/KjL4U9V5QZqmQi/rYwZ
 gvwCdMLwi8rgffIkinlDJy7pFplFh5dW1DXwcQJCZtbe67nsz4ttrTsFdgMblNqQ+yKV
 dVwn7oColQu5EJpb8iQRQBRsEzx7o1AQsUmIdyRhFHVVCdqL4SODsgMwn4WIuFOrH37K
 l3PdGkAdhq7F9LSR598ZqFlwu19FE8FECT4ACeRNrc2W9jkqq8wj2rzUnwEaUDfNk9g4
 LSor028VvmyoE2B0pF+51KCWk4l3m5u/4yRBJkdpDXMwJqwLYDrjLr6AzOe+B1/FkhMe
 aR6g==
X-Gm-Message-State: AOAM531ywoRJ8gV5/RKxA1ddrvHFOPJGyE6SSYpd0AEhtHcDu5VEK5WS
 FhC0ljHvf/w8wWKkRksOmY28wwZB05kgog==
X-Google-Smtp-Source: ABdhPJys05Nx44k2/YA4bFn0lVmiyhiBkiiiUeVjbgCiblEFJcCoMJJeP5wroYvx6LTGnNfpwItZ2A==
X-Received: by 2002:a05:6000:1a87:b0:20a:7ea5:2aef with SMTP id
 f7-20020a0560001a8700b0020a7ea52aefmr3034302wry.666.1650621877913; 
 Fri, 22 Apr 2022 03:04:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/61] hw/intc/arm_gicv3: Insist that redist region capacity
 matches CPU count
Date: Fri, 22 Apr 2022 11:03:34 +0100
Message-Id: <20220422100432.2288247-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Boards using the GICv3 need to configure it with both the total
number of CPUs and also the sizes of all the memory regions which
contain redistributors (one redistributor per CPU).  At the moment
the GICv3 checks that the number of CPUs specified is not too many to
fit in the defined redistributor regions, but in fact the code
assumes that the two match exactly.  For instance when we set the
GICR_TYPER.Last bit on the final redistributor in each region, we
assume that we don't need to consider the possibility of a region
being only half full of redistributors or even completely empty.  We
also assume in gicv3_redist_read() and gicv3_redist_write() that we
can calculate the CPU index from the offset within the MemoryRegion
and that this will always be in range.

Fortunately all the board code sets the redistributor region sizes to
exactly match the CPU count, so this isn't a visible bug.  We could
in theory make the GIC code handle non-full redistributor regions, or
have it automatically reduce the provided region sizes to match the
CPU count, but the simplest thing is just to strengthen the error
check and insist that the CPU count and redistributor region size
settings match exactly, since all the board code does that anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 90204be25b6..c797c82786b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -354,9 +354,9 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->nb_redist_regions; i++) {
         rdist_capacity += s->redist_region_count[i];
     }
-    if (rdist_capacity < s->num_cpu) {
+    if (rdist_capacity != s->num_cpu) {
         error_setg(errp, "Capacity of the redist regions(%d) "
-                   "is less than number of vcpus(%d)",
+                   "does not match the number of vcpus(%d)",
                    rdist_capacity, s->num_cpu);
         return;
     }
-- 
2.25.1


