Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8D96AC584
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrM-0003yz-IS; Mon, 06 Mar 2023 10:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrJ-0003yO-Ge
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrH-00027j-H4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id c18so5930761wmr.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=kNxEpbpzuEvIgoWhqEaVpuVuKpGVmLN3bzaspIgl5VA=;
 b=ytHzKxsSols1pkTnRTG2mbdcE8w1Cn2Vu4q2dPGD83+6pT1DIMfscC48gc1MzB57AX
 IH2Z7aYWMX0m26dnOFThtFHJfrMxkc/hqTCVqfowPBlIuWFfxL7kqmonejwYsnPE5wlf
 SJMnpGgd1av1rJyp6CJPJv4LO/xoeqF/5bK6Xz403CZCLlsGx6LvtJLmNgHaMj6wR2Yz
 mPL6gpQpQfSvyZukJ8MjfimFRsTVfkiJ7lgFKGopWwExWsNXqGeb2Gbe8KGvzwbWjSo2
 8+sXlAHELRqslWwTEUszlI07VfdBgyEpuhjIOpUdgr0HAhPJm/wANfvq4pOfW/5vHUnN
 QP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNxEpbpzuEvIgoWhqEaVpuVuKpGVmLN3bzaspIgl5VA=;
 b=KB67cM53hOShK+ECS9zcaRXfhwmIupIy8FZBYhk4JGkPMizrw6EUexGVs+50oDGwkM
 0kmD29AbC4TG2jZySSd859Mzv/YxtvAWhhVzgK+kSO69snKdzNC9VwnTq22IlMZbyXGN
 LlSBpjXEfiDcX7ehtZqNLe27/Dfl7iPCh7a7idO+sL5EKgVNyM12YObz5Z5A+hOESVmK
 dC4VAC8xu+XSrlJwLnh7bTUAYmIruWGZl3Vm/+roevs8SbzxcJZ2zhOC67kd2XAtMZde
 qyvybkCSJqY6z2Vlc3rbfV7MI99ITcaXL0vfb8u6V2uWg2oIAJCjxKtDOZhi7hZu12Cj
 MSUg==
X-Gm-Message-State: AO0yUKX503vKfZ+450/tnsmID3lMZKJs8cUV4TbdRmW4Fk0XwCQ6b4/e
 QdMy1LwhP5s3pnM5RmQfHs5Gb1p+UWugZcnAT+g=
X-Google-Smtp-Source: AK7set9TXbShslN/vbkECkiaDs12P3qk6fvTl4A5YEOLAqXnegpgLxe5IdJoB1OtfI24BtljEdNn7A==
X-Received: by 2002:a05:600c:3b10:b0:3eb:399d:ab18 with SMTP id
 m16-20020a05600c3b1000b003eb399dab18mr10229450wms.35.1678116877804; 
 Mon, 06 Mar 2023 07:34:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Mon,  6 Mar 2023 15:34:14 +0000
Message-Id: <20230306153435.490894-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

The following changes since commit f003dd8d81f7d88f4b1f8802309eaa76f6eb223a:

  Merge tag 'pull-tcg-20230305' of https://gitlab.com/rth7680/qemu into staging (2023-03-06 10:20:04 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230306

for you to fetch changes up to 2ddc45954f97cd1d7ee5cbca0def05e980d1da9f:

  hw: arm: allwinner-h3: Fix and complete H3 i2c devices (2023-03-06 15:31:24 +0000)

----------------------------------------------------------------
target-arm queue:
 * allwinner-h3: Fix I2C controller model for Sun6i SoCs
 * allwinner-h3: Add missing i2c controllers
 * Expose M-profile system registers to gdbstub
 * Expose pauth information to gdbstub
 * Support direct boot for Linux/arm64 EFI zboot images
 * Fix incorrect stage 2 MMU setup validation

----------------------------------------------------------------
Ard Biesheuvel (1):
      hw: arm: Support direct boot for Linux/arm64 EFI zboot images

David Reiss (2):
      target/arm: Export arm_v7m_mrs_control
      target/arm: Export arm_v7m_get_sp_ptr

Richard Henderson (16):
      target/arm: Normalize aarch64 gdbstub get/set function names
      target/arm: Unexport arm_gen_dynamic_sysreg_xml
      target/arm: Move arm_gen_dynamic_svereg_xml to gdbstub64.c
      target/arm: Split out output_vector_union_type
      target/arm: Simplify register counting in arm_gen_dynamic_svereg_xml
      target/arm: Hoist pred_width in arm_gen_dynamic_svereg_xml
      target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
      target/arm: Add name argument to output_vector_union_type
      target/arm: Simplify iteration over bit widths
      target/arm: Create pauth_ptr_mask
      target/arm: Implement gdbstub pauth extension
      target/arm: Implement gdbstub m-profile systemreg and secext
      target/arm: Handle m-profile in arm_is_secure
      target/arm: Stub arm_hcr_el2_eff for m-profile
      target/arm: Diagnose incorrect usage of arm_is_secure subroutines
      target/arm: Rewrite check_s2_mmu_setup

qianfan Zhao (2):
      hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
      hw: arm: allwinner-h3: Fix and complete H3 i2c devices

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 include/hw/arm/allwinner-h3.h             |   6 +
 include/hw/i2c/allwinner-i2c.h            |   6 +
 include/hw/loader.h                       |  19 ++
 target/arm/cpu.h                          |  17 +-
 target/arm/internals.h                    |  34 +++-
 hw/arm/allwinner-h3.c                     |  29 +++-
 hw/arm/boot.c                             |   6 +
 hw/core/loader.c                          |  91 ++++++++++
 hw/i2c/allwinner-i2c.c                    |  26 ++-
 target/arm/gdbstub.c                      | 278 ++++++++++++++++++------------
 target/arm/gdbstub64.c                    | 175 ++++++++++++++++++-
 target/arm/helper.c                       |   3 +
 target/arm/ptw.c                          | 173 +++++++++++--------
 target/arm/tcg/m_helper.c                 |  90 +++++-----
 target/arm/tcg/pauth_helper.c             |  26 ++-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 19 files changed, 742 insertions(+), 258 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

