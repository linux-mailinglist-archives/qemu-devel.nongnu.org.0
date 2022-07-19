Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE757A602
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:03:43 +0200 (CEST)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrZO-0002Xv-2N
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrW1-0005ha-QS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:14 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrVz-00069O-3H
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:13 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10d6cdf829aso5307562fac.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM2QmB11PRa5ueC6H0Tr62gFfMUwVI3iVm0E4nV9sA0=;
 b=Qwz4aVhDVBVJrH2td+q6qY3T9MpYgSgSf1mDxZye2O0hCS6UaWxFIq8IKoi9O+rZTJ
 Fvt0VY+kAJV99WGobnQsJAN6LTCA/DGbDK/tm8a36sVZKK9iH8PxFxy6IP9712SBYfIk
 lpZljCHTn5hfKGDbr0qIQzooJRg6KaJ2JpxREN7wIh2RCS2JowF6j3+TB6uyXnFbLiKC
 q/aLRNGFQ6WtCHtY3ysgxJz0N/3bWW1HNeta/AOnwvMuPNEHB5/CdWizQopsDi2CdBcg
 /JpawL7KGLeEpucD1o9H2GIWZIVnre8CWTU9gIg/bm5HyLRjgusnLZiMAyf2vqFhXWrj
 cSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM2QmB11PRa5ueC6H0Tr62gFfMUwVI3iVm0E4nV9sA0=;
 b=GxTDtsNjLh3we/0oCAaPdjYaWoCLAk4W/Knt0tygojIA6AAy+Kck9hElpJVsiDbmV4
 P4fVpxfCjwmBTpcXEZ0K8ocQ7+DWw7cjeSRjCaRP47Rgii63bktiaObRoKrA8m5uYS3F
 ledP16oi59TjL/3ZlJ0YM/wJb35izXP0rnDiOCMHBmRaR83tCYNYOIo8AkL/W2JD6gVR
 3Cu0zKFHySvXwJhOtcMoS1/3AWl5EFApS81Sz6kHksHtY8KlpSC2ORRdD6oxMTQjluNV
 NGY/sv18vz0T53n+1TZQadEg0ogK5UvMBQRJO+dSXRFycQLRpg2LN0f2QPuqsN9DC92U
 xxFA==
X-Gm-Message-State: AJIora8DaLnHzP7xiVprVNpjnfpYAVKzgADcTRT8j0ZguXORuQNr2jcA
 hLaZCPSCZhtDLn8GnDBLoMXSPIgcT+F3VeiY
X-Google-Smtp-Source: AGRyM1tQl6V4+CLxuouPVjISCadMXlD+FLKKMLChqmMNZ0r29PIbhVtQiW+cB+rJfB5SEtE5cukLbg==
X-Received: by 2002:a05:6870:434e:b0:10b:8204:3ec4 with SMTP id
 x14-20020a056870434e00b0010b82043ec4mr342814oah.113.1658253609557; 
 Tue, 19 Jul 2022 11:00:09 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] loongarch patch queue
Date: Tue, 19 Jul 2022 23:29:39 +0530
Message-Id: <20220719180000.378186-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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

The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:

  Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220719

for you to fetch changes up to fda3f15b0079d4bba76791502a7e00b8b747f509:

  hw/loongarch: Add fdt support (2022-07-19 22:55:10 +0530)

----------------------------------------------------------------
LoongArch64 patch queue:

Add dockerfile for loongarch cross compile
Add reference files for float tests.
Add simple tests for div, mod, clo, fclass, fcmp, pcadd
Add bios and kernel boot support.
Add smbios, acpi, and fdt support.
Fix pch-pic update-irq.
Fix some errors identified by coverity.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      tests/tcg/loongarch64: Add float reference files

Richard Henderson (1):
      tests/docker/dockerfiles: Add debian-loongarch-cross.docker

Song Gao (7):
      fpu/softfloat: Add LoongArch specializations for pickNaN*
      target/loongarch: Fix float_convd/float_convs test failing
      tests/tcg/loongarch64: Add clo related instructions test
      tests/tcg/loongarch64: Add div and mod related instructions test
      tests/tcg/loongarch64: Add fclass test
      tests/tcg/loongarch64: Add fp comparison instructions test
      tests/tcg/loongarch64: Add pcadd related instructions test

Xiaojuan Yang (12):
      target/loongarch: Fix loongarch_cpu_class_by_name
      hw/intc/loongarch_pch_pic: Fix bugs for update_irq function
      target/loongarch/cpu: Fix coverity errors about excp_names
      target/loongarch/tlb_helper: Fix coverity integer overflow error
      target/loongarch/op_helper: Fix coverity cond_at_most error
      target/loongarch/cpu: Fix cpucfg default value
      hw/loongarch: Add fw_cfg table support
      hw/loongarch: Add uefi bios loading support
      hw/loongarch: Add linux kernel booting support
      hw/loongarch: Add smbios support
      hw/loongarch: Add acpi ged support
      hw/loongarch: Add fdt support

 configure                                          |   5 +
 configs/targets/loongarch64-softmmu.mak            |   1 +
 hw/loongarch/fw_cfg.h                              |  15 +
 include/hw/loongarch/virt.h                        |  25 +
 include/hw/pci-host/ls7a.h                         |   4 +
 target/loongarch/cpu.h                             |   3 +
 hw/intc/loongarch_pch_pic.c                        |  10 +-
 hw/loongarch/acpi-build.c                          | 609 +++++++++++++
 hw/loongarch/fw_cfg.c                              |  33 +
 hw/loongarch/loongson3.c                           | 433 ++++++++-
 target/loongarch/cpu.c                             |  29 +-
 target/loongarch/fpu_helper.c                      | 143 +--
 target/loongarch/op_helper.c                       |   2 +-
 target/loongarch/tlb_helper.c                      |   4 +-
 tests/tcg/loongarch64/test_bit.c                   |  88 ++
 tests/tcg/loongarch64/test_div.c                   |  54 ++
 tests/tcg/loongarch64/test_fclass.c                | 130 +++
 tests/tcg/loongarch64/test_fpcom.c                 |  37 +
 tests/tcg/loongarch64/test_pcadd.c                 |  38 +
 fpu/softfloat-specialize.c.inc                     |  26 +-
 hw/loongarch/Kconfig                               |   3 +
 hw/loongarch/meson.build                           |   6 +-
 tests/docker/Makefile.include                      |   2 +
 .../dockerfiles/debian-loongarch-cross.docker      |  25 +
 tests/tcg/loongarch64/Makefile.target              |  19 +
 tests/tcg/loongarch64/float_convd.ref              | 988 +++++++++++++++++++++
 tests/tcg/loongarch64/float_convs.ref              | 748 ++++++++++++++++
 tests/tcg/loongarch64/float_madds.ref              | 768 ++++++++++++++++
 28 files changed, 4147 insertions(+), 101 deletions(-)
 create mode 100644 hw/loongarch/fw_cfg.h
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 tests/tcg/loongarch64/test_bit.c
 create mode 100644 tests/tcg/loongarch64/test_div.c
 create mode 100644 tests/tcg/loongarch64/test_fclass.c
 create mode 100644 tests/tcg/loongarch64/test_fpcom.c
 create mode 100644 tests/tcg/loongarch64/test_pcadd.c
 create mode 100644 tests/docker/dockerfiles/debian-loongarch-cross.docker
 create mode 100644 tests/tcg/loongarch64/Makefile.target
 create mode 100644 tests/tcg/loongarch64/float_convd.ref
 create mode 100644 tests/tcg/loongarch64/float_convs.ref
 create mode 100644 tests/tcg/loongarch64/float_madds.ref

