Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C649599D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 06:55:21 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAmtM-0005Z0-1t
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 00:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmok-0003wQ-W3
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:50:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmoj-0002y2-2k
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744231; x=1674280231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2fiKB7AiovahqdgGWdgGUtQNgpKwORZqUtPOp2735So=;
 b=rAOeLD8sVZQ/p/f+3ZlW4nytkt24lK0JuypWtVCB4UkX15a09cEUG9jT
 o3aTQnk+mvMrHd6bqJ0LQNjveyzMmEVQDW0jH6w2dlUKrt7W7mccUvETt
 pOzpFo1UzweCcOuumyvEhw29ih92pkbpL0oLT0/5ouVjSvf5RNCrcKIIL
 d83PHISbPH82g7kb3vutV0YO2fdiMIiLqx5r/Xn9UA0l2vF1JLpp1yFRD
 Wn8c1ZzSA1dtrLbEwTve0WpeQiGa7SxobIRdCn0DE3M/NVHOyd+ZmPauq
 zgSBwcrU4GFLCsDlc4OM4lJehDlwCuCSlx0k4zY8b4i1qpQn2cPUkRXqs g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="191016259"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:50:23 +0800
IronPort-SDR: Bynalq/5yZHIjThiatV2E/iHm5vaLXlaP8nZTA0q1BToaWLDPPGiTpglVbv8DmGbP/rFj6D7Tw
 956KJ6+0Hih6NECRyY8w38Fjg6jGS8ZjWTKMTGXN0yC9/Haf+74iVSOBz+7ZvDT6F1hEvYn+Pz
 rN/Ls6WIS8lE7JIhv4gG3mPRnUV9pMFzjZ7UXGGR1LGtresYt958acxDQNrUGs0bWGQCNQemJ+
 yRHqF9Jx2RTguYwL0HJI/z393MopiOEdZMVTOiDt/1WtHEnUD2xbJSbv+aGmfAYhz841kIWiqp
 vAWt5dYvEZTfHdE3KpDF+7Up
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:22:36 -0800
IronPort-SDR: R+dpVIQv300MLl3xa6ORobQQPmhEbaNmXEOYXa/dHXrPYCeFYPzIY6Q6qvoibA21QJhR2j8crS
 z70ufusfu2hlaAvCrZPf7BTUjhT/qPQqKp+T174ZoieZ+0NDB542811cV/PgYYg7OCHJhYFmKa
 +WyNobsw960XzE7ppDB5F728wSRItiGzISGpr+j8ocHWlbe0GxTks8iX6Q/piye0cZzksSS4hY
 d4Vc2k2qC2z+giYXxMEsUQt7T644BpL1SrRhukCBRJ0ZTMbPlXhNmKQndunUNbLDWfiLGf1ezz
 LTs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:50:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7l3727dz1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:50:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1642744222;
 x=1645336223; bh=2fiKB7AiovahqdgGWdgGUtQNgpKwORZqUtPOp2735So=; b=
 H3T2A3piOLvD2HrOjHUWbQ2wqv4HZdVvZSx54TE5t47mPB3lwVGN6bFDpyLRTR5r
 ptIlYkZzVZ3RF3RPJ1c82jHu3TnwZw+sz7P+JZeLaU8wBggkccPdhRHYLz2bEjWW
 XGj0VJFB9E36AiXcHDP4jMNUZ3GXFZ+K31lqLQ4dlmcqzaZKfiKC/RWLOoXdSeTF
 3AVDszSOOVl3es2ftzy0sTVolBzFNAg5t27hd1z6pD6Jvyg2Et3nzmdWAwYu2TjS
 3wcFmy0mfaoXfc8vQSMFoYxaOZ2R81AvLO8P3E8S4ZLlXeFEitv78SUc0vTzJA+n
 ke0QuDTeViuFYzQwTKNevA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jxi1kSiEgupH for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:50:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7ky5kv4z1RvlN;
 Thu, 20 Jan 2022 21:50:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v1] include: hw: remove ibex_plic.h
Date: Fri, 21 Jan 2022 15:50:05 +1000
Message-Id: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch removes the left-over/unused `ibex_plic.h` file. Previously
used by opentitan, which now follows the RISC-V standard and uses the
SiFivePlicState.

Fixes: 434e7e021 ("hw/intc: Remove the Ibex PLIC")
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/intc/ibex_plic.h | 67 -------------------------------------
 1 file changed, 67 deletions(-)
 delete mode 100644 include/hw/intc/ibex_plic.h

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
deleted file mode 100644
index d596436e06..0000000000
--- a/include/hw/intc/ibex_plic.h
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * QEMU RISC-V lowRISC Ibex PLIC
- *
- * Copyright (c) 2020 Western Digital
- *
- * This program is free software; you can redistribute it and/or modify =
it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOU=
T
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
- * more details.
- *
- * You should have received a copy of the GNU General Public License alo=
ng with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HW_IBEX_PLIC_H
-#define HW_IBEX_PLIC_H
-
-#include "hw/sysbus.h"
-#include "qom/object.h"
-
-#define TYPE_IBEX_PLIC "ibex-plic"
-OBJECT_DECLARE_SIMPLE_TYPE(IbexPlicState, IBEX_PLIC)
-
-struct IbexPlicState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-
-    /*< public >*/
-    MemoryRegion mmio;
-
-    uint32_t *pending;
-    uint32_t *hidden_pending;
-    uint32_t *claimed;
-    uint32_t *source;
-    uint32_t *priority;
-    uint32_t *enable;
-    uint32_t threshold;
-    uint32_t claim;
-
-    /* config */
-    uint32_t num_cpus;
-    uint32_t num_sources;
-
-    uint32_t pending_base;
-    uint32_t pending_num;
-
-    uint32_t source_base;
-    uint32_t source_num;
-
-    uint32_t priority_base;
-    uint32_t priority_num;
-
-    uint32_t enable_base;
-    uint32_t enable_num;
-
-    uint32_t threshold_base;
-
-    uint32_t claim_base;
-
-    qemu_irq *external_irqs;
-};
-
-#endif /* HW_IBEX_PLIC_H */
--=20
2.34.1


