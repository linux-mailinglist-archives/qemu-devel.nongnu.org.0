Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19085487B61
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:26:31 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t0Y-0000UO-6L
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw0-000543-VD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:49 -0500
Received: from [2a00:1450:4864:20::430] (port=45958
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5svy-0007rV-Ml
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id q8so12280880wra.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8uFZGQA7FM+THF/ywhBN1is1X/cocSGfQ/5rWaXJoc=;
 b=Ygd5eNMK/7XETqBuJm7odLVVZ6hs1BqSbPCt84WPcxI5lCoeRTfR+b1so+TfmwnJ+K
 Ur9HU7Yy7KTl0KDoydLlW+PmBXJOFncLBm+7eDCgZ9DUNq5q4r8J/t03QORABcDCDUUA
 Y2X43+1wj7jnAIWcyaw/5dPP2bhXGcAAb6TJcgBIqYz3yGGB7GSZXhgu+Q8e9dUw1FMb
 OFjraEzKSHUVk7X0z/cEo1LT6u04S+CiByoh6aILNRnldZFm1I0KgjquBV33Q7iYLD2E
 afVOa444kikiARa11ABCbagHYFBieQc45FL6Eukj9zP33xTKvwrx0l+LZ/rqZGR/QORw
 WpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8uFZGQA7FM+THF/ywhBN1is1X/cocSGfQ/5rWaXJoc=;
 b=JoK82edauWnLuee+1rxGkCQUckXPYs2vIZxP3MXvj7VDgl3kG4vChZYuKGrKdZcsCS
 JeUYAgHFmQgFO9QDNiqXKWLJXi7n318er67zNppwnLc3QGG+5DnAwIhvkj9TFpLQxpIN
 IPciMrlm8saGNAkxdirLp72b3UWDsH2b4PknUr4ceMNT+zb9t+X4npefb68eqa6xjLd5
 BdMsUc4IyAB6I/OsB2TR+1F08OoikkaZ9e0NFGP4+Bm8LYokPgYwSntri/LXrOA+ncM0
 INLlPnjuwUNb7mRgA4XEPKwXlSWO2GrHDg7KFR/WQJdGXoceEaQdyaBxaYCI6T6E8on0
 WLHg==
X-Gm-Message-State: AOAM531QAitZVlMlkJJuFYUNh0yoa3H/jd6sMhqXPHQ8ETIszy2hFD4H
 RjurLehgcyt8owSCNe1wrLOGybPuQq/5+g==
X-Google-Smtp-Source: ABdhPJw7EDfKoqh710SCC4c3eXFw17AkasjMaRBbbFBSgzL8oLd9rEziFAxkSEY2g7lN0kP/qAOPRA==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr6556602wru.588.1641576104940; 
 Fri, 07 Jan 2022 09:21:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] target-arm queue
Date: Fri,  7 Jan 2022 17:21:23 +0000
Message-Id: <20220107172142.2651911-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


The following changes since commit 41fb4c14ee500125dc0ce6fb573cf84b8db29ed0:

  Merge tag 'linux-user-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-01-06 11:22:42 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220107

for you to fetch changes up to b8905cc2dde95ca6be5e56d77053b1ca0b8fc182:

  hw/arm: kudo add lm75s on bus 13 (2022-01-07 17:08:01 +0000)

----------------------------------------------------------------
target-arm queue:
 * Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
 * Add missing FEAT_TLBIOS instructions
 * arm_gicv3_its: Various bug fixes and cleanups
 * kudo-bmc: Add more devices

----------------------------------------------------------------
Chris Rauer (1):
      hw/arm: Add kudo i2c eeproms.

Idan Horowitz (1):
      target/arm: Add missing FEAT_TLBIOS instructions

Patrick Venture (2):
      hw/arm: add i2c muxes to kudo-bmc
      hw/arm: kudo add lm75s on bus 13

Peter Maydell (13):
      hw/intc/arm_gicv3_its: Correct off-by-one bounds check on rdbase
      hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED define
      hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
      hw/intc/arm_gicv3_its: Don't return early in extract_table_params() loop
      hw/intc/arm_gicv3_its: Reduce code duplication in extract_table_params()
      hw/intc/arm_gicv3_its: Correct setting of TableDesc entry_sz
      hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL define
      hw/intc/arm_gicv3_its: Correct handling of MAPI
      hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
      hw/intc/arm_gicv3_its: Correct comment about CTE RDBase field size
      hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
      hw/intc/arm_gicv3_its: Fix various off-by-one errors
      hw/intc/arm_gicv3_its: Rename max_l2_entries to num_l2_entries

Shengtan Mao (1):
      hw/arm: attach MMC to kudo-bmc

Troy Lee (1):
      Add dummy Aspeed AST2600 Display Port MCU (DPMCU)

 hw/intc/gicv3_internal.h               |  40 +++---
 include/hw/arm/aspeed_soc.h            |   2 +
 include/hw/intc/arm_gicv3_its_common.h |   9 +-
 hw/arm/aspeed_ast2600.c                |   8 ++
 hw/arm/npcm7xx_boards.c                |  27 ++++
 hw/intc/arm_gicv3_its.c                | 234 +++++++++++++++------------------
 target/arm/helper.c                    |  32 +++++
 7 files changed, 197 insertions(+), 155 deletions(-)

