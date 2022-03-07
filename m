Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328B4D0078
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:52:57 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDnE-00063v-4e
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDg7-000626-Ah
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:35 -0500
Received: from [2607:f8b0:4864:20::429] (port=42612
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDg5-0007Ho-EY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:35 -0500
Received: by mail-pf1-x429.google.com with SMTP id g19so2259027pfc.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EWxsRqGLmu+y9a9we3MPYsnUoSssM0/xVYg8aJ1C4w=;
 b=GMqB38FfSYvAOVXVP+qjOwle9pgAMWWa5ZGBMEnKCkFkI9jXNiJvclIXTbma6fFUqj
 hvi3XsjXnkWYYVxQcLhssO+6yQCeNfuphQpOAl94xuVjLIpFJ2MLCaC+35gf9r9RF9bC
 j3k7P1rKR+Y/ZE3MALFa3w131tobtwm1oLI2I1p4Ox1FKtKude+Gtlr9gaydnhhl9BSf
 ccO5GQcIGWK/mP2tDniTJZ9zqj8KiV5wt+SzNw2Ex3Tel9uIzCUMp2F3Xg8WTSWGJX7y
 WU3dkAaUpJW76oXE+uNMP7qoYpmtZNEgRgg648vsszpx4xHHi2iX9mI+SPXgo4URDXBQ
 WoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EWxsRqGLmu+y9a9we3MPYsnUoSssM0/xVYg8aJ1C4w=;
 b=2GwbGuOgzDWc9ERaMndU4E7N5uPcn+O1humST71oYC2183QmKVNvPLzdKVAsZ4pMKj
 wgLygrHgIyFWRzTl7ITY5ryWm+ST07gzDX1i3TqtxpzuI9y1h0BzvflSxzu9XFaMToC4
 MSv3s8WX4AQjPih1D1nBel5ZiBaCddZLhdWYmO5SOwZKyGDB6Iu6xRShrx0e5HwAYQLs
 OY6ritFAWZXkXyeUKCvoLjg41z6dpdXh28OZsuJ/qQGT6XMJyxgy6mmVa0n98V4QaYyA
 i702Hw74c1EqFeWcvN3ln0V8JKFWaZy5slbjzvKnN/rw83/ENhidImrBgaMwpz5yxvLO
 O6SA==
X-Gm-Message-State: AOAM532WhuRoFeEeMLXjm5k4/DAus2OIpWB/Oj5roLBIypOezt8FUpOE
 xf/mbpsvMTGLLvl1G2CNwj0=
X-Google-Smtp-Source: ABdhPJwbCOyh0yn/ul0vx44utYXAcW5SMzDwP9Ufs4QT9oKQ7NGFEJlEFWPrMDDWB+bJrGIKejn/pw==
X-Received: by 2002:a63:471f:0:b0:373:9b10:886e with SMTP id
 u31-20020a63471f000000b003739b10886emr9718846pga.307.1646660732236; 
 Mon, 07 Mar 2022 05:45:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aaf8500b001bd4c825deesm18740158pjq.43.2022.03.07.05.45.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:45:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 11/13] hw/isa/isa-bus: Remove isabus_dev_print()
Date: Mon,  7 Mar 2022 14:43:51 +0100
Message-Id: <20220307134353.1950-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

All isabus_dev_print() did was to print up to two IRQ numbers per
device. This is redundant if the IRQ numbers are present as QOM
properties (see e.g. the modified tests/qemu-iotests/172.out).

Now that the last devices relying on isabus_dev_print() had their IRQ
numbers QOM'ified, the contribution of this function ultimately became
redundant. Remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/isa-bus.c           | 16 ----------------
 tests/qemu-iotests/172.out | 26 --------------------------
 2 files changed, 42 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 6c31398dda..af5add6a26 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -21,21 +21,18 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
 
 static ISABus *isabus;
 
-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
 static void isa_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
-    k->print_dev = isabus_dev_print;
     k->get_fw_dev_path = isabus_get_fw_dev_path;
 }
 
@@ -222,19 +219,6 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     }
 }
 
-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
-{
-    ISADevice *d = ISA_DEVICE(dev);
-
-    if (d->isairq[1] != -1) {
-        monitor_printf(mon, "%*sisa irqs %d,%d\n", indent, "",
-                       d->isairq[0], d->isairq[1]);
-    } else if (d->isairq[0] != -1) {
-        monitor_printf(mon, "%*sisa irq %d\n", indent, "",
-                       d->isairq[0]);
-    }
-}
-
 static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 4cf4d536b4..9479b92185 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -15,7 +15,6 @@ Testing:
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -43,7 +42,6 @@ Testing: -fda TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -81,7 +79,6 @@ Testing: -fdb TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -135,7 +132,6 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -190,7 +186,6 @@ Testing: -fdb
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -230,7 +225,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -268,7 +262,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -322,7 +315,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -380,7 +372,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -418,7 +409,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -456,7 +446,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -520,7 +509,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -575,7 +563,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -630,7 +617,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -685,7 +671,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -749,7 +734,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -804,7 +788,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -865,7 +848,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -933,7 +915,6 @@ Testing: -device floppy
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -958,7 +939,6 @@ Testing: -device floppy,drive-type=120
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -983,7 +963,6 @@ Testing: -device floppy,drive-type=144
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1008,7 +987,6 @@ Testing: -device floppy,drive-type=288
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1036,7 +1014,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1074,7 +1051,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1115,7 +1091,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1153,7 +1128,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
-- 
2.34.1


