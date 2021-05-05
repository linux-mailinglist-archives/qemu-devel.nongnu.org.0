Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE7374BFF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:36:10 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR3p-0008Pt-BM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrs-0007M3-FF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrq-0000Q9-GM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257026; x=1651793026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQ+E7bgIWZyDSwMRwwYYu9Yg/pKRgf4qLqVbRNdF+II=;
 b=ebVlQrBNjoWuinmYXsz5pBYvAxLjfhVlaJNRohWzLzzaSiSblxRVAGVT
 MlnS1qpgXekNVyf6B9VzkYd8FFph8UYpgrJI0Qx+pEU+5I1G7c1cbyTum
 5E0tmv9qzggVRCE0BDGs7mAZXzcd31znaZSWwoOY+EQCCjadwAilyVmD0
 9mCIcpclP179e6oU5QvHd+ri0mCXjRWAAIuqdjn5IpdIB5cevu+1+6K5W
 SY3x9r/T7dvff56P0fOs0tG1EkejmzaDk5sSBzJZxMlpVcHcN6vW7+klq
 1/ArKqM8eEQx45GMbVZv93HP8gEQOjE1P16+wpc6L9QLL0kBVeVVohimu A==;
IronPort-SDR: bnGsDkbGzgC3aBBZbI49P+XjTVA6CmK63LP6wy0njTjOG2k1YsKXLT/rqmCppaXSnhkt1ysxbR
 X25XTm1sH+OHETfb+qEWCy5x7yAtAwMxsYExTX9u4oBFaubQ+fLyzbT9GbH4eVDF56RSdQPrFB
 7crM2sT89+AnhGhP3/rHKVKykAtVQqH2V4pwRwKx0tGCsHffqSo2tm9BznVMUUPFaLZeo5QNg7
 b7iWfo7TfRLM4Mf90mMeCSYcgabDKKt/A8wZYVQPArAWHInv/TydVsrmD9iZkmABelfMiOfcje
 V/w=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356910"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:45 +0800
IronPort-SDR: APBJFZqRTc8pj0MUblYSuV9OSzmay7Nelm+c32YIcrI9/fdO1NuE9D5HjdkfBB0+O65+mTaDG3
 4tFhHdsgPgNm0mHVW+mkXlH84T7o20ax+nfr4oMpknPJU05zIEokB+Ognx+AgyKB49n3d9+NGE
 XoGXjibvNGXlq1yomnsUh3GFihH+iQLb8CpK3gJYURsJBVbW761DkWkcHPsY00RUbXyYN2JHg6
 nybwboQlEtRiu3JRmXrISGY3WJKFCv7/YJS9XYfbL1HLqSk2f+73cL2KgI1egVm1E1kbTLjqXf
 aP2SO0q0yWzGAezNjdEOTko3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:25 -0700
IronPort-SDR: 0yGPdBqQItVTsIgDP5XZjGdZdzKyWk/WdtQadCxWqLuCdN36cxjDrlU3KIYWrqJwIvG4NvweqN
 PlKmWs9NGICjUNuxbN+rar1BPgM29iq/81k4AMMC+e0W2hW8ujZF6Ch5AfI9NBboyeUjKUCaaj
 AgEftV6qxVVI39xTf8j2O+B7+0C5NOVCy4SnqpcxlaEUwW4qN2KynjZnjGdcILEUXjMTEXnBwE
 g/OXVfKUdDJXIRMHOrVXoegHAQRU2KcJHK491ywLHt/disDxq08r2ELD2OwBM0PyOPt4Z32kKw
 LyI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 09/42] target/riscv: Convert the RISC-V exceptions to an enum
Date: Thu,  6 May 2021 09:22:39 +1000
Message-Id: <20210505232312.4175486-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
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
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b42dd4f8d8..8549d77b4f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -504,27 +504,29 @@
 #define DEFAULT_RSTVEC      0x1000
 
 /* Exception causes */
-#define EXCP_NONE                                -1 /* sentinel value */
-#define RISCV_EXCP_INST_ADDR_MIS                 0x0
-#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
-#define RISCV_EXCP_ILLEGAL_INST                  0x2
-#define RISCV_EXCP_BREAKPOINT                    0x3
-#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
-#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
-#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
-#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
-#define RISCV_EXCP_U_ECALL                       0x8
-#define RISCV_EXCP_S_ECALL                      0x9
-#define RISCV_EXCP_VS_ECALL                      0xa
-#define RISCV_EXCP_M_ECALL                       0xb
-#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
-#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
-#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
-#define RISCV_EXCP_SEMIHOST                      0x10
-#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
-#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
-#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
-#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
+typedef enum RISCVException {
+    RISCV_EXCP_NONE = -1, /* sentinel value */
+    RISCV_EXCP_INST_ADDR_MIS = 0x0,
+    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
+    RISCV_EXCP_ILLEGAL_INST = 0x2,
+    RISCV_EXCP_BREAKPOINT = 0x3,
+    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
+    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
+    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
+    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
+    RISCV_EXCP_U_ECALL = 0x8,
+    RISCV_EXCP_S_ECALL = 0x9,
+    RISCV_EXCP_VS_ECALL = 0xa,
+    RISCV_EXCP_M_ECALL = 0xb,
+    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
+    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
+    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SEMIHOST = 0x10,
+    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
+    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
+    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
+    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
+} RISCVException;
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6842626c69..e530df9385 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -358,7 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 503c2559f8..99cc388db9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
     } else {
-        return EXCP_NONE; /* indicates no pending interrupt */
+        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
 #endif
@@ -1069,5 +1069,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.1


