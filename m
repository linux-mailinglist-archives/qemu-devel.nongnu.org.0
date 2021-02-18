Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3B31E430
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:05:07 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYgk-0003E7-7Z
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbp-0006I5-Tr
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbn-0008Kh-V0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613600; x=1645149600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0mI9hxZMKZAg9nDOms+wlT2DIoNas9/jZpOOLOf6Kg=;
 b=cB1O1xJk1yA9nRa3i/eNOAAS5VpaZA8SdI14HZ+RwtqI5KQIeUgxS4K6
 /1CfdQNVC0AQiFJA8OeAgqUX+PpLYPncKr0GI/VkiJtsbLHZ5FaclgZRa
 pE2P0vJfH0LGt9A8YaQm3AwjHYwe+g1oW2G/QdAlHdv/scrKMwGzAofnh
 c0wKGFCL6Yp9hNN+T+3QOMp75X3spqXfgooBB0+Aly6JznN2VwF9XqJaY
 ubCsSwhjRkw65wSCxwXk1ymSmjUem+5E8qMungaHVgj4aB32f+9maT0XF
 019ea5UbUsv225qsWMZzKJM9JwoqqfTeOQD3Ih7XXlb30LHZuFDtB3C3a Q==;
IronPort-SDR: ar8ut7cgWshRB2+VGTNrzCGFMVQYEe5DqE6Bjd2j0v8tIfETOHpyKqwyqcfXNyEW0wWsL2vDQB
 A/6uIakWb10I3VhwDZfMcFEO07ayn0/MvkeboBvtSlICML4eeDpcghh5EXorvGwuTvQsIpKAOC
 beP35GPEZex9P0+itE0B+3nML6uYksfmA4yX0OQpJlnrxVPPUvTkcNbKJZo+L/vUz6b7oZIQBq
 Jxh1w8Hx1663Wg36vFSo+VCUkWuf6uFnwYiPosz/GV0kamIg1GhlKjsjXf6kHNtSCA534OQanb
 2zo=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392112"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:55 +0800
IronPort-SDR: uxcDx1ugusFR7n/M3BzdPa3VSSKLuqlKcC3SAHMJ63lTqgBM/ndgCxs8GiH7tt1leSue78Xf8q
 /SXBCAOneS0pwvWS+Z6B2EcpZDWudlyrlOWoiXwr2QBvUXROctVMDupQoo3VRRz5D8ipB0/u9+
 nD4y9H7adUKEIkZ/S7cuMaqG+vGZrIBAmkL23qJ+IyHgmmEqNjOzAe7dbua/KvkzrQP7E1nzDS
 LJTOb6XfMQyusUYpjAYTOxMhcH2EtiaNVqI7m2tKP61MG7cE4X220+ARTD0syFpNT7hH2a28iE
 mYZMj7hqoBt7zWwCrwQkyknn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:25 -0800
IronPort-SDR: Pqc48Jv6uIjfX6+QjuVuBdwXmC94zweCQbx2cxLAz7qlPwdZciVVp5/R02UZl7sL8GiL7KpHGK
 KsD1JqsQJML+W3Rp5LBUExR5x/XkW6jFhZQVNWRr/yAmAjj2jpd222exNyHn0n8yjWaQg+Z/+j
 n7Jhbz+3CWH4pZuj/P/TYnU6gRpjlB/eYvo0pcbSK+WJQErwDsalWkIgMmdwbKfOF5Iz52P6rl
 W/n9VC9mtRFFKibELgWLyUErttJVsXqlnaaXbYHeMt3SGnsChdKYDe1ExS2AfAQe/R7LO7VJhR
 0lc=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:55 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 02/19] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
Date: Wed, 17 Feb 2021 17:59:17 -0800
Message-Id: <20210218015934.1623959-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present when blk_pread() / blk_pwrite() fails, a guest error
is logged, but this is not really a guest error. Change to use
error_report() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1611026585-29971-1-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_u_otp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index b8e8b9eebe..18aa0bd55d 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/sysbus.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
@@ -65,8 +66,7 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 
                 if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
                               SIFIVE_U_OTP_FUSE_WORD) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "read error index<%d>\n", s->pa);
+                    error_report("read error index<%d>", s->pa);
                     return 0xff;
                 }
 
@@ -169,8 +169,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
                 if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
                                &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
                                0) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "write error index<%d>\n", s->pa);
+                    error_report("write error index<%d>", s->pa);
                 }
             }
 
@@ -260,15 +259,13 @@ static void sifive_u_otp_reset(DeviceState *dev)
         serial_data = s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index);
+            error_report("write error index<%d>", index);
         }
 
         serial_data = ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index + 1);
+            error_report("write error index<%d>", index + 1);
         }
     }
 
-- 
2.30.0


