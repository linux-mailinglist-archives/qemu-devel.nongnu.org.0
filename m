Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FB89098
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 10:15:43 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwj0x-00085M-0Z
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 04:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisv-00068L-Da
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 04:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisu-00040T-7j
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 04:07:25 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwisu-0003zk-2O; Sun, 11 Aug 2019 04:07:24 -0400
Received: by mail-pg1-x541.google.com with SMTP id l21so47976325pgm.3;
 Sun, 11 Aug 2019 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=x5b+iEua9+D8TVxi662XixBoMp3MR1U85SW/9kkyOCs=;
 b=ApIMYFIFJn5t1vkpJH3msfyXy1a9GfiFKJXspdGPb7tJevJyUnQq3mvqHEnVcaBzEQ
 7FLSem3myLlj1o8pCQIZYMqN+Z/6bCw5k90vyPjffcWHNsA9QFBEMqs82+nTf2hX/Cnr
 52c7CYKZEpELOpEieoySEvWTx0feqfxI5ZOZZrGvOHT2NZ/nbU4d0QhXKQdotbd0N/qh
 QeDVqQghpRKz9FC1NgXnVhweHy1MCfJShmURzQNC2NulO5sQWNdoEhylJg6NESvj01j9
 yi5N3BeExiczfSqPcR8Mc2+WgdqzpYYUwXwRaYUm45MFTLYIx5t6/7ubpmEl0TV1IR5f
 Ityg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=x5b+iEua9+D8TVxi662XixBoMp3MR1U85SW/9kkyOCs=;
 b=daI999TpJLvG0rcqqaWvANfFHFA7IBRZ9FerrPPhKsASXYVYNiKZh9RkJNJZBmwFg5
 9BjLoqIofSMcKmcVRiOEV5JB8AOV1mT4KCsKVLarFHD+8rfDrcxlqdbKHyvC04OZgTMU
 UNoWkjqbJhYv50dHeEGi7jDbuSCaQqyAtlleSzCCeIO+jsX6QFnenhfIP9ThQqWojfPI
 KnRXTH84T8CNz+1AGr7uQSOBerYqeOSKFwMogLUyJKk3WIBbwgwESfCuHgLtOkSe6HRJ
 NP5fRkBrLOfBUk+Kv5EMfsHbihjejzaapvzpoKgd98PSdFqHgUAnbY4q25Jv5JPXlqR6
 8aXQ==
X-Gm-Message-State: APjAAAWycektAbQZ9G7rxMreGs1JJTPITC79ZAZciEVLBc2wdSGDIssl
 DW3DWYDNhgdhu//9UDgM7oY=
X-Google-Smtp-Source: APXvYqywKg/kP9CWcGkzpUjPE88QNhGAy/GhF/9fH9CaS5z3Abuxwr6K7+OSxFfJ0Ctg8JJh4Z2w4Q==
X-Received: by 2002:a17:90a:3082:: with SMTP id
 h2mr1538451pjb.53.1565510843223; 
 Sun, 11 Aug 2019 01:07:23 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.22
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:48 -0700
Message-Id: <1565510821-3927-16-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v3 15/28] riscv: sifive_u: Generate hfclk and
 rtcclk nodes
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

To keep in sync with Linux kernel device tree, generate hfclk and
rtcclk nodes in the device tree, to be referenced by PRCI node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 23 +++++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e071838..f2b711a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -77,6 +77,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
     uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t hfclk_phandle, rtcclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -95,6 +96,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
 
+    hfclk_phandle = phandle++;
+    nodename = g_strdup_printf("/hfclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", hfclk_phandle);
+    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "hfclk");
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_HFCLK_FREQ);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    g_free(nodename);
+
+    rtcclk_phandle = phandle++;
+    nodename = g_strdup_printf("/rtcclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", rtcclk_phandle);
+    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "rtcclk");
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_RTCCLK_FREQ);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/memory@%lx",
         (long)memmap[SIFIVE_U_DRAM].base);
     qemu_fdt_add_subnode(fdt, nodename);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index d0d8528..2b57ffc 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -65,6 +65,8 @@ enum {
 
 enum {
     SIFIVE_U_CLOCK_FREQ = 1000000000,
+    SIFIVE_U_HFCLK_FREQ = 33333333,
+    SIFIVE_U_RTCCLK_FREQ = 1000000,
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
-- 
2.7.4


