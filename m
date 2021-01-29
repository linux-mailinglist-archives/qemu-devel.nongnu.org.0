Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFE308822
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:14:52 +0100 (CET)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rjn-0006rx-D2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWK-00051i-9s
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:56 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW8-00075v-H3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id q7so8360630wre.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eht0LJqJ9FMWYx5205hZqgRzo6MSLq+VxidcXNoJE5o=;
 b=I56KBXl+5LBHGgLirgc7nvcWNa69AQddpfifFFvt9jdK3d/Kprmtknb06ZCEc8xDzF
 PaPxp3JRJyY+SmrCnlRL6cD4YxH5l0Tt835/zcgrXTxH2p0z3hGpNK7czRzPQ0WKAEFq
 M/McjlFRBUOiv1LnICFQno01HGkcyE2O/mFhevWLl8yKux3ApVdB2N9Nh510D8QzOH23
 PfhqxsAhUZfqsRmylpPbk9qp9bFE2UEL2XHtGDSBfke5/6yIQiNaORMxa8iuSoo7UOjq
 GmlFjr/OjMnmz2QIIoRkKO67u6CjLOqW1YhgtT8AgYh10ZqD1hnrvyYc3hdSwWdJds+L
 /uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eht0LJqJ9FMWYx5205hZqgRzo6MSLq+VxidcXNoJE5o=;
 b=FwXYv+Fdp8ewmLGlV+cNBSoT3FLy/tCEJiGupbpFeZU3BU3Z7Wi0T5RKbhLsE6oWUW
 ImfPdbQHEdbSawJ7Cw8drDQlnTeUMsq1HPbfiERW+meaASkpVhGe6rtERZ7wdLf/OQ7T
 L5WPddwv1huppyMWM7xxeHrCHYaLoEOCJFc3BqcX+18XJEDRgRjJSZDlIAjXl7lBYic7
 zxcr7CGOpRE2lDrHmDcOQmhJrnZ1RuOJksUd6RssLBWBCLXXflReqYzZ4IWj+b/pWCa0
 Y1Yeh1tHJOkhu9c9bxefn96H6LAMiKh73Xk96HPjoiqWgiEg6q92ZmgCMq7d2zFD/ast
 Sfrg==
X-Gm-Message-State: AOAM532heAX/ENAUcdHEW8A1UfxTNbNi1y/ax10nBUBXmUiYFeq/7tbG
 qxdRzKmzIq3KNwaebe4OWz0Ui3oPD9BGxA==
X-Google-Smtp-Source: ABdhPJx+61QlB9Le953GDbLjLGAFYR7ofvdlR5mIuZpVk65/PpBsKc51xImevK4EE46Ln5u+6iw3FA==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr3919016wre.408.1611918043059; 
 Fri, 29 Jan 2021 03:00:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/46] hw/arm/armsse: Rename "MAINCLK" property to "MAINCLK_FRQ"
Date: Fri, 29 Jan 2021 10:59:57 +0000
Message-Id: <20210129110012.8660-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

While we transition the ARMSSE code from integer properties
specifying clock frequencies to Clock objects, we want to have the
device provide both at once.  We want the final name of the main
input Clock to be "MAINCLK", following the hardware name.
Unfortunately creating an input Clock with a name X creates an
under-the-hood QOM property X; for "MAINCLK" this clashes with the
existing UINT32 property of that name.

Rename the UINT32 property to MAINCLK_FRQ so it can coexist with the
MAINCLK Clock; once the transition is complete MAINCLK_FRQ will be
deleted.

Commit created with:
 perl -p -i -e 's/MAINCLK/MAINCLK_FRQ/g' hw/arm/{armsse,mps2-tz,musca}.c include/hw/arm/armsse.h

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-11-peter.maydell@linaro.org
Message-id: 20210121190622.22000-11-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 6 +++---
 hw/arm/mps2-tz.c        | 2 +-
 hw/arm/musca.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 83f5e28c16e..4860a793f4b 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -39,7 +39,7 @@
  * QEMU interface:
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
- *  + QOM property "MAINCLK" is the frequency of the main system clock
+ *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
  *    (In hardware, the SSE-200 permits the number of expansion interrupts
  *    for the two CPUs to be configured separately, but we restrict it to
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index baac027659d..d2ba0459c44 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -47,7 +47,7 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
@@ -59,7 +59,7 @@ static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
@@ -448,7 +448,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     if (!s->mainclk_frq) {
-        error_setg(errp, "MAINCLK property was not set");
+        error_setg(errp, "MAINCLK_FRQ property was not set");
         return;
     }
 
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3707876d6d4..6a9eed9022a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -402,7 +402,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
-    qdev_prop_set_uint32(iotkitdev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index b50157f63a6..d82bef11cf2 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -375,7 +375,7 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
-    qdev_prop_set_uint32(ssedev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
     /*
      * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
      * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-- 
2.20.1


