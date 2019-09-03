Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF623A6D4A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 17:51:48 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5B5v-0007Ua-Cm
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 11:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5ArU-0002uJ-59
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5ArS-0005ys-PC
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:36:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5ArS-0005yE-E9
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:36:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id n2so17415040wmk.4
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m5LyuFloMeiWOvUC1xvIB8Pb8XrZPnk3a+E9CwjfkEU=;
 b=E2rkC9QPMaVzfMW0907SSVlyojlomoUD2lNk4ZHI8KZcxDm5EIlfeb5QIRrP3WwqK8
 HzZGPFsSJSCKCO8RNJ3n+SobNBf6/FmnsBEsMPRfx6d3aeHI1BbFIUkukukDsuCy+4nV
 ngT96LyTU8dWvDIRb96B+UJ0zUK55TrJ5J4f5OvdhOL2Jxeqxu4N7M6Uty/rfGlo/sFO
 /awkkUoECTfFy1WHLfpKRiCLX/PS26yD491FP3reuG8LW2TbfjFrHCf4vyY0cHswng7z
 qKuuxAYi+Ajc3dzsd4pqopctWEambRj+1OHIs0SVG+KFgIMGVmmUSb3svqg1nCqgPNRC
 VNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5LyuFloMeiWOvUC1xvIB8Pb8XrZPnk3a+E9CwjfkEU=;
 b=mJ/CbQ0MBWNv3wG7eB16hK+p9uvQgl6NYkV8ED3gBESxW0CKfXAW9NTkWkhYGXjNrm
 E7ZIZ7bo9TlqGCwT7Sgi+017k2A57nOw/78/w1R+2rAxl24oSS+3HS4vzDVMnXAUN3me
 lhQdlaKKzTlvmSG56EePlanWQP5l9rAFn6niAnDuXFQ0ixiirIQ9mlCjN83PTz8I1or1
 hSiD7C4VCi7uaFo9ZAN5YgL/A2k5PmsBFlsxfeHUUacFR0lhpcw5LiV6ez5QkZJI4gZz
 QvPyAY/2Zk651RNpqSEsN8hLd3KZfJU8jAsm4/TTTKcDreaa+1pucAtVcfdUqG/tTbZN
 ihTw==
X-Gm-Message-State: APjAAAXYSDuTNS7+d6MBpTAL2NapP3R5zzfRmP03bNMRPp5+6zrXx+Pf
 IIady5PCFBZ0aMMsRfbIKLxQdVCNelwsSA==
X-Google-Smtp-Source: APXvYqyLJR8ZOKq9fSqNdX9x+3JFwbKl/VBrmMpFAJlZtFq9+rMbKjUOqWWPjOtNMc7nUvudIEuwtA==
X-Received: by 2002:a1c:ef18:: with SMTP id n24mr813146wmh.29.1567525009103;
 Tue, 03 Sep 2019 08:36:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a18sm24435188wrt.18.2019.09.03.08.36.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 08:36:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 16:36:23 +0100
Message-Id: <20190903153633.6651-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903153633.6651-1-peter.maydell@linaro.org>
References: <20190903153633.6651-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
Subject: [Qemu-devel] [PULL 11/21] hw/arm: Use object_initialize_child for
 correct reference counting
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190823143249.8096-3-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mcimx7d-sabre.c |  9 ++++-----
 hw/arm/mps2-tz.c       | 15 +++++++--------
 hw/arm/musca.c         |  9 +++++----
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 97b8bb788a1..78b87c502fc 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -30,7 +30,6 @@ static void mcimx7d_sabre_init(MachineState *machine)
 {
     static struct arm_boot_info boot_info;
     MCIMX7Sabre *s = g_new0(MCIMX7Sabre, 1);
-    Object *soc;
     int i;
 
     if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
@@ -49,10 +48,10 @@ static void mcimx7d_sabre_init(MachineState *machine)
         .nb_cpus = machine->smp.cpus,
     };
 
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX7);
-    soc = OBJECT(&s->soc);
-    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal);
-    object_property_set_bool(soc, true, "realized", &error_fatal);
+    object_initialize_child(OBJECT(machine), "soc",
+                            &s->soc, sizeof(s->soc),
+                            TYPE_FSL_IMX7, &error_fatal, NULL);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
 
     memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram",
                                          machine->ram_size);
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index d85dc2c4bd8..6b24aaacded 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -427,10 +427,10 @@ static void mps2tz_common_init(MachineState *machine)
     /* The sec_resp_cfg output from the IoTKit must be split into multiple
      * lines, one for each of the PPCs we create here, plus one per MSC.
      */
-    object_initialize(&mms->sec_resp_splitter, sizeof(mms->sec_resp_splitter),
-                      TYPE_SPLIT_IRQ);
-    object_property_add_child(OBJECT(machine), "sec-resp-splitter",
-                              OBJECT(&mms->sec_resp_splitter), &error_abort);
+    object_initialize_child(OBJECT(machine), "sec-resp-splitter",
+                            &mms->sec_resp_splitter,
+                            sizeof(mms->sec_resp_splitter),
+                            TYPE_SPLIT_IRQ, &error_abort, NULL);
     object_property_set_int(OBJECT(&mms->sec_resp_splitter),
                             ARRAY_SIZE(mms->ppc) + ARRAY_SIZE(mms->msc),
                             "num-lines", &error_fatal);
@@ -465,10 +465,9 @@ static void mps2tz_common_init(MachineState *machine)
      * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
      * Create the OR gate for this.
      */
-    object_initialize(&mms->uart_irq_orgate, sizeof(mms->uart_irq_orgate),
-                      TYPE_OR_IRQ);
-    object_property_add_child(OBJECT(mms), "uart-irq-orgate",
-                              OBJECT(&mms->uart_irq_orgate), &error_abort);
+    object_initialize_child(OBJECT(mms), "uart-irq-orgate",
+                            &mms->uart_irq_orgate, sizeof(mms->uart_irq_orgate),
+                            TYPE_OR_IRQ, &error_abort, NULL);
     object_property_set_int(OBJECT(&mms->uart_irq_orgate), 10, "num-lines",
                             &error_fatal);
     object_property_set_bool(OBJECT(&mms->uart_irq_orgate), true,
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index ddd8842732c..68db4b5b387 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -424,10 +424,11 @@ static void musca_init(MachineState *machine)
      * The sec_resp_cfg output from the SSE-200 must be split into multiple
      * lines, one for each of the PPCs we create here.
      */
-    object_initialize(&mms->sec_resp_splitter, sizeof(mms->sec_resp_splitter),
-                      TYPE_SPLIT_IRQ);
-    object_property_add_child(OBJECT(machine), "sec-resp-splitter",
-                              OBJECT(&mms->sec_resp_splitter), &error_fatal);
+    object_initialize_child(OBJECT(machine), "sec-resp-splitter",
+                            &mms->sec_resp_splitter,
+                            sizeof(mms->sec_resp_splitter),
+                            TYPE_SPLIT_IRQ, &error_fatal, NULL);
+
     object_property_set_int(OBJECT(&mms->sec_resp_splitter),
                             ARRAY_SIZE(mms->ppc), "num-lines", &error_fatal);
     object_property_set_bool(OBJECT(&mms->sec_resp_splitter), true,
-- 
2.20.1


