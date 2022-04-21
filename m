Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198C509E89
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:28:10 +0200 (CEST)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUyn-0005IL-3N
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpq-0002ln-TL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpp-0003QI-48
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id x18so6241562wrc.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wfsVKDSs56nO298B9eGbm6n11u9EwnB13l23WZAxciw=;
 b=Tq/20ZDirVD5MPM9Tg3S22Mt9CzMpQEFaxl+LQPDNzTThjK5bt8bVB6k1X6hOzT+nd
 hAM06HKLbt4AT0bcE6xwVgJSaSICS6GbZTllrtIux11/VYZCgTxFkkPt2dVavJ+XU/AR
 fUd74zWmQZCbhOBy4KjX03qsaE/QxR94cMU6943fBpiWGGmNXyQjPIiu8lo1RH5QEryb
 HELbiX4G8JNZ5Ga8tRcVx5x80twdkG5iIoM317K1cypomsXEA09b8Te/scvXb0TIBl1F
 t0VjqKGTH+cygtVu2oTppWYe1vIg4LoN2aZutFC0Ydyo6ox/dagQTICXk1kOZDELphzK
 YKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfsVKDSs56nO298B9eGbm6n11u9EwnB13l23WZAxciw=;
 b=LvRR27z6oYwN8u/TrX4b5X7j373DRv9/TpiGAvv1o79Y88Vwdw8JcxCRX4r7LYLGLS
 khOK1EDejy+SamQm3vui84z3fkkh7X6/U4T1feWo2KUm+/spCXeapmN7N/sW3YM3KY5q
 9RIXhHjnvT2xgE4wS1q3FLW10SZ/f8YNRllxhL71pSvRtsUkGOUZsXjyI9nGklKtnol2
 l/QAdgYVh+F9Dv1YxmNoZGEgwtA1DWu1RYL+mggNmvPi7TmPZiPGWVpARyM6H24eRi6Q
 76pO66quF12S8E4hwzOnTs6cHM8wby+xjUEvVZHBMZ44u+dAFWK5bqLF2pbLL0V6iyPn
 Rfjw==
X-Gm-Message-State: AOAM533gaCI2nwkb8ozXA1y50uQ0v9A5xByPjOsGvmSgmjYo3/m8DiNP
 UDe84CrtLYF1TV1uEBI1zNS9fy7Hbct1jA==
X-Google-Smtp-Source: ABdhPJwUhtqyYWrx6cXOilYvhbf3YTbHJQyPitps91dEKe5+rbOZxJJH41jqmpccNoHAZKM+/NWoYg==
X-Received: by 2002:a5d:5604:0:b0:207:a2a3:2f3d with SMTP id
 l4-20020a5d5604000000b00207a2a32f3dmr18913328wrv.358.1650539931618; 
 Thu, 21 Apr 2022 04:18:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/31] hw/arm: versal: Create an APU CPU Cluster
Date: Thu, 21 Apr 2022 12:18:19 +0100
Message-Id: <20220421111846.2011565-5-peter.maydell@linaro.org>
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

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Create an APU CPU Cluster. This is in preparation to add the RPU.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Message-id: 20220406174303.2022038-2-edgar.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 2 ++
 hw/arm/xlnx-versal.c         | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 0728316ec77..d2d3028e185 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -14,6 +14,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
+#include "hw/cpu/cluster.h"
 #include "hw/or-irq.h"
 #include "hw/sd/sdhci.h"
 #include "hw/intc/arm_gicv3.h"
@@ -49,6 +50,7 @@ struct Versal {
     struct {
         struct {
             MemoryRegion mr;
+            CPUClusterState cluster;
             ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
             GICv3State gic;
         } apu;
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 2551dfc22d6..4415ee413fc 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -34,10 +34,15 @@ static void versal_create_apu_cpus(Versal *s)
 {
     int i;
 
+    object_initialize_child(OBJECT(s), "apu-cluster", &s->fpd.apu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->fpd.apu.cluster), "cluster-id", 0);
+
     for (i = 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
         Object *obj;
 
-        object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
+        object_initialize_child(OBJECT(&s->fpd.apu.cluster),
+                                "apu-cpu[*]", &s->fpd.apu.cpu[i],
                                 XLNX_VERSAL_ACPU_TYPE);
         obj = OBJECT(&s->fpd.apu.cpu[i]);
         if (i) {
@@ -52,6 +57,8 @@ static void versal_create_apu_cpus(Versal *s)
                                  &error_abort);
         qdev_realize(DEVICE(obj), NULL, &error_fatal);
     }
+
+    qdev_realize(DEVICE(&s->fpd.apu.cluster), NULL, &error_fatal);
 }
 
 static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
-- 
2.25.1


