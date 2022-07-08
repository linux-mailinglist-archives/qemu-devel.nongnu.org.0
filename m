Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5A56BAD0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:33:10 +0200 (CEST)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o6W-0003zS-Qx
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzL-00030b-EU; Fri, 08 Jul 2022 09:25:43 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzI-00075X-VZ; Fri, 08 Jul 2022 09:25:43 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so29156400fac.13; 
 Fri, 08 Jul 2022 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mpEMCJe7xwwFfVuB0N8vuB9Jnd/D6SGgMuZj1piRMDQ=;
 b=bbpNV0XyYrwqYAWrXhfV1cS4i+GzVWvGvwlBboBH8bnCZhsyI1I01K7vm0rrJoiU+P
 qDsTGnvRCNg1AMnz6sptZbniKUNAB5Kv1hbUgkPfKxO6NAyBWmCrKbl82N/jzRIIGbuI
 xXJacPlZr860zpFW+wqCDB43rivT621tyN8MI83PGG/GzRkiqoA8dVTVq2dDbOLX2BUI
 qeguE6f0s1gZXBPPgUOFWEO/AWLZWUWvtD7EHnmxbmZgNv1CnTa1ShXHDA+4MX50xJiB
 R0BX5y+luvyRhUyd/srbikASyNnhTDrwK0Zhe4ppV2TCdD1+VIVQGtcV2lEU5Xvw7oQc
 NzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mpEMCJe7xwwFfVuB0N8vuB9Jnd/D6SGgMuZj1piRMDQ=;
 b=ee+MQcI3ty4HTgSGXQRpvseYHPFLLxO14mNiUikv3yv5NB4Gb+kBCZv5PC8mx1HOtK
 +460gaahz/hpWJ9X2bSyt1WS4f/ZA1nPcKo7vrLURPkqyX0A3jjY6rsQfVgOS8dUSQH5
 Q7VgTUWbg/M04iiV1+SHV7NEZs24UYSjB9dWfrmtvwy8fy3/YQcO/+BiRnPLbA0zwfku
 NxFLZVvwZE4lvSa1IwNvuq+Z/mWXn6uvYnOSFT+xWWjheJOkw7YoZRSfoEm2y4nRjIFR
 K4boKBnPmET7R/BSNDGCh6QnQCS9yO+S43ZpdFgf2oKdPb1V4yh9q79MIgWRcVCoIG6m
 /TKA==
X-Gm-Message-State: AJIora/rzov2DpNOCuujK6r4ytDYuXn18IcdrXE51Qb2ZouRYebKhku0
 fX/64KgkgDzsqmluxq/mWKOQsow9KXs=
X-Google-Smtp-Source: AGRyM1vwLUrkjruV6GjlySjkDj4fN5Mlgq6mhNBULQEdjHPCRg6eTti1Gur+oAma/cqSQ08nxjZk+A==
X-Received: by 2002:a05:6870:c8a9:b0:f2:87f0:670b with SMTP id
 er41-20020a056870c8a900b000f287f0670bmr1870658oab.143.1657286739152; 
 Fri, 08 Jul 2022 06:25:39 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 06/10] ppc/pnv: enable user created pnv-phb for powernv8
Date: Fri,  8 Jul 2022 10:25:18 -0300
Message-Id: <20220708132522.581382-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The bulk of the work was already done by previous patches.

Use defaults_enabled() to determine whether we need to create the
default devices or not.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 9 +++++++--
 hw/ppc/pnv.c          | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 077f391d59..953c384bf6 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -17,6 +17,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 
 /*
@@ -171,6 +172,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
+    if (phb->version == 3 && !defaults_enabled()) {
+        return;
+    }
+
     pnv_phb_attach_root_port(pci);
 }
 
@@ -206,7 +211,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb_realize;
     device_class_set_props(dc, pnv_phb_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static void pnv_phb_root_port_reset(DeviceState *dev)
@@ -297,7 +302,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
                                   &rpc->parent_reset);
     dc->reset = &pnv_phb_root_port_reset;
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     /* device_id will be written during realize() */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index a94f269644..f5af40ce39 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1155,6 +1155,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
+    if (!defaults_enabled()) {
+        return;
+    }
+
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
@@ -2107,6 +2111,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


