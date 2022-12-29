Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E84658AE7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp45-0008CG-LE; Thu, 29 Dec 2022 04:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp40-0008BA-K8
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:00 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp3x-0006kx-OL
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:18:59 -0500
X-QQ-mid: bizesmtp73t1672305516ti0g3fof
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:35 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: xnbq7qFd8voZaquLhYjM5fcHSpZBC9sfwQUM9gZiW0UqUIAzU2SNGWi2IB669
 DZ20ec2T5KSaDnzWUxe54IBdFSnFv/wH04kq6DuMmJVCmh403t3WJ5ht8fOyUNHF6JSghHv
 Uc9xUhyDtKV4WC4W3jXdkx+eIq8a3S8G/812cILPNogXfKijDPKYw4xP32HlZBjeWmBeUHm
 /4+w2lFR/+/AB8QxgkuHuX5QDtJdUJ4OX7YU9wbzr9vLaH5SC2PV+tXwSxLYsoWOlZrzMxX
 D3eNlWH29HEGOhIu2xTQBMWHHUxvCHIfFUOh7ZvtdvU43HXbZP5MhR+JmVHUHk35wAPh1hB
 0yYQUC1X2glkMasoBCf34BRM2XZQiMixFqxLV7s
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 02/12] hw/char: riscv_htif: Drop {to,
 from}host_size in HTIFState
Date: Thu, 29 Dec 2022 17:18:18 +0800
Message-Id: <20221229091828.1945072-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
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

These are not used anywhere. Drop them.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/char/riscv_htif.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index f888ac1b30..3eccc1914f 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -33,8 +33,6 @@ typedef struct HTIFState {
 
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
-    uint64_t tohost_size;
-    uint64_t fromhost_size;
     MemoryRegion mmio;
     MemoryRegion *address_space;
     MemoryRegion *main_mem;
-- 
2.34.1


