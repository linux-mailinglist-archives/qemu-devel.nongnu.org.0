Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C9338EF6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:38:59 +0100 (CET)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKi0I-0007nu-Hl
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKhxm-00062l-RY; Fri, 12 Mar 2021 08:36:22 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKhxg-0001DB-97; Fri, 12 Mar 2021 08:36:22 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso10756352pjd.3; 
 Fri, 12 Mar 2021 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebj1iFDzS/MqQmshyHo6xeJRG0qxKcfMW3Emdg5fiBc=;
 b=khh8v159N6MHdvoN35rxZgKxEgFJ0jVdVCdP3Yaoe5n/5iNQZD3N+6YSAxlQXbNHY4
 gxMOfdnD3atFX0PuYVJuZAc2ZAUBwIZWIeUdxozjCjRvC2SI6p2vjZtXCEqKIt4pZmCp
 NRN9MkqEB5nLbUfuoNB0oFVwRjQ/TtvYnt/nFQL2H7cao4Qi4+reMB+3GHBzGMs/vlwq
 57CDNaa7MYjkRpjKtaeQ1zql2PEhW+qJz4acORXaK4w6cqhKKZSS1MZOnWecfyA+pfds
 wfStbHxhotYJ/qS2osW+UzifcDRA1nh174UVMoW8l+oH2I5TIippmWl3K1RIimyVR7T0
 5g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebj1iFDzS/MqQmshyHo6xeJRG0qxKcfMW3Emdg5fiBc=;
 b=H/5+gC7BdnWnn66qJwhdd7RfjDgyGqn/7dbzGSqPjH8dea5dqhp6oY7ccAsfVmLLjQ
 S3ELZtgZFUgxT+HBP7peytZsTuMXH8zGuou9AJJWiAHt9+S5ZFsmg6mW2vGBU1TwSbAU
 anhnaxEt2Qzz0Zn9u+VS5+hVry+l85bc09c5VzKufjR2z1+WPsTCszZT3fP+cc+gwaHz
 KTIQZnv+CRMjoX63G3aaVHIFLqI779n5RcrJa0y/PYnQC3U+PT9I6hyaMFqVpFV+9y3R
 l7iKnikA2VDb3p7IDwscBUvt24a8QYpTHmdwdzVRE2JMMPXVO7Z5QnkgOPWOxlb75K3z
 92DQ==
X-Gm-Message-State: AOAM5318md5bYjA2ty5IO3D2SVcDTBUuOVSuJ5tP83nK3o+Kzs1DaPQm
 RvgXz43ZT2y+/o3177Oe9ck=
X-Google-Smtp-Source: ABdhPJyCcWEu4OLngyuYE1bNu1bWflTrJGJD9QY8wEeJ6+Jx0jchNB5ZOX5MCOYG7H1FozECXAS+1g==
X-Received: by 2002:a17:902:ba8d:b029:e6:3a3c:2f67 with SMTP id
 k13-20020a170902ba8db02900e63a3c2f67mr13284491pls.10.1615556173911; 
 Fri, 12 Mar 2021 05:36:13 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g21sm2297962pjl.28.2021.03.12.05.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:36:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Priyanka Jain <priyanka.jain@nxp.com>, Ramon Fried <rfried.dev@gmail.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de
Subject: [PATCH v2 00/21] ppc: qemu: Add eTSEC support
Date: Fri, 12 Mar 2021 21:35:41 +0800
Message-Id: <20210312133602.31105-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Tom Rini <trini@konsulko.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU ppce500 machine can dynamically instantiate an eTSEC device
if "-device eTSEC" is given to QEMU.

This series updates the fixed-link ethernet PHY driver as well as
the Freescale eTSEC driver to support the QEMU ppce500 board.

3 patches related to fixed phy in v1 are dropped in v2 as the changes
were done by Vladimir's fixed phy & Sandbox DSA series [1]. Vladimir's
series is now included in v2, and updated as needed.

This cover letter is cc'ed to QEMU mailing list for a heads-up.
A future patch will be sent to QEMU mailing list to bring its in-tree
U-Boot source codes up-to-date.

This series is avaiable at u-boot-x86/eTSEC for testing.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20210216224804.3355044-2-olteanv@gmail.com/

Changes in v2:
- move device tree parsing from xilinxgmiitorgmii_probe() to
  xilinxgmiitorgmii_config() and use OF APIs
- new patch: split from <20210216224804.3355044-4-olteanv@gmail.com>
- include <asm/global_data.h>
- use a Kconfig option CONFIG_SIMPLE_BUS_CORRECT_RANGE to control the
  new behavior for boards that want this
- default y if SANDBOX for CONFIG_SIMPLE_BUS_CORRECT_RANGE
- turn on CONFIG_SIMPLE_BUS_CORRECT_RANGE in qemu-ppce500_defconfig

Bin Meng (17):
  dt-bindings: net: Add the old DT bindings for "fixed-link"
  of: extra: Introduce ofnode_phy_is_fixed_link() API
  test: dm: Add a case to test ofnode_phy_is_fixed_link()
  dm: mdio: Use ofnode_phy_is_fixed_link() API
  net: phy: xilinx: Be compatible with live OF tree
  net: phy: xilinx: Drop #ifdef CONFIG_DM_ETH around
    phy_connect_gmii2rgmii()
  net: phy: Simplify the logic of phy_connect_fixed()
  net: phy: fixed: Make driver ops static
  net: phy: fixed: Add the missing ending newline
  net: phy: fixed: Support the old DT binding
  dt-bindings: net: Update Freescale TSEC to support "queue-group"
  net: tsec: Support <reg> property from the subnode "queue-group"
  dm: core: Correctly read <ranges> of simple-bus
  test: dm: Add a test case for simple-bus <ranges>
  ppc: qemu: Create a virtual memory mapping of the platform bus
  ppc: qemu: Enable eTSEC support
  doc: board: qemu-ppce500: Document eTSEC usage

Claudiu Manoil (1):
  sandbox: Add a DSA sandbox driver and unit test

Vladimir Oltean (3):
  net: phy: fixed: Be compatible with live OF tree
  net: phy: fixed: Drop #ifdef CONFIG_DM_ETH around phy_connect_fixed
  net: tsec: Use dm_eth_phy_connect() directly for the DM case

 arch/Kconfig                                  |   2 +
 arch/sandbox/dts/test.dts                     |  59 ++++++
 board/emulation/qemu-ppce500/Kconfig          |   6 +
 board/emulation/qemu-ppce500/qemu-ppce500.c   |  18 ++
 configs/qemu-ppce500_defconfig                |   5 +
 doc/board/emulation/qemu-ppce500.rst          |   5 +
 doc/device-tree-bindings/net/fixed-link.txt   |  47 +++--
 doc/device-tree-bindings/net/fsl-tsec-phy.txt |  15 +-
 drivers/core/Kconfig                          |  14 ++
 drivers/core/of_extra.c                       |  26 +++
 drivers/core/simple-bus.c                     |  32 +++-
 drivers/net/Kconfig                           |   9 +
 drivers/net/Makefile                          |   1 +
 drivers/net/dsa_sandbox.c                     | 179 ++++++++++++++++++
 drivers/net/phy/Kconfig                       |   1 +
 drivers/net/phy/fixed.c                       |  54 ++++--
 drivers/net/phy/phy.c                         |  63 +++---
 drivers/net/phy/xilinx_gmii2rgmii.c           |  61 +++---
 drivers/net/tsec.c                            |  32 +++-
 include/configs/sandbox.h                     |   2 +
 include/dm/of_extra.h                         |  18 ++
 include/dm/simple_bus.h                       |   6 +-
 net/mdio-uclass.c                             |   7 +-
 test/dm/Makefile                              |   2 +
 test/dm/dsa.c                                 |  82 ++++++++
 test/dm/eth.c                                 |  10 +-
 test/dm/of_extra.c                            |  18 ++
 test/dm/simple-bus.c                          |  33 ++++
 28 files changed, 687 insertions(+), 120 deletions(-)
 create mode 100644 drivers/net/dsa_sandbox.c
 create mode 100644 test/dm/dsa.c
 create mode 100644 test/dm/simple-bus.c

-- 
2.25.1


