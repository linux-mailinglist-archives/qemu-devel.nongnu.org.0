Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D946419FD
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 00:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnS-0000A8-0N; Sat, 03 Dec 2022 18:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnQ-00009e-Ly; Sat, 03 Dec 2022 18:19:48 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnC-0001ZP-Gq; Sat, 03 Dec 2022 18:19:48 -0500
Received: by mail-lf1-x134.google.com with SMTP id b3so12939579lfv.2;
 Sat, 03 Dec 2022 15:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ua3HtEc/TdfM1Wt5fqcGOrhTM0H6ueiZCckFhuAwBNM=;
 b=ejimAuMEcveu15JUDkXW25QmMu+ZddfAz2EoaV6cBR/lZhL67K3UaVLdeOn72Xpbdo
 fVsw2lY0bCR3qzQWlDIvgZJBef148QCumc/8xlOuiOwgSPyVQzqwYYjJOPQP3OBz76ij
 u4BewCX41M0CteSkzUHAlneETfaKYMdyCe4vr309TjRE00OvnFqqeBd5zKjQEgFcWWYk
 4xVeq1GKY4ldezKUbNAciAlKh9+9jSRVqXpF44Q8EGteGEHlLfhTMUp+s/NGQX70yDh9
 lZz5p1je/O7y/hcLZAKD4itE2JppySNyCNrARpMD68A16Csa6Hq3edM6lvbWmni0fYs/
 PZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ua3HtEc/TdfM1Wt5fqcGOrhTM0H6ueiZCckFhuAwBNM=;
 b=kjmsSAxdNzyDv14xHneHSvIQNzC5nnNwvni4KBI6iylUWHgQLlXO5M1QvMfYS+WRnD
 Meh/JF8LBhftpjn9q13m4YUgVfuMzlZ4tbWhXm/KsCxyKT34H/pD4DTpmmvqGjYHbhVM
 vvEc5PYod/O8t4uCfcAs+6H9LQGn49xhWn5v60ZK1SaEi/s8KotNe0v2w6I/U4vKvrTT
 lTNV1ry3cxCPI52QDMuwUyJxAEE8aiYbby8HoODTnG3wRT6B/lrjy+C/FXk7KR+XdJJk
 N4/dgeIK6oXkmlXDwJpy5a2vIZMpWyxQhQXIntWG97l5tfNGq/BuTpXsinNl9FmMwT/2
 RWeQ==
X-Gm-Message-State: ANoB5pnRDg+PvhcnGuos3Pg3EVAigmbu351xgV1SmfpBom/WBIiubQyC
 JSXmzC74VOk6cmxeqOoH8J4=
X-Google-Smtp-Source: AA0mqf49MS34D64nJGz7ThGYjT+141Hc4oTDG7PwXnCp6uq3an+amsjKoOcsBLdCqSwF+bY8WI9Rvw==
X-Received: by 2002:a05:6512:258b:b0:4b5:c8f:2b59 with SMTP id
 bf11-20020a056512258b00b004b50c8f2b59mr12624007lfb.536.1670109571183; 
 Sat, 03 Dec 2022 15:19:31 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:30 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 0/6] Enable Cubieboard A10 boot SPL from SD card 
Date: Sun,  4 Dec 2022 00:18:58 +0100
Message-Id: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Strahinja Jankovic (6):
  hw/misc: Allwinner-A10 Clock Controller Module Emulation
  hw/misc: Allwinner A10 DRAM Controller Emulation
  hw/i2c: Allwinner TWI/I2C Emulation
  hw/misc: Allwinner AXP-209 Emulation
  hw/arm: Add AXP-209 to Cubieboard
  hw/arm: Allwinner A10 enable SPL load from MMC

 hw/arm/Kconfig                        |   5 +
 hw/arm/allwinner-a10.c                |  40 +++
 hw/arm/allwinner-h3.c                 |  11 +-
 hw/arm/cubieboard.c                   |  11 +
 hw/i2c/Kconfig                        |   4 +
 hw/i2c/allwinner-i2c.c                | 417 ++++++++++++++++++++++++++
 hw/i2c/meson.build                    |   1 +
 hw/misc/Kconfig                       |  10 +
 hw/misc/allwinner-a10-ccm.c           | 224 ++++++++++++++
 hw/misc/allwinner-a10-dramc.c         | 179 +++++++++++
 hw/misc/allwinner-axp-209.c           | 263 ++++++++++++++++
 hw/misc/meson.build                   |   3 +
 include/hw/arm/allwinner-a10.h        |  27 ++
 include/hw/arm/allwinner-h3.h         |   3 +
 include/hw/i2c/allwinner-i2c.h        | 112 +++++++
 include/hw/misc/allwinner-a10-ccm.h   |  67 +++++
 include/hw/misc/allwinner-a10-dramc.h |  68 +++++
 17 files changed, 1444 insertions(+), 1 deletion(-)
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/allwinner-axp-209.c
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

-- 
2.30.2


