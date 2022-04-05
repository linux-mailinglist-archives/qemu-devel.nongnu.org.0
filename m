Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A014F2086
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 02:54:02 +0200 (CEST)
Received: from localhost ([::1]:59980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbXSK-0005rF-36
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 20:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1nbXR9-00058D-Q1
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 20:52:47 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1nbXR7-0007LL-LA
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 20:52:47 -0400
Received: by mail-oi1-x231.google.com with SMTP id q129so11873062oif.4
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 17:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEqQPZf1iup3XqHQ662/aZcx5dNe1HrQQ3zuE3Ga/Zw=;
 b=IuRiH9ZEMMGiXDgBtndab3KemyHcr/U2hzUse7Dr2e0V+AkktaL2pPfX9AN1pu5BX9
 AvpTbjhIXD4/qmQ/w3RcjjTcZ25/Qs2u8IZGr7qCeyNwp6jt/qNy26TcXMuYh/O/cVMa
 jbJoIznlHKYmBEd4bIbdZpRd0xWYdREV0Q4IBK58Y1hhlbpj2AYfk4YKjv6y0Ix1R7yS
 jWQjxrm4tswmxvNyWZTOdvXoY9pyP9H2avWA9m+wF/uFwgDC8B7D4Fhgp71DliwPxe9q
 Q6Jq/wgnqO5zYy7FEq//iIhEcmiFyjaRLC1PcGsM8n42twjek+pEkdalEe4UMcAVP++6
 R9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MEqQPZf1iup3XqHQ662/aZcx5dNe1HrQQ3zuE3Ga/Zw=;
 b=8HgWUq15k/vymZQ3axa02NqcOvglpKLl+OMgqNHywdlk6cEzPe0Ut1R0+4GerNwMmR
 N3G1m3WJHTLT5Pq59mbU/do2Pltna4nOtWYk4zy+tIox9MYDXz8L6eHykFss+RNu6oSP
 dN3KvJ/vcJiqQ5lKRE5Sw2gi1R4EAZBwZdnKk7IOV3PZq2wU/h9ZYCbCWoskIgXx33LB
 EfGXGMTJgipsvhld1FBtYEM/U1n0ECne0yFtcUrVuvk9X8D8engnw3q3/LqXoFY1fsi2
 Wrp52S5r57LaE8yLC/kRL1yW3KD/E/qtmZ3cpRa1BoqbswasIC/0+n4dkXJYZBfEVv0S
 hsUw==
X-Gm-Message-State: AOAM531/Mn8wMvj2PTLpGDn/7h8zg+VnMe24SCejOiHbhsSXjNUsDWlE
 qwtgkgBpTWASkSfHrH55bE36NGwxh6ray0U9
X-Google-Smtp-Source: ABdhPJxFxze8nDQfEawd7oy2nr0XpqWTqChf7e1+xFjO6NYhnUs0e8rCJJU0y8OkC/yMYXdIxVSxZg==
X-Received: by 2002:aca:5941:0:b0:2f7:5c90:ad61 with SMTP id
 n62-20020aca5941000000b002f75c90ad61mr446818oib.190.1649119963630; 
 Mon, 04 Apr 2022 17:52:43 -0700 (PDT)
Received: from localhost.localdomain ([179.34.62.223])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a056870d3cc00b000ddeb925982sm4816399oag.38.2022.04.04.17.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 17:52:43 -0700 (PDT)
From: =?UTF-8?q?Pedro=20T=C3=B4rres?= <t0rr3sp3dr0@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3] hw/misc: applesmc: use host osk as default on macs
Date: Mon,  4 Apr 2022 21:46:22 -0300
Message-Id: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=t0rr3sp3dr0@gmail.com; helo=mail-oi1-x231.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Pedro=20To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 =?UTF-8?q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.a@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alexander Graf <agraf@suse.de>,
 Chetan Pant <chetan4windows@gmail.com>, "Gabriel L. Somlo" <gsomlo@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>, Susanne Graf <suse@csgraf.de>,
 =?UTF-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pedro Tôrres <t0rr3sp3dr0@gmail.com>

When running on a Mac, QEMU is able to get the host OSK and use it as
the default value for the AppleSMC device. The OSK query operation
doesn't require administrator privileges and can be executed by any user
on the system. This patch is based on Phil Dennis-Jordan's description
of the process for reading OSK from SCM on macOS:
https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html

In the future, this could also be extended to work on Linux and Windows
when running on Macs. Just implement the applesmc_read_osk function for
those platforms.

The Apple SMC driver for Linux is currently being rewritten by Hector
Martin as part of the effort to bring Linux to Macs with Apple Silicon
(Asahi Linux). When the new driver gets merged to the Linux Kernel, it
will be a good time to extend this to work with it.

Signed-off-by: Pedro Tôrres <t0rr3sp3dr0@gmail.com>
---
 hw/misc/applesmc.c | 75 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 81cd6b6423..c95e038bd2 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -5,6 +5,7 @@
  *
  *  Authors: Alexander Graf <agraf@suse.de>
  *           Susanne Graf <suse@csgraf.de>
+ *           Pedro Tôrres <t0rr3sp3dr0@gmail.com>
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -28,8 +29,16 @@
  * This driver was mostly created by looking at the Linux AppleSMC driver
  * implementation and does not support IRQ.
  *
+ * Reading OSK from SCM on macOS was implemented based on Phil Dennis-Jordan's
+ * description of the process:
+ * https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html
+ *
  */
 
+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+#endif
+
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -312,9 +321,62 @@ static const MemoryRegionOps applesmc_err_io_ops = {
     },
 };
 
+static bool applesmc_read_osk(uint8_t *osk)
+{
+#if defined(__APPLE__) && defined(__MACH__)
+    struct AppleSMCParams {
+        uint32_t key;
+        uint8_t __pad0[16];
+        uint8_t result;
+        uint8_t __pad1[7];
+        uint32_t size;
+        uint8_t __pad2[10];
+        uint8_t data8;
+        uint8_t __pad3[5];
+        uint8_t output[32];
+    };
+
+    io_service_t svc;
+    io_connect_t conn;
+    kern_return_t ret;
+    size_t size = sizeof(struct AppleSMCParams);
+    struct AppleSMCParams params_in = { .size = 32, .data8 = 5 };
+    struct AppleSMCParams params_out = {};
+
+    svc = IOServiceGetMatchingService(0, IOServiceMatching("AppleSMC"));
+    if (svc == 0) {
+        return false;
+    }
+
+    ret = IOServiceOpen(svc, mach_task_self(), 0, &conn);
+    if (ret != 0) {
+        return false;
+    }
+
+    for (params_in.key = 'OSK0'; params_in.key <= 'OSK1'; ++params_in.key) {
+        ret = IOConnectCallStructMethod(conn, 2, &params_in, size, &params_out, &size);
+        if (ret != 0) {
+            return false;
+        }
+
+        if (params_out.result != 0) {
+            return false;
+        }
+        memcpy(osk, params_out.output, params_in.size);
+
+        osk += params_in.size;
+    }
+
+    return true;
+#else
+    return false;
+#endif
+}
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
+    bool valid_osk = false;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (s->osk) {
+        valid_osk = strlen(s->osk) == 64;
+    } else {
+        valid_osk = applesmc_read_osk((uint8_t *) default_osk);
+        if (valid_osk) {
+            warn_report("Using AppleSMC with host OSK");
+            s->osk = default_osk;
+        }
+    }
+    if (!valid_osk) {
+        warn_report("Using AppleSMC with invalid OSK");
         s->osk = default_osk;
     }
 
-- 
2.32.0 (Apple Git-132)


