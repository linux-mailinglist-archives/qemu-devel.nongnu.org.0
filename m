Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6424CFD04
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:34:02 +0100 (CET)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBcn-0007ql-PN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMd-0004jo-G8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:15 -0500
Received: from [2a00:1450:4864:20::432] (port=37635
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMb-0004Ng-Of
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id q14so6808587wrc.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EWxsRqGLmu+y9a9we3MPYsnUoSssM0/xVYg8aJ1C4w=;
 b=Idfz7Fpq17OOZyFdhWdQNdYa8M9BR+1BzVohsRr0YQGvSp1BAU9saHlnLK7rYBu3Xt
 Fr5uHxdda+UgJkAF0Z7zI9FqiiL2ylfBzc+bdz1/akaIn1VcDh1qdJIXjCjdkCXvh/sa
 vKK3b7wTeDD5KuKOly4BGtirBja6YnOHqtD9n9eM4VffMx2iVS10DYPXavhk9c3XMNAr
 gWAaQjc/iXLiCB1d+WNEdX0BdpS2OHBdIzg+HOxRTMz0t0gjPw6fye2BjMp2WLNRA67m
 dNl7RsACeaeNd4nZmZNsmm184WWDNhxpWG9jUSouhL9/7+gjR62dxqU0+V9jVvEFLeP/
 Ot5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EWxsRqGLmu+y9a9we3MPYsnUoSssM0/xVYg8aJ1C4w=;
 b=7xZ28fnLYAt9VAb5pTjxctlBtRUX3mEipfd8UrryeT7F7cZrkiB98CZpor9920dVRE
 ZkAZt1HPNTWZGNUaeuJFgzJPiBsipXObA9UhMt4oo95NVbfCbLWFjfV7Ps6ty3bkEK0+
 PnJi1VSdnJi1OCD/Sa3Q796nFymdulX9UdtVGTG/3GcneLUQK/JdRT8yKj8VerZTdOgl
 X8uJ1DQZES5KxYICeMLSZpMxJZnBSq7dcAg4U3ASX8u7hZos+S79tKZM2HcNXQGtAsxt
 dBfvlwN/Ir8txfwuSgd3mR1DbLRa6nwj/Z4l/WeM8Ms9h7YC5pVlVcOIEs2dLyVwdhuV
 QJEA==
X-Gm-Message-State: AOAM533CNMKp6jvntpJSySIFcv7hMdgMDuaoH8QoscvdHIWq8ywUGx6s
 vHx3ygOMIv40w2dVgU/NdaGvMTVkVvM=
X-Google-Smtp-Source: ABdhPJyi0D5oD+uY2x5+VaRnA+ljORrELvKd0gcj8mAzMk3DliDtb6n8YNxcyGMcJJ3W1rpBF+e/JA==
X-Received: by 2002:a05:6000:1c06:b0:1f1:ed99:8143 with SMTP id
 ba6-20020a0560001c0600b001f1ed998143mr4278556wrb.163.1646647991988; 
 Mon, 07 Mar 2022 02:13:11 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b00389a826abd3sm1807742wmq.42.2022.03.07.02.13.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] hw/isa/isa-bus: Remove isabus_dev_print()
Date: Mon,  7 Mar 2022 11:12:04 +0100
Message-Id: <20220307101207.90369-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


