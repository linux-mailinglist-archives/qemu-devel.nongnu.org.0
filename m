Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9494B8174
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:24:06 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEfT-00019t-DQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDog-0004HC-PR
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:31 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDoe-0006Gk-Ae
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992967; x=1676528967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVcJ3H0xI37hYmEcH9RcIT3zwvBrl8Sr1npO+d72CAE=;
 b=jqF0rF9R9OotKeyFDV4wSCmHVHHdmmaHirVHu1KPo3/evwokvvGt7dR5
 JcHDAP8nORNnNO+dwiMgx0Wo1vSBZ475yK68oJ6xzMROqMfpQkW0radVH
 XAaLZZbTDTeUwS5UCFNghYIipDuyFcBrxZojFXBnAAFSibu48UheV0iZJ
 fo1DfMoZhdd8WoLtT1FgwdRuSNhd7Gi0ISVbs4IWgxeg4wsYSIbTAv73X
 7dPjBZnUsPkYomS5F2b5Yu/2IXrbWPBw8rwx0oz+FUFiuLmqe9zZR6NJh
 1w8j7jOEdez8C+PhhnoJXXaIeWbgHKaQdDbw/aF7srmik5D39a035thuT A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072666"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:26 +0800
IronPort-SDR: m5a3lgMIiT8JWauGJohMjhuAkJ7QIF2dpRNuTg5MQCZmKAlDxIsbrg5fdd/hY2Bzkzd2iV3/hX
 CJI8TCoUwK2yK0a0KsG3ywra6No8KWqRv/WsYdB/9xwOEWu0ISkfQYFtH418EbgWK9tTyQfjl/
 3/btvhkTtVg0VEfikv3k4RWN1g81Fe91gdaSW6WODxuJ1griqW2KIXPhZ3jil2QHlVCx4bEJSI
 G4h6p8S42rP9D71bGCcx+/HLyytvQS9PfAZ8KgR0YXOacuN+BneElHNeN6mbxQVuXyE0tQf391
 VxjcbnwaGKwT6wVrS4RElvvi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:15 -0800
IronPort-SDR: KBbNWQudvLwjD9AXTnvyuQbesAwzqNCRo/WU/skyDPHe1TGev/hf5mGFjsCkD7NEz9uKCUZ1wF
 n0Ni9BYuvzPKut3cGHqagyz3E71Bbrqv4Yoj5n4VXT8TZph9iKRBilJ+zIH5wADEj+Fz35BHgB
 zCryIHwhGPrzYpF9hqjyN+JbSssQERqmn8Ujk9GYU4LfFhAp53Aky7N5KHbsJ8P6InxIEgVSGg
 C9A29+rAcDo6Lxy9cEOtw43Ej0TWLVnauxwZF6flOsKMUez3XzZrQ7UD09tYRB93JH6HHuDtPX
 lgo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7N721kLz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644992966; x=1647584967; bh=BVcJ3H0
 xI37hYmEcH9RcIT3zwvBrl8Sr1npO+d72CAE=; b=Hgi0oYmtiyReLod1l75C3mS
 SfjhDgt1uUAf4R/1E/EODNeMcjlUp3AnSaIsqXZyf7zPsywKeGcQ1Wujwm6tVV0n
 Q2MaZ2ABtlMZGxolWCQX/r+klgXrEIgb5dmeaTobqsFDHF4z5Kt3f5tTXcyy6C2I
 gYYoX+8j0oblpvKSiG1sm9jx8RykzTmxm5670NQOy65oA2TuJ/FgsISkX4f6g0+S
 LAMMUfyROEjBB3HM1ucYsNEVMz3lvg/E6zXP9ylcZ48MopANl2LZ4fESZP+jWZJU
 k0CCYlm2Nz/zQ2oR4rDo5IU9TDNuJgDRsRPu4ZsqBc5kwWLZ2aCGM5B12T2n0BQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wvIKbQNWV7Fm for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:26 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7N30z1wz1Rwrw;
 Tue, 15 Feb 2022 22:29:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 01/35] include: hw: remove ibex_plic.h
Date: Wed, 16 Feb 2022 16:28:38 +1000
Message-Id: <20220216062912.319738-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


