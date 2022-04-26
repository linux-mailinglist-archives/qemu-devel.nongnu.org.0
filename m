Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2E510891
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:08:00 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQXX-0005cj-LF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPqB-0002BB-7I
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq9-0005ZO-4B
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d15so30990082pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhY6IsLbZViijjLfLFhbBpoo7RTXZotmcRSvMZEYx1c=;
 b=kB7uM1eR1iXTlyyVSB+DQZdgxL3yjE4Bq5uDgmUhifIrlYxN9DfKCoi3zyE3K2+tjr
 G4H7gUYVB/WyNh91BQhGLw5N0UlL0HI2CSMHSZzb8wmvFy3ZR0wDi9Q9s4VHgk6w/j/l
 MApyi4n1s2bcXlT9brQN4oY9lVvkFKM5vfjqWQzpyLibx7VUAafjp/AGsR0axEUaA+RG
 WM0z9m/tKa2DGuLyxmYmBi4Pt6m/qFOnKODDwAgoccabRtJPfLLBa354n1/hBUyAN4wK
 7m8cq1TfVBpZtoHo5BUcTW2Gu6QoDHbm018ETKgP/euli+hsKY4ee91pJnRioMNBhCs1
 S+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhY6IsLbZViijjLfLFhbBpoo7RTXZotmcRSvMZEYx1c=;
 b=4M6IhuIbOhN9Ti4l4/lMgrQBUC+oIa0gYOYQDyLElKlGChCGRWzPUu9E6a8yZgJJ9S
 xYAIHL68d0LMwwiCCMSuB7LkvlacmcpTAfSMlwjyB1YsWxY55DGh1uh4aj8SZFmlazbZ
 9ib8j9Bwn/waMIqIGThR5x/5VVWfuwT1+OoRUaPB8FljGgOjlVWmJoz3MJl9emhewknC
 XzfKV7xWtCQpQPb+bba5hlEjsqITJ9KJWy5uYT2EevDI2JxpvIrx75RkM8+Oax/Ff2M0
 eUPRewkHu+XHnYEaXiGbpwNY1HRys5jgMPkr0CocIk8l1oYv+gPXt1Jq9dcsPYBOA/5D
 2VdA==
X-Gm-Message-State: AOAM531RWXfiCoDHvIj8P+aVgxw03yUDfU1+c01OliEDXK+5FWRGDh39
 CLo82tv+uURFqOO+S2V/cyJLKyH8o5Sjtg==
X-Google-Smtp-Source: ABdhPJxJX+0+cZzl3h5tHTIZ7JXjMM2zBjg5HoCW+WdfsJD28YMJsz1Th5KnjhY0qO5NZ++moqGQeg==
X-Received: by 2002:a17:902:ab43:b0:156:6f38:52b3 with SMTP id
 ij3-20020a170902ab4300b001566f3852b3mr24540276plb.135.1650997387841; 
 Tue, 26 Apr 2022 11:23:07 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 65/68] hw/nios2: Move memory regions into Nios2Machine
Date: Tue, 26 Apr 2022 11:19:04 -0700
Message-Id: <20220426181907.103691-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to contiguous allocation, as much as possible so far.
The two timer objects are not exposed for subobject allocation.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-62-richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index bdc3ffd50d..dda4ab2bf5 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -38,6 +38,11 @@
 
 struct Nios2MachineState {
     MachineState parent_obj;
+
+    MemoryRegion phys_tcm;
+    MemoryRegion phys_tcm_alias;
+    MemoryRegion phys_ram;
+    MemoryRegion phys_ram_alias;
 };
 
 #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
@@ -47,13 +52,10 @@ OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
 
 static void nios2_10m50_ghrd_init(MachineState *machine)
 {
+    Nios2MachineState *nms = NIOS2_MACHINE(machine);
     Nios2CPU *cpu;
     DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
-    MemoryRegion *phys_tcm = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_tcm_alias = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_ram_alias = g_new(MemoryRegion, 1);
     ram_addr_t tcm_base = 0x0;
     ram_addr_t tcm_size = 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB */
     ram_addr_t ram_base = 0x08000000;
@@ -62,22 +64,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     int i;
 
     /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */
-    memory_region_init_ram(phys_tcm, NULL, "nios2.tcm", tcm_size,
+    memory_region_init_ram(&nms->phys_tcm, NULL, "nios2.tcm", tcm_size,
                            &error_abort);
-    memory_region_init_alias(phys_tcm_alias, NULL, "nios2.tcm.alias",
-                             phys_tcm, 0, tcm_size);
-    memory_region_add_subregion(address_space_mem, tcm_base, phys_tcm);
+    memory_region_init_alias(&nms->phys_tcm_alias, NULL, "nios2.tcm.alias",
+                             &nms->phys_tcm, 0, tcm_size);
+    memory_region_add_subregion(address_space_mem, tcm_base, &nms->phys_tcm);
     memory_region_add_subregion(address_space_mem, 0xc0000000 + tcm_base,
-                                phys_tcm_alias);
+                                &nms->phys_tcm_alias);
 
     /* Physical DRAM with alias at 0xc0000000 */
-    memory_region_init_ram(phys_ram, NULL, "nios2.ram", ram_size,
+    memory_region_init_ram(&nms->phys_ram, NULL, "nios2.ram", ram_size,
                            &error_abort);
-    memory_region_init_alias(phys_ram_alias, NULL, "nios2.ram.alias",
-                             phys_ram, 0, ram_size);
-    memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
+    memory_region_init_alias(&nms->phys_ram_alias, NULL, "nios2.ram.alias",
+                             &nms->phys_ram, 0, ram_size);
+    memory_region_add_subregion(address_space_mem, ram_base, &nms->phys_ram);
     memory_region_add_subregion(address_space_mem, 0xc0000000 + ram_base,
-                                phys_ram_alias);
+                                &nms->phys_ram_alias);
 
     /* Create CPU -- FIXME */
     cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-- 
2.34.1


