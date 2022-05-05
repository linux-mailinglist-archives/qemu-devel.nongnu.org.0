Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B93051C543
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:40:13 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeWR-0000mZ-Ck
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBS-00027y-I5; Thu, 05 May 2022 12:18:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBR-0005kW-23; Thu, 05 May 2022 12:18:30 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i19so9676692eja.11;
 Thu, 05 May 2022 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+73gejvQMvAP3s/0y0ZZzesiuBYtND4qvienTeKqs0I=;
 b=qX+qtO/9UC8gRFM+SvnPkQOTfo8TZSaWF/7/BVmpn72DAaL2yag4BPJSzYix0EhzHi
 o2borlKy0HgALAbXPGksWM90QAJy6LFclyJRBHFMQHZHI/WZYNJx1/86XWbQWMu7STsk
 RLv2KV2eU6b60382ovVceaR7AgM/gTWdLCP9hUiizbBD3/0mgxqM91k0+LuMEgPXR6Te
 cfTUHQJbvkPHtCL0LKHD+IeGEzvu6LX88g/pH5vqLGq0Q+VFpRb0DHxjiy9qncAKF4KX
 O0jWSI9mE3kfRljFaN47Q0gTpcZIUECFlIHhZC1RHbUzlTD8BQWDDaP7McpXGz6g+153
 NZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+73gejvQMvAP3s/0y0ZZzesiuBYtND4qvienTeKqs0I=;
 b=Z8gaVNGk/cfSFVolAAIFNH5YUCeEReAaSXXpCC3qt0nttshG0WJZsNSluMNtSEJ145
 aZYaJvk2w/WXrqOuz7ORsZPm15T5pOieJ76wdxypaung92gxvigJAilgfMtj/RuFvVej
 hzhevZFQm+VHGsaxkkjeJFCn/tDQiPNBgRudV+Gx1u3X2Wlcuh2GG8avHhXCUohn5meP
 /Sv64ZjuxvUtFkZ858KLINT/4jte1lx/BkvzbO7B0+cL8CWRMlr/o/jCfaSxpzF82Y24
 NR4RXiJyhusfRWM/RRDW5bXNVE6resMvUSm+8V3Uc6rkD+9lD2pFI6usxsoOHmn6R1qD
 kB3A==
X-Gm-Message-State: AOAM531v55vp5/Uopr7aJzwCo+3U5futiVs3BgnxBbHgD9jMxZ+Dt3c3
 95vqWm8SG9G9tPy8z5BuSdLTAqPER7Y=
X-Google-Smtp-Source: ABdhPJybzMHvKvGRuZnYJDJuXJhkFapGAn67U4Z3oUZ5QWQzXaVIvHsTP6Lb8AC3UfQEY0S5Jq9vwg==
X-Received: by 2002:a17:907:97d5:b0:6f5:405:ef01 with SMTP id
 js21-20020a17090797d500b006f50405ef01mr2368287ejc.551.1651767506760; 
 Thu, 05 May 2022 09:18:26 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org (open list:e500)
Subject: [PATCH 08/11] hw/net/fsl_etsec/etsec: Remove obsolete and unused
 etsec_create()
Date: Thu,  5 May 2022 18:18:02 +0200
Message-Id: <20220505161805.11116-9-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

etsec_create() wraps qdev API which is outdated. It is also unused,
so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/net/fsl_etsec/etsec.c | 23 -----------------------
 hw/net/fsl_etsec/etsec.h |  7 -------
 2 files changed, 30 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 6d50c39543..24deb47cff 100644
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
2.36.0


