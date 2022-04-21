Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56719509EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:43:47 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVDu-0004Bp-DU
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqU-0003MM-Ik
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqR-0003Xx-Ps
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h25so177568wrc.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uM2Z8pOmM345Tmz6p1sACjfjRoZTp+FYU6GMrrVCQUQ=;
 b=HHP4jVN51SEgdlWe4LzqFH5voCB/4YczYRRrdxwYWYgCT6M5jvbyi9c/KfFDNOUnnT
 vzkVdOX65/0Jyv3u2D2uEujgNdJGqgQIWG2YsHc6G6vCiWhk1BbMLKkD6e43Gd7pqAyH
 JKPZKFRFRE6SWP6uqm2vyQm4MJqZpe0toM3B/SnCVutKcbmif3LTooz8TYYyZyL2n9Fn
 0MxAJxUwarv8Q6PJptvD1VNxiiyBozdsNS8RVKbaNVQSM+eVM5MJJVmmPUqlceBppmOa
 Q5XrV9pAAVdu9+sas4aDVhCu5p569eXoTdfByLh9r17RtqgSb1k1sVY6nStzS2Eq0ty9
 bFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uM2Z8pOmM345Tmz6p1sACjfjRoZTp+FYU6GMrrVCQUQ=;
 b=h73WlVWiO7RxXRV92qtZpyJOIvacA91uCTCawCZRiGDDSvyLZX94MSFBVuCsAZYlG3
 EKAvPx94YdIr34im87a51pHGI0x0OAXJ6kZkFkEHapDL6zdoIoA1MGDpJj6x+7UFl33d
 uMC9JVj2gIBqu6e5RuMqWOJANOlHja/kUkZlWUBmDEhgaR+2R2PRw9CVCvTN5nDfRj1V
 urVQe9zE+YgCAVreOlJ1DHx1jahZ6JI2fwh8qtv8Si8jq/UO2L5K+0Uc4EnkIm4O+/Me
 12D6aAtuKCCPxLAoIKfSy6W8/JvbEiCeKmKVRmBCP8VM6zpfMY+Vns+p8hUmrbK/TzZH
 +L9A==
X-Gm-Message-State: AOAM530jgbVYcW0FUzsA96tXs3UpLgJN7/j0pOUFwqCxU47/JxPy6rzL
 Dg9Nk/Brq+/merQaWCZraqoj3lpE7Pu/zQ==
X-Google-Smtp-Source: ABdhPJxRUZaKNs5fxpeZHiOQAGofy4of8Si7ZkYcTu8J3w573HO9isdiwMYkSsUYGyZ512lI5ZkKRw==
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr19823553wrp.407.1650539954144; 
 Thu, 21 Apr 2022 04:19:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 21 Apr 2022 12:18:42 +0100
Message-Id: <20220421111846.2011565-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Zongyuan Li <zongyuan.li@smartx.com>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220324181557.203805-3-zongyuan.li@smartx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d6098..12c673c9172 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1160,6 +1161,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *ssddev;
             DriveInfo *dinfo;
             DeviceState *carddev;
+            DeviceState *gpio_d_splitter;
             BlockBackend *blk;
 
             /*
@@ -1237,9 +1239,18 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 0,
+                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 1,
                     qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
+            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
+
             gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);
 
             /* Make sure the select pin is high.  */
-- 
2.25.1


