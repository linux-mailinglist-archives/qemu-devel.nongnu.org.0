Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E932A422
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:36:24 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH74R-0002om-4A
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH73J-0002IY-U8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:35:13 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH73I-0001QN-3F
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:35:13 -0500
Received: by mail-pg1-x535.google.com with SMTP id o10so14050964pgg.4
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OaSHWE5WnYiHJD8Yqu01jM70tH1uOX52Z4XjcgzF5U=;
 b=QjlF1UOJEKDDOQlQbPbXbfoSYWjhWQbF7qfuosidXNz9ShIVH8Z3BYNqrj8M0N+dhR
 I3yyXVtIrqivP+Bi9H0yTcevzZXZO5OfNHYs0qq63UDochIfXjhZ69fIYFZYIX8MHmLQ
 19oIon+UHqh6G7MrcD64reIcjmBk1L6UlTluWhm9LPYxcfqSkW78dpLEW6doA04kBDCf
 58KUhR68rWbNcfziMdFl2uG9Wc8qYFG0cyEe5i49dcmUCVRRSVWZu+xJH8AhlyF+gwIo
 jKx9/dgVrrCkLnNLDRtBdGc2aWL3UAHzgcD1xwUYQebP6tslLcThbalzyGBmu/EckvJg
 uvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OaSHWE5WnYiHJD8Yqu01jM70tH1uOX52Z4XjcgzF5U=;
 b=g96vH1pOXRuMZ//Tp1gozFpRW7eDkXGCg52O1rLKx1rXWeXM8hylVjzRWD4oKwPyzK
 BU/bdbZvRyF8+g6CQRYxLlM/Wu4RKLrvKRr86HFCqdyRdhho0NPSFokA5Z2SEErsSRLc
 hSdU8CPyQCQYBjKCsvsHIvwBmCnsUcwCz5gOOSKXDwq5Ah59jjspJHGjcKmK4O6VzFQC
 ZWzCmBmlxt6g3orsss29gjiY+FePvSTkn38QJkRU8duFzSPyp1Pe4AJGeKzcZzRdugG3
 GyLDbzen3sCHgL0FXM0orAKnXKRk2aQhBjS9aZ6X+BqJrjBpD6S8JnpUDUfAMPCW/Xro
 Wwgg==
X-Gm-Message-State: AOAM531aL6PumPnQru12IjwSRv2vVMUGTSjbIotSZ/PxhEF74xO3hbD+
 E2Lh1AFEVf4gf4PcF05rLKE=
X-Google-Smtp-Source: ABdhPJxPJlhaXALsK5q1LD8ovcwge2jogPsE7F6i1eZuiTjZNhAcs1tlzfpOD7uQP4RIYGxbrDAoNA==
X-Received: by 2002:a63:c80c:: with SMTP id z12mr10646418pgg.376.1614699310497; 
 Tue, 02 Mar 2021 07:35:10 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id mm12sm3541139pjb.49.2021.03.02.07.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:35:10 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de
Subject: [PATCH 00/20] ppc: qemu: Add eTSEC support
Date: Tue,  2 Mar 2021 23:34:31 +0800
Message-Id: <20210302153451.19440-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Stefan Roese <sr@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Joel Stanley <joel@jms.id.au>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Dario Binacchi <dariobin@libero.it>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Andre Przywara <andre.przywara@arm.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexander Graf <agraf@csgraf.de>,
 Dan Murphy <dmurphy@ti.com>,
 Florin Chiculita <florinlaurentiu.chiculita@nxp.com>,
 Abbie Chang <abbie.chang@cortina-access.com>, Bin Meng <bmeng.cn@gmail.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU ppce500 machine can dynamically instantiate an eTSEC device
if "-device eTSEC" is given to QEMU.

This series updates the fixed-link ethernet PHY driver as well as
the Freescale eTSEC driver to support the QEMU ppce500 board.

Based-on:
http://patchwork.ozlabs.org/project/uboot/list/?series=230985

This series is avaiable at u-boot-x86/eTSEC for testing.


Bin Meng (20):
  net: phy: xilinx: Remove non-DM prototype of phy_connect_gmii2rgmii()
  net: phy: xilinx: Convert to use APIs which support live DT
  net: phy: fixed: Remove non-DM prototype of phy_connect_fixed()
  net: phy: fixed: Convert to use APIs which support live DT
  dt-bindings: net: Add the old DT bindings for "fixed-link"
  of: extra: Introduce ofnode_phy_is_fixed_link() API
  test: dm: Add a case to test ofnode_phy_is_fixed_link()
  dm: mdio: Use ofnode_phy_is_fixed_link() API
  net: tsec: Use ofnode_phy_is_fixed_link() API
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

 arch/sandbox/dts/test.dts                     | 11 ++++
 board/emulation/qemu-ppce500/Kconfig          |  6 +++
 board/emulation/qemu-ppce500/qemu-ppce500.c   | 18 +++++++
 configs/qemu-ppce500_defconfig                |  4 ++
 doc/board/emulation/qemu-ppce500.rst          |  5 ++
 doc/device-tree-bindings/net/fixed-link.txt   | 47 ++++++++++++-----
 doc/device-tree-bindings/net/fsl-tsec-phy.txt | 15 +++++-
 drivers/core/of_extra.c                       | 26 ++++++++++
 drivers/core/simple-bus.c                     | 15 ++++--
 drivers/net/phy/Kconfig                       |  1 +
 drivers/net/phy/fixed.c                       | 37 ++++++++++---
 drivers/net/phy/phy.c                         | 52 ++++++-------------
 drivers/net/tsec.c                            | 30 +++++++++--
 include/dm/of_extra.h                         | 18 +++++++
 include/dm/simple_bus.h                       |  6 +--
 net/mdio-uclass.c                             |  3 +-
 test/dm/Makefile                              |  1 +
 test/dm/of_extra.c                            | 18 +++++++
 test/dm/simple-bus.c                          | 33 ++++++++++++
 19 files changed, 276 insertions(+), 70 deletions(-)
 create mode 100644 test/dm/simple-bus.c

-- 
2.25.1


