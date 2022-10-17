Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6F6017DB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:40:20 +0200 (CEST)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVyE-0003Yi-Lg
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfz-0002m2-4Q; Mon, 17 Oct 2022 15:21:28 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfx-0002yh-L6; Mon, 17 Oct 2022 15:21:26 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 z11-20020a05683020cb00b00661a95cf920so6359646otq.5; 
 Mon, 17 Oct 2022 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucBINp7qsRISBMjTXg66YJ+tRcZMxd0gKORoFwq6RbY=;
 b=pI8r1fSJMImV/d8nxGN18rPBxE2ZjgkpQ0hLYEA7uzrAxYjyVdOk3xq5kjhrjXB5Ap
 SQmygPKwpZ0ctIqTqRXvnBsP5e94mscouDaN/wbPcLLpq7a6t0jFawLtg7km+xSQEJfn
 nUypsMiphFzwevcXjq2CqkeoKVi60FeqZ21G89eGQKbKN5QFVCIYqOXjf4dPSp66YT0D
 Pk4RolsI1+zkmOr9GQGN2Uqf7Fy/2A+VU8VmoE58ilhmz+PxUBY7nCBg6rCL9tP7EmL0
 2mXMFkAaor6UkJaGYB3rHFyeO0bm2PPSkVz83SCUAPvl7+DU/bjt9tLw6oqdfbew8p+B
 J4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucBINp7qsRISBMjTXg66YJ+tRcZMxd0gKORoFwq6RbY=;
 b=RPb4RqE/FmBqxnS46kPWVJTt++ogvr5Qlk5zXP7FpFWT5QQqrM3l7ZMce4n+ZTMzAN
 DUZXi9VhgcEJR4G7ED+dl9mVCDl8Gryxjb6SFedekbz64u8iOUpCtOv14TUZCqZSvrd2
 mSrhFebHMqFklHuaNcMb2h/VFGS4HhkoAOl1M1dU7/7lC6OTkwCDFxqmkAgTzPfWgrC5
 I2QDBppH95HTlVeBYWJ33YwmZTmeuY69mjWxp0a4g/aO7vPn32x++alXUE2X4AEBaehQ
 rf/2+5CnMtY3B/nm/R1YO/PW4cKRKZS1/YEsoYx2Trmd9QM50DFgBGOchujhduD2ZdAD
 CFGw==
X-Gm-Message-State: ACrzQf0NW8rGL2Gbw8F3ZsJnYzdLiBNF4Gphv+jfR1+ReSQqGgesT+8G
 EZ7yKO977RWBTFUBb2TaYKiTWoJ3jNI=
X-Google-Smtp-Source: AMsMyM4gVtCv5jSpeZ2g8ORSztypgT0ZZRVA6J+lX0GBMZXFA9zwXWmqADpo2GCSlxIn6fIO4PQ/Wg==
X-Received: by 2002:a05:6830:b8d:b0:65f:22fb:be09 with SMTP id
 a13-20020a0568300b8d00b0065f22fbbe09mr5629942otv.38.1666034483636; 
 Mon, 17 Oct 2022 12:21:23 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 25/38] hw/ppc/mpc8544ds: Add platform bus
Date: Mon, 17 Oct 2022 16:19:56 -0300
Message-Id: <20221017192009.92404-26-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Models the real device more closely.

Address and size values are taken from mpc8544.dts from the linux-5.17.7
tree. The IRQ range is taken from e500plat.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20221003203142.24355-7-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/mpc8544ds.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 8e674ad195..9c81477698 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -14,6 +14,7 @@
 #include "sysemu/device_tree.h"
 #include "hw/ppc/openpic.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "cpu.h"
 
 static void mpc8544ds_fixup_devtree(void *fdt)
@@ -45,6 +46,11 @@ static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
+    pmc->has_platform_bus = true;
+    pmc->platform_bus_base = 0xFF800000ULL;
+    pmc->platform_bus_size = 8 * MiB;
+    pmc->platform_bus_first_irq = 5;
+    pmc->platform_bus_num_irqs = 10;
     pmc->ccsrbar_base = 0xE0000000ULL;
     pmc->pci_mmio_base = 0xC0000000ULL;
     pmc->pci_mmio_bus_base = 0xC0000000ULL;
-- 
2.37.3


