Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43953722E7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:17:40 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgsl-0006Rl-J4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpH-0004Wq-Bw
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpC-00008S-DY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080038; x=1651616038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPCk4g3W8fX2UrYqx8Ha0jhj3mJEcwbKzn0C8s8q6fI=;
 b=rtachLHhozZWOfOZ+MG+rJ30QxiQmHJfFp9T4jeFL7tcpMT45MjqEteo
 60kEAoF6yPUvJZHXK9atquVXef/32OplY7Bt3K2s56kueBlVEk+i+6E6k
 05hsKx624vjp097XwSZhajEdwZcKwL7PaK5H+5N4UvTRQffN5Wn9XeLEI
 Rbi1gtyKdwdXv+AdW67ItTPCbcmPFp8r9ToUG1p4ohWQxIf9oPhPvHr7h
 afmFUDNSqAM2T6+YQD749+Ekdt+AHS0nPp6ukymdDMr6T8xwloOSeZbXp
 firICw4Y7h1Md73cUP7r3eSvZRSGu5Xh/Zs5TLUiSURYlfVC2Iq8IOAdc w==;
IronPort-SDR: 7+oqVdwrvsIJrwJjZ4vPlraVew1mtRHHed43k3Ii3RNJQMu5Gt3L7y5ctqBf8C1Gl3jWhChGbt
 uDxj3PIkBQkuEofc3xn1tRS4Slr5oDRMxxkXHbvwRHUtvcNABQCHkxe0mEWtzTMVgi32C/SnHB
 JiWAOGfzQuISlJdlGrKDDvdDVAK0Ank6nPnTfVqVDd/oqwd2OPNIRBJJMM+E2NrD/cccj4jVrA
 woXF37ItaN55yXmWTxSA2OFQqDCLp5v4zazim7YaG4ABYGjBl7XEvKlY5w4MyHhsxh5JZ8rbMt
 6nc=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114599"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:56 +0800
IronPort-SDR: MyqSibqaMgpgIyQQ75Ta5bB+FceeQQDRpH9z8WwdG6VXjr9WCKgw6nL8R+NUG15jhhAeONJO57
 GLWea6d0lv5t1ITI9dYMyhZhC7PQWiLsxEy3djXR+CUAHG0c9dwrfN4pGV/roflVvgKPHPvl8j
 xUD7A4AyFKeSxL/fzIOFvT+NDInQ0HybpSGI81MQqBRHUhJq77DoN21Rxji6RYHd1cpG5gA9CA
 8GKWhpXJDiY6MjOofrCYY32oULRJBRJhYPNjAZH2a/jYBCFC09xKFSBjGkt+jqgdNNHCMdOy7h
 SIAzL8xm53dCu4Pm9LJLuCr1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:07 -0700
IronPort-SDR: GDi3JYylV1jrWsBc8OQkLFjsqTveSWup8gqWsG8FwviGGomUZoZYq5l0b+AfUed8sZUnmzhtzY
 564leOJzFfjAJ8oqghsA6L+MNxpSqWOGsS1pyqD0bdAM6Dj7r79SED5by4lya41VIGK9huEDgS
 D356axwj4F4c5ZqE28C9bdAt7kCCKzFwtEe7lUpWIYkrktAF9yeicr6oZ4A5va0IaurMNaE5Ai
 Xg9P8AHi3nSV/jfLcYbgxHkMsiGByl7eBIlyO8yrV9Oah6pwKjjk74qQvYWquvsuvm9+7/DW3V
 ZWw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 05/42] target/riscv: Add Shakti C class CPU
Date: Tue,  4 May 2021 08:12:50 +1000
Message-Id: <20210503221327.3068768-6-alistair.francis@wdc.com>
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

C-Class is a member of the SHAKTI family of processors from IIT-M.

It is an extremely configurable and commercial-grade 5-stage in-order
core supporting the standard RV64GCSUN ISA extensions.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-2-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 311b1db875..8079da8fa8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 047d6344fe..6842626c69 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -708,6 +708,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.31.1


