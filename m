Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686932DDE66
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:07:54 +0100 (CET)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8vh-0003CQ-BU
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qG-00062c-2Z
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qE-0002G4-5X
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271668; x=1639807668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOe9jHqCVU8CUXf5M1w3YigRwpzUNJDWNK9fV8sterc=;
 b=KI/2clxLR6YRBfBDYc2ULsXuhv4YzllUA/0l+RPS4EVBiLtMxIjtOSbt
 Tdh4bdYfjXAx7Pryu5C2IJMjS06RtN6gIo6kAcs0qpjHhIAbelHhRGPBB
 htLthgjmXBCY7MaHe3DD3jS2v0AXiruWy20aSDGGkGVWVS9ifWdtUQdj8
 xdbi38GpIfKZpHWaTQNBEGN0tG+icPX4Y2gUvZochrVcdfnp1I/Xqr5DC
 ZEhf7KIw35Bwn8s/1lJsXoKbGZ4WywTCmHqYJESTdhQwUbv64RTALRfYH
 mnwDRw01f7AS1Qk0rNuQ1XnxZY1C+xHm/3si9TwIfSGOMXF6kA0cG1ZwM g==;
IronPort-SDR: gngvK4XB76sjUw0vwu8ERXWFv1Lhc7u+qaBzDRHtv6Yk7ed6pWttWUJyDEMG1XH9BCNt47Uf2h
 tB7Q3PH6gv2xrAQsUpntKFAaGEJvKg+3OzIDA2GKthU0kWj8CUHWfepcqxTxepimKqOwxXhCNO
 SOYkltZi1Mz8QeY8UVmZZTdGGE5ya4w5nc5ZGMY7kNZHvWfE7McguqohcjnJhC7M7q0lEGuoHu
 t3PxvCdmyZUqZ1oSTi9ezg8vi1zaw40dEl66wg1frFEURCjAObIDtwMM477FkT3oTpK0q21cAT
 nxM=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237067"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:33 +0800
IronPort-SDR: //KE9MALjmCn4VESFmsP6WBDfu1hnaoYtGUruNrNQxnovrGckpfTJmJdG5v3qtvLI6KVJi2Dxg
 n79cSKwojcrk7FZENHhOxwq7CCmb0nCEG+B+UosxJDkrLJFGPBjTpc/9TMUCszg920L8Mz4vU7
 o7jcSQzB7Bclj3fc6JXpZR2d4ZY9pBQTuf5xfPef+DPivgqQiwXoI0VMfmLTIREws74mCnQa/m
 VbW7jaxscoXqvJBj4eTwBQbVUWAXYnvK2wXhfINeZbYGAZkgVFKyQ6V7jAaZON39A4mQyYelFn
 Sp0JfoQ5gztB9+1CBodAga9d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:40 -0800
IronPort-SDR: aP+K6iu75BLFk8ClIf6w0NIWGV3c6kdijn4W+IAei8lSzLJ4oIhvW48YLWLBqkDQ6kQwOisd8X
 O15igdkva5EBJ4toaNjK6fq6Asj1CTg0VpIMqknu7ziYQJdwniXeIKCmkbju10YHFhAbzdKZ6I
 LKtrWRT7H7iP787Yc0mDnvJT2Cx2+SIACBShbQjCjAlJyH4ZoYRgMLvUk29nX0TMzplm9UxAmQ
 5+xqmkojl9l+EBV1Scg2v1ZxPfdq1Ais5p3wHstQYWfNx41gI6r+UI+sGOiouJ8YjIGePdoKYg
 TXQ=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:25 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 18/23] target/riscv: cpu: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:09 -0800
Message-Id: <20201218060114.3591217-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: a426ead44db5065a0790066d43e91245683509d7.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6f032122..47b738c314 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,10 +240,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
-#ifdef TARGET_RISCV32
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                 (target_ulong)(env->mstatus >> 32));
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
+                     (target_ulong)(env->mstatus >> 32));
+    }
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
@@ -356,11 +356,12 @@ static void riscv_cpu_reset(DeviceState *dev)
 
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
-#if defined(TARGET_RISCV32)
-    info->print_insn = print_insn_riscv32;
-#elif defined(TARGET_RISCV64)
-    info->print_insn = print_insn_riscv64;
-#endif
+    RISCVCPU *cpu = RISCV_CPU(s);
+    if (riscv_cpu_is_32bit(&cpu->env)) {
+        info->print_insn = print_insn_riscv32;
+    } else {
+        info->print_insn = print_insn_riscv64;
+    }
 }
 
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
-- 
2.29.2


