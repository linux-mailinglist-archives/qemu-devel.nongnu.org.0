Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901D3C9983
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:18:40 +0200 (CEST)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vdm-0007VB-Rj
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc0-0005N8-QH
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:48 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vby-0003VO-2N
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333406; x=1657869406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7l28ZzBUUbFHFa9PqsazIA76P+TXl8IpMYJZ1WWuX5w=;
 b=Caa88XWx+QKKmqMZadVGKPNcXrIjiWxv6tD25G4Wh64PzjzO4f0rbwhD
 Q8eElQR//h1r6UmvM/rncyqoi03wvSzyvOhSS/b26qrn9JJsGG9GVdtSX
 34AKAfb8zADPIehck4FXSDtdMeWu72/NC4+lbxBNnnI2RvfchGViZjnCf
 2IcZO8S75cxd7hgIfnIjI1eTt2B7xR5nGZ1k4pW0VUP5QCaVULZR8H7kY
 SFsdOukH/Bnu7Hf+8CarxVzP/DrK/liqPhjQIDMD54SrGyVWzhXhrW3VB
 rKGQtpaPVWLOlN0511Z5hRkZV1jnWmHkaILFJ1xUD0AtVEvMHA8uDW3as g==;
IronPort-SDR: Tz0L8ZCdnhDPyoqNPP3Qfz3XVhB7Q1MJ0JY+Iu487Ocj2GuftT8nmGFW33Kn5tI27K42CzZgt0
 Qcgq/WwNwK1u1D+xSJrufNdOHnyoLz8ON0ko2qKqlVmgq9MWfPfXKeRH89kIoWpa3cW5ul0zdO
 SLmr6zvtSe98rMmD9SRUdiAitupGZeRxzr95k7gmLNOuQhyCJQ9fct+yWu9NWfrLtw7ImwPRmB
 ZI5t0mrvTakhwoc++vtgRjwCBzrNWAq6CuIxLQlkbwquZmwulE+NCbccwuCB87WXij9LKTn28S
 H0M=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212299"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: FSzGi9VmfruzfUFx2mHlLuc4vHdefdWzftm4YDxAt54/AIRk6QhH5qnpR4o4iwzEeWJm4lES/P
 ea0AmCFdHlyyNePLNeeMSpQU3LawnFgecPxhXONXRYPe97rN4NaAQqT3N3b+GKALVWotH/4e8w
 3dDkL400sLCtoax5n341P+7GGPRL4e+EjJ5Ttka2nvXf0Nlo9M3uk8beXHAAE176IBGu7ogyAq
 geKEYntGilDOIpaT2ETJEJrW6dhJ5lphq7Ijn6cAppf/IvLcILHbqkd3QDvhqqj/xy94PQw1Sj
 HNB6wWpzpVn/8NYra7cgs2Cu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:44 -0700
IronPort-SDR: axDC9i6kqxqeSynKmQTi8uOoo59n+kWUQ16Wp+NQSXxnZGVBoo3yr5npGYa+RpoZsR7CrLCsvu
 muljrFE5Je4GhH6/TW5Q7ydX8bmUl2dM0JqxjU7LW7t93BuHgM1aXmxkwc5MNTE+8yIDByMD+Y
 vohkQ6hdp67jf1Iwm+WEVk455YcRnYl4WqcIMD0a+1PLgttbad82u9+lYnbZ87DM8/Tpzrbd23
 jXnreePdTqY2Y/M5o/ZnDXa0xLCVi8WhivHeIWw5+Ges1Nss1XmH01Qzwev/ijQgcE3lQbardV
 d7w=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 01/12] target/riscv: pmp: Fix some typos
Date: Thu, 15 Jul 2021 00:16:29 -0700
Message-Id: <20210715071640.232070-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

%s/CSP/CSR
%s/thie/the

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210627115716.3552-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 82ed020b10..54abf42583 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -456,7 +456,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 }
 
 /*
- * Handle a write to a pmpcfg CSP
+ * Handle a write to a pmpcfg CSR
  */
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     target_ulong val)
@@ -483,7 +483,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 
 
 /*
- * Handle a read from a pmpcfg CSP
+ * Handle a read from a pmpcfg CSR
  */
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 {
@@ -502,7 +502,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 
 
 /*
- * Handle a write to a pmpaddr CSP
+ * Handle a write to a pmpaddr CSR
  */
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
@@ -540,7 +540,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
 
 
 /*
- * Handle a read from a pmpaddr CSP
+ * Handle a read from a pmpaddr CSR
  */
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
 {
@@ -593,7 +593,7 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
 
 /*
  * Calculate the TLB size if the start address or the end address of
- * PMP entry is presented in thie TLB page.
+ * PMP entry is presented in the TLB page.
  */
 static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
                                      target_ulong tlb_sa, target_ulong tlb_ea)
-- 
2.31.1


