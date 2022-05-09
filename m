Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1551FBD8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:03:33 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no26t-0001aN-Mq
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Q-00070l-UY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22P-0001GV-0F
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id v12so19069501wrv.10
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3K/gnyfwQ5SlC9PohntUl+Ghq4dRaFx5ugGptct2IYI=;
 b=WB/r9M5HCQ74EMok86Ro1Honbm9FRVoCfF4H7ge4jAjBi9LwykMNNXiQhNRN2Lz/RK
 abV0dJpHeqXYgiG7z9E4nhzAhYsXG3ncILRdFR3qryl7v0tR7H7gfe5XS9Qt9dL6mrdE
 YtRPdpligDd0e0u0q+eQ8hJ2H0ZvZKbSV1LQVn9gRBSi5WRl+9/PtpiudxjENA9rN0b4
 M0SQSo67Uz8s6uax+4aGlVKrbHh8vrntvtq5OLGVaUk/QHh/nNzQchxZFD4e3f47EFHS
 YA1IY6m4wk9B3izu3Ym8z4CAfq2Klc9xgU+8+CKAkkbp0fjHXsLxJuouiwT7zYjt/Ryp
 KMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3K/gnyfwQ5SlC9PohntUl+Ghq4dRaFx5ugGptct2IYI=;
 b=mfcpJzDIUFIAEnAMrzBrO3ZEU3qQ95RWz7MvDgDblMSpa3huHng/SCLV6cwAlulZvS
 1kqVM71sjqNvQzK6+WusFof2iJ6p5ScyldWa8oFAGgd81+WXiVEALWOcdEp+If1gTHYq
 8zEX+GOZrJp9E9cZ3fRz5vDKV6/E4G9pxj6BEmO4nTq4HaOGCE7N1s1kpzzEtsv1STO3
 efJkbN3/ZVPL9lcjBqka+5T5RObxKVu5Gz5LgOqRPLkFPQE2OBJuY1vy/CuOUJWbIDmL
 2T4qHNuopr1LMtxmy/6ZeAHLL6GF8mQy/CkNRsMhK6AjzWP2p+uzubqOBd+er6yinngh
 Q+KQ==
X-Gm-Message-State: AOAM533aRbigxWQvXrp3CdU+scuNbzKzBiz8fQX3ikCjjTMsB+iVUJlG
 kSlMAoYac3d4beB4eiO2C4htwiZbd6sLRA==
X-Google-Smtp-Source: ABdhPJzg9ecKS9wWDq5GFreOIRLUssCKLgHmlbxgwS12hD09dp5i4L87t2T8nSvs/uwkPefncZxjrg==
X-Received: by 2002:adf:fd0b:0:b0:20a:ea57:6dab with SMTP id
 e11-20020adffd0b000000b0020aea576dabmr13685376wrr.175.1652097530157; 
 Mon, 09 May 2022 04:58:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/32] target-arm queue
Date: Mon,  9 May 2022 12:58:16 +0100
Message-Id: <20220509115848.3521805-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

target-arm queue: the big stuff here is the final part of
rth's patches for Cortex-A76 and Neoverse-N1 support;
also present are Gavin's NUMA series and a few other things.

thanks
-- PMM

The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:

  Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220509

for you to fetch changes up to ae9141d4a3265553503bf07d3574b40f84615a34:

  hw/acpi/aml-build: Use existing CPU topology to build PPTT table (2022-05-09 11:47:55 +0100)

----------------------------------------------------------------
target-arm queue:
 * MAINTAINERS/.mailmap: update email for Leif Lindholm
 * hw/arm: add version information to sbsa-ref machine DT
 * Enable new features for -cpu max:
   FEAT_Debugv8p2, FEAT_Debugv8p4, FEAT_RAS (minimal version only),
   FEAT_IESB, FEAT_CSV2, FEAT_CSV2_2, FEAT_CSV3, FEAT_DGH
 * Emulate Cortex-A76
 * Emulate Neoverse-N1
 * Fix the virt board default NUMA topology

----------------------------------------------------------------
Gavin Shan (6):
      qapi/machine.json: Add cluster-id
      qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
      hw/arm/virt: Consider SMP configuration in CPU topology
      qtest/numa-test: Correct CPU and NUMA association in aarch64_numa_cpu()
      hw/arm/virt: Fix CPU's default NUMA node ID
      hw/acpi/aml-build: Use existing CPU topology to build PPTT table

Leif Lindholm (2):
      MAINTAINERS/.mailmap: update email for Leif Lindholm
      hw/arm: add versioning to sbsa-ref machine DT

Richard Henderson (24):
      target/arm: Handle cpreg registration for missing EL
      target/arm: Drop EL3 no EL2 fallbacks
      target/arm: Merge zcr reginfo
      target/arm: Adjust definition of CONTEXTIDR_EL2
      target/arm: Move cortex impdef sysregs to cpu_tcg.c
      target/arm: Update qemu-system-arm -cpu max to cortex-a57
      target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
      target/arm: Split out aa32_max_features
      target/arm: Annotate arm_max_initfn with FEAT identifiers
      target/arm: Use field names for manipulating EL2 and EL3 modes
      target/arm: Enable FEAT_Debugv8p2 for -cpu max
      target/arm: Enable FEAT_Debugv8p4 for -cpu max
      target/arm: Add minimal RAS registers
      target/arm: Enable SCR and HCR bits for RAS
      target/arm: Implement virtual SError exceptions
      target/arm: Implement ESB instruction
      target/arm: Enable FEAT_RAS for -cpu max
      target/arm: Enable FEAT_IESB for -cpu max
      target/arm: Enable FEAT_CSV2 for -cpu max
      target/arm: Enable FEAT_CSV2_2 for -cpu max
      target/arm: Enable FEAT_CSV3 for -cpu max
      target/arm: Enable FEAT_DGH for -cpu max
      target/arm: Define cortex-a76
      target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 qapi/machine.json             |   6 +-
 target/arm/cpregs.h           |  11 +
 target/arm/cpu.h              |  23 ++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 ++
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/acpi/aml-build.c           | 111 ++++----
 hw/arm/sbsa-ref.c             |  16 ++
 hw/arm/virt.c                 |  21 +-
 hw/core/machine-hmp-cmds.c    |   4 +
 hw/core/machine.c             |  16 ++
 target/arm/cpu.c              |  66 ++++-
 target/arm/cpu64.c            | 353 ++++++++++++++-----------
 target/arm/cpu_tcg.c          | 227 +++++++++++-----
 target/arm/helper.c           | 600 +++++++++++++++++++++++++-----------------
 target/arm/op_helper.c        |  43 +++
 target/arm/translate-a64.c    |  18 ++
 target/arm/translate.c        |  23 ++
 tests/qtest/numa-test.c       |  19 +-
 .mailmap                      |   3 +-
 MAINTAINERS                   |   2 +-
 25 files changed, 1068 insertions(+), 562 deletions(-)

