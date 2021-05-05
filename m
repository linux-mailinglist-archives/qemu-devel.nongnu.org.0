Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B97374C1B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:49:52 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRH5-0000Bm-Ut
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtZ-0001Ym-Pu
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:33 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtX-0000ys-Pq
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257131; x=1651793131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kX2Xv9V0jg3JpeHNNRl1F4kvINea/oqMxr6h/7opXw8=;
 b=PGcXR3HzcHClYYxQjn7G2Mx3JmWLqUM2tBEiOHb8XdsjQNSZqY/IjcJJ
 60ZgeR8W3gITvB6YLfmibFwOGl4rq561mllaWpV6ZUZdHf7Ipa1DY+bmc
 RdeKsdtC9dlSlf93zmdnDz3MuBEu2xqqbbyDBhdLH9S0Fl/w6OGLOBMWy
 WSqD5FldVoFGyl0w5wPk0ovBBnwS4ASpj22/a43JUQxnzINtzcMQMCxow
 7mTWECuyYJlo+sfRXIN3pi6gn3DH4pZ0AdRWh+CPfYuEhVTY0q3teRsnR
 bOHcu/beKG1aGSKtpx0ID9mfNjbTvh14jz5340LftiFq7zPKTwZWUokZo Q==;
IronPort-SDR: xn1/WU8m8bAfjUIvGV95BuzjWKm82sMzI+97Q54jfqfG0f+fsIlMQqbiTylHLWkQ5X3S0tT5A9
 lBP1P4zThXUxJLGEGK6F4/SOBLLkmlC0e4Lwtkv/Uw/qcdsVixLkDMGnrFlWk2zWtYAy1sUYGJ
 oZt+/5ZIeVuAdIZVFwHAbjUiuIiyJ9qxK0qeKOeOs83fLPKaFnT2JHXAWQW2enYL5hqZldehv9
 mhvO40IOXqW0u972Wd3OZgcSh1rpjmWUfsv09IjHA3GiSymcTnDabolTSUppKNjsodSYvlmMt3
 4uA=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586006"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:11 +0800
IronPort-SDR: k7b4i9titDLK1sk8qz+7Dr5ydvq9c7ntIPhJc9rm2+QC7sMoUV6gAko8EZaALXK3CYvaOQWM7C
 uEVy4ANPqfpQYoxpeRdgI9mPMLxjr/REBLlbB0POXZm4WNi6qFOyOehims7I3QljrTgdTqRcs4
 G0pmoKOBVJGkaiHPgFjI6W9Euq6mxLAa0mcLY0u+T/SBKV+OYIgC8KdpjhPEdTEoKzQfnnoWOE
 eWFXeIvKLlRge9S9a/2IiqFRDBnz6kDQXwRU32Qa0lTfee9llFxOLuiqfmRGJ9sCYRebWOpxyT
 5MiYG/pvJbEEL1kUDnzv+GE3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:52 -0700
IronPort-SDR: t6sxYEQiiZEKCCdFPgUompHa8dSw+P8fQd+cTW2UwrCJFn3QMZrGXUDe9bSWAQTsOkTeaXgGwA
 qCwgxJThLonXlgJm1RlmxB18Fz/57kg/CpCE31kRQtMejHaBY6PPJwqCQVoIr4LuGDyb7AJDxl
 7u3L3sG0PP231aAJmpgSy50zidSZ9lq3kXs29MlyhMiznK1Kst/6idKEAHosTL/Bxa4FRTa8Nw
 U6hbe75bFGwBwNdHYxiD76YHgevzVcxjojVh5K3F9d+NzRE5gBu7foTms3HtukMP5zdB8yxPik
 etI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 34/42] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Thu,  6 May 2021 09:23:04 +1000
Message-Id: <20210505232312.4175486-35-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This also ensures that the SD bit is not writable.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 9ea842309f0fd7adff172790f5b5fc058b40f2f1.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h | 6 ------
 target/riscv/csr.c      | 9 ++++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24d89939a0..3a0e79e545 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -403,12 +403,6 @@
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
-#if defined(TARGET_RISCV32)
-#define SSTATUS_SD SSTATUS32_SD
-#elif defined(TARGET_RISCV64)
-#define SSTATUS_SD SSTATUS64_SD
-#endif
-
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 97ceff718f..41951a0a84 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,7 +459,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -788,6 +788,13 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+
+    if (riscv_cpu_is_32bit(env)) {
+        mask |= SSTATUS32_SD;
+    } else {
+        mask |= SSTATUS64_SD;
+    }
+
     *val = env->mstatus & mask;
     return RISCV_EXCP_NONE;
 }
-- 
2.31.1


