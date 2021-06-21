Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7A3AEEEB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:31:56 +0200 (CEST)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMq3-0001KM-0b
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmt-0006yp-N4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmr-0007RJ-Dg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id r9so20370460wrz.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNhnVbd7N87GbnTma6Ck6WtqARaoX8V3aW1LE2yFUmU=;
 b=zQrQBP7OladMuQoKSzvBlARv4AK3ySGH3/LBBQNs56pzlpdjZZAqeZ2NNcNYJOBMcX
 BZYpYhXrmmBo8dtvgfBYCiiYfNNF26vMCRTRH8USjpIn7nxPM8ih0v7pUPDBBLzgDFti
 4wvlH/uyCszl1Mvgkly8CRNnqzEjj8jr5/MtRMyZoSw/hhHxiqsGN7TgbVWSj+M0Yxs2
 zLx3+36yBVNzwEQfbfXLf4ZKjo352bi6osrC4g0P8VtW4W9pSumWlqnjX6RPs9UbVK+Q
 kp2GqxtXNFokcIdKWQfEk3Iul3dDnIp7ESQWbnEr9mZbTPUwrWTbHWZ0V1nfMXRrqQoR
 Y4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNhnVbd7N87GbnTma6Ck6WtqARaoX8V3aW1LE2yFUmU=;
 b=LsVF9yykTkYJvdlPGWmeoXaShg5WS+PWatQuBg22RBxqabX3X2ZcrbgPl3krPEiBob
 E+fiLaJI9HZN2S9FnSmPmRYSYH3mISXlV7UognDBDH7kIcc1sEQBEFA378xXZzFSnMlQ
 VY/lpjsAee7BylrDrV7EpW5cUBOLvL800JDF4yW3bn7VgkFq9eNC0GCND7JuNCy01pPc
 9BCjUfB87IJl0UFZ/mylTS541XHePi+SAE4rYevdVPtV8wAHicrCUMXRu+4UpV5xfu+I
 V2/M8pZ4cFelSLlxSZzx6P688YDi1vU/D4t/GAZ8VBnQBZxZDwUvBWavylNgHatufY9D
 Wq9g==
X-Gm-Message-State: AOAM533LCGQK5rLi+APt9UTSFKKCgXljwNe22sUfHHNlBVs72bei0noe
 64YGsPbydbEYauvLVTy+6DyvSWIf5YYlzR6D
X-Google-Smtp-Source: ABdhPJyrw/a+BPQ6XvvZny5q2hJXBcBS2h02fJisBrov5mdQ85Z0T4nyxRBrvZBuYoTiLxVg8JmOtQ==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr29956746wri.290.1624292915163; 
 Mon, 21 Jun 2021 09:28:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/57] target-arm queue
Date: Mon, 21 Jun 2021 17:27:36 +0100
Message-Id: <20210621162833.32535-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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


The following changes since commit 53f306f316549d20c76886903181413d20842423:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-06-21 11:26:04 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210621

for you to fetch changes up to a83f1d9263d281f938a3984cda7104d55affd43a:

  docs/system: arm: Add nRF boards description (2021-06-21 17:24:33 +0100)

----------------------------------------------------------------
target-arm queue:
 * Don't require 'virt' board to be compiled in for ACPI GHES code
 * docs: Document which architecture extensions we emulate
 * Fix bugs in M-profile FPCXT_NS accesses
 * First slice of MVE patches
 * Implement MTE3
 * docs/system: arm: Add nRF boards description

----------------------------------------------------------------
Alexandre Iooss (1):
      docs/system: arm: Add nRF boards description

Peter Collingbourne (1):
      target/arm: Implement MTE3

Peter Maydell (55):
      hw/acpi: Provide stub version of acpi_ghes_record_errors()
      hw/acpi: Provide function acpi_ghes_present()
      target/arm: Use acpi_ghes_present() to see if we report ACPI memory errors
      docs/system/arm: Document which architecture extensions we emulate
      target/arm/translate-vfp.c: Whitespace fixes
      target/arm: Handle FPU being disabled in FPCXT_NS accesses
      target/arm: Don't NOCP fault for FPCXT_NS accesses
      target/arm: Handle writeback in VLDR/VSTR sysreg with no memory access
      target/arm: Factor FP context update code out into helper function
      target/arm: Split vfp_access_check() into A and M versions
      target/arm: Handle FPU check for FPCXT_NS insns via vfp_access_check_m()
      target/arm: Implement MVE VLDR/VSTR (non-widening forms)
      target/arm: Implement widening/narrowing MVE VLDR/VSTR insns
      target/arm: Implement MVE VCLZ
      target/arm: Implement MVE VCLS
      target/arm: Implement MVE VREV16, VREV32, VREV64
      target/arm: Implement MVE VMVN (register)
      target/arm: Implement MVE VABS
      target/arm: Implement MVE VNEG
      tcg: Make gen_dup_i32/i64() public as tcg_gen_dup_i32/i64
      target/arm: Implement MVE VDUP
      target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
      target/arm: Implement MVE VADD, VSUB, VMUL
      target/arm: Implement MVE VMULH
      target/arm: Implement MVE VRMULH
      target/arm: Implement MVE VMAX, VMIN
      target/arm: Implement MVE VABD
      target/arm: Implement MVE VHADD, VHSUB
      target/arm: Implement MVE VMULL
      target/arm: Implement MVE VMLALDAV
      target/arm: Implement MVE VMLSLDAV
      target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
      target/arm: Implement MVE VADD (scalar)
      target/arm: Implement MVE VSUB, VMUL (scalar)
      target/arm: Implement MVE VHADD, VHSUB (scalar)
      target/arm: Implement MVE VBRSR
      target/arm: Implement MVE VPST
      target/arm: Implement MVE VQADD and VQSUB
      target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
      target/arm: Implement MVE VQDMULL scalar
      target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
      target/arm: Implement MVE VQADD, VQSUB (vector)
      target/arm: Implement MVE VQSHL (vector)
      target/arm: Implement MVE VQRSHL
      target/arm: Implement MVE VSHL insn
      target/arm: Implement MVE VRSHL
      target/arm: Implement MVE VQDMLADH and VQRDMLADH
      target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
      target/arm: Implement MVE VQDMULL (vector)
      target/arm: Implement MVE VRHADD
      target/arm: Implement MVE VADC, VSBC
      target/arm: Implement MVE VCADD
      target/arm: Implement MVE VHCADD
      target/arm: Implement MVE VADDV
      target/arm: Make VMOV scalar <-> gpreg beatwise for MVE

 docs/system/arm/emulation.rst |  103 ++++
 docs/system/arm/nrf.rst       |   51 ++
 docs/system/target-arm.rst    |    7 +
 include/hw/acpi/ghes.h        |    9 +
 include/tcg/tcg-op.h          |    8 +
 include/tcg/tcg.h             |    1 -
 target/arm/helper-mve.h       |  357 +++++++++++++
 target/arm/helper.h           |    2 +
 target/arm/internals.h        |   11 +
 target/arm/translate-a32.h    |    3 +
 target/arm/translate.h        |   10 +
 target/arm/m-nocp.decode      |   24 +
 target/arm/mve.decode         |  240 +++++++++
 target/arm/vfp.decode         |   14 -
 hw/acpi/ghes-stub.c           |   22 +
 hw/acpi/ghes.c                |   17 +
 target/arm/cpu64.c            |    2 +-
 target/arm/kvm64.c            |    6 +-
 target/arm/mte_helper.c       |   82 +--
 target/arm/mve_helper.c       | 1160 +++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-m-nocp.c |  550 +++++++++++++++++++
 target/arm/translate-mve.c    |  759 +++++++++++++++++++++++++++
 target/arm/translate-vfp.c    |  741 +++++++-------------------
 tcg/tcg-op-gvec.c             |   20 +-
 MAINTAINERS                   |    1 +
 hw/acpi/meson.build           |    6 +-
 target/arm/meson.build        |    1 +
 27 files changed, 3578 insertions(+), 629 deletions(-)
 create mode 100644 docs/system/arm/emulation.rst
 create mode 100644 docs/system/arm/nrf.rst
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 hw/acpi/ghes-stub.c
 create mode 100644 target/arm/mve_helper.c

