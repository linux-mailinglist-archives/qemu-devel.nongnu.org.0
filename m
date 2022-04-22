Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8D50B4B4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:09:44 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqER-0007gq-Bg
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Y-0004Dj-Lu
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9V-0002ZM-Ch
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id e28so108923wra.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7nbpPUYaQ94bmOhkxKKDTmhkqN+EOkV6e+hJmVPT0Q=;
 b=aohLeUfNGD5K2rOQVgV+Pb5HZEYiWj9Rh0ROamg2IwRwTgbiyfDAFOnoyoyEYGaOys
 2N3FMvGLCXvg62p/2GfEb0/HfscNNy7zM/TEw1HNFIXsJmsq5yit9o3t29ci3w8sAYww
 K4omlnRWKV338hEKsOgdGM+oR5h+O3TCfxYnmqvL54dTIq7B32UBxKI1KNNsW+EpMifB
 ovCowk+KKTfU9t5JOUe0iho4HU3E2nIOMUfyXq+8k8Z4AOPuCM5cHAks2Gt2Ugj1SpW3
 EkzK2wJScEt71pcNnNCS2rJZW63mXOyrI0VDHJ4Z73JmhrfRt1CE+XC1CNBSOHslQS6l
 6y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7nbpPUYaQ94bmOhkxKKDTmhkqN+EOkV6e+hJmVPT0Q=;
 b=qQTWrptveoT4bDr3bMR9N053ON4R6Xzlrx1FcZqhXnX8+ReATuuwRu9dSlVaSKm8wu
 VVubp3+nvSITi+whLXQaGgVqNsHE96QofG62Pi/PiEakDcm/lslMWoAZ3zO5gELe54Ri
 ub95Rk4dm+T43kDRhxarAmI0QgGwaIIab/JBiqyEKqJpegz/xAO3wHXpxvYvp7Pnmu/o
 Tk4SA4ln5qAo3V/yWAH5+eY1Xe9x2BDSSxwNS3TyZJ5qfwWIM7ZojV+hvprjY399MHAR
 WtJNYIlbqmFpCrmOKdjCMjPViSeuVd740u9Xyye0csPepxdEeVo/CmmAsM8w5RJ3xdCy
 9L9A==
X-Gm-Message-State: AOAM532M+pfuXU24vz7AGTDMD4ncIbm8d0fdv0Ii/7svOT/BlIw/SdLl
 dcmisFdewQs5x07xpjxp8aR+uPalqrL/2Q==
X-Google-Smtp-Source: ABdhPJzR7/XjTheiytYpTIgvFKPaSvIxOa1KBd3kVq6OU9fb4lAFf23bdQpKf22PI1FOLH16L86jIQ==
X-Received: by 2002:a05:6000:1acf:b0:20a:a0b1:a479 with SMTP id
 i15-20020a0560001acf00b0020aa0b1a479mr3020918wry.228.1650621875588; 
 Fri, 22 Apr 2022 03:04:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/61] target-arm queue
Date: Fri, 22 Apr 2022 11:03:31 +0100
Message-Id: <20220422100432.2288247-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pullreq is (1) my GICv4 patches (2) most of the first third of RTH's
cleanup patchset (3) one patch fixing an smmuv3 bug...

thanks
-- PMM

The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:

  Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220422

for you to fetch changes up to 9792130613191c1e0c34109918c5e07b9f1429a5:

  hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate() (2022-04-22 10:19:15 +0100)

----------------------------------------------------------------
target-arm queue:
 * Implement GICv4 emulation
 * Some cleanup patches in target/arm
 * hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate()

----------------------------------------------------------------
Peter Maydell (41):
      hw/intc/arm_gicv3_its: Add missing blank line
      hw/intc/arm_gicv3: Sanity-check num-cpu property
      hw/intc/arm_gicv3: Insist that redist region capacity matches CPU count
      hw/intc/arm_gicv3: Report correct PIDR0 values for ID registers
      target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
      hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI ID?"
      hw/intc/arm_gicv3_its: Implement GITS_BASER2 for GICv4
      hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
      hw/intc/arm_gicv3_its: Implement VMAPP
      hw/intc/arm_gicv3_its: Distinguish success and error cases of CMD_CONTINUE
      hw/intc/arm_gicv3_its: Factor out "find ITE given devid, eventid"
      hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
      hw/intc/arm_gicv3_its: Split out process_its_cmd() physical interrupt code
      hw/intc/arm_gicv3_its: Handle virtual interrupts in process_its_cmd()
      hw/intc/arm_gicv3: Keep pointers to every connected ITS
      hw/intc/arm_gicv3_its: Implement VMOVP
      hw/intc/arm_gicv3_its: Implement VSYNC
      hw/intc/arm_gicv3_its: Implement INV command properly
      hw/intc/arm_gicv3_its: Implement INV for virtual interrupts
      hw/intc/arm_gicv3_its: Implement VMOVI
      hw/intc/arm_gicv3_its: Implement VINVALL
      hw/intc/arm_gicv3: Implement GICv4's new redistributor frame
      hw/intc/arm_gicv3: Implement new GICv4 redistributor registers
      hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ" from gicv3_cpuif_virt_update()
      hw/intc/arm_gicv3_cpuif: Support vLPIs
      hw/intc/arm_gicv3_cpuif: Don't recalculate maintenance irq unnecessarily
      hw/intc/arm_gicv3_redist: Factor out "update hpplpi for one LPI" logic
      hw/intc/arm_gicv3_redist: Factor out "update hpplpi for all LPIs" logic
      hw/intc/arm_gicv3_redist: Recalculate hppvlpi on VPENDBASER writes
      hw/intc/arm_gicv3_redist: Factor out "update bit in pending table" code
      hw/intc/arm_gicv3_redist: Implement gicv3_redist_process_vlpi()
      hw/intc/arm_gicv3_redist: Implement gicv3_redist_vlpi_pending()
      hw/intc/arm_gicv3_redist: Use set_pending_table_bit() in mov handling
      hw/intc/arm_gicv3_redist: Implement gicv3_redist_mov_vlpi()
      hw/intc/arm_gicv3_redist: Implement gicv3_redist_vinvall()
      hw/intc/arm_gicv3_redist: Implement gicv3_redist_inv_vlpi()
      hw/intc/arm_gicv3: Update ID and feature registers for GICv4
      hw/intc/arm_gicv3: Allow 'revision' property to be set to 4
      hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in create_gic()
      hw/arm/virt: Abstract out calculation of redistributor region capacity
      hw/arm/virt: Support TCG GICv4

Richard Henderson (19):
      target/arm: Update ISAR fields for ARMv8.8
      target/arm: Update SCR_EL3 bits to ARMv8.8
      target/arm: Update SCTLR bits to ARMv9.2
      target/arm: Change DisasContext.aarch64 to bool
      target/arm: Change CPUArchState.aarch64 to bool
      target/arm: Extend store_cpu_offset to take field size
      target/arm: Change DisasContext.thumb to bool
      target/arm: Change CPUArchState.thumb to bool
      target/arm: Remove fpexc32_access
      target/arm: Split out set_btype_raw
      target/arm: Split out gen_rebuild_hflags
      target/arm: Simplify GEN_SHIFT in translate.c
      target/arm: Simplify gen_sar
      target/arm: Simplify aa32 DISAS_WFI
      target/arm: Use tcg_constant in translate-m-nocp.c
      target/arm: Use tcg_constant in translate-neon.c
      target/arm: Use smin/smax for do_sat_addsub_32
      target/arm: Use tcg_constant in translate-vfp.c
      target/arm: Use tcg_constant_i32 in translate.h

Xiang Chen (1):
      hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate()

 docs/system/arm/virt.rst               |   5 +-
 hw/intc/gicv3_internal.h               | 231 ++++++++-
 include/hw/arm/virt.h                  |  19 +-
 include/hw/intc/arm_gicv3_common.h     |  13 +
 include/hw/intc/arm_gicv3_its_common.h |   1 +
 target/arm/cpu.h                       |  59 ++-
 target/arm/translate-a32.h             |  13 +-
 target/arm/translate.h                 |  17 +-
 hw/arm/smmuv3.c                        |   2 +-
 hw/arm/virt.c                          | 102 +++-
 hw/intc/arm_gicv3_common.c             |  54 +-
 hw/intc/arm_gicv3_cpuif.c              | 195 ++++++--
 hw/intc/arm_gicv3_dist.c               |   7 +-
 hw/intc/arm_gicv3_its.c                | 876 +++++++++++++++++++++++++++------
 hw/intc/arm_gicv3_its_kvm.c            |   2 +
 hw/intc/arm_gicv3_kvm.c                |   5 +
 hw/intc/arm_gicv3_redist.c             | 480 +++++++++++++++---
 linux-user/arm/cpu_loop.c              |   2 +-
 target/arm/cpu.c                       |  16 +-
 target/arm/helper-a64.c                |   4 +-
 target/arm/helper.c                    |  19 +-
 target/arm/hvf/hvf.c                   |   2 +-
 target/arm/m_helper.c                  |   6 +-
 target/arm/op_helper.c                 |  13 -
 target/arm/translate-a64.c             |  50 +-
 target/arm/translate-m-nocp.c          |  12 +-
 target/arm/translate-neon.c            |  21 +-
 target/arm/translate-sve.c             |   9 +-
 target/arm/translate-vfp.c             |  76 +--
 target/arm/translate.c                 | 101 ++--
 hw/intc/trace-events                   |  18 +-
 31 files changed, 1890 insertions(+), 540 deletions(-)

