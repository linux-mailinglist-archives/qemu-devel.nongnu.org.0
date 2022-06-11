Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636EA54743C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:30:44 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzKF-0001xq-DG
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUU-000751-Ie
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUS-0006qh-KY
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso761069wmr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbLPFFc7MFaTFJDTC3pMiLQiCLIDD7h/iPBGWVlSuoQ=;
 b=Wsk4vCSWymWQqBPPa/nMK3IZ8zxDFtfSWqD8eswkcxatb27gttgxj3ZSbO4GceEKFX
 z0JSZ1S59mBdIaz0PEPlui7HpSqbekMPKTx1CYkFaN6GSyLtvEQQAdFH26C6DV9Vo4d8
 /jhIYIAYXpsjiaAOmB9NetJKLPIJry+w/BIT15/gsfK4gEyoSUqU9l1Ss54fC+UjktXW
 TUIA3E7d3rno0tWHLdhwFiTcbJ7uWwApKCYFYcxknkoORdkKjsR91nfvICx+q2cjlbAb
 VGy7DXt/D1Y47ys+iESkm3jF2OyHB9UnDCiOZx04lLF7iSsoOHgrAv3YTENWVB7O8Hu/
 LYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbLPFFc7MFaTFJDTC3pMiLQiCLIDD7h/iPBGWVlSuoQ=;
 b=0f+C+1vkBOAycOt9WYcNtx2aKE6VCfx/gx4eBkU71A4OnhOXz1Acu//yCv8tcrXwLe
 v4eLPFKw1vJeSpLedpzVrLa1x+nNvSjFjyoi0Ja9z54tUBz57xXpH53hc8HJ4hcctzS7
 gIoUeS+k1mCOuAFMLC94Wzs+2jbLYV9WdXbRk9drAu09fQIDBOOiycxhJdusOmqi+Yvt
 EmnwSYE5ftT34I7PopMA547Ideoihbgt/VmZy32/JMWNZ7CQPqgIA+0VriY1u1DwLmO/
 NgK1b4YXVFxrY2rbuUpAQQ5n1UAe9orbQiDGO5vswwOlUAKEhFbijGSIjCPcBwLGYPUG
 rZ5Q==
X-Gm-Message-State: AOAM530WlU6zEL4+SLKiRI6Zba/fefyNIjz6/okNEnr+QgqP8ylz9fki
 WSIeBEjSdYHGdm0pUP2k3drUtvZXT0M=
X-Google-Smtp-Source: ABdhPJytaDu3661zBIPya83aHaYsQvcNeMj8k6JlUMc9ZCxWdbWpF1vWa10BV91FbRwqC9oL+rPfDA==
X-Received: by 2002:a05:600c:3d18:b0:39c:474c:eb with SMTP id
 bh24-20020a05600c3d1800b0039c474c00ebmr4178168wmb.87.1654943830948; 
 Sat, 11 Jun 2022 03:37:10 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0039c4ba160absm15131144wmq.2.2022.06.11.03.37.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 46/49] hw/net/fsl_etsec/etsec: Remove obsolete and unused
 etsec_create()
Date: Sat, 11 Jun 2022 12:33:09 +0200
Message-Id: <20220611103312.67773-47-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

etsec_create() wraps qdev API which is outdated. It is also unused,
so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/fsl_etsec/etsec.c | 23 -----------------------
 hw/net/fsl_etsec/etsec.h |  7 -------
 2 files changed, 30 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 4e6cc708de..b75d8e3dce 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -443,26 +443,3 @@ static void etsec_register_types(void)
 }
 
 type_init(etsec_register_types)
-
-DeviceState *etsec_create(hwaddr         base,
-                          MemoryRegion * mr,
-                          NICInfo      * nd,
-                          qemu_irq       tx_irq,
-                          qemu_irq       rx_irq,
-                          qemu_irq       err_irq)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("eTSEC");
-    qdev_set_nic_properties(dev, nd);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, tx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, rx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, err_irq);
-
-    memory_region_add_subregion(mr, base,
-                                SYS_BUS_DEVICE(dev)->mmio[0].memory);
-
-    return dev;
-}
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index fddf551544..3c625c955c 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -155,13 +155,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(eTSEC, ETSEC_COMMON)
 #define eTSEC_TRANSMIT 1
 #define eTSEC_RECEIVE  2
 
-DeviceState *etsec_create(hwaddr        base,
-                          MemoryRegion *mr,
-                          NICInfo      *nd,
-                          qemu_irq      tx_irq,
-                          qemu_irq      rx_irq,
-                          qemu_irq      err_irq);
-
 void etsec_update_irq(eTSEC *etsec);
 
 void etsec_walk_tx_ring(eTSEC *etsec, int ring_nbr);
-- 
2.36.1


