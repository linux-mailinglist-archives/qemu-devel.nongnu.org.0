Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A743372342
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:55:47 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhTe-0006y7-Aa
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrR-0006tX-NU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:19 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrO-0000Fd-3b
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080173; x=1651616173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kX2Xv9V0jg3JpeHNNRl1F4kvINea/oqMxr6h/7opXw8=;
 b=XK7P286LGq8CiyuBuha+9yAJNsZ+YDn62L8HS57nzWhU/5FBXoCRVRfZ
 RbAk40UpR+RuxZpmbxlAHqKXmDtkn4an1jUWEDaJU4PZ2rX6CCfurtoAq
 LpkZBAJeL83uWjpNUuyGNIlZQ4razfQkVm1ZWAXWOpSqsiKi2v1hZUkZ2
 2bAGABgM4eAxKgo3TwwaN7Sc2lqx4snN01gf7hWjNkybU7NybHUqK1ydW
 Gzv8l6euy2Z+G5x/2wqc82McMmS0DXGOM8qz4d2glVW/D3qRCUdNCIlOU
 xkWVaSPUHdaxLc7smHx9tqjjb/xxpoEVw647ydwA6UwiaUVHHpO1vr1fa g==;
IronPort-SDR: W6o5+pNofbX8IZ/YGJOoWtycmQkfpboYkvhNcb7lDp6pwWqxi1E4wDa/EdcGt/TN6vEb8DPGlp
 Ka7X0tW9uHmwNEzLu5mkTRl1whJrxi2LesLndY3BPVHiit6qNNomKWV6Nw9sUHLVnzvkY4qIAf
 jHX0/AwS6tcNVw5AFK6UY6xx1uQGRptsEeJCJ4LLecZubPMijNx7GLO0N4VCKADTX/Zdfleyqc
 5nRaDIH31+4WekM8kCqJSCgY9gRQJTa7GgSjvCMzmwlr6OXJLdTq1UEMPI0FvY7YcICLZFcPPy
 3fA=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114698"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:32 +0800
IronPort-SDR: 8Tnm7Qc24tHgutaSgwFS3JSYEE/jG2BlYHhl5H53kL3WSP3qoiD9V1DSXH0nzIbpWGg+PXu+uS
 XLpZMnNlJtN/fxY4hFmud0ZKahUSRVLLIwZYgl08ilkZoxN3QH0Dm7vrw5zTNdTlUQi8w/x3/f
 7BWb3zK0ZguiDNVvXnmdsxYEYxvyLZaAsSp5GuCa0yvO7JNvlPU1q8w1me0Bk5IuHEK/Yc9e/a
 7GEJpN0mEn0ucZF4EGuSfsqm4CkfSlWYFJTphVhY6IB9Ha3ksdjZkfWPQfp9EMUlVTcGHEwIFj
 U9toIMiTBhH1NxXjN3GAh0TQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:43 -0700
IronPort-SDR: uBzgMU4GxsYmB5Sfk2OTaQ5l2jy7zkvHPZs3DlteohUdpVAuXjftfZkOb2+fSPchHpoAaYAHFU
 /xhNVNzuJeISxRfK/Hv72fyNphF+o3JmYKpV9VBjrKDgxOD6YghXv/79ksjNM8wc87o9xaku6b
 +gkss8zR1ALQhCfWUgwAxzkfa1lXLEQ0PHbi0XvYymOya6C7s3YTt4STSJ0J2nxNl0Hv4w73KN
 FPaWVDh6AQ35YlNIC2jbdY1D1NxUyst0zG9iJvkycdjAVoFfO93gDCzQWQ92cd9DE7baoJZkbB
 8gA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 34/42] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Tue,  4 May 2021 08:13:19 +1000
Message-Id: <20210503221327.3068768-35-alistair.francis@wdc.com>
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


