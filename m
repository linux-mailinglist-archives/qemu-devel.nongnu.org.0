Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D066677CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzv-000629-D5; Mon, 23 Jan 2023 08:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzR-0005v1-Mi
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzP-0002La-3W
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id l8so9023586wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+HeNVQgwKhG+/iEC06223yYm0lQcj+BxRBCi4/n3dgQ=;
 b=cg4O41HNmH6YYxtJYLJSKX/hMbgczU6xBDKr2uEA2vIN+Jtqu0+9+cQfmXUTgdVGvt
 /MsOOBwYzYUmYM5T01xXxDsdK50c//Rk7cfcW/2IS6rYUDLGuzWUuIhOYE2/W+zORgut
 WVUNm58KzeZqulXfMwqpdv7t9Rb0BSgnBnTyEp6E+v83EMMeNo7FifSaBDK0EncEwIvt
 yVkqq0rrkDNHu/mNg4uZCRDcaz7DcThVDPdN4gttpKP4iDUcedYeEzyUKWrl8NT7l4ed
 xUnDV623uIWGFzzPErdSlKi+YwzcCn2dgAHKONnFpv6kF2L+sHk0tNrlCDNI5zcylZge
 V0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+HeNVQgwKhG+/iEC06223yYm0lQcj+BxRBCi4/n3dgQ=;
 b=qksgux8dCia0sOwQ4aBBr/mr6iXBLKFi7cXs6dtKQolSDtW//LliaTsheCfFHukRzp
 8UgMotNO41Ovg6CZE02B7nSCKOyVpQVLbJyYNaFprDpFCR8whdWfTTQHtR/rAh8dz5O0
 JzedPwjNDsnvVnXfz/OxeG+9j4nQFAv4gI4GtqJvJe34wiiCymTve5CwxxeOwePgpMHq
 oC6DDL9XqIP3XnZAbwgRjiUMF351SBLg+kQh3WNS/1MRQXUke0AcFH27xxCQGwsa/XXq
 LAWNfH8MzTYQ16BOQNYADz2LiG36yEOUdOBcf0vysMIoWyMx+2R5hWKpFM0uQ6TimStj
 TbCg==
X-Gm-Message-State: AFqh2kr98F40/2s3G3q9rJQqcTT5pS1Fyo1bJWZbAM8S7LQqmGE8oJMp
 K6o7cygfFg/IZwRPr5Qi1+4ozG9yevN6KwXz
X-Google-Smtp-Source: AMrXdXshs/moWyeofqnjouPhcj+vb9kVG5iTOiKhVvcrdcxIM3w6GSI1AfVdsN3YRcWZkRnbm1W+fQ==
X-Received: by 2002:a05:600c:35ce:b0:3db:1caf:1020 with SMTP id
 r14-20020a05600c35ce00b003db1caf1020mr17288481wmq.35.1674480956276; 
 Mon, 23 Jan 2023 05:35:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:35:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] target-arm queue
Date: Mon, 23 Jan 2023 13:35:27 +0000
Message-Id: <20230123133553.2171158-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 65cc5ccf06a74c98de73ec683d9a543baa302a12:

  Merge tag 'pull-riscv-to-apply-20230120' of https://github.com/alistair23/qemu into staging (2023-01-20 16:17:56 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230123

for you to fetch changes up to 3b07a936d3bfe97b07ddffcfbb532985a88033dd:

  target/arm: Look up ARMCPRegInfo at runtime (2023-01-23 13:32:38 +0000)

----------------------------------------------------------------
target-arm queue:
 * Widen cnthctl_el2 to uint64_t
 * Unify checking for M Main Extension in MRS/MSR
 * bitbang_i2c, versatile_i2c: code cleanups
 * SME: refactor SME SM/ZA handling
 * Fix physical address resolution for MTE
 * Fix in_debug path in S1_ptw_translate
 * Don't set EXC_RETURN.ES if Security Extension not present
 * Implement DBGCLAIM registers
 * Provide stubs for more external debug registers
 * Look up ARMCPRegInfo at runtime, not translate time

----------------------------------------------------------------
David Reiss (1):
      target/arm: Unify checking for M Main Extension in MRS/MSR

Evgeny Iakovlev (2):
      target/arm: implement DBGCLAIM registers
      target/arm: provide stubs for more external debug registers

Peter Maydell (1):
      target/arm: Don't set EXC_RETURN.ES if Security Extension not present

Philippe Mathieu-Daudé (10):
      hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
      hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
      hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state() helper
      hw/i2c/bitbang_i2c: Trace state changes
      hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
      hw/i2c/versatile_i2c: Drop useless casts from void * to pointer
      hw/i2c/versatile_i2c: Replace VersatileI2CState -> ArmSbconI2CState
      hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
      hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
      hw/i2c/versatile_i2c: Rename versatile_i2c -> arm_sbcon_i2c

Richard Henderson (12):
      target/arm: Widen cnthctl_el2 to uint64_t
      target/arm/sme: Reorg SME access handling in handle_msr_i()
      target/arm/sme: Rebuild hflags in set_pstate() helpers
      target/arm/sme: Introduce aarch64_set_svcr()
      target/arm/sme: Reset SVE state in aarch64_set_svcr()
      target/arm/sme: Reset ZA state in aarch64_set_svcr()
      target/arm/sme: Rebuild hflags in aarch64_set_svcr()
      target/arm/sme: Unify set_pstate() SM/ZA helpers as set_svcr()
      target/arm: Fix physical address resolution for MTE
      target/arm: Fix in_debug path in S1_ptw_translate
      target/arm: Reorg do_coproc_insn
      target/arm: Look up ARMCPRegInfo at runtime

 MAINTAINERS                                 |   1 +
 include/hw/i2c/arm_sbcon_i2c.h              |   6 +-
 include/hw/i2c/bitbang_i2c.h                |   2 +
 target/arm/cpu.h                            |   5 +-
 target/arm/helper-sme.h                     |   3 +-
 target/arm/helper.h                         |  11 +-
 target/arm/translate.h                      |   7 +
 hw/arm/musicpal.c                           |   3 +-
 hw/arm/realview.c                           |   2 +-
 hw/arm/versatilepb.c                        |   2 +-
 hw/arm/vexpress.c                           |   2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} |  39 ++-
 hw/i2c/bitbang_i2c.c                        |  80 ++++--
 linux-user/aarch64/cpu_loop.c               |  11 +-
 linux-user/aarch64/signal.c                 |  13 +-
 target/arm/debug_helper.c                   |  54 ++++
 target/arm/helper.c                         |  41 ++-
 target/arm/m_helper.c                       |  24 +-
 target/arm/mte_helper.c                     |   2 +-
 target/arm/op_helper.c                      |  27 +-
 target/arm/ptw.c                            |   4 +-
 target/arm/sme_helper.c                     |  37 +--
 target/arm/translate-a64.c                  |  68 +++--
 target/arm/translate.c                      | 430 +++++++++++++++-------------
 hw/arm/Kconfig                              |   4 +-
 hw/i2c/Kconfig                              |   2 +-
 hw/i2c/meson.build                          |   2 +-
 hw/i2c/trace-events                         |   7 +
 28 files changed, 506 insertions(+), 383 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (70%)

