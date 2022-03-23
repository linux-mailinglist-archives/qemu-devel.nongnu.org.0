Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262244E57E4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:54:03 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5BK-00037G-86
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:54:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uA-0008Iy-Ui
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:19 -0400
Received: from [2607:f8b0:4864:20::635] (port=34748
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u9-0005Uj-JM
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:18 -0400
Received: by mail-pl1-x635.google.com with SMTP id i11so2215397plr.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkrhIhe7YG6BgM78VtHLUlMDvp0jiKNofViYVhBy1/U=;
 b=qNVxXYid4f/16xzVNs/iRGfRJPgcmWKGFlOjDzQgeIh67roBFhkrYI8UH1l8weVvel
 1zthPzYsS8KW8Uv6S5mvFnERlSthed+P6pOhQzYFNdBwuaVH3K694RqLiyRrjSzLlifP
 BUnYyuPsWkkPZv3Sx/u+DmPQ9VJYS/BwS6ep1zx7badznB2wSy6F59EUiKeAax0USpek
 UKhHKiI6+3HnOXEmX9x0dzgwp5U3gNI0quDZwvBo3d99C2RY0xjL1Qs0ii1uGFPt4JGW
 XxJcdKtvAAbkxNNi5sQRKuBM8ol6v19eL7D2qQD4ieX4BE/Ya6Qwze7toJgpcxthUZmK
 /H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkrhIhe7YG6BgM78VtHLUlMDvp0jiKNofViYVhBy1/U=;
 b=3Oz6tbYa907InBgZMMCbrzX+u7tAqPkWkgCqIngBIOQhXbaAo8nA7L41TvHGU2MyyJ
 2OxxpeDWR4ZBGHz+vYGOq2uq5ao18HndTfoUDjrfkltVo+ej3zs3yncKkcRcd1XTSUHF
 TtCYl8rvqHUF0dusoKYcrDupiCizvbkdFTVr/wVwirP0oSyIgIEsQX3EMxoqYTNGMxel
 XmXWZbHZE1BL8suWjUPx/oHsfJuLyif9AcFR9/AZyp5P9PtWbQNH07IekxNJGiWgvQ//
 wcY+UfQgTraWo6HdXF5ujqCMyq+tQuA/zyXvrCg+zRNBAZaJWkG0YY4WeOe+deheJjcN
 o72Q==
X-Gm-Message-State: AOAM530XsTmF5irTlZp35RPhriZCOuayKVBtAkYDYdnAjMwy+lB5U0Qs
 bkV+dPK6CJhnN9Rmd/4FG9meBE2I/+t6fA==
X-Google-Smtp-Source: ABdhPJxHDwYqLctuDaYvfKu3tSUO686BqEsY2/Kosnwxm/FJwE8hA9cNpyhIn4TNj5WgXEbHnm6Omw==
X-Received: by 2002:a17:90b:3b44:b0:1c7:9ca8:a19e with SMTP id
 ot4-20020a17090b3b4400b001c79ca8a19emr3352514pjb.245.1648056976172; 
 Wed, 23 Mar 2022 10:36:16 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:15 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:40 +0800
Message-Id: <20220323173543.146442-3-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/stellaris.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d609..ccc2d5def2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1023,6 +1024,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     I2CBus *i2c;
     DeviceState *dev;
     DeviceState *ssys_dev;
+	DeviceState *gpio_d_splitter;
     int i;
     int j;
     const uint8_t *macaddr;
@@ -1237,9 +1239,20 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            if (!qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal)) {
+                return;
+            }
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
2.34.0


