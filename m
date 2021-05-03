Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2B37230F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:38:45 +0200 (CEST)
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhDA-0003ln-Tq
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqm-00060B-2u
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqj-0000ID-TA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080133; x=1651616133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eY64W9JB7jnGvaakjv5BADNjhl2X/P3bfdlkpxmil/8=;
 b=mAWgYDolKL0Dz1DUgS61XIyER3fHsYK3efjh6CgvJaivZAqYBvoXFx7h
 ShsL7ZUvwxvFtslJ9aGm0qCE4gxJtYi9qk8i1DQDNW/YDeNtfmoDxK1R4
 z0HwwXmMWe6wDrEG/9NSrOUuqlhqOE+H4uqFyO0yvmhZDmH7hOf536Fdj
 xoUBYZQTAI4/1ra8tFFxdlNtvlXLlGU9H9tQaSdisSPQX6WJzamk/1Aeu
 ny143nAglEP1EdK+XgUbe2//YjB7aNwg1Mo/xZKIZDlR0/UIZd9DGeNFg
 AaPT9OgtuBLuim0AKxNLDV4HxBCoNAznJAbjOiNr5Z5NBUx5g7bVu11m4 A==;
IronPort-SDR: FyGcpEC8KIpV+MRmhOjseNEpNzzNnkbqnGV4rdPzypaXVTeadwhUh2hawNj1iFkZguNYt8VYov
 j4asi+GlKPo57YUGcQmLw1OXOsmjpw7M4GC32y1V/da8Q/HFfZbp4ut6OGdHwoCq/rV1bxY/Mm
 npWlXW8rr1bfoaefv4KLr39YwLwuo/u78karScKrC0VjnbySCzodzazoMC3nhg8PHlbJFfZI9k
 49KyupnFGPr6nn88yhRUogFRUQY06cVcEPQ6O13XTLSYj7UMeIMncpDu4qqss/5sT3ciLSufdT
 rUk=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114681"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:04 +0800
IronPort-SDR: IIkieemVzKODqFwfisi2/MGlwQHDd0mj5JbezBVMeFQzmZ5Dg4QUqJdLFn1ZfgwJaJtFtdki68
 vqkLnohum+b9WC+7JagAQK/r7IP0ZLGZA+YH7E00Cxqo14SV7kxIQijcEBjbvF6A5wbg/2xb99
 Y2N0dys3hYUSha8GQ9vRdqWf0NipQG2JMRYYyLsHV2kPC0mkFpqydX32SKJOhTF6z/dJlnbSwR
 kOXJMGjLS59tXbS/BMm5m5CoZQgA+9nfeq7GnAhnzmtifVfL92HaZkS/NOM0Atw76QKtK5/95N
 BYLaU2+ty7e4YI0j9O8QI/pd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:15 -0700
IronPort-SDR: 5usfdQ4BQo0E4fGX+1QuQ2z3/4Ly4CGsQ7YkI3Em9/0qe9fiZci2YxNvZPcxVPQH+UE3dn/ihN
 fV9ozQvLS/gh4DvLrE0z0/Bz0fjh/cQrEObtwvoTplUjPEUc/IDRaRBzrUtqEFEZZpsPWBDX8u
 g26d/F+263DZUJGQXPadtiK1yC8M33cwBwDCYc9swUVKXTE7kd+AxCs5rhb1FPUwQHscuM9zom
 Og6x560Xq6z0vtLEswso1PjWSZd+48dCRviipPPmg4S481q7HruJN0c9Gjak0KYCz3Lbwbvwjj
 tko=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 25/42] target/riscv: Add a config option for ePMP
Date: Tue,  4 May 2021 08:13:10 +1000
Message-Id: <20210503221327.3068768-26-alistair.francis@wdc.com>
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: a22ccdaf9314078bc735d3b323f966623f8af020.1618812899.git.alistair.francis@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83b315e0b2..add734bbbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e530df9385..66787d019c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -412,6 +412,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         set_feature(env, RISCV_FEATURE_PMP);
+
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        if (cpu->cfg.epmp) {
+            set_feature(env, RISCV_FEATURE_EPMP);
+        }
     }
 
     set_resetvec(env, cpu->cfg.resetvec);
@@ -554,6 +562,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.1


