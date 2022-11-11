Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99E6262A4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 21:15:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otaPL-0003va-PM; Fri, 11 Nov 2022 15:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otaPK-0003vQ-E1
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 15:13:46 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otaPI-0004Cs-E6
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 15:13:46 -0500
Received: by mail-pg1-x532.google.com with SMTP id r18so5182262pgr.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 12:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/hIUxVxO8TjvOlxq4eDg++WCGB24oDt5Olj4d0qqwrY=;
 b=n3sMmr8a4bpR3jx3xhGJ7B8Mm8DHYDie6Hx5EowziyDL3hS5qKFzi2/VRdQySb4wgD
 C5BdEhexss4wR3s59iXuobf4nLICU6Crx/kwG2Ry51x914l9GJ25Uo8JKE82hRg3kjUO
 rIDGg90xjEB0mXeN1bvvKsyNXUdv/M8wPsQmE1a6LswarCYSy2oDPQMvGiiL6r76Ql9T
 AtbtCEACpgoOyd0w3dw5b7ZkQ/OYW8vEFcn5Ryv6NK/UwB/gcbLFj3u9MUZ9I5ZfKmJq
 DuqCFJzy78UmVcHgUSOBD60uafU642pprvs5yiw+9bhJPfAocGAajbqooaO78OXAibr2
 z2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hIUxVxO8TjvOlxq4eDg++WCGB24oDt5Olj4d0qqwrY=;
 b=QCMcPoJRamhI0Iw+IT+OHF4WMsM4CPh+6ZjMIkUsXQMNi9OE7YKohWTwrc4EvCNtTM
 aVk60tAEeSEfaUF2B1VNWX8kijX2sb/fbhiJRSqQMCsCJ0K9x3vE0CZ0D4oDc/FVl7fk
 amUnHsL23HFaF5XKeL4YbM3EJrrnr8Y+yd11UwYvaIQ7CFsvCoEUChgXUggTDWYC3Asp
 YhP6nze8bvIAdeTt7ABnzJUOVbhM7KcAExxC3Z1s1+BzjK2dJH1D+zeG9q34tiy7Bq6r
 MxQVNmmTQGOxZwSq7TzT7inK+xRxf1q9/9Wzxvo4nKSexgn79zf7UKoxte9dIZDAHGrN
 +FIQ==
X-Gm-Message-State: ANoB5pnz9f9gzmO/wkAk75lTvHGWPBGH/ZkRQHNJx0x68MnwYzptHvGX
 /PFUgVDVwiGzGl4rm4HSpFK/9TmQJ4zVBw==
X-Google-Smtp-Source: AA0mqf7iCrw8tEQkVYVpOPjqpZlQGpR8P1ZYTlljFzh80HFnkqmUAgNq9qx++8AjFceFL0vIVxng1Q==
X-Received: by 2002:a05:6a00:1488:b0:53b:f208:d7db with SMTP id
 v8-20020a056a00148800b0053bf208d7dbmr4240134pfu.42.1668197622002; 
 Fri, 11 Nov 2022 12:13:42 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa796c7000000b0056c410fd03fsm1979915pfq.40.2022.11.11.12.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 12:13:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: virt: Remove the redundant ipi-id property
Date: Fri, 11 Nov 2022 12:13:37 -0800
Message-Id: <20221111201337.3320349-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The imsic DT binding has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c         | 2 --
 include/hw/riscv/virt.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b412..0bc0964e42a8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f71..62513e075c47 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
-- 
2.25.1


