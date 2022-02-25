Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40B4C4181
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:34:29 +0100 (CET)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWzb-00050t-Tx
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1t-0004cl-Nd
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:50 -0500
Received: from [2607:f8b0:4864:20::102c] (port=34511
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1q-0002v3-5W
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:45 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so7056315pjb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRWwYIpH79WnXrvA95iIW6INZqQLTad2HjWVVpgkLC0=;
 b=d2vYCXBUwAUdtwRb8+lixc3GqHHLg5JstEinwApB7pgg23hA8rbgY0Sy17Fe+1vcAp
 VyJorYTrC5Og/KD6fgDnaHQMc+ya/DbkcQzu68eVzb3OrnzcWaNLHbF+SPJdktzXsCz/
 UTOp+JJ5RGvhF6Thay3qOipiF1ZsQNdexr6J8Sm26RLTJw4afkTA7gFcw7vXuxgfZwej
 M8d3zAjyVlI+y5NWAsTJtgjB6agV9KW3NRIJy0dJtPcdIdvD+43GpsSddQSOV0nbbI+f
 9t3S43z742ziQYOBcmM863oZNVUnu8AR5DD/zrbDgjYPKZTByBO5NykVbnMKiqfjcwtB
 Udeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRWwYIpH79WnXrvA95iIW6INZqQLTad2HjWVVpgkLC0=;
 b=ey1V9nESJr1BKxfyBUafoIPlYgR2te4M5jtAKlrnZ8yVSrIzJk7o47k7hpRXy6uoZn
 jBRUR3e6+sDierJHqUyUE88iBBd7SWRObCbRaiSFsJ1yGOJbVVzZUK86wnw8lMyij7VK
 zao95CXY+o/nv0gK1AzSztNqc/A8QnJ1wwpLRZ6wD7sIdasfUgy3ujoLeXXPj/z93nH6
 h7k26iBoOGL4OM//okowwejV5uZ74aAJ4A7P5RwKked8M+qT7tMZP1kvUjbm38NYRB9V
 Hg3JXwvyYfxF3y58k+8df4oulOP1YjHogKn/b7iYb+U/DyytNlo4FXyrH1QonNnt63QL
 dHjg==
X-Gm-Message-State: AOAM531hYUJwoupIH5/pqa4tueJJA/OWZYbLzDwNMMNC5/LE6gub2QH6
 xaGM4l45OwkB3m1+rLXVoxntIDoomqWhWeL0
X-Google-Smtp-Source: ABdhPJzIAaq/Fp1ckAgbgC7UMnjuCx9aGEB4S91f68yiwsDDMTY0MgigZKSEbQNAMNS5S0a8LNvujg==
X-Received: by 2002:a17:902:e289:b0:14f:ffd3:29bc with SMTP id
 o9-20020a170902e28900b0014fffd329bcmr6463021plc.35.1645777959979; 
 Fri, 25 Feb 2022 00:32:39 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a63f147000000b00373facf1083sm1769463pgk.57.2022.02.25.00.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:39 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
 UART
Date: Fri, 25 Feb 2022 17:32:19 +0900
Message-Id: <20220225083222.1174517-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
References: <20220225083222.1174517-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the OpenRISC SMP configuration only supports 2 cores due to
the UART IRQ routing being limited to 2 cores.  As was done in commit
1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.

This patch moves serial initialization out to it's own function and
uses a splitter to connect multiple CPU irq lines to the UART.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d12b3e0c5e..5bfbac00f8 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -137,6 +137,28 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
     sysbus_mmio_map(s, 0, base);
 }
 
+static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
+                                     OpenRISCCPU *cpus[], int irq_pin)
+{
+    qemu_irq serial_irq;
+    int i;
+
+    if (num_cpus > 1) {
+        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
+        qdev_realize_and_unref(splitter, NULL, &error_fatal);
+        for (i = 0; i < num_cpus; i++) {
+            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
+        }
+        serial_irq = qdev_get_gpio_in(splitter, 0);
+    } else {
+        serial_irq = get_cpu_irq(cpus, 0, irq_pin);
+    }
+    serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+}
+
+
 static void openrisc_load_kernel(ram_addr_t ram_size,
                                  const char *kernel_filename)
 {
@@ -177,7 +199,6 @@ static void openrisc_sim_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     OpenRISCCPU *cpus[2] = {};
     MemoryRegion *ram;
-    qemu_irq serial_irq;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -208,15 +229,10 @@ static void openrisc_sim_init(MachineState *machine)
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(or1ksim_memmap[OR1KSIM_OMPIC].base, smp_cpus,
                                 cpus, OR1KSIM_OMPIC_IRQ);
-
-        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ),
-                                    get_cpu_irq(cpus, 1, OR1KSIM_UART_IRQ));
-    } else {
-        serial_irq = get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ);
     }
 
-    serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
-                   serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    openrisc_sim_serial_init(or1ksim_memmap[OR1KSIM_UART].base, smp_cpus, cpus,
+                             OR1KSIM_UART_IRQ);
 
     openrisc_load_kernel(ram_size, kernel_filename);
 }
-- 
2.31.1


