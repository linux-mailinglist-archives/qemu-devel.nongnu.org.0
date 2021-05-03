Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE637233E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:53:14 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhRB-0003iA-10
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrN-0006sO-P2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:15 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrK-0000Lb-EN
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080170; x=1651616170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JgM/gLIjni+dyO7wx31lSD4YXhtJoi1y1oqkheC/Erk=;
 b=UiG4GaF3uhl5mm6when3R+01U11QCQrRhi1mI/it1+jq+ws2c4UNTCt2
 sxbnApJ6HvolAEpRy/rF4XL/uJzJbHGxSC+E0YM4yeHrwd0pLTDXxI6Hf
 kBgjPzcOQnq12vyosDKfdKpAzq3trkj/SEGsoh5jzVqKs+rN0Wxd/ALyC
 iAga70KLv4A0cEleuXJhtgj2ty5ovofVwzKzHFqpkXM7PXDvrwa3cdkVe
 P3M5F5w3Nh1Go1Vy6C3V3Kp/gh6zCnrZ+jG5nDCy2X6rwX22a42Wx0oqb
 Mz894NQhA0DEqwVhYES4GstfU2FNLgAtbbod5QQw/Vvk2SssdKNi5ta7y g==;
IronPort-SDR: x/87JM7IN0X0oa00AMCDNy3FMpbDVwj2gfMYnaPnJPBIWuw47TLSnCNb0Z5ym1KArajvyYzH22
 7sMePR/dRbhYD8msduAbQTRWcRYgcTXOAIpsh+SLZVtBTCU6ky9+KL7gs253KwG5WiKZykiRGI
 oudEX2V8wsxf4GWCNVnUW/D7RBBroKerxAPo0jnYy7WbbsAjpy6KWyPZ1D/ch7saKzmtvIo99F
 AfGk6+4j2bkYz/8scJ0wYGvWPQO9M5UaRIuA6nAySMTqU6BZ3ytLHOgFf2oEJorMNeCwXgQR/G
 dD8=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114696"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:29 +0800
IronPort-SDR: Zqr1A2gceLc65W+M2LNMUa0A+33WjAoZGLzYLSXC8rfpHBGlPIgXurWzFcGNqSLSVPb61y9jWv
 GU0UM0iywhM8wyU/sEtjWOrImDrrXF3NxgjrUqtnyF4Fr5l+pZIhg9jO40pX19zOf9YB2zcaew
 LHLupW65VL+3M2NCfuaDgH7t6A9YSObgFtXwAHG1S79e9Pqy25uD0PoJUBAHLgGz/1lvT0jP0D
 ocm5jPDkRSjJ5IzlHdPD6/Gti1z4pKXt/g6uQLPpuAfitw+vDLbHSqvW9DvEenWR8Rg2et78/Q
 Lny2ExLOZQU3kMscmtA6rdsF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:40 -0700
IronPort-SDR: 7ot5pyN8EDAQWEhaE5lcYHzoMn63Yg66xGE7bPr7pAbc/iyFV+A8OHApA92dYkXdNYQ45i49Jy
 0cgzoe3grb+lfeO8j9ykk7mAYyWhoGpIHM/LEhfW3/kHhKP0PnKVPK222UD5KqqG6gcNwhRfZh
 gjAgYGq6pHt64PKQhglglH1rTya/dYXsQKmqwz3k+TjRODUl8D/rXZThK7Of1Fe9U5W2UQOP22
 RruqK7n1i0f0/pLNJryy9/g/fomdAEY7vSVwr/vINxuHf/NlU6nucexS589g0zg/1dTCrbyyHF
 8jc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 33/42] target/riscv: Remove the hardcoded RVXLEN macro
Date: Tue,  4 May 2021 08:13:18 +1000
Message-Id: <20210503221327.3068768-34-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: a07bc0c6dc4958681b4f93cbc5d0acc31ed3344a.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 6 ------
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index add734bbbd..7e879fb9ca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -54,12 +54,6 @@
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-#if defined(TARGET_RISCV32)
-#define RVXLEN RV32
-#elif defined(TARGET_RISCV64)
-#define RVXLEN RV64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 #define RVI RV('I')
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 04ac03f8c9..3191fd0082 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -147,7 +147,11 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#if defined(TARGET_RISCV32)
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-- 
2.31.1


