Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DF39EADA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:37:54 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPkf-0006JH-I8
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPe9-0001iw-5O
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:09 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPe6-0004Zo-QD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112266; x=1654648266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTRprxUAjp6DhIZsLg0OTM9c4gT7pinj+2xK4ipu3SY=;
 b=Gl3limigmmZfKH4YSewLI7XkanM43c6diLr9dKgOQ/VCN3Tg3XIbYFOK
 GhXu8219cI1B6jqMX9v/lOKCqawJkHxAXn+OzRExq8hHZlXdFHdJyjEGY
 jI+8O7PwoTuOg0DJm20zT2fDD4Ysl9Tq/osiX1JpEeD4ONi5gVvstY8jz
 MO8Dx9UAf+qNcifEhlAMPsCJNOUShUJv3VnsESsUVsVVfT/qMGgybAdun
 KGlBMw14/T9iZAwZrULUqQdvoRKrC7fa4ElDUARKvCnMDy2yFC+bWaMrx
 ylu72uQ0kgiNXgWUj3uhImm21m8pzrt5rSGAUgEsY89FF+P6joWXA/nXZ A==;
IronPort-SDR: gpILZ3EAQztipkZPEH01fgl0lSbUxShmjD3/zhDtRSkj7C1qPBcPfZZoqBfypU6NcP/oAnZ0y+
 FrDhB0AUXfOhQRYgtFFtXZRH/fWHPbmMsgHAhHGYc4jz4U0wOGTAGPR+a8DnlANpYn8gAzLcfc
 uG0QLQPWwpWEa1WDiJC9QXqHLapfdlHXoFpSknNRhnJfB3FbomCSmEn4kGxl4W0jr5jSIdfVgv
 Z0TpRCznskK6pmxF5K6h8mWNf7INijSbOjqCLR5sNH/3HJZQV2Z0K9i1DDpyw2bkXIEFttu378
 K9c=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087377"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:55 +0800
IronPort-SDR: pjqopDJOYqpYPDloS0HRAB7BLV+XtMLcJ/rtVrP84WlBftLo8NMX5QPsnRphi5rfTIbv58qdLS
 uGVvNSALRQLNg0l2CwjFoJLr6oLw04du+VBEMSbZPItWWbAJXIABLojangvKo7Fw+ZfYbQXpnt
 utNbjnN7M9sIkXaYyF85m3Xj4BxX2AbUXF2IsLM7317zaGOsbtwrZaATXO1+UHAoeQ4aV294qm
 7sxap2T6w5fsmOanqzczr+/ziHcnDW5YYzjdMhM7xz6+WAGhHfzEIr52RY3bEoDGpHnIqmOEZ9
 xqjYVuBF74sssA6ZmVgFoSB6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:01 -0700
IronPort-SDR: Kh0+vwJImVD+/HbXpfaeysqkAbuKt872RcMvusvsD+zgP3+3haHGgJeY/ACuWooyi1NY9nQOBP
 CMeJ2zPQUmEjpJZOlxqmI+xEGm/MmW/Lq7ediPr0aQ0YSRNyyd6C2LRVBzZ1URBWQsSuSDNLHL
 kt/9OwjHdSSRpFD8wOqu/qbrmMtwH9Zx/NrdgqKi0MHtoJIa4qJbMEJMEeT6NkKGGgJ43hIAe7
 Ooy/Vke9GFId3C+4EORKJBjcbG7jafuB6iSBP3e6zSEBjtd8SxjX1dizNGNnlhOZpgw/c5lLvg
 qgM=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/32] target/riscv/pmp: Add assert for ePMP operations
Date: Tue,  8 Jun 2021 10:29:29 +1000
Message-Id: <20210608002947.1649775-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although we construct epmp_operation in such a way that it can only be
between 0 and 15 Coverity complains that we don't handle the other
possible cases. To fix Coverity and make it easier for humans to read
add a default case to the switch statement that calls
g_assert_not_reached().

Fixes: CID 1453108
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-id: ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 78203291de..82ed020b10 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -402,6 +402,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                     case 15:
                         *allowed_privs = PMP_READ;
                         break;
+                    default:
+                        g_assert_not_reached();
                     }
                 } else {
                     switch (epmp_operation) {
@@ -433,6 +435,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                     case 7:
                         *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
                         break;
+                    default:
+                        g_assert_not_reached();
                     }
                 }
             }
-- 
2.31.1


