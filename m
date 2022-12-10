Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBFF648F8D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42Cd-0003pU-L3; Sat, 10 Dec 2022 10:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42Cb-0003mm-M9
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CY-0004Uc-Rh
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so7978055wrw.13
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAIyeA7URHRc9R78H/YlOyhbX6NAYtvfVcML/GjO4L4=;
 b=bhjZzU3MTClQdCNmAaXU4SrNnUXhmvXa6/a2EPTQeZGi2NqGy6BFu0gZWWPAPFq+Tc
 vuryAXYcsjjBH5x6jERbU5Zlqak+OytLoRPYfdCdG6kfFjt27kfRCrZChxPOKPF72Njt
 ES2JEivvEP9ARskT9ccIeNGIq08xedqbD5eCyxbUFyVW/hKrOKnXZ80mIaR022Cs1Zo5
 HcEaYCXqBzUr8NOiQA90okRuY+rxOveTNz8Vi9hZjzHTknRU3uZJlDWtUCa/42rrXauk
 G8Q4QPxaEUOHqZYRFzUnmsLQ+fluaxk+tIlEvZB1LAlHCJsn3HLygYcuQJHCB/hYzwI2
 AjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAIyeA7URHRc9R78H/YlOyhbX6NAYtvfVcML/GjO4L4=;
 b=HmG2PHqGUlDi/lFuFK3BK9Gmex9HIfDgvqmPe7EfiIM5NfSbDxaudxsMHw+t3w/Byn
 XHUXuW94KNpS94vRgYSfvHUG4qULX5/jJ5egG4dTA59YcBkEebre7p3TA9Un+UivQXEQ
 AIc6+82spUTdQdtEy9hM0olnKVHCGBDx6HNnQ5dK7Pv2+QWjcgt6ZqrizUOI8I3M1GQD
 mLF1/vw+YzNQ7YD6uuXSupexEF8HJ30x1ZJI7YEhXUnZ2cRPXF4dw4TdoVCF1g2G9KvP
 GxnB08fn5dcoYFLGb2E6tjY2WsL3v2fui6SKcGqmKLoxaufxg+eESTDGN5X67NHocQEn
 RCow==
X-Gm-Message-State: ANoB5pnTrvQTCJKqeECCPJGcloFKpF4tSyMjHxl+jJsVxvwXuq/8Wel6
 q5RZah6hZTwXdYN1AIUjoncBm+8Hi5ZVIHpQlMc=
X-Google-Smtp-Source: AA0mqf6CQW2ywvR7uK/ygLG+pmvoIbdMJ2RuSzhp4huVtjGlIcv4eaEXV+HaEby4lTrHIo7h5PtjGA==
X-Received: by 2002:a5d:4312:0:b0:241:997a:4f57 with SMTP id
 h18-20020a5d4312000000b00241997a4f57mr5985153wrq.39.1670687745326; 
 Sat, 10 Dec 2022 07:55:45 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020adfee52000000b00236883f2f5csm4180686wro.94.2022.12.10.07.55.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 7/7] hw/mips/malta: Use bootloader generator API for
 nanoMIPS CPUs
Date: Sat, 10 Dec 2022 16:55:02 +0100
Message-Id: <20221210155502.74609-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Similarly to how commit 0c8427baf0 ("hw/mips/malta: Use bootloader
helper to set BAR registers") converted write_bootloader(), convert
the equivalent write_bootloader_nanomips(), allowing us to modify
the bootloader code more easily in the future.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 148 ++++++++++++------------------------------------
 1 file changed, 35 insertions(+), 113 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 944730af98..d0da0b71eb 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -614,6 +614,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                       uint64_t kernel_entry)
 {
     uint16_t *p;
+    void *v;
 
     /* Small bootloader */
     p = (uint16_t *)base;
@@ -682,123 +683,44 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
                                 /* ori a3,a3,%lo(loaderparams.ram_low_size) */
 
-    /*
-     * Load BAR registers as done by YAMON:
-     *
-     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
-     *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
-     *  - set up PCI0 MEM1 at 0x18200000, size 0xbe00000
-     *
-     */
-    stw_p(p++, 0xe040); stw_p(p++, 0x0681);
-                                /* lui t1, %hi(0xb4000000)      */
-
 #if TARGET_BIG_ENDIAN
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
-                                /* lui t0, %hi(0xdf000000)      */
-
-    /* 0x68 corresponds to GT_ISD (from hw/mips/gt64xxx_pci.c)  */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0801);
-                                /* lui t0, %hi(0xc0000000)      */
-
-    /* 0x48 corresponds to GT_PCI0IOLD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
-                                /* sw t0, 0x48(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0800);
-                                /* lui t0, %hi(0x40000000)      */
-
-    /* 0x50 corresponds to GT_PCI0IOHD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
-                                /* sw t0, 0x50(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0001);
-                                /* lui t0, %hi(0x80000000)      */
-
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x07e0);
-                                /* lui t0, %hi(0x3f000000)      */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0821);
-                                /* lui t0, %hi(0xc1000000)      */
-
-    /* 0x80 corresponds to GT_PCI0M1LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
-                                /* sw t0, 0x80(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0bc0);
-                                /* lui t0, %hi(0x5e000000)      */
-
+#define cpu_to_gt32 cpu_to_le32
 #else
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00df);
-                                /* addiu[32] t0, $0, 0xdf       */
-
-    /* 0x68 corresponds to GT_ISD                               */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    /* Use kseg2 remapped address 0x1be00000                    */
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
-                                /* addiu[32] t0, $0, 0xc0       */
-
-    /* 0x48 corresponds to GT_PCI0IOLD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
-                                /* sw t0, 0x48(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x0040);
-                                /* addiu[32] t0, $0, 0x40       */
-
-    /* 0x50 corresponds to GT_PCI0IOHD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
-                                /* sw t0, 0x50(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x0080);
-                                /* addiu[32] t0, $0, 0x80       */
-
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x003f);
-                                /* addiu[32] t0, $0, 0x3f       */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
-                                /* addiu[32] t0, $0, 0xc1       */
-
-    /* 0x80 corresponds to GT_PCI0M1LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
-                                /* sw t0, 0x80(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x005e);
-                                /* addiu[32] t0, $0, 0x5e       */
-
+#define cpu_to_gt32 cpu_to_be32
 #endif
+    v = p;
 
-    /* 0x88 corresponds to GT_PCI0M1HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9088);
-                                /* sw t0, 0x88(t1)              */
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&v, /* GT_ISD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
+                     cpu_to_gt32(0x1be00000 << 3));
+
+    /* setup MEM-to-PCI0 mapping */
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
+                     cpu_to_gt32(0x18000000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
+                     cpu_to_gt32(0x08000000 << 3));
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
+                     cpu_to_gt32(0x10000000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
+                     cpu_to_gt32(0x07e00000 << 3));
+
+    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
+                     cpu_to_gt32(0x18200000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
+                     cpu_to_gt32(0x0bc00000 << 3));
+
+    p = (uint16_t *)v;
+
+#undef cpu_to_gt32
 
     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
 
-- 
2.38.1


