Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB696504BB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p714E-000123-81; Sun, 18 Dec 2022 16:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714B-00011H-Tl; Sun, 18 Dec 2022 16:19:27 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p7149-0001ww-2P; Sun, 18 Dec 2022 16:19:26 -0500
Received: by mail-lf1-x130.google.com with SMTP id b3so11130749lfv.2;
 Sun, 18 Dec 2022 13:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UaMyemjWHVtb8P4kKE1NTumKJ4QAyCc74gpnVxBlue4=;
 b=lbkbssfRRUVA+bWSgbhzHqTjJeFJ9LArk9YS9rhYJ2bXmIYrto6gRR84NxJeyNMGkl
 ALe1iW50kGjHqWeLP1Thf58SR7RnXnXVnpxte3u+qGEgKd6JHd56yu4talA/eoCr4h03
 T0jMdzm+mmtX24s1LSKphZ2JOuj+Mp2grMTk8AO0kghsGhFrLK0yFxqHjxqWSoSitL4p
 UjmCYfGH0yOETiU9I4O3YQyzW6ZKaUZHhCZiSqntRDMd9F/WfP1sMRvfpLEz0d1WGIwL
 CMi6bv/2Ux4NfTJ33NziHDEFce4YYR/B98RPutexfYXUkKRKdQiZacC32mUf//AQkuR8
 mq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UaMyemjWHVtb8P4kKE1NTumKJ4QAyCc74gpnVxBlue4=;
 b=QXrxf9ATwO6LDeljLdAb0hkYo1B7SXqXZDlQSVfdaS7Nv5DAkS5zqCnGxj7lPsl8AL
 90eH9d/NA3BQwtQosJLipaeog5oYxg3OJ9JdmJIaGoY+HF6b/k0f27r6VSAAlRLGfuba
 fnToDcAkFz4sm0rJSOyfmsRBxMAXspd6jWCkR/i9dpCfquKmSOkheZ6Wnbezw8wFP+rM
 TNzhsw3D3c1Ia5qsnvLUo318iwGHTZVuNYOkve6WqGxItYkl9SQ+5/bCo844VBe/NtCp
 ZGGCuZP9OW3qr9WrV/V23PmhhbfBPKNoKRfNr79axI27O4CkFP95mtb4wHIx0WMKzsUY
 hRTA==
X-Gm-Message-State: ANoB5plJdEMsc6QaBKSor2FBM+m1V17RWgS2WuCRYhA2ujU0u2TXcyaW
 4F7MzFbciyk4RDxRaTjD/TA=
X-Google-Smtp-Source: AA0mqf5D21dofelbwxphrvQZIONNLX08PDKFF5UQPuQ5UtGVRyu83pkm9At9/r1El0CPKEQxFQKt9Q==
X-Received: by 2002:a05:6512:3055:b0:4b6:edee:5873 with SMTP id
 b21-20020a056512305500b004b6edee5873mr10089428lfb.32.1671398362548; 
 Sun, 18 Dec 2022 13:19:22 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 w7-20020a05651234c700b0049464d89e40sm902620lfr.72.2022.12.18.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 13:19:22 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
Date: Sun, 18 Dec 2022 22:19:11 +0100
Message-Id: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This patch series adds missing Allwinner A10 modules needed for
successful SPL boot:
- Clock controller module
- DRAM controller
- I2C0 controller (added also for Allwinner H3 since it is the same)
- AXP-209 connected to I2C0 bus

It also updates Allwinner A10 emulation so SPL is copied from attached
SD card if `-kernel` parameter is not passed when starting QEMU
(approach adapted from Allwinner H3 implementation).

Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
Yocto image built for Cubieboard.
Example usage for Armbian image:
qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img

v2 from v1:
* replaced DB_PRINTF with tracing functions
* removed .init function in AXP209 since .reset covers functionality
* moved defines to allwinner_i2c.c from header file
* updated docs with information about TWI
* minor code style fixes

Strahinja Jankovic (7):
  hw/misc: Allwinner-A10 Clock Controller Module Emulation
  hw/misc: Allwinner A10 DRAM Controller Emulation
  hw/i2c: Allwinner TWI/I2C Emulation
  hw/misc: Allwinner AXP-209 Emulation
  hw/arm: Add AXP-209 to Cubieboard
  hw/arm: Allwinner A10 enable SPL load from MMC
  docs/system/arm: Update Allwinner with TWI (I2C)

 docs/system/arm/cubieboard.rst        |   1 +
 docs/system/arm/orangepi.rst          |   1 +
 hw/arm/Kconfig                        |   5 +
 hw/arm/allwinner-a10.c                |  40 +++
 hw/arm/allwinner-h3.c                 |  11 +-
 hw/arm/cubieboard.c                   |  11 +
 hw/i2c/Kconfig                        |   4 +
 hw/i2c/allwinner-i2c.c                | 459 ++++++++++++++++++++++++++
 hw/i2c/meson.build                    |   1 +
 hw/i2c/trace-events                   |   5 +
 hw/misc/Kconfig                       |  10 +
 hw/misc/allwinner-a10-ccm.c           | 224 +++++++++++++
 hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++
 hw/misc/allwinner-axp-209.c           | 238 +++++++++++++
 hw/misc/meson.build                   |   3 +
 hw/misc/trace-events                  |   5 +
 include/hw/arm/allwinner-a10.h        |  27 ++
 include/hw/arm/allwinner-h3.h         |   3 +
 include/hw/i2c/allwinner-i2c.h        |  55 +++
 include/hw/misc/allwinner-a10-ccm.h   |  67 ++++
 include/hw/misc/allwinner-a10-dramc.h |  68 ++++
 21 files changed, 1416 insertions(+), 1 deletion(-)
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/allwinner-axp-209.c
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

-- 
2.30.2


