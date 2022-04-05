Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2504F4538
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:40:57 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbrr6-0006oY-3o
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xMRMYggKCpkPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1nbroL-0004BL-Kw
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:05 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xMRMYggKCpkPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1nbroE-00030U-RI
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:00 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 j17-20020a62b611000000b004fa6338bd77so426048pff.10
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ZvKuSopRgSBrjg/Zq5sIYj8taEjAFAHUmvIQ+T+62z4=;
 b=b3G+juCD/bPIJWpcmm/TEkrUZe9WXUecAq+0LfcQL1Eu7nye4oEF1pd1LEf7f5NMP+
 R4I5HDJUawB1PFyZbvTWzJTwG/WFYA17r31NWDNSCQ1KaY5GfDe7ZiigRiwRSQmzlZSX
 3QGN7ihMnnuKj284pE9Q0GQ4cghMH/9XU1o/EZfg+VW5erHTH2RjF7zXLfaM8gmXtQWq
 4zA6XsNw9VlCTCUIHr2HZ1KQhLrsN8N0pz9ap16s5FnoKHaSZ8e+74kbFS3EoWa7d+mW
 odavbSjhrZVIPial18iEZjNs+CPmK4Kpe/YLDw/O/Rhiag1pAx6s6puLrVsjXSlDpaxk
 RsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ZvKuSopRgSBrjg/Zq5sIYj8taEjAFAHUmvIQ+T+62z4=;
 b=4HYmueULXUAdBO2t76kZjhF9xPCw/olQnc/Qet2OWPgt8sLRylJZosUUCZUXwueG2H
 eUNwA6rXHaTQDfNjWs41MjrxW1imFJxXjp1Tg+lejlj0WYE2pr+Cuc/JOzr+Sc8JZTa/
 TriJf5QXdsIJ5rPnGYjG8KTQnsFAYQgcSrmypiI8EuMvPPmzjGf1va8VeoKkUsvrA0Vy
 z8lG3GHGDIR6tL8vN1H4ccgZGf8NNdXYhSBq5gGV6QAiBul/IJkXjkz2KBrdMwRPz5lj
 rWexT9SK0bblBOtzxXnFrXtH7BFVxxcJjRrC6yYPW3ORRdYnmZItdqMimTutMk4igz72
 dcUQ==
X-Gm-Message-State: AOAM533VItcW5iPZpc5BFdVVqy1hSS10PlH0YqzJDA5P4zGU41VCMTvt
 qlUBeW8sQlxcbdaymwie1z5sn/rKUfVD+Q==
X-Google-Smtp-Source: ABdhPJyNp1ZPv2vSmC+KHYQPhAaQSnmtIHKmLkWHBUm/wR5BDhDCAfZyIZkhZ7/8q5GZyy3B1By0eoXRIVgXUA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:1a85:b0:1c9:d81b:33f1 with SMTP
 id ng5-20020a17090b1a8500b001c9d81b33f1mr6441185pjb.212.1649198276495; Tue,
 05 Apr 2022 15:37:56 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:29 -0700
Message-Id: <20220405223640.2595730-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3xMRMYggKCpkPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature
quad-core ARM Cortex A35 that supports both 32 bits and 64 bits
operations. This patch set aims to support basic functionalities
of the NPCM7XX BMCs. The patch set includes:

1. We derive most devices from the 7XX models and
made some modifications.
2. We have constructed a minimum vBootROM similar to the 7XX one at
https://github.com/google/vbootrom/tree/master/npcm8xx
and included it in the patch set.
3.  We added a new NPCM8XX SOC and an evaluation
board machine npcm845-evb.

The OpenBMC for NPCM845 evaluation board can be found at:
https://github.com/Nuvoton-Israel/openbmc/tree/npcm-v2.10/meta-evb/meta-evb-nuvoton/meta-evb-npcm845

The patch set can boot the evaluation board image built from the source
above to login prompt.

Hao Wu (11):
  docs/system/arm: Add Description for NPCM8XX SoC
  hw/ssi: Make flash size a property in NPCM7XX FIU
  hw/misc: Support NPCM8XX GCR module
  hw/misc: Support NPCM8XX CLK Module Registers
  hw/misc: Store DRAM size in NPCM8XX GCR Module
  hw/intc: Add a property to allow GIC to reset into non secure mode
  hw/misc: Support 8-bytes memop in NPCM GCR module
  hw/net: Add NPCM8XX PCS Module
  pc-bios: Add NPCM8xx Bootrom
  hw/arm: Add NPCM8XX SoC
  hw/arm: Add NPCM845 Evaluation board

 MAINTAINERS                                   |   9 +-
 configs/devices/aarch64-softmmu/default.mak   |   1 +
 docs/system/arm/nuvoton.rst                   |  20 +-
 hw/arm/Kconfig                                |  11 +
 hw/arm/meson.build                            |   1 +
 hw/arm/npcm7xx.c                              |   6 +
 hw/arm/npcm8xx.c                              | 806 ++++++++++++++++++
 hw/arm/npcm8xx_boards.c                       | 257 ++++++
 hw/intc/arm_gic_common.c                      |   2 +
 hw/misc/meson.build                           |   4 +-
 hw/misc/npcm7xx_gcr.c                         | 269 ------
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 238 ++++--
 hw/misc/npcm_gcr.c                            | 492 +++++++++++
 hw/misc/trace-events                          |  12 +-
 hw/net/meson.build                            |   1 +
 hw/net/npcm_pcs.c                             | 409 +++++++++
 hw/net/trace-events                           |   4 +
 hw/ssi/npcm7xx_fiu.c                          |   6 +-
 include/hw/arm/npcm7xx.h                      |   8 +-
 include/hw/arm/npcm8xx.h                      | 126 +++
 include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} |  43 +-
 include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} |  30 +-
 include/hw/net/npcm_pcs.h                     |  42 +
 include/hw/ssi/npcm7xx_fiu.h                  |   1 +
 pc-bios/npcm8xx_bootrom.bin                   | Bin 0 -> 608 bytes
 25 files changed, 2428 insertions(+), 370 deletions(-)
 create mode 100644 hw/arm/npcm8xx.c
 create mode 100644 hw/arm/npcm8xx_boards.c
 delete mode 100644 hw/misc/npcm7xx_gcr.c
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (81%)
 create mode 100644 hw/misc/npcm_gcr.c
 create mode 100644 hw/net/npcm_pcs.c
 create mode 100644 include/hw/arm/npcm8xx.h
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (83%)
 rename include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} (55%)
 create mode 100644 include/hw/net/npcm_pcs.h
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

-- 
2.35.1.1094.g7c7d902a7c-goog


