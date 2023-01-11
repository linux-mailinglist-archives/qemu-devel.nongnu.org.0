Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685766565C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWdt-0004kQ-Uu; Wed, 11 Jan 2023 03:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdg-0004Z8-L3
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:39:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdd-0005Nz-4z
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:39:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso8383667wmb.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVteOLcdgywnZKReax1sWIW2ti3pURJ4pbMPZbXRnEg=;
 b=mi+ETGfUtjY4aRXHXyIPe8/GYdeyKH7gMz7JAghbCiM+M/petCIX8rXccLewBTkQJY
 /xR6FDmI+IOX373gnfR41CdFnwFwrmzkAEQmW6KUrxGnMIFMFII+9kK+86s5Md3B9j4g
 6a9mzEonmcvVRDDlt9EQlZzoYn5g51rocOvFH2jBSB2okRIH/k33LiwimdY+wPRZbMSU
 ejK2bsip6ISmhKIGHWQgAdXgUlTb9F4NvPNKPuXlBuYm8rBgxYnAoZQAnZV/5j6fku4T
 sxoUfdNHq6auIM9mZwMDW7YfGwA6RBrkjRcycwssIwDyovE9E+uXyPpgQGsQ1lVVomoX
 eBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVteOLcdgywnZKReax1sWIW2ti3pURJ4pbMPZbXRnEg=;
 b=lZC9e7vT/P3metqnUNKK5V9vflR7A4nAv0qXPzc0IAKCO6m9uedjPKgY/n7bvBe2dB
 tzAGTEyHB/01XWK7aJCPUjDJ/vgJnCg9mq/T3tpS6YvRAv0/56jxpw9a2L8W97IwqaM1
 HT8GAyB04Pe1/Dc7aicH1QvBLDOCCZcpsGxjZ8PPexCHkEySu8L8wZ9IHGCaVVTPjnZ2
 q/aBnmHvJ9fiQJI2B1qgsRsb61Fv5uYRnwJyD++oJ0o8z6jtqgeZFPd57plWZaO5/YnG
 Kf3R1fNRB3zJT1/ILXM5WYJzdyTOYNSlLbcfjbUnTmibaZT0MtKGHXXW1iddt2hiTlEz
 ooWg==
X-Gm-Message-State: AFqh2krw8i+jzLF2UdJzlD4bjM3TQVJS5/+jfQLn+lw7yB5kZPuaTSIT
 uFDQCPwPahmLUqAtrH3fiPWJEYFhDvmIKtHG
X-Google-Smtp-Source: AMrXdXuJdHbPsisPbdvVRDETb5IqtJaygQ472pbsFDxfyuHdAkPqAPrH3eYe9e+fwIbnR8p2InH4BA==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a424 with SMTP id
 hg26-20020a05600c539a00b003d9efe8a424mr7638806wmb.34.1673426351210; 
 Wed, 11 Jan 2023 00:39:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003c6f3f6675bsm23898568wmq.26.2023.01.11.00.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:39:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] bulk: Replace TARGET_FMT_plx by HWADDR_PRIx
Date: Wed, 11 Jan 2023 09:39:05 +0100
Message-Id: <20230111083909.42624-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Since v1:
- Fix checkpatch style violations
- Use HWADDR_PRIx instead of HWADDR_FMT_plx (Zoltan)

Supersedes: <20230110212947.34557-1-philmd@linaro.org>
            "bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx"

Philippe Mathieu-Daudé (4):
  hw: Remove hardcoded tabs (code style)
  bulk: Coding style fixes
  bulk: Replace TARGET_FMT_plx -> HWADDR_PRIx
  bulk: Prefix '0x' to hex values displayed with HWADDR_PRIx format

 accel/tcg/cputlb.c                  |   2 +-
 hw/arm/strongarm.c                  |  24 ++--
 hw/block/pflash_cfi01.c             |   5 +-
 hw/char/digic-uart.c                |   8 +-
 hw/char/etraxfs_ser.c               |   4 +-
 hw/core/loader.c                    |   8 +-
 hw/core/sysbus.c                    |   5 +-
 hw/display/cirrus_vga.c             |   4 +-
 hw/display/g364fb.c                 |   4 +-
 hw/display/vga.c                    |   8 +-
 hw/dma/etraxfs_dma.c                | 196 ++++++++++++++--------------
 hw/dma/pl330.c                      |  26 ++--
 hw/dma/xilinx_axidma.c              |   4 +-
 hw/dma/xlnx_csu_dma.c               |   4 +-
 hw/i2c/mpc_i2c.c                    |   4 +-
 hw/i386/multiboot.c                 |   9 +-
 hw/i386/xen/xen-hvm.c               |   9 +-
 hw/i386/xen/xen-mapcache.c          |  21 +--
 hw/i386/xen/xen_platform.c          |   4 +-
 hw/intc/arm_gicv3_dist.c            |   8 +-
 hw/intc/arm_gicv3_its.c             |  14 +-
 hw/intc/arm_gicv3_redist.c          |   8 +-
 hw/intc/exynos4210_combiner.c       |  20 +--
 hw/misc/auxbus.c                    |   3 +-
 hw/misc/ivshmem.c                   |   6 +-
 hw/misc/macio/mac_dbdma.c           |   4 +-
 hw/misc/mst_fpga.c                  | 162 ++++++++++++-----------
 hw/net/allwinner-sun8i-emac.c       |   4 +-
 hw/net/allwinner_emac.c             |   8 +-
 hw/net/fsl_etsec/etsec.c            |   4 +-
 hw/net/fsl_etsec/rings.c            |   4 +-
 hw/net/pcnet.c                      |   4 +-
 hw/net/rocker/rocker.c              |  26 ++--
 hw/net/rocker/rocker_desc.c         |   2 +-
 hw/net/xilinx_axienet.c             |   4 +-
 hw/net/xilinx_ethlite.c             |   6 +-
 hw/pci-bridge/pci_expander_bridge.c |   2 +-
 hw/pci-host/bonito.c                |  14 +-
 hw/pci-host/ppce500.c               |   4 +-
 hw/pci/pci_host.c                   |   4 +-
 hw/ppc/ppc4xx_sdram.c               |   2 +-
 hw/rtc/exynos4210_rtc.c             |   4 +-
 hw/sh4/sh7750.c                     |   4 +-
 hw/ssi/xilinx_spi.c                 |   4 +-
 hw/ssi/xilinx_spips.c               |   8 +-
 hw/timer/digic-timer.c              |   8 +-
 hw/timer/etraxfs_timer.c            |   3 +-
 hw/timer/exynos4210_mct.c           |   2 +-
 hw/timer/exynos4210_pwm.c           |   4 +-
 hw/virtio/virtio-mmio.c             |   4 +-
 hw/xen/xen_pt.c                     |   4 +-
 include/exec/hwaddr.h               |   1 -
 monitor/misc.c                      |   2 +-
 softmmu/memory.c                    |  19 +--
 softmmu/memory_mapping.c            |   4 +-
 softmmu/physmem.c                   |  10 +-
 target/i386/monitor.c               |   6 +-
 target/loongarch/tlb_helper.c       |   2 +-
 target/microblaze/op_helper.c       |   2 +-
 target/mips/tcg/sysemu/tlb_helper.c |   2 +-
 target/ppc/mmu-hash32.c             |  20 +--
 target/ppc/mmu-hash64.c             |  12 +-
 target/ppc/mmu_common.c             |  30 +++--
 target/ppc/mmu_helper.c             |   4 +-
 target/riscv/cpu_helper.c           |  10 +-
 target/riscv/monitor.c              |   2 +-
 target/sparc/ldst_helper.c          |   6 +-
 target/sparc/mmu_helper.c           |  13 +-
 target/tricore/helper.c             |   2 +-
 69 files changed, 430 insertions(+), 424 deletions(-)

-- 
2.38.1


