Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA183443594
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:29:13 +0100 (CET)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyX2-0008M0-JE
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTM-0005dX-US
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:24 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTK-0004DD-1V
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:24 -0400
Received: by mail-qt1-x830.google.com with SMTP id r2so46664qtw.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HOkihzxhakTq9sVGzDt5sT0E5mk3v1AG+KLAa89YXEA=;
 b=IQW3fmOgQg0Qs18MAm1efZS4oCAPj3HSI4kkqac9/g8yu4EwS9TwT56W+U80lcVxMa
 INq2S4pr69mwZDrbYkKqiYDeqrWnQH3m9le4vZgYrZaLbN9F+Ys+1B2IGWP8fF4WbRC/
 x7kbL4w797ljT1BGRgKojUrfBto/yRueXgThF8H0jEGg1wMY3K1LdY4fEoM/y4unGRxO
 7iWRzGaW3qLL6ehzZAAXAeoT6OvDK8ix+Zl/HU6D7x1aqxANCk97DKsypYobOqygFUIk
 aVywDPufG/CVZKSfZ+zXrT/eW+luZre2RV98580zGig/46ULFly0Ar9/8nAvoXqCr/+6
 sLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HOkihzxhakTq9sVGzDt5sT0E5mk3v1AG+KLAa89YXEA=;
 b=FnHy7iT6m9dPgO/IegRx9cX8XOqSOO2k8+WMzeuIAvo2NloE/w1o7ZQ4/9IiC0VBk2
 MGes4SyxBY2+IAcFff92MUJE+n4EeAnWPrZ1ZP6ti5Emqug/IwbOM7YWdCunw0vp7fk2
 DI05pt/eVi3BqQPrdIJZ0s41eh7Hr93sb4KkHh4jcl2U97rhwAGUEBVhMMxi6MR9+gKc
 M5peHyqmqomKns6CUKujvUoF47yZJD+pp5OAruxpeNns6we7LPs/gws6fod6jNAWvrqX
 DrSuyY7ZWgh/L1aFV5JyIFiHgHsz0FvTCXg3Clt8JXOqDoAWJrYW2QRMod5z9RnMP+B8
 ufKA==
X-Gm-Message-State: AOAM531rJlz2PhfxwmIVH9mlb6c5nJ/3oNJo2T6lCuh5Qr3Jddg7gl0n
 Cjo5sKUbDjNvamL/lMLhPpOYqsU7ExL4WA==
X-Google-Smtp-Source: ABdhPJwgcnYjOWl7TZ5YYh4ZHPiQoITSTh6cHaHkGj7ZWs3oxecz1QOd0nemkI8oqRlpkrIO7Cx6GA==
X-Received: by 2002:a05:622a:1187:: with SMTP id
 m7mr17964639qtk.297.1635877520734; 
 Tue, 02 Nov 2021 11:25:20 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/12] target/arm patch queue
Date: Tue,  2 Nov 2021 14:25:07 -0400
Message-Id: <20211102182519.320319-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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

v2:
  Dropped the errant npcm7xx_sdhci test case.
  Added the hvf fix for openbsd.


r~


The following changes since commit 91e8394415f9bc9cd81c02bfafe02012855d4f98:

  Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211031-pull-request' into staging (2021-11-02 10:07:27 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-arm-20211102-2

for you to fetch changes up to 5fd6a3e23669444026f84f466a7ed402c203a84e:

  hvf: arm: Ignore cache operations on MMIO (2021-11-02 14:18:33 -0400)

----------------------------------------------------------------
Add nuvoton sd module for NPCM7XX
Add gdb-xml for MVE
More uses of tcg_constant_* in target/arm
Fix parameter naming for default-bus-bypass-iommu
Ignore cache operations to mmio in HVF

----------------------------------------------------------------
Alexander Graf (1):
      hvf: arm: Ignore cache operations on MMIO

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

Shengtan Mao (4):
      hw/sd: add nuvoton MMC
      hw/arm: Add Nuvoton SD module to board
      hw/arm: Attach MMC to quanta-gbs-bmc
      tests/qtest/libqos: add SDHCI commands

 configs/targets/aarch64-softmmu.mak  |   2 +-
 configs/targets/arm-linux-user.mak   |   2 +-
 configs/targets/arm-softmmu.mak      |   2 +-
 configs/targets/armeb-linux-user.mak |   2 +-
 include/hw/arm/npcm7xx.h             |   2 +
 include/hw/sd/npcm7xx_sdhci.h        |  65 +++++++++++++
 target/arm/translate-a32.h           |   3 +
 tests/qtest/libqos/sdhci-cmd.h       |  70 ++++++++++++++
 hw/arm/npcm7xx.c                     |  12 ++-
 hw/arm/npcm7xx_boards.c              |  20 ++++
 hw/arm/virt.c                        |   4 +-
 hw/sd/npcm7xx_sdhci.c                | 182 +++++++++++++++++++++++++++++++++++
 target/arm/gdbstub.c                 |  25 +++++
 target/arm/hvf/hvf.c                 |   7 ++
 target/arm/translate-sve.c           |  17 ++--
 target/arm/translate.c               |  27 ++----
 tests/qtest/libqos/sdhci-cmd.c       | 116 ++++++++++++++++++++++
 gdb-xml/arm-m-profile-mve.xml        |  19 ++++
 hw/sd/meson.build                    |   1 +
 tests/qtest/libqos/meson.build       |   1 +
 20 files changed, 544 insertions(+), 35 deletions(-)
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 gdb-xml/arm-m-profile-mve.xml

