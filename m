Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C82DDE8B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:23:46 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9B3-0008VU-4i
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qT-0006FJ-J1
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:29 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qO-0002GJ-CQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271683; x=1639807683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aG2XFCzEDf2EjnleQgJGld784WbjTcYmNCBnbsK0hhs=;
 b=rISx7mlZjA+JO6Cg8CzEyUovUAyOvzCiqKhPUhSdQM41C/EjqeA8E6BY
 DpM7jwp0iNIhTt4eh9h1QyqhQW1F22VqDU6sK2Q1zfusyerbPB+WVeOR8
 GzaMdNnaCeMmFK5hsXe9EDrqtHm1xxCTdHXgAMn1o1W46rnlHzkbLygiB
 jZI0DE4JzIJOg3xrryO1WyumVPaiSAhuodDTSiiMS9RVvDBU9rhxEFqmZ
 WFc+mDWUT98TMa3hmH9NofsuziNCV0jrM+L0dOShuiCs+XKfK2WkT4M1/
 tVfnLltvqGI8VPfOD5WCIJKi7pw98eiOIQCsILVCX8waD5YRwe6KlPsq0 g==;
IronPort-SDR: Xs9R9O3nZPdHolLdgdrCvaUI+MaDcTpdt6QQFyLp2Nd90Oek7f2REqU6gfq0FUTfWdDpdRiAY1
 MYOEWkAUt+Yi2S9OB9VmSunS757JuxcddtyI1omDHmcYU5V2lmfwYO8DnxbnDS2ssHnjKCktPp
 WH9/fSfAodNzOiZCRhjNEX8j+nkguSFed2JVQcednWK0xuR+QBKS7rl1FFOXN7jcKD1pINcTPT
 NU/1cA1TutP399LyN9CW3hy8eBiaCr/nWRps/ncKEzbnXIUv9O6prkAwBK6/d823L2gBRwh4+I
 BTA=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237068"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:34 +0800
IronPort-SDR: SVGDUY3vNJasOnlEMA6e39MboDFFo3ittDTTYO73uPHaY/VHTmEBtt0sq0Xqoi0hJo3s8Jaw5W
 rFu1JQ0cCFeQUyYSYdTh4hxB8N4/wOESyYBslOXAHt7qCVNUU7NSID0806w+GIMIHO/+8mBRtk
 wjQNXVDhLjCa1u+nSvAI7yeoYW5B4etEwe95BkObPvtGEa73lTyHd3MNgkbu7guMGsWaJ51VcU
 ZrrjIipDXbD4IrDEBH3RB1pWSyj+41bqSoocQXE2ZdfYFUpPu2vQ3qWg5n1izdAx48TJE/Gu3H
 M2gCShKKmb27JlIZyLq+qk2d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:41 -0800
IronPort-SDR: fhfo9Z0lvm6mIMSsNsUmIPqs3w95I02CssDM9KHZflTq3WwrY6vArHw0I7epBHWMTnDjZxjYOC
 BYcbffjdBIf/LgpDimjPn06CGsfiac4AA2w5betMaC9gYoyCGd076+bL1VVtVbUn6PaNkrqfzC
 a9cGvak7Wmf+caBLg6afGVebRRmHazfTHVpmcuVhjiqV7795dnNjKtoyoZdnZJGuZoHr2VFq6h
 UXSBWHdgR/Dv3Ky2amTBzwNMCZko8IC1O7tvXmzGgTDjzP2HcniHvR0ettbZWCFF79F9lb2RKv
 FOA=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:25 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 19/23] target/riscv: cpu_helper: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:10 -0800
Message-Id: <20201218060114.3591217-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: 872d2dfcd1c7c3914655d677e911b9432eb8f340.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7274f971a4..a2afb95fa1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -447,11 +447,13 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-#if defined(TARGET_RISCV32)
-        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
-#elif defined(TARGET_RISCV64)
-        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
-#endif
+        target_ulong pte;
+        if (riscv_cpu_is_32bit(env)) {
+            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+        } else {
+            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+        }
+
         if (res != MEMTX_OK) {
             return TRANSLATE_FAIL;
         }
-- 
2.29.2


