Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FE65679B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 07:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA3lZ-0006H0-Nt; Tue, 27 Dec 2022 01:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pA3lV-0006Eq-Ah
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:48:45 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pA3lS-0006gd-Pd
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:48:44 -0500
X-QQ-mid: bizesmtp64t1672123712tsoluzod
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:31 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: Q77qMjlDMfx7NxZDFWmG2gpDswcxSGNPuuNiee+Tywi9Jwd2kVLV77bOIj8uT
 6FpIFCJH1BBMBF199PSCnfmgxyDXp/7NcWNFk8wAr6luIYfVl3BkOvdb2WD7gZlBgsvzxVM
 2aLbGz2RRU4sRyBtgydifsiOk5jjLLMA1K85fnXXVHfEArlwRiHwmFQbGzfm/hUYc1lQ1fC
 xJ2rLc335k1PWSF0FEq7leANOpGmOaHR6uhlXSXwVy6LjuBzxqoRnmpxCVU4pHT1D2oRLFP
 HRC2Sjahoef+TYsPoO6WlnCfd73mTvWd1CIi2tLyS4TwQthnqfdyZ8cRsJKuLEPSSIg6sTE
 gLhv8xdN4m3Ze0j+4UabQIgDMZrvlDZJp2tOJc3kajFXWiZdLU=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 06/12] hw/char: riscv_htif: Remove forward declarations for
 non-existent variables
Date: Tue, 27 Dec 2022 14:48:06 +0800
Message-Id: <20221227064812.1903326-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227064812.1903326-1-bmeng@tinylab.org>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There are forward declarations for 'vmstate_htif' and 'htif_io_ops'
in riscv_htif.h however there are no definitions in the C codes.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/char/riscv_htif.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 55cc352331..9e8ebbe017 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -40,9 +40,6 @@ typedef struct HTIFState {
     uint64_t pending_read;
 } HTIFState;
 
-extern const VMStateDescription vmstate_htif;
-extern const MemoryRegionOps htif_io_ops;
-
 /* HTIF symbol callback */
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
-- 
2.34.1


