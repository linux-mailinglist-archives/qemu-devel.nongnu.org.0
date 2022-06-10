Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A304B546A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:18:23 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhL4-0000l0-OW
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAn-0007My-FF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAl-0007Eb-IU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h5so37186654wrb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SnB3PGgJLHXBSjQc+BnC8xpmGjuYprIe8cRKG8yrr4=;
 b=vmyiqzi8XKBWJS/DarVe4cwGvO+MAVITRu+CNGJagYx5BDJ6aqRFtrcGiblLTttEyR
 64s3Ouy5unBpAZ+uv/ShUmbxDiA8uQXub4NHPH7rLIHT8CwsKZy3r8a/9HDF8mWxkMQG
 KNVvQPLXh4/lbbqo6ohPmboj8V6stLWQ5/19lCh0LArUzquehUSeCIqZNWBJLrmhSgFJ
 Wm4NJ6pveL8Yin3CS0frX1aNESwzziN2K8LplgO3cuPsAzf3LLm9G0M6fy5jurXrfr6t
 L7V1AAgCICmVi3Tx56EmDHSvMgJMqKI8A5EjgEuKbIexZZ21H7RKKj3QvAzP/cxo4awo
 TjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SnB3PGgJLHXBSjQc+BnC8xpmGjuYprIe8cRKG8yrr4=;
 b=PbIKKve08ex/rNJCbNeu6QeN0BwR49sI1kyCxTU01cc/3E6ovpHTTbAb9snspfydEi
 UueJQBLvV95pmIysfUvwFvo74wQyEpc/EMsvwobkoAVDQkBJSOueaAiZHvCNxVyqFRzo
 6/cpT7g5Da+aUeqkRHs0zwGfWRQjQK5ng42uY0zv97uKtortuGPYbEiAb3Jf2mu+wL2E
 vwHpoofYrB92UuBfadLGkcG6Xcegw93LjtQJLtcjIwXhoFMNuOAA68F6/DnKnnIV5Xy2
 eQvKf927mU/aioVnUyc24SncUTdrxDa+A0Bxxu2ounldF4QLQheMBUV9XQqvQ8vW1TmW
 qs8A==
X-Gm-Message-State: AOAM533r3mGjuGdIOQT0G3U6v1QlfzAujf8hdSOc9/pB3kFmh0u34i6+
 wisr5/bQcmgjI8N28F0RWySLfyB/uIPxlQ==
X-Google-Smtp-Source: ABdhPJxuD4CfcJigkvAFpYrwIhonlpaHRSR2G/7Larjl6vxUVDbD8/Pw3232n9zDHqufvrvOujLBJg==
X-Received: by 2002:a5d:5985:0:b0:218:410d:dc67 with SMTP id
 n5-20020a5d5985000000b00218410ddc67mr27021856wri.189.1654877261655; 
 Fri, 10 Jun 2022 09:07:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] target-arm queue
Date: Fri, 10 Jun 2022 17:07:10 +0100
Message-Id: <20220610160738.2230762-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Just flushing my target-arm queue since I won't be working next week :-)

-- PMM

The following changes since commit b3cd3b5a66f0dddfe3d5ba2bef13cd4f5b89cde9:

  Merge tag 'pull-riscv-to-apply-20220610' of github.com:alistair23/qemu into staging (2022-06-09 22:08:27 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220610

for you to fetch changes up to 90c072e063737e9e8f431489bbd334452f89056e:

  semihosting/config: Merge --semihosting-config option groups (2022-06-10 14:32:36 +0100)

----------------------------------------------------------------
 * refactor exception routing code
 * fix SCR_EL3 RAO/RAZ bits
 * gdbstub: Don't use GDB syscalls if no GDB is attached
 * semihosting/config: Merge --semihosting-config option groups
 * tests/qtest: Reduce npcm7xx_sdhci test image size

----------------------------------------------------------------
Hao Wu (1):
      tests/qtest: Reduce npcm7xx_sdhci test image size

Peter Maydell (2):
      gdbstub: Don't use GDB syscalls if no GDB is attached
      semihosting/config: Merge --semihosting-config option groups

Richard Henderson (25):
      target/arm: Mark exception helpers as noreturn
      target/arm: Add coproc parameter to syn_fp_access_trap
      target/arm: Move exception_target_el out of line
      target/arm: Move arm_singlestep_active out of line
      target/arm: Move arm_generate_debug_exceptions out of line
      target/arm: Use is_a64 in arm_generate_debug_exceptions
      target/arm: Move exception_bkpt_insn to debug_helper.c
      target/arm: Move arm_debug_exception_fsr to debug_helper.c
      target/arm: Rename helper_exception_with_syndrome
      target/arm: Introduce gen_exception_insn_el_v
      target/arm: Rename gen_exception_insn to gen_exception_insn_el
      target/arm: Introduce gen_exception_insn
      target/arm: Create helper_exception_swstep
      target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
      target/arm: Move gen_exception to translate.c
      target/arm: Rename gen_exception to gen_exception_el
      target/arm: Introduce gen_exception
      target/arm: Introduce gen_exception_el_v
      target/arm: Introduce helper_exception_with_syndrome
      target/arm: Remove default_exception_el
      target/arm: Create raise_exception_debug
      target/arm: Move arm_debug_target_el to debug_helper.c
      target/arm: Fix Secure PL1 tests in fp_exception_el
      target/arm: Adjust format test in scr_write
      target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]

 target/arm/cpu.h                 | 133 ++---------------------
 target/arm/helper.h              |   8 +-
 target/arm/internals.h           |  43 +-------
 target/arm/syndrome.h            |   7 +-
 target/arm/translate.h           |  43 ++------
 gdbstub.c                        |  14 ++-
 semihosting/config.c             |   1 +
 target/arm/debug_helper.c        | 220 +++++++++++++++++++++++++++++++++++++--
 target/arm/helper.c              |  53 ++++------
 target/arm/op_helper.c           |  52 +++++----
 target/arm/translate-a64.c       |  34 +++---
 target/arm/translate-m-nocp.c    |  15 ++-
 target/arm/translate-mve.c       |   3 +-
 target/arm/translate-vfp.c       |  18 +++-
 target/arm/translate.c           | 106 ++++++++++---------
 tests/qtest/npcm7xx_sdhci-test.c |   2 +-
 16 files changed, 390 insertions(+), 362 deletions(-)

