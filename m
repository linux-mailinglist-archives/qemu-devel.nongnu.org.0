Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D12ACE68
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:11:13 +0100 (CET)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcKzw-00064J-Mt
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxu-0004rk-Jf
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxr-0000Tc-IN
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981593; x=1636517593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvaqOwaC7kbC6XV9wO/qh+V1j9FCAw+z5DUfTVFUzaE=;
 b=gUdPxupAzJN2qVaAfJrFF0nrh0P6+jWPc6fIjlDbdLcr16pMwqmCNmSK
 Gv4Lqz7AD9+R6xuO7xlIqWishlmkvUhUxxAYGYQNiK1griiRQNOsxA58N
 bQAPZK6hmaLxNqnoWjtQDKjpkUbl3kE0uEF9dhoZo+7znFGhblIErewSP
 OjGW10yyECzfQfKB8w/Gi0WOVOSJWDPsS77hDAyfHjZ1jM91B0kNOBWSM
 iYGYr0QPg30wqd1099oO6+dqpbCgoxZpEWsqE6YOPWJqCUDiPYGmTYrrm
 ZvT1uWUmT5D3P/NysisKX8dhSuzkPibRf7LyBIxGp5N0tlHWB+I/QGQNs w==;
IronPort-SDR: HHOgoPi+fBRxfBVxX9zcVzjm5Eab2KIxaz2t57YMNBkdsDIZihzLGufFB0ilQ95qDYEbmyiclt
 Y1d6EuPARJMfwJJcmCuodwbTwODXvmvhR87jLl02vcQqMav5fEWhUnfiKJtDoAcBKn9KpAGEer
 tu+OPiClhNftQboRbEdOTwP0sJWmyfPnJNpB7JKTrb6hgNEUUIUYuzjL1SDeR0F71G4Tb54Wk3
 nvRU3vdUyI4ffzyciM05rWJzCafj1IOALOVNmzxHR25WPMZUUcsDRzK9Fb8tqTN/ySEP0UiDxo
 xBo=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803593"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:07 +0800
IronPort-SDR: 9Ph3XbQ7kg7+ed7xeaZ8xGlKTLBTmoKSD9UfAbZkqeI4TGjRabseVXB46RUo2Rw3jjlNpNYRSw
 DGbzfblMja5/bT5VF5ygvH0+QAD8ustjQkvQcA6MpQnBjNLRTsqUH4dXJ5/d2u/CyERquItHLp
 MXSik5LHVHteysJa1qbvqvNaFOxC+wx0DYj3KWBhfXGEOA1F37j3s9pJ9PaavDEOC4vg29ZbYo
 uuTdW9Pm8N3HVQpvjFK+1w0zbi5Bk6pbn+him3wBFKAqmM5ygEGUq8QH/4HtcYaPH2VjAMxnza
 fMAIFQzRyR7CSPYOGYoEjsgU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:00 -0800
IronPort-SDR: PjIip4+6CXOjsSgmgaaAKCm95tH9vXW5KjjfXdslSDWo0PA5PItTrt/Xo6JROGWtmFi4DPlE3I
 3RNXcR6EQejJZ9K9LcSpTeJK1FtzBJiPzb0FeNGnIPnvd9qQTq0xyWo/B1zc0aGG70LWRid0jO
 NtGNVIBXnN16d4xIryzbzBT3J1R6RuxaTV8Gko1cgrilC1cgX6TKdjkR4xdNi7pxKPCPICPqyu
 Sm4dGmyfX+eQeYLCQTVRuhO66wTvRjPfFo344502L7SNyR50xvbHkMEI9dH6mCcwacLMA/zGHN
 mlc=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:08:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/6] target/riscv: Add a virtualised MMU Mode
Date: Mon,  9 Nov 2020 19:56:58 -0800
Message-Id: <20201110035703.83786-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
References: <20201110035703.83786-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new MMU mode that includes the current virt mode.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 4b301bc0ea36da962fc1605371b65019ac3073df.1604464950.git.alistair.francis@wdc.com
---
 target/riscv/cpu-param.h  | 11 ++++++++++-
 target/riscv/cpu.h        |  4 +++-
 target/riscv/cpu_helper.c |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index 664fc1d371..80eb615f93 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -18,6 +18,15 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
 #endif
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
-#define NB_MMU_MODES 4
+/*
+ * The current MMU Modes are:
+ *  - U mode 0b000
+ *  - S mode 0b001
+ *  - M mode 0b011
+ *  - U mode HLV/HLVX/HSV 0b100
+ *  - S mode HLV/HLVX/HSV 0b101
+ *  - M mode HLV/HLVX/HSV 0b111
+ */
+#define NB_MMU_MODES 8
 
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 87b68affa8..5d8e54c426 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -363,7 +363,9 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK   3
+#define TB_FLAGS_MMU_MASK   7
+#define TB_FLAGS_PRIV_MMU_MASK                3
+#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 
 typedef CPURISCVState CPUArchState;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3eb3a034db..9dfa7af401 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -323,7 +323,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx;
+    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background = false;
 
     /*
-- 
2.29.2


