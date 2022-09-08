Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5ED5B2711
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:46:10 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNTV-00075l-6i
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOd-0004zr-0v; Thu, 08 Sep 2022 15:41:07 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOa-0007Ct-U6; Thu, 08 Sep 2022 15:41:06 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so13024154oth.8; 
 Thu, 08 Sep 2022 12:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IJGxDWIooTZeySostCt3cNZ9hfpj8NMfdT8RBIxinxI=;
 b=glsmiAAdYuBrOYNV8cfhD1EB+tqItuMT4ZRGJPE43Vyq6LpbbZhDL41eGgUbsoJmny
 cuZGWrogbnSDtVicxS2oHlzW65Ym1IehvhEjv1UueP4E5u8QuTUH1KriH1J64zAZ8+5T
 FPFwSRoPIRyBWgzwlZnxKiaWdurJBdixYwY6lO43FMMMNTk9myebc0mBo77cCEmOuf6t
 9imhivSY2lL+xpELJQI+TpQloGaGSssikQQVAZnqROOz8GS+e+hkpIIm1kVQe+685Aub
 H/XOpk5ZzgmliHbShnC6HUp8ooHPZ9sNRZRmfXfdHVgAwnHmlB6nGvGQ4/iu+FKaDCkk
 3b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IJGxDWIooTZeySostCt3cNZ9hfpj8NMfdT8RBIxinxI=;
 b=j8RFA2xFKA1zJ7q1OV3KsG3OTR1Fjyx3DWs93gHVkt+E5/dx+RrPnLFnJS9f18qczx
 TJ6S1jn00WsnkSmLm0e4nirZjz6ofpx0nYWJGISeX53hONPQAs5oTAQ0zckHmDfbGAib
 GC0I1sVYahI8/h5VOoFt4d6rWQXPJdCFv8IbKGli+TIGuV+f0+Zx0y7O6/pTUX4wbu3t
 NBva50iMm38AWasRJv5IR5eJZF1Zs8b1mamGv/5QOIz5RSWgrSeLPV9XDgzlsXNTq3yH
 MIPF617lRB7wkFKvNBnLsK0FDY9qmXny9bfQSOhQi7JkGHLskM379Vg48vB/Qv5yTxu6
 lTMQ==
X-Gm-Message-State: ACgBeo0OhUqZQ9e9KWsWGmwAksPNAdQBjzZuxpv7CS9idFV5SGLA8Bte
 6paYeS2DAtD0YNSnOUXT7Pw5Z+uTxUSVbQ==
X-Google-Smtp-Source: AA6agR6DeltvMlxZMTGhCmiCJ6VFTr7MTHE9AS67dV3sX7Fxt/PSS4x+Kx+vDds8to2f4L4tqGGOGA==
X-Received: by 2002:a05:6830:18c4:b0:636:ee33:158e with SMTP id
 v4-20020a05683018c400b00636ee33158emr4045445ote.239.1662666063350; 
 Thu, 08 Sep 2022 12:41:03 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v7 07/14] hw/ppc: set machine->fdt in xilinx_load_device_tree()
Date: Thu,  8 Sep 2022 16:40:33 -0300
Message-Id: <20220908194040.518400-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the
virtex_ml507 machine.

Setting machine->fdt requires a MachineState pointer to be used inside
xilinx_load_device_tree(). Let's change the function to receive this
pointer from the caller. kernel_cmdline' can be retrieved directly from
the 'machine' pointer. 'ramsize' wasn't being used so can be removed.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 493ea0c19f..13cace229b 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -45,6 +45,8 @@
 #include "hw/qdev-properties.h"
 #include "ppc405.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * MiB)
 
@@ -144,11 +146,10 @@ static void main_cpu_reset(void *opaque)
 }
 
 #define BINARY_DEVICE_TREE_FILE "virtex-ml507.dtb"
-static int xilinx_load_device_tree(hwaddr addr,
-                                      uint32_t ramsize,
-                                      hwaddr initrd_base,
-                                      hwaddr initrd_size,
-                                      const char *kernel_cmdline)
+static int xilinx_load_device_tree(MachineState *machine,
+                                   hwaddr addr,
+                                   hwaddr initrd_base,
+                                   hwaddr initrd_size)
 {
     char *path;
     int fdt_size;
@@ -190,18 +191,21 @@ static int xilinx_load_device_tree(hwaddr addr,
         error_report("couldn't set /chosen/linux,initrd-end");
     }
 
-    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
+    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
 static void virtex_init(MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
     hwaddr initrd_base = 0;
     int initrd_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -294,9 +298,8 @@ static void virtex_init(MachineState *machine)
         boot_info.fdt = high + (8192 * 2);
         boot_info.fdt &= ~8191;
 
-        xilinx_load_device_tree(boot_info.fdt, machine->ram_size,
-                                initrd_base, initrd_size,
-                                kernel_cmdline);
+        xilinx_load_device_tree(machine, boot_info.fdt,
+                                initrd_base, initrd_size);
     }
     env->load_info = &boot_info;
 }
-- 
2.37.2


