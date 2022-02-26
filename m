Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0244C5338
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:05:41 +0100 (CET)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmSq-0008Qj-Sm
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMz-0002Ak-D6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:37 -0500
Received: from [2607:f8b0:4864:20::634] (port=41595
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMx-00073y-6B
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:36 -0500
Received: by mail-pl1-x634.google.com with SMTP id z2so6212798plg.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=BC5bX26qNPBkxG06zdeOi9paDeFz73kbKnGIzzJTvBMSGbveQyYMABsIXrC1w5GpcZ
 vwv5ELQp0+yzx7soRlVp6WQW556XLO341XlGYhwOzUkrC2s3Wgcv44edRUbG5tISuIEE
 3H2oPP9U8AuaxZ6gq+1vTSEDEsiwI56VckNHPKfyMW1BNi7TPPfaqjCB+TaUd+w1VGFL
 W6mRSVn8OFSSKX7goKK6n/PXulIflSKtN/sf8ErwK8ypbthuJs8iCxI9d4TyQkYeWbwN
 mNLPUf0fsFwD66+EAKgQC63HQIuzzzVn4BcJC+RTYvPs+WmOCY7tlfwv+GN3YMDd9dQ+
 /DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=WPNL5anHum3OiQjE9x/8boR4tyYQysLlsarayk+teuIpHsv2XMNOyWEb5rMOnisZIJ
 vVlC/m3+KPkhcEtZW7u7hxgcehyj2s8WSXdg6pAxAVodU0CG0tUOd/0cd+wOcftwLTF7
 B2xq1Gq0zb0WyikP+XnY4hhQL3e/hgS9r7CCyQYSWhSFSeSakFJY6hAofj8oecaS/4QJ
 JqFsBvn0yq2tp5GbtdYZUpPRiz2xDy6bTByPqeiam/dXyzO9mZzPVn43DWEKD3CPTlLA
 V+ASmWHSuAkw1OUoyTzGWM7tvyjtPuKxDpK7Mrsw4q2N65J6ojiKvw5BENqg45dXmDw+
 c6sQ==
X-Gm-Message-State: AOAM530kSIywRdXRlRvk0nfy+RzUOpr5eY6x3e74HnQP7Tb1t/2o94Gw
 1nzW3UBS9YaK42d5dAhNjGyY56FLUkQ6PQ==
X-Google-Smtp-Source: ABdhPJwJLGnhBVmUyQH4NKH4UJ+72AtUHVfmPx0wRtVESJcE+LWBnaDzvIrcs5o7/jBaqkmYo0hqjw==
X-Received: by 2002:a17:90a:70c5:b0:1bc:9a6c:843c with SMTP id
 a5-20020a17090a70c500b001bc9a6c843cmr5925869pjm.83.1645840773175; 
 Fri, 25 Feb 2022 17:59:33 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a63fe57000000b0036490068f12sm3760828pgj.90.2022.02.25.17.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:32 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 2/6] hw/openrisc/openrisc_sim: Parameterize initialization
Date: Sat, 26 Feb 2022 10:59:20 +0900
Message-Id: <20220226015924.1293022-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
References: <20220226015924.1293022-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move magic numbers to variables and enums. These will be reused for
upcoming fdt initialization.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 42 ++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 26d2370e60..d12b3e0c5e 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -49,6 +49,29 @@ typedef struct Or1ksimState {
 
 } Or1ksimState;
 
+enum {
+    OR1KSIM_DRAM,
+    OR1KSIM_UART,
+    OR1KSIM_ETHOC,
+    OR1KSIM_OMPIC,
+};
+
+enum {
+    OR1KSIM_OMPIC_IRQ = 1,
+    OR1KSIM_UART_IRQ = 2,
+    OR1KSIM_ETHOC_IRQ = 4,
+};
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} or1ksim_memmap[] = {
+    [OR1KSIM_DRAM] =      { 0x00000000,          0 },
+    [OR1KSIM_UART] =      { 0x90000000,      0x100 },
+    [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
+    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
+};
+
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
 } boot_info;
@@ -176,21 +199,24 @@ static void openrisc_sim_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0, ram);
 
     if (nd_table[0].used) {
-        openrisc_sim_net_init(0x92000000, 0x92000400, smp_cpus,
-                              cpus, 4, nd_table);
+        openrisc_sim_net_init(or1ksim_memmap[OR1KSIM_ETHOC].base,
+                              or1ksim_memmap[OR1KSIM_ETHOC].base + 0x400,
+                              smp_cpus, cpus,
+                              OR1KSIM_ETHOC_IRQ, nd_table);
     }
 
     if (smp_cpus > 1) {
-        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpus, 1);
+        openrisc_sim_ompic_init(or1ksim_memmap[OR1KSIM_OMPIC].base, smp_cpus,
+                                cpus, OR1KSIM_OMPIC_IRQ);
 
-        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, 2),
-                                    get_cpu_irq(cpus, 1, 2));
+        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ),
+                                    get_cpu_irq(cpus, 1, OR1KSIM_UART_IRQ));
     } else {
-        serial_irq = get_cpu_irq(cpus, 0, 2);
+        serial_irq = get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ);
     }
 
-    serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
+                   serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
 
     openrisc_load_kernel(ram_size, kernel_filename);
 }
-- 
2.31.1


