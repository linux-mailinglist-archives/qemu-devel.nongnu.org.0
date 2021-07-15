Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03D3C9991
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:22:54 +0200 (CEST)
Received: from localhost ([::1]:50328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vht-0000yp-4F
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc6-0005Yp-RE
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:54 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc5-0003VO-0Z
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333413; x=1657869413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qe5NSgZWinSdjj7ZsUlkyN3Gf/d5eMq2C8L+vF+ROQ=;
 b=Tmr5u7QXi+oR4+2GP/wQXoafvwsRKcYbhk7ysdhwSLT7xwTJDAeq5DG1
 9sAsAW2t1KOVmyB/YvLD9tKdcv6gnlJjUeqVi26hTxRGqCEPz4jZYAi8i
 MdyX8jG9z+WH2MAUGB/pIlbStdf8U44dCjkht4mmbmAdBCWnm9CCiIe1j
 gNPXA9jIwgA3rj647EgAbDmldCyEbH+9ISMYD8fdI8h2sC9sHvya430zJ
 Oekt6J1IIxF1MAZkqKoXmtsDxSF6VvrsRrUFLOxwD6PoVN1ll0Y+yjYxD
 orEbI819npR+RKepT26Gat5x428bdPHPOVIlVUxm4HRayETmMk+HXD2ED w==;
IronPort-SDR: 9cDK564MFCrlJaM3GiloRZLd1ufZBxzSgotk8lOHd2862ltUHdd4SIU3YjN8q/wc45lqXXch4a
 3Gzejnn27LxuGj2IyiVnxU8L2RyUw4OdpraKvMDK2zOI0tjSgw583UfFCBekbUKiLAdRejqoXW
 IsknMpP3DLtQXt+6trjLI/sqtdQlwzFi0FY9ZFAFo6iIAgUcwjykCyY4onplYQGbKcxshXLd3I
 +Vb13WjPdMpJOG9mJECvFL2I2ooW12LC3+YqSDhccC80Zw5oNEYVpp9a5Q8KNRDf4c3lzi01yR
 Lk8=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212307"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: 4NXIlqmHpMaX4Nw7GPgNmYy00FaYnnyLVa97xvnDW23XhSvvHwf8QhrvBBnNzAWMz8IXWqROky
 EB/QZpqKeFxLYGXui3G6GuiMHakSzqOq4wI+rn8uNbXw76OjXNF/vevbTBeK/ugd2Ks7Ywr4Y8
 CTitMwAmO2aZ2lyRARBb/dpXg37SKFCi7BTxcuxKoWA/ZWU+1S1McWuJNtaXJgirFnwaMip0oN
 wKxoC3AXPF4o/QlKsQTCwJU38R9V1iILZ/a2qL8fzQWlHZAvic2I8SL7uZ7/Ex4UASr7R1CcNL
 3naJSDiIc6o1Ja5dPTAsjlP8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: vQ7H992MqEdg9dpnF9g+D+9klWOjcfkzRSf/TvDgSzCprdAIaoJrPnU9m6n+ZmTDy5q73XH/W/
 M4r3zO+kFuzJJoc9mrbsrbGv6Wce4qTfTz+1qIPv9HCvaRoGkIKAQ1sd9YhiDIQeQoVKOO4M6f
 cGD5SVJt1Zw2dfMSCL6xjmy8XavEKrlyUwxxc8FIouMRhkkLSkytQeo4+mWRKNok+OYjLSdf/J
 KdqlXw3IxRE/l/duWSF08wC6+7QDuRHUnxuOTq0szsyWQkA9QwWlIaxz8IS2g3I/FW4mBa8uPY
 sD0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 08/12] hw/riscv: sifive_u: Make sure firmware info is 8-byte
 aligned
Date: Thu, 15 Jul 2021 00:16:36 -0700
Message-Id: <20210715071640.232070-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Currently the firmware dynamic info (fw_dyn) is put right after
the reset vector, which is not 8-byte aligned on RV64. OpenSBI
fw_dynamic uses ld to read contents from 'struct fw_dynamic_info',
which expects fw_dyn to be on the 8-byte boundary, otherwise the
misaligned load exception may happen. Fortunately this does not
cause any issue on QEMU, as QEMU does support misaligned load.

RV32 does not have any issue as it is 4-byte aligned already.
Change to make sure it is 8-byte aligned which works for both
RV32 and RV64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210708143319.10441-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e75ca38783..87bbd10b21 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -602,10 +602,10 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     /* reset vector */
-    uint32_t reset_vec[11] = {
+    uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
-        0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
+        0x02c28613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
         0,
         0,
@@ -613,6 +613,7 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
+        0x00000000,
         0x00000000,
                                        /* fw_dyn: */
     };
-- 
2.31.1


