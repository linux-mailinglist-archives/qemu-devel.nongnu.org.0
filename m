Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9073C6688
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:56:11 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34qP-0007zh-Sz
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oG-00058i-Ss
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:56 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oE-0006rU-MY
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130435; x=1657666435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7l28ZzBUUbFHFa9PqsazIA76P+TXl8IpMYJZ1WWuX5w=;
 b=GZMw+CzOwx6Pyp6zMpxJMTrEgbsRHnsLviEP5z9e5O+Of8ljEk+oGiAi
 EGGiX69zWt3fydaB4tNM+3D6GrO8lnjJYUEKtefqdPfzGLXo/1tVFMeaU
 lM7MAbnf/0vQBus//toOh/SWx7+fTsBTMef/s//dlfXLJse5GQNgvmqyz
 KRFa5yVqCNPqbPr3PVLozgU214A62qCITHlqfOzTqzUANHUSeSNHfYdDO
 uExQLF5n1jzEZ0MgCUd2qKfRF+e+nr3O0EZ5BaiGVLATvMCOHNfDRElHM
 cdh5CqhwPsRfd7UbCnhU9DaLJY08KcsEZj1zHlPIf+J6sXR0r8PnsDHka w==;
IronPort-SDR: SNB2+Rtd6hs8Be4kgsfaYdxtqTrlWoaAOn8DOgM14PEm/xpv/i/KPLJZNx7VnV0hPrcpXusIj6
 tDlTYNoTJdAHoYxS43sAvCMWbmTwY7Vdxbvt4JTQ7mIbxXCOnoeVlstXU8tcmU8Tgg3OIDyMkG
 MgJlSjtD2/lupLs+WMS6MMR27uOgWvuIx1OcfXuRKWQmxmbmE3HeGxOdJaTxtr7X4o/eUeIWK2
 WRa8bZLPB0vYyrszfwhR8fvNZbvrjhjLmOdwsFlJMrkQ7pDnLqjnAkTb9wCAkQCMw+NQZPyzRB
 T34=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973300"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:52 +0800
IronPort-SDR: fMB0ct6KoVoS4/330inCc+06xc1GBbS5rUO/gqxI4DHQMtuyngMPo6DHjBhHHq9pRPX8/WsEWG
 8vtuooWLChproSfu6pxULsG/24hGEJYFGVHzAAXUJ90MgLciTifNUKSPKwkKLyKHSBZ7qGFM1J
 eCStaPC8+Gxvbgx+bj8+Hq/TMjAsqR887WuCbcg/w2TKDCG6Roq0tMLFGUNUE01Z1BjuIB+AlM
 +uyvuGxKaNaV6Nc9EL4ZohwDxS7sSwVXuRKssc1NrcvimTbfloxykwCA3Aas4BEUk5qmPgAsHo
 pqzHnX5AhwLGKekI3PqzlDsd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:57 -0700
IronPort-SDR: ob06jXvuG9HDCHLanckvSZoZd8E7M9d5YuUcAXHHlhtYflKnwq4UFDCrLpQZ0Oltk39rzbNciZ
 s/UgOPS9waPfq/IavwZlITTPE/HKzduoMMvkwO2g+gG/Y22gA9210XXtPtW0r24JBYv/XYdQA1
 MMIZDH1NwZAzkZNPylP7PkseS41MvMcvbRdK1YLNJmb2dfcvb77EaO3vz905vY1GG/ZQRANlYW
 t+tz1sQ8NeY+TQDcJudCKkUoVboRqxzOk7kb07CUsl9Shp4v9z+LFfak+06KU8VXwBosk+VVkR
 Hhc=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/11] target/riscv: pmp: Fix some typos
Date: Mon, 12 Jul 2021 15:53:38 -0700
Message-Id: <20210712225348.213819-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
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


