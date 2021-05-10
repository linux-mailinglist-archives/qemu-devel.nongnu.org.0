Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90CF3793C5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:29:42 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8mr-0001nu-JG
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg8ky-0000pY-4T
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:27:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg8kt-0006b7-22
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:27:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id z6so17271200wrm.4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bx0BGQAi0S+F37QeuoGMa97g1xe1Uk0YyJT6Ip7gC4w=;
 b=ZwI0iIketFJdL3VzwbFC7zRi9f3mIMoF6R+oEW0GzdbCwbk4/qpgxDQ8Xh2Xdrow37
 PrlbweUr5vEjdFc8aQhEt2sXaw0TKbOujjm09sQiyVd164N1CpDaPSh7Xaah4MZ+GIYg
 tCOxCHVI3pds0qqRo9lZ+ABkDD/G370UT4XDvBgtlekScXEf7rDN0P9W8jk1SODj7mCy
 Nkug3Y73ui22h6Oafv++mrlyfm64dWc8olZ9klSRCimuvOfQPw8BNexIeko6hyFLITm5
 l40mG0A+gzN4tJmA3rt1FM0ArzNbjKNgqCAgTDd8m4Hoz8GFBheT6ZIRUi7KZKfFX09T
 PpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bx0BGQAi0S+F37QeuoGMa97g1xe1Uk0YyJT6Ip7gC4w=;
 b=Ez5JqgbyvABBqXOk6c2qXbOONLpAK+gy9gA+jf+GaDBdvqHsKLo56IVQiFauv7B9Zh
 yI2Ow1CPb1kYnlKEEi7WKEyqZTV62uLaz8wAM/vIs6boW5yHOGnUQ9vUPWsdnpa0jQoz
 G3w92vLNWYnqrLCG8tNvTPZqEUcNwAF6HgqVSIkzScBwzRk7TYNyI4oxVnuNWX4wL/BM
 hXvvgUTUMphcFuCbH820sZwhpTT+3W1Qc510o29ZKj8EC4SjUdz4GvrcHD4k1flnpjVs
 cQNmSJYaT35o8vRnyQwsvqYv6LOjg71FFBBWXS7GJ7IWD1W8gwYp/Wjtit457rkqS7uM
 vdMg==
X-Gm-Message-State: AOAM531Zem/gvR/N1wDo/AsC2QrLqLCdS6cISN9ctsbo4GV0f8twatM7
 zGMNjxPvm7pFcKaRkTfG6jCwdRm3fUyYVQ==
X-Google-Smtp-Source: ABdhPJxtHTiBU2L89+Ni5UxS53XqluP2m6ytDjDIQkDjllMSpLXd1fm/fhkoLlrEAHkL65/NsJ+N1w==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr32542399wrp.242.1620664055563; 
 Mon, 10 May 2021 09:27:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f184sm15142251wmf.0.2021.05.10.09.27.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:27:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/26] target-arm queue
Date: Mon, 10 May 2021 17:27:33 +0100
Message-Id: <20210510162733.2366-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

v2: fix compile issue when building user-mode emulators with clang

-- PMM

The following changes since commit 4cc10cae64c51e17844dc4358481c393d7bf1ed4:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-05-06 18:56:17 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210510-1

for you to fetch changes up to c3080fbdaa381012666428fef2e5f7ce422ecfee:

  hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9 (2021-05-10 17:21:54 +0100)

----------------------------------------------------------------
target-arm queue:
 * docs: fix link in sbsa description
 * linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
 * target/arm: Fix tlbbits calculation in tlbi_aa64_vae2is_write()
 * target/arm: Split neon and vfp translation to their own
   compilation units
 * target/arm: Make WFI a NOP for userspace emulators
 * hw/sd/omap_mmc: Use device_cold_reset() instead of
   device_legacy_reset()
 * include: More fixes for 'extern "C"' block use
 * hw/arm/imx25_pdk: Fix error message for invalid RAM size
 * hw/arm/mps2-tz: Implement AN524 memory remapping via machine property
 * hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9

----------------------------------------------------------------
Alex Bennée (1):
      docs: fix link in sbsa description

Guenter Roeck (1):
      hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9

Peter Maydell (22):
      target/arm: Fix tlbbits calculation in tlbi_aa64_vae2is_write()
      target/arm: Move constant expanders to translate.h
      target/arm: Share unallocated_encoding() and gen_exception_insn()
      target/arm: Make functions used by m-nocp global
      target/arm: Split m-nocp trans functions into their own file
      target/arm: Move gen_aa32 functions to translate-a32.h
      target/arm: Move vfp_{load, store}_reg{32, 64} to translate-vfp.c.inc
      target/arm: Make functions used by translate-vfp global
      target/arm: Make translate-vfp.c.inc its own compilation unit
      target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
      target/arm: Delete unused typedef
      target/arm: Move NeonGenThreeOpEnvFn typedef to translate.h
      target/arm: Make functions used by translate-neon global
      target/arm: Make translate-neon.c.inc its own compilation unit
      target/arm: Make WFI a NOP for userspace emulators
      hw/sd/omap_mmc: Use device_cold_reset() instead of device_legacy_reset()
      osdep: Make os-win32.h and os-posix.h handle 'extern "C"' themselves
      include/qemu/bswap.h: Handle being included outside extern "C" block
      include/disas/dis-asm.h: Handle being included outside 'extern "C"'
      hw/misc/mps2-scc: Add "QEMU interface" comment
      hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
      hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

Philippe Mathieu-Daudé (1):
      hw/arm/imx25_pdk: Fix error message for invalid RAM size

Richard Henderson (1):
      linux-user/aarch64: Enable hwcap for RND, BTI, and MTE

 docs/system/arm/mps2.rst                           |  10 +
 docs/system/arm/sbsa.rst                           |   2 +-
 include/disas/dis-asm.h                            |  12 +-
 include/hw/misc/mps2-scc.h                         |  21 ++
 include/qemu/bswap.h                               |  26 ++-
 include/qemu/osdep.h                               |   8 +-
 include/sysemu/os-posix.h                          |   8 +
 include/sysemu/os-win32.h                          |   8 +
 target/arm/translate-a32.h                         | 144 +++++++++++++
 target/arm/translate-a64.h                         |   2 -
 target/arm/translate.h                             |  29 +++
 hw/arm/imx25_pdk.c                                 |   5 +-
 hw/arm/mps2-tz.c                                   | 108 +++++++++-
 hw/arm/xilinx_zynq.c                               |   2 +-
 hw/misc/mps2-scc.c                                 |  13 +-
 hw/sd/omap_mmc.c                                   |   2 +-
 linux-user/elfload.c                               |  13 ++
 target/arm/helper.c                                |   2 +-
 target/arm/op_helper.c                             |  14 ++
 target/arm/translate-a64.c                         |  15 --
 target/arm/translate-m-nocp.c                      | 221 ++++++++++++++++++++
 .../arm/{translate-neon.c.inc => translate-neon.c} |  19 +-
 .../arm/{translate-vfp.c.inc => translate-vfp.c}   | 230 +++------------------
 target/arm/translate.c                             | 200 ++++--------------
 disas/arm-a64.cc                                   |   2 -
 disas/nanomips.cpp                                 |   2 -
 target/arm/meson.build                             |  15 +-
 27 files changed, 720 insertions(+), 413 deletions(-)
 create mode 100644 target/arm/translate-a32.h
 create mode 100644 target/arm/translate-m-nocp.c
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (94%)

