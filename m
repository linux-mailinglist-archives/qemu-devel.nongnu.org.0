Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE254210C5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:54:13 +0200 (CEST)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOQ0-000810-S0
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJz-0006Lq-AF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJw-0007K9-ID
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id r10so14419072wra.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1v9TqC347QTL0iy7WAjvcLe/L9RSHF/zcwT3VIh2fdQ=;
 b=njtQ0dVf5j3EEH+pgtVEKnkijA0Oct5X3sPFi+01MybE4XtM8Mcx4c9BmRyc57QA99
 cPAC1pgcuD7LG7ex2A33qPvv9AnQ3ieGBOY6cZq4L8zKtWbeikkLeQS1T0Hol1R6Scfm
 4KrCYHIN28lJzn6TWaAUfSiak96V5cyd1leFjlPPWusaqXjXgyx5P4aeog647lDkhJHN
 mu7MDmziS+NPI51qClZ1TX+43nSeDgjsRXpJxZOIhzZLmOZVEO0yaC/vPFMViBUkPaUi
 HMLvL/QX0f1rDS+b33qeDT+PaWpBDqHld/F/SaCVVeZBJcRiGKgRfeBEIvN8XMPra4TI
 FLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1v9TqC347QTL0iy7WAjvcLe/L9RSHF/zcwT3VIh2fdQ=;
 b=PJ0Ryca2v2VjzcZIZ4DDAYAB0JtdSoDdPar5MOz4dMaN+f9jWJ3u/iA+0D42qeOXEd
 IQbBnQeNnqs+nmPJNOQepzN9xxZXnMn7WjNmPqY9I7GWr4QaItiedFV3Xln2RtLClZur
 aFT7g/pbsThHvFLNcrBFyltPeqsVUpw8pIgzrWyse1yaii498/k9+d1yLq0oqT12KvCo
 5nY/aQpY1jYwgCioXAdEybAuZ3P/yOxJ0NsHubYXemiZe0sfDg7uZFYGcgxOvQ0mqJc5
 azhUgC+HfQdrAd4sAtrrbRbkbf3nAg3+D9QNh1lLRq3k+nbBXI//28/oilYZPDvUBvaA
 kRjQ==
X-Gm-Message-State: AOAM5325LW7Bcrt9b4F5m4lH4fOolnD/MzMsRNXP0wnd+FUqB26+GJqf
 xUHP9xQKXXFH1hfBbmv5nm8Alg==
X-Google-Smtp-Source: ABdhPJw05pktVn2n60MZQ+QZ/7HTbSBWTqXukzDSvbWGczNieeBFFvhp8SVm15RKbne83GzFewThtg==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr15086947wrp.397.1633355273021; 
 Mon, 04 Oct 2021 06:47:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm15890463wmi.1.2021.10.04.06.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8AFBE1FF9D;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/7] hw/arm/bcm2838: Map the PCIe memory space
Date: Mon,  4 Oct 2021 14:47:40 +0100
Message-Id: <20211004134742.2044280-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2711 has a BCM54213 Gigabit Ethernet block mapped in the PCIe
range.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
FIXME: create the bcm54213-geth in raspi.c?
vAJB:
  - fix for move of gic_base to bc
---
 hw/arm/bcm2836.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 99dc15e6e4..ff62e741ce 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "hw/misc/unimp.h"
 
 typedef struct BCM283XClass {
     /*< private >*/
@@ -46,6 +47,8 @@ static Property bcm2836_enabled_cores_property =
 #define GIC_VIFACE_OTHER_OFS(cpu)  (0x5000 + (cpu) * 0x200)
 #define GIC_VCPU_OFS                0x6000
 
+#define PCIE_BASE                   0x7d500000
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -227,6 +230,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
+
+    /* bcm2838 kludge to easily create PCIe */
+    if (bc->gic_base) {
+        create_unimplemented_device("bcm2838-pcie", PCIE_BASE, 0x100000);
+        create_unimplemented_device("bcm54213-geth",
+                                    PCIE_BASE + 0x80000, 0x10000);
+    }
 }
 
 static void bcm283x_class_init(ObjectClass *oc, void *data)
-- 
2.30.2


