Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03632213E2C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 19:07:46 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrPA9-0000VC-0P
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 13:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrOxI-000510-Ae
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:54:28 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrOxG-0005gu-JR
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:54:27 -0400
Received: by mail-wm1-x343.google.com with SMTP id 17so34698628wmo.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K1voChlz8vWgeFf1uPl+d638S/hhQnZSLnL38yK92NY=;
 b=JFqFd5yhxwIvKdtUhTpkpcwGeRvxuV96DqWI4jadZkqixABHBhb9fKZ82q7Lx7WX49
 5nOG27gnbUWGC2XauG9gXsB+zyL2Y1Qtbvkwbf8NENudkNjpI5tyL8V5ZUvAZ1FPAvAI
 gVoMjwEEr2pHewKAhm/2feDhFNdQYGgITiJmbrAB/5eqYpp/kVbquJ8PsccISRlLUAHO
 BT9LDzC0X46Ly1NQZTBqOjpWvNvFFXI15uHMN3Vw5z0esLVieYQlA6BFF5VRJJaaDTUb
 cGLZLpPoPm0lWrm++xjpgBXkaSrK3BKHPsKTDzd71u/fCN5lwOYJgw8Xu1DjZBtPnrx7
 2bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K1voChlz8vWgeFf1uPl+d638S/hhQnZSLnL38yK92NY=;
 b=kXK7cz/b4rUEB3krrugX8aM7J1gUkypZVFYmcH1TNOu1uulY4u6efvM7op1AHsR75V
 QyqFzBYJ+W0AR9fv/nXGiNqTaFUeqfcraNob3rNtvQywS8TAD1OXZ3W6IClLBx++UWnl
 9usG3T59EZL99GEks3AoRKqewGT1YZc2PGF9i0ebx5Ss19ppGgncv+CtPZRsIP7JjNCQ
 RVAjMVifdSyN1AF1wu91vrXsh0qxZnYhcUyC/sETR0omstBSLBAZZWLycPhAaTsbczUb
 YYE3bwJFEgjmMF9YHZVqJwE/LCFkCPqkzxdJJyiAWRBReqrn1US6cYdQ896o1QJrKC4F
 qm3A==
X-Gm-Message-State: AOAM532kJsaDQw04u86uxXKiwuNHU99waKuzrauWb/SFheBTkadC2eN8
 OABNVSl35lvctRBkifQZ7Filp5y/owC4Tw==
X-Google-Smtp-Source: ABdhPJyEUWINVaKgLi4xApsxBRR8eOeu1rfyfineSqe224BHNiluYvrtkVRBF2o/3mb8uBuER0pSTQ==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr35719247wmn.167.1593795264910; 
 Fri, 03 Jul 2020 09:54:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm5574224wrx.69.2020.07.03.09.54.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 09:54:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/34] hw/display/bcm2835_fb.c: Initialize all fields of struct
Date: Fri,  3 Jul 2020 17:53:47 +0100
Message-Id: <20200703165405.17672-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703165405.17672-1-peter.maydell@linaro.org>
References: <20200703165405.17672-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In bcm2835_fb_mbox_push(), Coverity complains (CID 1429989) that we
pass a pointer to a local struct to another function without
initializing all its fields.  This is a real bug:
bcm2835_fb_reconfigure() copies the whole of our new BCM2385FBConfig
struct into s->config, so any fields we don't initialize will corrupt
the state of the device.

Copy the two fields which we don't want to update (pixo and alpha)
from the existing config so we don't accidentally change them.

Fixes: cfb7ba983857e40e88
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200628195436.27582-1-peter.maydell@linaro.org
---
 hw/display/bcm2835_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index c6263808a27..7c0e5eef2d5 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -282,6 +282,10 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     newconf.base = s->vcram_base | (value & 0xc0000000);
     newconf.base += BCM2835_FB_OFFSET;
 
+    /* Copy fields which we don't want to change from the existing config */
+    newconf.pixo = s->config.pixo;
+    newconf.alpha = s->config.alpha;
+
     bcm2835_fb_validate_config(&newconf);
 
     pitch = bcm2835_fb_get_pitch(&newconf);
-- 
2.20.1


