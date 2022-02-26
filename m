Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56414C533C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:10:22 +0100 (CET)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmXN-0003sJ-Qn
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmND-0002LS-Sn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:52 -0500
Received: from [2607:f8b0:4864:20::102d] (port=45014
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmNB-00075Y-8b
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so6414707pjb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=QvohHUfrp/iRvg5Kdre7sEfoO894aetYT0py7BXzZfeHRDfwE1dyIGBmHCAB3lr7qe
 zndfeUnUoxoiyQLomHehXXtRSF+rXt9cklQpDDdrKpu0T2Hl9aCEcT9yYatsy2kF5IwU
 TLQIyIVb/4ReUZHP+sa9DJBGH4yK1esn+geZVdQnvIOTeKzB0CAlF5Q5evhf8vnk9paF
 MsXeXr6yuAexKOnox969Oq/BbZbMirlMDJKeQM/ww4yY2nsKn1AT9ynOPOcHxMkaTpQp
 LyR4MlQF6KdPfC9Qvo94CYpELr6yssJP2WW1V92vHGD8OmHXAHOC7mnx0L/dCsWCF3Kw
 pvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=0TyxwOQsvi1JUQjON65ExgrsvKErSOGQH9U8P2roSg3cEZi6ZfrsD4kZgi5gURh7Ep
 1j6cFO50M1lT0YJiP6rTs0o8AJ8VQzaAL35Cc6hyjeYnQ39rxJDaz8bny9uVkV8sY3fp
 /lIYXeC5Ix2W/YLXk1EuacnUpH04cZZqeCkqkpijVU5r9ssiT4+rtswIkG26XWiRC8o/
 2mg26GSMCZXrxhOTmvbO4xm3AXCoAgAoZ/XO3c2zKW5Tky0Z5cMGYp4WndPCVz9Moa86
 nqj8pe7+IkxxlwmiBfiVC6NS2nFaD5pBSIF7BJma7WmgWqGqBKxeCMT0Gs5V/Za/hWa0
 ULaA==
X-Gm-Message-State: AOAM5312SkNXvhoYSwkhVpP19xg+PrVP+Szr9bUPAfZd9Y/xIjuB44ox
 PHS8ivawGDxvI41AIx4bpR0+QDRqbWygig==
X-Google-Smtp-Source: ABdhPJx1WgF0TmjJXrfS8QDc1ESm6xvSen6erRz2LbRofLVKVr5ie9nfVoi2g+i59SHx5K2xPZBfLQ==
X-Received: by 2002:a17:90b:3693:b0:1bc:89f0:e38f with SMTP id
 mj19-20020a17090b369300b001bc89f0e38fmr5976196pjb.171.1645840784142; 
 Fri, 25 Feb 2022 17:59:44 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a17090ab29300b001bc13b4bf91sm10393027pjr.43.2022.02.25.17.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:43 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 6/6] hw/openrisc/openrisc_sim: Add support for initrd loading
Date: Sat, 26 Feb 2022 10:59:24 +0900
Message-Id: <20220226015924.1293022-7-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
References: <20220226015924.1293022-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initrd passed via the command line is loaded into memory.  It's
location and size is then added to the device tree so the kernel knows
where to find it.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/openrisc/openrisc_sim.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index e0e71c0faa..8184caa60b 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -315,6 +315,33 @@ static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
     return 0;
 }
 
+static hwaddr openrisc_load_initrd(Or1ksimState *state, const char *filename,
+                                   hwaddr load_start, uint64_t mem_size)
+{
+    void *fdt = state->fdt;
+    int size;
+    hwaddr start;
+
+    /* We put the initrd right after the kernel; page aligned. */
+    start = TARGET_PAGE_ALIGN(load_start);
+
+    size = load_ramdisk(filename, start, mem_size - start);
+    if (size < 0) {
+        size = load_image_targphys(filename, start, mem_size - start);
+        if (size < 0) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_cell(fdt, "/chosen",
+                          "linux,initrd-start", start);
+    qemu_fdt_setprop_cell(fdt, "/chosen",
+                          "linux,initrd-end", start + size);
+
+    return start + size;
+}
+
 static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
                                   uint64_t mem_size)
 {
@@ -393,6 +420,10 @@ static void openrisc_sim_init(MachineState *machine)
 
     load_addr = openrisc_load_kernel(ram_size, kernel_filename);
     if (load_addr > 0) {
+        if (machine->initrd_filename) {
+            load_addr = openrisc_load_initrd(state, machine->initrd_filename,
+                                             load_addr, machine->ram_size);
+        }
         boot_info.fdt_addr = openrisc_load_fdt(state, load_addr,
                                                machine->ram_size);
     }
-- 
2.31.1


