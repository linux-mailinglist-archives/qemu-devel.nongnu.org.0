Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFB91C89
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 07:30:08 +0200 (CEST)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzaF0-0000qV-2Q
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 01:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZy2-0005FV-6j
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZy0-00084M-2L
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:12:30 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxz-0007zB-Qe; Mon, 19 Aug 2019 01:12:27 -0400
Received: by mail-pf1-x444.google.com with SMTP id w2so458103pfi.3;
 Sun, 18 Aug 2019 22:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=N434gx6sLGralO/y6q4vOlnJsoETUf1kWJ817RFou/8=;
 b=K5GK6symyJ8DpgyFJkfibb4T+v0+0wtzxSQrXlL52W3APiszd75keAlqRYkzb6fgis
 +EKvgkVIqZR3OL1O4r2qVVV6gO549M/JcjPvsoq21wVsumdA3D1F98apmCWaxCiOsJbH
 FeXW5itMqWh6DHj9nRZ5ymnzZlbzqMI/3SxACjEXGNwOUFgwSgsPeDk4hREqkexzVTaR
 +P3BcfZNJxLkH7a0YLCrj7/fP08h5KzuqrUa2Z4vALeyf/ou6/B3VPxbgVXUloVeoGXF
 dlEWlXQTp1/SfuyaKNNEWPI9dZzS9M68cy9gKhIhBPpVt40r8nxswW6AhkBuiHMIHBwg
 NN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=N434gx6sLGralO/y6q4vOlnJsoETUf1kWJ817RFou/8=;
 b=slYQa1lsCgEaagnAgOGjpm+fseuJDxXEzfBNLb+MxSUp4Mg57Eg52qcoksH71fKCL9
 CGmRyKWYNb7jME8qe4RM8mjS/UEqLRtPOTt6VgT9TprTRKgGRg1Wx59vDDFQ+7qciW1m
 2eXRUJgUPpdclQOY3paG+vimjBsW3Lc+YwDDuu2IQxGH3tSelGqwYhDSca+2uAdMBGRw
 ZJqeIuZ4oO+jl7hoQcW9Ovwba3+rUzLg+UXO+yc5lqM/FP16Cyk8lr/GiaJolWlR5AdC
 zH4bMjF0fA3NHFZud1yK/VVspXbrE7SbzOJhQV+MmbfGIqycFxJ4XeGf6hh3PZTxuYA5
 RLjw==
X-Gm-Message-State: APjAAAW682P/4KB3ySBj+Ril+Xc18AIXMk7fbuWR7jVocDNtFnSRrMfy
 DxLGcoJBYLU3bntmr5nawY8=
X-Google-Smtp-Source: APXvYqyXmuIiryY38ANUAEZaJvaCSjRrV7kbE6L93jzo7Q1PBPnkThereL0QBpD9p8tcWBrusCMt0Q==
X-Received: by 2002:a17:90a:e392:: with SMTP id
 b18mr18372181pjz.140.1566191546534; 
 Sun, 18 Aug 2019 22:12:26 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.25
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:51 -0700
Message-Id: <1566191521-7820-19-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v4 18/28] riscv: sifive_u: Generate hfclk and
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

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 23 +++++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 284f7a5..08db741 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -80,6 +80,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
     uint32_t plic_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
+    uint32_t hfclk_phandle, rtcclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -98,6 +99,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
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
index 7a1a4f3..debbf28 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -68,6 +68,8 @@ enum {
 
 enum {
     SIFIVE_U_CLOCK_FREQ = 1000000000,
+    SIFIVE_U_HFCLK_FREQ = 33333333,
+    SIFIVE_U_RTCCLK_FREQ = 1000000,
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
-- 
2.7.4


