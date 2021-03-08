Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A280E33154C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:54:50 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK5h-0005XY-MY
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJky-0006xI-Kq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkj-000767-QG
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so4309246wml.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7xYZ+HciElGUaFRNp8Vvkg6tWFIMlpBDq+4h/wI/xJ8=;
 b=QW/g2Vrw1GJ0znTFWjb5cJaOD4GdpPj3tNXmcLRGiLFus3Tphkk5PVNlpIXw6FyCOD
 4BF57p9reZcxl8nrnQGYO0xDKUPDRhWpMhMUk9QFv5mZScMn9mpwRAY0F8vfcKTmQEMR
 nuzCNK+lMS1WQR7DYeGi/jlneXSuC8iTvaDYRJiU6Pa0aB2PGZTUidNMrPaC9LtGKmHx
 i6HUqqlfBUOFvUuMv0TQOYCkn7YVuJvcG+NpGlNn4Cit6YJnxNJMPVZFSDi/hPlJUBDB
 ttvvGXfmtsf7MXO7sYo2QMHJzxfbPDXyqbwkHJUbW/X3M0PfiGsIIxt6AvAWBl8kDVTM
 w+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xYZ+HciElGUaFRNp8Vvkg6tWFIMlpBDq+4h/wI/xJ8=;
 b=YuY1Bzz45zWwlgD6rdc70Vy75wOlknDwRXe4X9OCOT4ZDEyzHDUDWkSPV51in9h7kk
 A85W2nXhk4s5oHQ1NeeWvnSx7ayB//6yq/S31EmKx1D5mM/q1HPYGSk2Prq3ZY4lU0UT
 xAHYzGeL5IAcNmFO3GSCNejF7RKyiNYj+Bdw23bI/S7X8ZFiBwLxO1cdXZiX8O182nYc
 EDf+cLWGvqri4UurTA1FxAIYCfhJIwKi7UhWtSSzmgaj7e23YWdR/qNX4xK8wEAGJ2Gf
 0RRLJYD2uN8ccG9xJUfR06vD+yZc1/jq9RmHzmDXjui8McQ9xabvuKMWOWoWv/z45kpr
 qAEA==
X-Gm-Message-State: AOAM532hcFVczUN9FlzY5W5ktC6b96vrHHh98kpQ+EkW85W3Eg5Sbgwi
 /tVCg/xYXjggCNfQ65R8/tAwGNPnPAyS2A==
X-Google-Smtp-Source: ABdhPJz+dncdNumMpXXEBO4ms3fqXd8pFBjsUg6fahdMPEdC3ivcYZNaA3CcskfRD7zt7e8Jfh+6Eg==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr13652889wmb.2.1615224786741; 
 Mon, 08 Mar 2021 09:33:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/54] hw/arm/armsse: Move sysinfo register block into
 data-driven framework
Date: Mon,  8 Mar 2021 17:32:17 +0000
Message-Id: <20210308173244.20710-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the sysinfo register block into the data-driven framework.

While we are moving the code for configuring this device around,
regularize on using &error_abortw when setting the integer
properties: they are all simple DEFINE_PROP_UINT32 properties so the
setting can never fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-28-peter.maydell@linaro.org
---
 hw/arm/armsse.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 3270362d599..91f30b1fdc4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -157,6 +157,14 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NMI_1,
     },
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x40020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
@@ -407,6 +415,10 @@ static void armsse_init(Object *obj)
             object_initialize_child(obj, devinfo->name,
                                     &s->cmsdk_watchdog[devinfo->index],
                                     TYPE_CMSDK_APB_WATCHDOG);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->sysinfo,
+                                    TYPE_IOTKIT_SYSINFO);
         } else {
             g_assert_not_reached();
         }
@@ -437,8 +449,6 @@ static void armsse_init(Object *obj)
 
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
-    object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
-                            TYPE_IOTKIT_SYSINFO);
     if (info->has_mhus) {
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
@@ -889,6 +899,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            sbd = SYS_BUS_DEVICE(&s->sysinfo);
+
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
+                                    info->sys_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
+                                    armsse_sys_config_value(s, info),
+                                    &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
+                                    info->sse_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
+                                    info->iidr, &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1106,23 +1132,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
-                                 info->sys_version, errp)) {
-        return;
-    }
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
-                                 armsse_sys_config_value(s, info), errp)) {
-        return;
-    }
-    object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
-                            info->sse_version, &error_abort);
-    object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
-                            info->iidr, &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
-        return;
-    }
-    /* System information registers */
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
     object_property_set_int(OBJECT(&s->sysctl), "sse-version",
                             info->sse_version, &error_abort);
-- 
2.20.1


