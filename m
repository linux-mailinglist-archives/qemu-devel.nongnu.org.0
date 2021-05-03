Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB6372306
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:34:32 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh95-0007Lu-Qr
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqA-0005eW-2A
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:58 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgq7-0000Lb-SA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080095; x=1651616095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eBNCyqtOfzNeogyxUlf2PGSAY8yQsrhavKYqjK6n7uE=;
 b=XU5eDlYsV1sEusIRNGjrX19CNHM0KlD8Ik2igfR+tdMU7J44CAiCjfpi
 wpPVADqBOU5bopTSd8Uoq3a2iAUke/B/hXjX1nrCXWIhaJEl/Y4+jZSXa
 BZ9GkyQ2xdAYWlPsfsVx3NBo5UNpoWI9xthJ7VmJlJrUu5N3KWatw/KzT
 sh5FTArk/o8hcHxTpJykkcqhvXuN2vxHVLIEKanXqHzcfHYK/UkLYb7hx
 XnuKtgdH8dDpczOthikJGwsyCcj/3znSyAgUeAyPWlI+e8BZyppG2vOm4
 2kLsRJ64OKpr6F/aRyv0N5OJosx4I+00LGn/RHnh2rnvh50BBxsHDcGz4 w==;
IronPort-SDR: UvREXA6C58M5X9uJl+XMJ1egzzG4wvUp85mDghOrFWo5UpXS4nR0NSlhI7EVpMp5SHfvuJY5Tn
 urb0y05dVMaWGAzPfvnwpzwqZwffHA8f1vvQdpDP9PK4vrVtn5KYdkLC3ZUXtTQYc8/HxyhBa9
 HmDQfYPsLbeF2rNYHXq+pcfj3qyS7Y5Nsy7O96fpNdVnHA85D36wFNtNGSV16sG0rIr48b5sxQ
 Pyaz3JQWlNzBshQ5OmXhRX2YwB0Fa+T6hiejVU2xA5DRT31zUOvE80x7+V6LD4BHXa5Y7qk78r
 c9k=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114656"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:39 +0800
IronPort-SDR: pnJCW32WTjqoXPeFsin478KNfJm2MfeXVqFWJbaxCKLpHiiQN3dfyeLlt1SRG8sJ8a4H4XIpJx
 RW+6BXGmuUuwvgUdyXNf210wSaYwhFiMxk2dHJ9ZGb+AABvUrfdkH4XtWkngXZE2TnPwwcH5dX
 iNCtPx2cUH/gUlycKHgNiheWFKt608huc6900Qqg6qnpl2ybSUr+rFle1seu/FAxNrlzi0UGOF
 yInZoybzqQhAmRIPjpxqMLw6nOoIRgdrUZEX+1d8Kw25Vgnsvk+cZ8c2dAHohIZyZVYyWFI6vq
 NfOZ0w4ipKpLieiv/5WjlJVL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:50 -0700
IronPort-SDR: Mchhq6J3dwFt4POqC7yMzPWFznSajfk0XI8fp+PIW25Q4sn1/nMsMnCkkOGl9z58FD1yVjD2Gk
 +/Cfsqx7WGKaiMxOSdqL5+5p4UCQAE+axgXlSPpoAuQEVc2BXE1k0lJQDbu56KJbATI80Mux1O
 WwK4rgh2dpv8iTHDze/ifhuGKd0mWELXhgHBBzTjY7YVkvnpa0aIn23OrCGE5Dc3NhLU/DsXK2
 I9p1bEjJUv/bSHYrecV8eGZbT/ydh7rzECMTVPiSQYyWkwcG4/rIYvkNU0kNDRuetcPWGAtYN8
 oqQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 18/42] target/riscv: Fixup saturate subtract function
Date: Tue,  4 May 2021 08:13:03 +1000
Message-Id: <20210503221327.3068768-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
However, when the predication is ture and a is 0, it should return maximum.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..356cef8a09 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
-        res = a > 0 ? INT8_MAX : INT8_MIN;
+        res = a >= 0 ? INT8_MAX : INT8_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
-        res = a > 0 ? INT16_MAX : INT16_MIN;
+        res = a >= 0 ? INT16_MAX : INT16_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
-        res = a > 0 ? INT32_MAX : INT32_MIN;
+        res = a >= 0 ? INT32_MAX : INT32_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
-        res = a > 0 ? INT64_MAX : INT64_MIN;
+        res = a >= 0 ? INT64_MAX : INT64_MIN;
         env->vxsat = 0x1;
     }
     return res;
-- 
2.31.1


