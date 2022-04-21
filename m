Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD17509EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:43:55 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVE2-0004S9-Hm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq6-0003BT-SN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq4-0003WH-N1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id w4so6175904wrg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eg02MfewzqD34GfCv6gUqyp7N32TaZTJUBAY/UnbV7k=;
 b=tUtl+e+DxAOnuKU7tEpwTfSmYg3VZ+4yL4j9a6aSeve94IyBU1LaDvbE6HlfMSA9iI
 1PyNctNWyj0b6dXeWrM+A5fJbjb22l4MO1W8mXZSyhl0gsAh3pM0gzRSnHs5qJ1WIaxj
 SKzDzV18Ip2ngRmi5ySJX4rnqZvue8oQeDbnWflGPosNImG3Kq8j6DmNgHmDDyixQtjs
 Wz10f/R8GxMIBtq5GGKEVohbF+2LhUVz6aeeCzYtlGNJR8pYQKAPNmfd5qd9HktIwYet
 y3dD3NaPt8vgL06PJpEsmEdA8hip7y2XqWGeYB9o5TS2r2SU3ZcYYz+sl16z/ftBmCNr
 4PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eg02MfewzqD34GfCv6gUqyp7N32TaZTJUBAY/UnbV7k=;
 b=e3n9bEjFdL45kBxO3Io3aM07ZDO/qvuvx97+An5X2i6G3MynD7qckJ07TNG6ZLyVLI
 udiOZkgy2k0YIfPS6swTMFTDiRf+nLs+vAX74eyUKJvWjv7hwOwtWmFcFCZ6EQ96JzF6
 FhdNIH0S1nSfcvR88wj8pdill5io4nL3/9ENswGugvaBo+onH/zMEwwR2ZVcxLtC4JhA
 nxc0rtQvGgIDMliHVjfIjh8nmELoRurDt9NWqTDEa6vzkGXc22ijQjk1nkjeqcNjrLwQ
 sFdEqtm/Bjw08lya+xe7i+kAasiYBFCKyV5by9V4hxTdA7CVzL/rFr0rqafeTOsGnhNP
 dgnA==
X-Gm-Message-State: AOAM533tfqXcDZutJZdvsHGC+Rxj2L2dg4RO3NEghrtafOAe2iHs8fdc
 HKZg6BvISdtab2lwpn7e1Q/ygZd/SZVbbQ==
X-Google-Smtp-Source: ABdhPJyt32qHr17FnwOaot+NS87c6V423qkQwGuRJjNp7ozimOwsSIV8o1s+2joAhNZFDarw+m9o/g==
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr18819233wrq.341.1650539946907; 
 Thu, 21 Apr 2022 04:19:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/31] hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to both
 combiners
Date: Thu, 21 Apr 2022 12:18:36 +0100
Message-Id: <20220421111846.2011565-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Currently for the interrupts MCT_G0 and MCT_G1 which are
the only ones in the input range of the external combiner
and which are also wired to the external GIC, we connect
them only to the internal combiner and the external GIC.
This seems likely to be a bug, as all other interrupts
which are in the input range of both combiners are
connected to both combiners. (The fact that the code in
exynos4210_combiner_get_gpioin() is also trying to wire
up these inputs on both combiners also suggests this.)

Wire these interrupts up to both combiners, like the rest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-15-peter.maydell@linaro.org
---
 hw/arm/exynos4210.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index a4527f819ef..962d6d0ac2a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -281,16 +281,15 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
         assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
         splitter = DEVICE(&s->splitter[splitcount]);
-        qdev_prop_set_uint16(splitter, "num-lines", 2);
+        qdev_prop_set_uint16(splitter, "num-lines", irq_id ? 3 : 2);
         qdev_realize(splitter, NULL, &error_abort);
         splitcount++;
         s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
         qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+        qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         if (irq_id) {
-            qdev_connect_gpio_out(splitter, 1,
+            qdev_connect_gpio_out(splitter, 2,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
-        } else {
-            qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
-- 
2.25.1


