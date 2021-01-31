Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE0309B7F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:10:04 +0100 (CET)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AcF-0006lD-4q
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASZ-0007ZD-2i; Sun, 31 Jan 2021 06:00:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASX-0000Ua-5f; Sun, 31 Jan 2021 06:00:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id m13so13424601wro.12;
 Sun, 31 Jan 2021 03:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=CzQnvB+wAGG+ZM98ASAkFFlNd5GPT7S2Vr0TiFcZ9h1nMzE2O3ZNyjO7hWErIt03de
 fjSp7c3iPq/2WxBlx9/sTwl9uWSpjUMS8Z9R5+KnFlkYDqHVxfEqUkhcCYVpFHFpCZM1
 EyLsvmW25ZLIKF7VVERw6T5y147X8Rf21Oqsnijpb1ttu6lpZdu65CIdYeNp/l43ebJq
 RJ7CKc7F4X7q8342OojNpsZNi8u0rAVDJuaCUrkqntY654FYzosO++jtpr8e268GlFTh
 AyGqp9+70R1Y7OxX4WxOGP24+uK/tA6sDIaiCQa0aAFKIH0+jLBEBLgh6AcSBw5oR9Zo
 IKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=rVSBvL4RML67YWRBJFHOe0+GzprMB3W40ijmMdqjeaZ9KVYg2NzGGfu/QLfOgBI8+B
 gYer0y8EJb33Wm2x4mxrmUnCU47H484NZpBZpoNrTzVEeshYL1BgM0PkzMRX5yKqHRFT
 qZo8GPECrCMfqRhBwbpShtdt0r/cHPVOxcDOFWH6UkIll+U0vXdM7kKU55I6IxQNwisz
 YXR1IxxneBYSlMKOqbxc12g7sRY1D512RHzAKuRPc6H6IGBW4L/75DI4UU/A9gIIKjl5
 1u0c+NestB53nCGc+HW3z+WO118ipYT85/ma+rm0kP6cu7lkAI/DImI++I7FMZ3HDuTv
 HuVw==
X-Gm-Message-State: AOAM530sk2v686e6jcH/HRg6cG1iPz+c4w7581MhkGJ4vc/AxfO+DmFD
 cEdhVPsez3DlKvToQi6dpaLWN/vhU2A=
X-Google-Smtp-Source: ABdhPJyY553CHznXAkhgaIPNfhNT33w0WY2gzsrGRR8vsbuHKvEQywFza4gZYWFnvuBdxlbytBMrNA==
X-Received: by 2002:adf:f747:: with SMTP id z7mr13068572wrp.384.1612090799066; 
 Sun, 31 Jan 2021 02:59:59 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e11sm22314803wrx.14.2021.01.31.02.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] hw/arm: Display CPU type in machine description
Date: Sun, 31 Jan 2021 11:59:18 +0100
Message-Id: <20210131105918.228787-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of ARM machines display their CPU when QEMU list the available
machines (-M help). Some machines do not. Fix to unify the help
output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c  | 2 +-
 hw/arm/microbit.c      | 2 +-
 hw/arm/netduino2.c     | 2 +-
 hw/arm/netduinoplus2.c | 2 +-
 hw/arm/orangepi.c      | 2 +-
 hw/arm/stellaris.c     | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index be12873673b..6cdc1d83fca 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)
 
 static void canon_a1100_machine_init(MachineClass *mc)
 {
-    mc->desc = "Canon PowerShot A1100 IS";
+    mc->desc = "Canon PowerShot A1100 IS (ARM946)";
     mc->init = &canon_a1100_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_size = 64 * MiB;
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 0947491cb97..e9494334ce7 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "BBC micro:bit";
+    mc->desc = "BBC micro:bit (Cortex-M0)";
     mc->init = microbit_init;
     mc->max_cpus = 1;
 }
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 8f103341443..1733b71507c 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)
 
 static void netduino2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino 2 Machine";
+    mc->desc = "Netduino 2 Machine (Cortex-M3)";
     mc->init = netduino2_init;
     mc->ignore_memory_transaction_failures = true;
 }
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 68abd3ec69d..d3ad7a2b675 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)
 
 static void netduinoplus2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino Plus 2 Machine";
+    mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
     mc->init = netduinoplus2_init;
 }
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d6306dfddae..40cdb5c6d2c 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)
 
 static void orangepi_machine_init(MachineClass *mc)
 {
-    mc->desc = "Orange Pi PC";
+    mc->desc = "Orange Pi PC (Cortex-A7)";
     mc->init = orangepi_init;
     mc->block_default_type = IF_SD;
     mc->units_per_default_bus = 1;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index ad72c0959f1..27292ec4113 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S811EVB";
+    mc->desc = "Stellaris LM3S811EVB (Cortex-M3)";
     mc->init = lm3s811evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
@@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S6965EVB";
+    mc->desc = "Stellaris LM3S6965EVB (Cortex-M3)";
     mc->init = lm3s6965evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
-- 
2.26.2


