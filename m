Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA94442C21
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:05:33 +0100 (CET)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrbg-0004jP-Hr
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVy-0007El-ES
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:38 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVw-0006qW-9h
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:37 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id g25so11996307qvf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqN9D7OPzlH4DWRjrX/K/Ecj743aqTLSstUkg57nIfk=;
 b=SqttlrML831U3QgHGaltrWi+Jt3DPC+47pZCDRtNGvr+UgNwRyPOMD4lJs5Y2hHGOn
 jHBktaUKJFjLd8u0l1UgtZkfndaVr0C1HLqfnKP+8H6m1EE3OiOTatPqd77Vq/37CmSJ
 1BfF2iKG7qWw1HLjj7aOJXCiMNAf+sxwGR/wh4gzZO4rDJ8x/MSzsC9WDsGSH4eOETrF
 JK3dA+fYT07mJ+8Fo32/wI676cdm0cu6luFVpBA1lIF0pfYjgapBeFk2LXVJNrVCK6M8
 lnjYmNQrN/15iP2jyGMb5oY5bGUSUHQMqri7QgwB60lfHrZvdZTjj3NlyyfYViO//4oH
 v2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqN9D7OPzlH4DWRjrX/K/Ecj743aqTLSstUkg57nIfk=;
 b=sCOGuAr4KxXLVRRCJ3PZu4jeGb262MI+Jmf6TsAOh6kynRIEPONcA3ELOmlhUS78CC
 +AGczCqs73WhDCPx1joXValaWcVSEDqWIEIABBmiOYPKn0QN8Z4Tef/Ny9c+tZTQxsN5
 F+zB5vmrSAtO3iu5E2GiMxPyd7L4EgQnRBA/E5PY+SKXn6mehpnr9LZN8/kIknWIrcqe
 64jRyIxRaSmf3EP++0nBF91cvriGPWr1BTxvw6Eg3hYp6Zq6R12l50k1mqas9L0hhNNK
 wX1Gxb54dOgXt7XezPaPo2+c4ATWFtK3Drr2jDyH22N8JV0Z3d7hSSwe+GAMEJuwUL4k
 HGFg==
X-Gm-Message-State: AOAM531A836Zp14/HSIqDGeTQUoYqwAhfezAO7eVga9zlps1bzFgaAY5
 VeRk8rbfbr9p0ymVOIgjZoX5Xm8ANrO4tQ==
X-Google-Smtp-Source: ABdhPJz/Az4i2OKVQEdHurxotuUsRZ/6KKglKhA7rlR+5WgXbluJTTN8QX4IJunKkEVMMjPTsJo2Cg==
X-Received: by 2002:ad4:5422:: with SMTP id g2mr31198278qvt.19.1635850775057; 
 Tue, 02 Nov 2021 03:59:35 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] target/arm patch queue
Date: Tue,  2 Nov 2021 06:59:22 -0400
Message-Id: <20211102105934.214596-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dd61b91c080cdfba1360a5ea1e4693fffb3445b0:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-10-29' into staging (2021-10-29 19:42:36 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-arm-20211102

for you to fetch changes up to 1d3e21e25399367714518d389f3cbc956d27dddf:

  hw/arm/virt: Rename default_bus_bypass_iommu (2021-11-01 13:45:26 -0400)

----------------------------------------------------------------
Add nuvoton sd module for NPCM7XX
Add gdb-xml for MVE
More uses of tcg_constant_* in target/arm
Fix parameter naming for default-bus-bypass-iommu

----------------------------------------------------------------
Jean-Philippe Brucker (1):
      hw/arm/virt: Rename default_bus_bypass_iommu

Peter Maydell (1):
      target/arm: Advertise MVE to gdb when present

Philippe Mathieu-Daudé (5):
      target/arm: Use tcg_constant_i32() in op_smlad()
      target/arm: Introduce store_cpu_field_constant() helper
      target/arm: Use the constant variant of store_cpu_field() when possible
      target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
      target/arm: Use tcg_constant_i32() in gen_rev16()

Shengtan Mao (5):
      hw/sd: add nuvoton MMC
      hw/arm: Add Nuvoton SD module to board
      hw/arm: Attach MMC to quanta-gbs-bmc
      tests/qtest/libqos: add SDHCI commands
      tests/qtest: add qtests for npcm7xx sdhci

 configs/targets/aarch64-softmmu.mak  |   2 +-
 configs/targets/arm-linux-user.mak   |   2 +-
 configs/targets/arm-softmmu.mak      |   2 +-
 configs/targets/armeb-linux-user.mak |   2 +-
 include/hw/arm/npcm7xx.h             |   2 +
 include/hw/sd/npcm7xx_sdhci.h        |  65 +++++++++++
 target/arm/translate-a32.h           |   3 +
 tests/qtest/libqos/sdhci-cmd.h       |  70 ++++++++++++
 hw/arm/npcm7xx.c                     |  12 +-
 hw/arm/npcm7xx_boards.c              |  20 ++++
 hw/arm/virt.c                        |   4 +-
 hw/sd/npcm7xx_sdhci.c                | 182 ++++++++++++++++++++++++++++++
 target/arm/gdbstub.c                 |  25 +++++
 target/arm/translate-sve.c           |  17 ++-
 target/arm/translate.c               |  27 ++---
 tests/qtest/libqos/sdhci-cmd.c       | 116 +++++++++++++++++++
 tests/qtest/npcm7xx_sdhci-test.c     | 209 +++++++++++++++++++++++++++++++++++
 gdb-xml/arm-m-profile-mve.xml        |  19 ++++
 hw/sd/meson.build                    |   1 +
 tests/qtest/libqos/meson.build       |   1 +
 tests/qtest/meson.build              |   1 +
 21 files changed, 747 insertions(+), 35 deletions(-)
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c
 create mode 100644 gdb-xml/arm-m-profile-mve.xml

