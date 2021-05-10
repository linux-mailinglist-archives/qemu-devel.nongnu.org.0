Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF311378C48
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:32:03 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg54s-0005Vn-Ex
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yy-0005YN-Ke
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yv-00038S-4f
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so16410441wrq.6
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYVk2o1Cu3wH134bVf/D9vTaTrzssqs1D6MFr2Lw7og=;
 b=Jve63ssAsVk3TGiZC63iqiXEBHKIUEiuG+NTqkOcN2on/pApf5p4Nz9Ii2bq/WmlXW
 QbmjvgMB/BJ8R7I4QM3YgtvS6QNLnduX6xzfLKAHfxkMt+Y4d+qZ05olUch44n4KrM/5
 MMhXjTM5smtNHODfGxHTBxa9KPJ6CT27bft7vE14kpyxLw6y/CJOIe8WIQ6O2xDj7MCT
 JPqDrK8tN17x0u0COiXf5Up/ON7wrZRYbP0QIcJwmX+gY6yx2NWa5pYDCHq+lXDxPeU2
 lBKVSJQKmnL6BvQCnPUNkcDwi1kCkn9vmaQjQGQAgIQVBkbqMlDm7HQaXIz5VRnKO+3j
 BWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYVk2o1Cu3wH134bVf/D9vTaTrzssqs1D6MFr2Lw7og=;
 b=aR2D3ngaPexdiA+3B5h/i2dFRFhnlrJp1B2/91eRbZuzYPZ7JtGtjmyNMslib4nE2B
 HWHpYO/jzwEFTKb3RDsB6feoEnqSYIAkppR8ftdBatFIa562eLmXn+lTLcQILPiE0F9b
 xlKR2bhDQITCSzQLLoKoMnuheLEslTRaboqlFVKPaldXXw9wx5tFenrkMTMne4spLpwe
 AEywC5CPYnAM3bKhdlHiUzPBgf9sEgnxspCp9HThEPtGELGx3kfChGDjtjWBpjS7FZMI
 CHpV30oogcyGCXfkK0ohUScNbUWeSUkpEGzZKQnZXiut+xlXyt9J94BRr8GiYLRt+fRw
 ukuQ==
X-Gm-Message-State: AOAM532DNkfzejaEvMiRpsqe1OeqcSQ1aUK49eoLXjiSan6/jyt589De
 jV4ALbE7jGLC/Vo5c/a6NCWzGKJMvr/C5w==
X-Google-Smtp-Source: ABdhPJye/IFe3ZXJ2VLMmJaA51DVKEuG7oB3lOvn1MPC7S1nfzdp7i7hVWkSoQpzcUX7BHZxAmCBjw==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr29638968wrt.424.1620649550324; 
 Mon, 10 May 2021 05:25:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] target-arm queue
Date: Mon, 10 May 2021 13:25:22 +0100
Message-Id: <20210510122548.28638-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The following changes since commit 4cc10cae64c51e17844dc4358481c393d7bf1ed4:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-05-06 18:56:17 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210510

for you to fetch changes up to 8f96812baa53005f32aece3e30b140826c20aa19:

  hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9 (2021-05-10 13:24:09 +0100)

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
 target/arm/op_helper.c                             |  12 ++
 target/arm/translate-a64.c                         |  15 --
 target/arm/translate-m-nocp.c                      | 221 ++++++++++++++++++++
 .../arm/{translate-neon.c.inc => translate-neon.c} |  19 +-
 .../arm/{translate-vfp.c.inc => translate-vfp.c}   | 230 +++------------------
 target/arm/translate.c                             | 200 ++++--------------
 disas/arm-a64.cc                                   |   2 -
 disas/nanomips.cpp                                 |   2 -
 target/arm/meson.build                             |  15 +-
 27 files changed, 718 insertions(+), 413 deletions(-)
 create mode 100644 target/arm/translate-a32.h
 create mode 100644 target/arm/translate-m-nocp.c
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (94%)

