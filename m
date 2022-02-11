Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E544B31A7
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:06:43 +0100 (CET)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfw2-0007RJ-Hw
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:06:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqe-0004jr-Uz
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:09 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:52992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqZ-00008v-Ex
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624063; x=1676160063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVcJ3H0xI37hYmEcH9RcIT3zwvBrl8Sr1npO+d72CAE=;
 b=IQqx/1TqxK4QPvy7QdfBZSK/sBvhPy8ZMF9twU75VZKjPGVfHmXRrsAt
 S6MR7Yy/jsDoo0qgsChMpeXOwkvu5I3vl4b9exaDWeHSywv/F1DFG40qH
 Ekxfn1wHOhHLwKkcUFVvXOW5Ov0CPE5jAuTKvE5dnf6DdAZ87u1vDURQ4
 UR3brTHYHy9z6ScouLA3hOSjwOrAGNqArF6ptCTldCnEIe4DapY3wHxXr
 BmJTLBJZ4zL11Tr2baeOOv8UKuHSpwpetgykBKo+ZVh7Wqxs/XIwgf/TV
 fJ5r1PivpYFKvcRbnvsPcJusa9VHwoWCP/M6+4qTDrObbAJG7bDmRZu+d A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636171"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:01 +0800
IronPort-SDR: Mgn8nzYGz7ADHUO4hp5MPeOpH6Lp4+qxdj6Nnvbdwhm6JKfgvJ0UfNjaTiaKMS2oT3Uw/qmp/d
 HjZeMxswe2SzFy9BiNvk7pDZNijVTyTue1+qaLwpPMce8cDXucHcCSGaSfjchlnmW5dQAC080u
 1Xq4HmhxpZ/m/F9Kjr65BgZu+0E3KkPemCTkQHHGYu/RafvvMrvOQoEuzlfETT7TnKHQWzPMHl
 X2/1lzhXUbmtaiopfG8c14RMw3+2JL+4M8qoYYOq12mmibY+ZbI8DXrHL5BkG5i9LaWOcCWckO
 UHgrLrdhuUYN5gtqNxXNnhPY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:55 -0800
IronPort-SDR: /WTYc2/lkq3a384QkOeEVPZpHaA5nkWV3CvR/M2KENjWI747RZ2gewP4uhPJF0gn+M/5cxoKh7
 VNlr4AqhIHXQxmhULu2mDKZ1ckAQ2VzqpIu3e4Bm1bB3vcRf8ruLqXsVcrDZT3zmWBXh6ksB/o
 WizIhyt/xTU7ec1w+as0ItLynJU+hIb2CIjxecAwusJ5/6sHC06lGD+Z6rrlXxccIaZHzEFRM0
 6lD2NIritZn2TAOY9G42IFhIhM/7k1ZFI/zFIwvrGfLQaSQ+fGlCqd9cKSWA33P3rkIfIIbBwo
 aP8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVxn2WvLz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644624060; x=1647216061; bh=BVcJ3H0
 xI37hYmEcH9RcIT3zwvBrl8Sr1npO+d72CAE=; b=MkcltkOoHF0sH5edrVPFI3f
 TV7MsBzYXVu8YqHdIKpKr3kf9uollNefF+JB3JO8u0+YyedbsaFS68foVEvmdSUI
 lZ61a+1nzizRMKYm27HwtVSsKSYE8VHwKetiH9W9EhTXqbcdWymKgg50dTVGzmeS
 yPDUWxeUYzz13zuRsAD+Ow18ODlVCVbaO8sNZLhTG648QrAi2WC6FCqUgDt0A2C6
 hc+97i8yHED4Q3eLU0KfvODTflW8lQOoAe+lS4XNxRETF+3jSb0R/OzcdrCbYQ5g
 QFFCX3lNkWATXpbQx5tN+1a9U57LmkkkWLMB8jsToOMcJX/uGMSmGGttRPAjjqQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KGYGlYflY6Jq for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:00 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVxh6lPKz1Rwrw;
 Fri, 11 Feb 2022 16:00:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/40] include: hw: remove ibex_plic.h
Date: Sat, 12 Feb 2022 09:59:52 +1000
Message-Id: <20220212000031.3946524-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20220121055005.3159846-1-alistair.francis@opensource.wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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


