Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621A2C04D2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:46:00 +0100 (CET)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAI9-0007JJ-KG
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFe-00049E-2h
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFc-0002eM-2N
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id g14so3068260wrm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V5mPLkXLZ4Ej179UYHo5lR7TTajs6v4KErMW5OtaPkI=;
 b=qchVKSBxW2ixYvRpX9XKDLIB3Kf7MBnvHMVrIOuI57cADjHvMChe1iZHjWV4FFP50L
 ZW337F4xSP1qsPzDzsomSxLmFlsBmwEHqlriua/404B/Bny/mI0fOWL05fq7arIo8ITV
 W6u+uua9FCnEL3d0ZZd1G9P29PrD1GiWMgUVSGECXPLsprKyT3r+jTbFb8TUxONZxHbI
 tBurTXXvdvQyG9CIRvGC4K26CifJmCgELG5QzbzFSTbqZOuDVfA3CHTFRcBGH04NaaV3
 8BgJSjH7MntSNSJ1nSlF4OH6qrfVEcbVfDVbgvOJCPYgWjVUT6SyGCpgNJJXiVeHRV0U
 Co7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V5mPLkXLZ4Ej179UYHo5lR7TTajs6v4KErMW5OtaPkI=;
 b=Ut2nt/hj59JT06LyWjZKh5b5Ay8/a5v2L/rBUkvHly9rklHkfftBYgbfoyHZdLdABX
 QYvbuyE3928IT/2dVKxCHWmJIWku4KtV6vCg2ZMKFzfySFnhf5iCq0FNg7M9+Hx+dPUe
 VkEgKKUz6TwpumRYsA9RXmFOtihQcSmsxIAI10HBH5GeQk4Z+E7tkTFBNEo4FelOUU2F
 3lBDZoUyPRP+drzDJoNTfkSHkqT4UiJ4z9BudLr4cnm48uziEJIOSsWL8EvLQ0cw4Ti4
 BhSqa8d2NMHfEiaxvM0Zz+sW3olljkI0VeLJj5rWRHQrA4ggycIpSUupdsH8fIgXTv7n
 3TXw==
X-Gm-Message-State: AOAM533s8fu7cYUr4w68OnqATg1ZrEHCzhAd2m0TRZkQFImYznuc3rN5
 vsUVa6C7t8Sd92YV/C5dA7InufriTiOAMw==
X-Google-Smtp-Source: ABdhPJx9e4fstcwRW2MPj/nNMEYDpHmr6IQeIr0Ppx2nO/RZ6bHnjXbeP//F9T3XkxqjoO48vyyV6Q==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr11776558wrp.71.1606131797257; 
 Mon, 23 Nov 2020 03:43:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] target-arm queue
Date: Mon, 23 Nov 2020 11:42:51 +0000
Message-Id: <20201123114315.13372-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

A big pullreq by number of patches, but most of them are just docs
updates or MAINTAINERS file fixes. The actual code changes are pretty
minimal bugfixes.

thanks
-- PMM

The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201123

for you to fetch changes up to c6ff78563ad2971f289168c7cae6ecb0b4359516:

  docs/system/pr-manager.rst: Fix minor docs nits (2020-11-23 11:10:04 +0000)

----------------------------------------------------------------
target-arm queue:
 * incorporate 'orphan' rST docs into manuals
 * linux-user/arm: Deliver SIGTRAP for UDF patterns used as breakpoints
 * target/arm: Make SYS_HEAPINFO work with RAM that doesn't start at 0
 * document raspi boards and tosa
 * docs/system: Deprecate raspi2/raspi3 machine aliases
 * docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs
 * MAINTAINERS: add lines for docs files for Arm boards
 * hw/intc: fix heap-buffer-overflow in rxicu_realize()
 * hw/arm: Fix bad print format specifiers
 * target/arm: fix stage 2 page-walks in 32-bit emulation

----------------------------------------------------------------
AlexChen (1):
      hw/arm: Fix bad print format specifiers

Chen Qun (1):
      hw/intc: fix heap-buffer-overflow in rxicu_realize()

Peter Maydell (11):
      target/arm: Make SYS_HEAPINFO work with RAM that doesn't start at 0
      linux-user/arm: Deliver SIGTRAP for UDF patterns used as breakpoints
      docs: Move virtio-net-failover.rst into the system manual
      docs: Move cpu-hotplug.rst into the system manual
      docs: Move virtio-pmem.rst into the system manual
      docs/system/virtio-pmem.rst: Fix minor style issues
      docs: Split out 'pc' machine model docs into their own file
      docs: Move microvm.rst into the system manual
      docs: Move pr-manager.rst into the system manual
      docs: Split qemu-pr-helper documentation into tools manual
      docs/system/pr-manager.rst: Fix minor docs nits

Philippe Mathieu-Daudé (10):
      MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPUs
      MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC machines
      MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton NPCM7xx
      MAINTAINERS: Fix system/arm/orangepi.rst path
      MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF machine
      MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines
      docs/system: Deprecate raspi2/raspi3 machine aliases
      docs/system/arm: Document the various raspi boards
      docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs
      docs/system/arm: Document the Sharp Zaurus SL-6000

Rémi Denis-Courmont (1):
      target/arm: fix stage 2 page-walks in 32-bit emulation

 docs/meson.build                          |  1 +
 docs/system/arm/aspeed.rst                |  1 +
 docs/system/arm/raspi.rst                 | 43 +++++++++++++++
 docs/system/arm/xscale.rst                | 20 ++++---
 docs/{ => system}/cpu-hotplug.rst         |  0
 docs/system/deprecated.rst                |  7 +++
 docs/{ => system/i386}/microvm.rst        |  5 +-
 docs/system/i386/pc.rst                   |  7 +++
 docs/system/index.rst                     |  4 ++
 docs/{ => system}/pr-manager.rst          | 44 +++------------
 docs/system/target-arm.rst                |  1 +
 docs/system/target-i386.rst               | 19 +++++--
 docs/{ => system}/virtio-net-failover.rst |  0
 docs/system/virtio-pmem.rst               | 76 ++++++++++++++++++++++++++
 docs/tools/conf.py                        |  2 +
 docs/tools/index.rst                      |  1 +
 docs/tools/qemu-pr-helper.rst             | 90 +++++++++++++++++++++++++++++++
 docs/virtio-pmem.rst                      | 76 --------------------------
 hw/arm/pxa2xx.c                           |  2 +-
 hw/arm/spitz.c                            |  2 +-
 hw/arm/tosa.c                             |  2 +-
 hw/intc/rx_icu.c                          | 18 +++----
 linux-user/arm/cpu_loop.c                 | 28 ++++++++++
 target/arm/arm-semi.c                     | 12 +++--
 target/arm/helper.c                       |  4 +-
 MAINTAINERS                               |  8 ++-
 26 files changed, 326 insertions(+), 147 deletions(-)
 create mode 100644 docs/system/arm/raspi.rst
 rename docs/{ => system}/cpu-hotplug.rst (100%)
 rename docs/{ => system/i386}/microvm.rst (98%)
 create mode 100644 docs/system/i386/pc.rst
 rename docs/{ => system}/pr-manager.rst (68%)
 rename docs/{ => system}/virtio-net-failover.rst (100%)
 create mode 100644 docs/system/virtio-pmem.rst
 create mode 100644 docs/tools/qemu-pr-helper.rst
 delete mode 100644 docs/virtio-pmem.rst

