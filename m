Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FA2DDE6D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:11:44 +0100 (CET)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8zP-0006Pw-3G
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pV-0004z8-SO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:29 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pS-0002GJ-P7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271596; x=1639807596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puSwE5R4YrFaze+ycwrNYHx51qVBAahae+xQFvXLGTg=;
 b=V1PcmAEx7f9ytijtMOoLsHW3cfTYHbAYnnku0qtR6VqLteZSAYZKgX4U
 IWh+M5rwykpLKxaxk5EwDMq9htU+BbbbemJMtB0zjkWSUoptd8yZJUiVc
 nyproIL4n+VDRrZtYMtLRlqFRrKUP4oVPId0YP76ImkG6uwyKDBk+sunl
 lDnYS56gIZFAOVU0CFyrCPDRqcwbGkOoHT7FDISgNrCe162iRYw43fFpp
 p5LnbHWB98+ooGZHYm/6KoF0RtYaB1uAWYyANhzkdEpvFeKTJV/D4ou/I
 6G++CLN4ryTawlZ23cnRIwiig7GUH6Y+htZrj5wwCEEYKuix/Stp8KV7u Q==;
IronPort-SDR: iCoVocaaZdBDF7EgPsbzfoUyyILyoFfRUmhuRA0t5XxCHHxNyFMXHOWsrjJFzewTSLq7OH+hUh
 jXvyY4lfe55tUWgpuODiqpl3vUghCc0Cx97ynk9iRyGgrqCgSdO/N11dZpmjdeBh+oQ5KL5IJS
 jQ5r8wvzN1Vw5Vlurrdsmk+bE8Wnvh7m9uM6AaNvt5Si5Vbv8/B+6OYGidEjD1borYBG2qBw9L
 QP74M+xme/KaEwsMJGcba1LLrjD5fQilkdF7NK5ECIlOnh8Dpmh7+jXVu6PQ8kt7RTiyQLU4q9
 haw=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237040"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:24 +0800
IronPort-SDR: D8d15sc+jxE9KSDsUJaPTtyYnMJ+l+hUuQQ9L8TCdFmPm7nW0Ii+rT6KnPibcXcud6Qe2TaF7X
 eVpsVaxvXN4HTovnadjQbu4khJupLh88E4vy2c84wC8OuncFFxmurgs1wYrD030jTn7evZFWqG
 CK2BO/JvrzACc51y/At8jXnusNC8fx4/TXycaKPqxbsv2V7oChyOgtUWyvqfPUjGHIhCROtNQu
 VS/Lxvh5WYPNvz7v9iefqFy4JX/5ygzQEHLPFJe4FhcMU0nlFzdCpNTmU1w2b8b074Kp2XvaB0
 Cx6wJOWokjXXAejyRIJyF7Do
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:35 -0800
IronPort-SDR: ualB0NbvaFtg5hxvVgMLSgtMJkOeZhpEOPgcvMZTWfAjPPJjmRkvEaZBK1+XZL3GcmhZGraSYK
 CnsjDs06+DWgQdnHPqeRMw022ltmzPEdMI3Gk/ODeGclWU0w6kTZRMVP4M1NA1u042AYDsm8RP
 tjFZ2R8c7QxasdPimvWtrfjSG1K08LWabGxnsIqOP+V85d7vqpNo64jN89fPBdizi4+t0jaYTj
 MEMfJ/nwmNDwmSbPIhpScMDpuIXG4fWbck9Kqz2ze2Xbean1xpyjxduRIgR60X78fxh5BMAhD6
 93k=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 04/23] target/riscv: Fix the bug of HLVX/HLV/HSV
Date: Thu, 17 Dec 2020 22:00:55 -0800
Message-Id: <20201218060114.3591217-5-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Yipeng Yin <yinyipeng1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yifei Jiang <jiangyifei@huawei.com>

We found that the hypervisor virtual-machine load and store instructions,
included HLVX/HLV/HSV, couldn't access guest userspace memory.

In the riscv-privileged spec, HLVX/HLV/HSV is defined as follow:
"As usual when V=1, two-stage address translation is applied, and
the HS-level sstatus.SUM is ignored."

But get_physical_address() doesn't ignore sstatus.SUM, when HLVX/HLV/HSV
accesses guest userspace memory. So this patch fixes it.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201130012810.899-1-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2787b1d48..7274f971a4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -367,7 +367,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         vm = get_field(env->hgatp, HGATP_MODE);
         widened = 2;
     }
-    sum = get_field(env->mstatus, MSTATUS_SUM);
+    /* status.SUM will be ignored if execute on background */
+    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.29.2


