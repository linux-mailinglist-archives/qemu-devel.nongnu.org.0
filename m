Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483E658AD7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp45-0008CU-Vl; Thu, 29 Dec 2022 04:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp41-0008BQ-JX
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:02 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp3z-0006yy-5i
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:01 -0500
X-QQ-mid: bizesmtp73t1672305528tjzkslh9
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:47 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: Q4gfBD3K7t+wBSBHL1sKSt7Wiwtdrh1C2z0vfzHqMb8XoHbOkNgiK+MyMWYmu
 9KKamcnmIa3WaCKsk0w77RpWiwZlmFYOp01OWUlcqBfCp7zyGTHiirmJuhadIARuskzr+ld
 5xYpJORnp2Fes+uh6p3XVoykWqEqd+ZT9ENZBYp2K6n0IQIo/JneZL/KNpiKlqDc2aKaOLM
 rJvQX+nYQ7+Oif6mstHeijETzz7YiG3VLdskT8hTUFbzrLKgDHEg3712Y7cJFzwVOKfShr9
 hOGmJUTX8/LpOBMBuaUkXheW5tiPd1I6mSsWi/hLG6fw3ZRLHvaCnezLrVrS2XDAFPcir4p
 O1IOiXHXt8IxkoDN40BIe/+MNmD9jDlqLECx3j4JsG8u4XjhjA=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 06/12] hw/char: riscv_htif: Remove forward declarations for
 non-existent variables
Date: Thu, 29 Dec 2022 17:18:22 +0800
Message-Id: <20221229091828.1945072-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
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
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


