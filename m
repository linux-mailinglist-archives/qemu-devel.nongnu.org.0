Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F97374C18
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:48:56 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRGA-0007SO-Nr
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsO-00084B-L6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsM-0000cg-M6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257058; x=1651793058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eBNCyqtOfzNeogyxUlf2PGSAY8yQsrhavKYqjK6n7uE=;
 b=GNgzeGVOzrBegrO3r4nYMYkfC0L3INCdsvNZnJx2TdOTACMAGTiTzlnW
 fYKQ7lbmh9M5fwp7jMWQUyazQPlx8JLm3+EsBId4D855q0/Yynr6tLplI
 nlmV662ybUkoN9bHhL0i6zdq8Flrv4lAQeAnMqVGgQoNKCu+e82JwNFuv
 kJXvkQgaIN3xRLMhBpaYyGoZKFlt++IMaBophqor5RgLg2lmUVNW+Wjyj
 S2jEOZdMsQV7IfJJDeApJ70mTm5kC0kvkBu0DnXvC+Z0CzV8P0hk3s/mH
 RSVuX+/5tb0Wir+0SNMHKzhm29M3vWyZlyiSYExJkaW7nqA2eDSZlngHV w==;
IronPort-SDR: 1Gblt7PJKP9mL75P0eJsqN0O8TG7hXuFYyFbmaX7b5IAdYG+mGIi5UeSzazkgP/xcbF6K8Z2jc
 0kCN5su9/GzQfboMfDKtNeBOdXIp9F66CN3ydczYi7crvTs5x4/gLNU2vaORSckTqE6N/rmEho
 CAwId+euQPlrtC+qMXtkQwoQbVMz2Ef7/1hpeigoOJqrsvuxa61drRu9t8CRwIeuPyZiJVD7cw
 9GJm3Tl4IJOPDBZwv6DWDB6JQtaYCObol/+WsXRW+MZoW7pbuod2F/gJcSP4pUIXNu4swZT0ou
 kuM=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585931"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:18 +0800
IronPort-SDR: Y16feLb12k7oquEKKS9PdLOUqrWROp49s8XRbepCyf5SPiUe2bl/rMeig8/lJ+YnPnHwgbnCJu
 JNzdH38dAW3psYDPnC7eA58i2oWAM6CnBxd20kI53uUe6JuY6pPAkIKsXzgy26/dIp7oJ+Yu6/
 aDXxfy52becMY8W9PyVLT2RqcDbnGOdfFyrq+52QCOLj3Q22unL+6vqc1jpW6rETLQTaLAtAkb
 nQwGwdaCJceMwzdhae5WLj/00Li+AXRYdYP1t0/Zs1i74T7blxk4LriIGGDZW2r6nyJIOG/qs/
 9ljSyvJV+QKjyG6bmLQzeKGV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:58 -0700
IronPort-SDR: EDtp6PrvrxNyr0zuPi1Kws3PK2E00asHLdGH2hgJLarnRKXzrt08FVKdS5nqRdeqXcTeIi5o4L
 dCmvqCW2ImQ671mg8ogwjjm2JKGQykg1RkHJORD84ObgwRUdoE44gdOZ0e0+OJxFmqq8aUOURt
 8mt60zPjtgNC/DnrCNgY5J5KZfVex3PdwUieftYiH+NTNrFDF3khKu6zEabSS4z0pn0hcDoHrW
 AF2dP0Yzdx6Q+SlHDhD2h+hEHIplh+4/Vhk1QlHIOfhuRvL9kmNCh/dbHeQOfvpw8hprFDdvVA
 3fk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 18/42] target/riscv: Fixup saturate subtract function
Date: Thu,  6 May 2021 09:22:48 +1000
Message-Id: <20210505232312.4175486-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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


