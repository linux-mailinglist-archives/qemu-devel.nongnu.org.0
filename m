Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCEF4959CD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:19:16 +0100 (CET)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnGV-0008Ge-3u
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmx6-0006ml-Ht
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:15 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmx2-00040G-1g
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744748; x=1674280748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pIeG3ufrkiPsI31qkW5RFpYT7Trsq1rH9/UfpLv99dw=;
 b=bd1ZxrUXDh6vCbvmaZ3tWAwO+3gV4nHDOMj/1Hch2PJjvI7VCjehOaLZ
 rxx3WDIVnnkRk1OJ6azpD1rr9vrHxmy6IieaU3iayPIJbygVEt3zEFDs7
 a/jZ85Hk1Q0oyXVOLdfNLp+R92sSyR3/9FC3bs0zXR0tUMYxOv8++LZKq
 2owtkCQrocaGps84t9PeWChwXz2NvwoCn7fMGuUhxQM+I9bKNdRghHhNQ
 NrSwvXXDyqz6dZDyjVD9SUj2T/oMPsENlW++S6kUnFKxk1TwBZhcvllHk
 m/V4aDlTyWQ5xT66/JtaLmyh0NTDRPrppVqoAvMUAS7DU1EKu/L4PMNnQ g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976486"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:07 +0800
IronPort-SDR: atU/imKWKeh1r76EL+nn9I3KYLdKMrgmXHg5fwk0VbN73vMGXyxQzd7zTPbDRQ2byMXPil6TWl
 UMPC97yhqTOUAIzzhmaNRGnRZTSq7tUfSE+R/P3mQpFYyFqm0QxOPvFgZ2Vn/IEzDpYISFCzSr
 DQ52rMMz6EQepBr1vC4MhWteQ3DFIkCaHjtd7pYPqmPA0xdU5qqIU7stGo+KQqWW47tokPS23n
 eUlgZI6GnYFfCHE0TNyYAvZ0KTU15fK6K0jw/EzmuzeiKU9wQ0bCI23/LzUa2405pZptZ2vq8I
 bTMsp2C3Ai9QYhW3DP9TgvbF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:18 -0800
IronPort-SDR: 1E/eKJtisgVP1tTxAZMF1e0h27IpkSskYHidLxt3hdrNeBy21HiVkGj1fLMpfSvo+D62fsjMX5
 Fs9CKcNT7NcE7OV4kFaYyvw+QZKdGL0UgTLWKdjfKMsI+l9Kln2ohPNOpJU+/tci5l+qFylPG4
 6gUOmk35oS8b3RiDXeKknJlwilx2TMoTEWClHSdC2k+53vsf5x4UtPQ13sqXl5bhgikMdMSlxi
 vQXb+V+TC5bMRp0gPFdxx9ot0SryIORYgqSWW/AuW8OOi4bp4kYHBOiG92Lu5GnBO20+4jNCL5
 G0g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7x7112Jz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744746; x=1645336747; bh=pIeG3ufrkiPsI31qkW
 5RFpYT7Trsq1rH9/UfpLv99dw=; b=V1yW5tNv8uHwO3397FzCufFm+H17KTEcTv
 UvBqW+9BrJpWhaJTEEG0WJZRaqH0XXTDiECI53Ggji+EkPSse6Pw9wgu4DL3DtGF
 o3GJkvH4W1KhnarjhqsdyQZ6Fi6WPAx9nLm9Qn41MnXVkpxXUeepObXPaFsb83Hz
 tX78uOIvtCfKEshW4ZS+BzpZvkoXhjFlI45BC/+Zo9eUAqv4HmqluA54qySl2k3m
 W6fv8hTXK8NZwQDezm17i5l4gvZwQ+A6gfdrtxpiCfAo+RxwfYhlxE2mDNb8p8wM
 1PhsVIijtnx6wmJ0Q6dibkMU6RF5EvDZOnSjPISfARt5lCMMz80w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yg8blW3onqFH for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:06 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7x319drz1SVp2;
 Thu, 20 Jan 2022 21:59:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 06/61] target/riscv: Implement function kvm_arch_init_vcpu
Date: Fri, 21 Jan 2022 15:57:35 +1000
Message-Id: <20220121055830.3164408-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yifei Jiang <jiangyifei@huawei.com>

Get isa info from kvm while kvm init.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-4-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 687dd4b621..9e66b4a97f 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,24 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
=20
+static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
+                                 uint64_t idx)
+{
+    uint64_t id =3D KVM_REG_RISCV | type | idx;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        id |=3D KVM_REG_SIZE_U32;
+        break;
+    case MXL_RV64:
+        id |=3D KVM_REG_SIZE_U64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return id;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
 };
@@ -79,7 +97,21 @@ void kvm_arch_init_irq_routing(KVMState *s)
=20
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    return 0;
+    int ret =3D 0;
+    target_ulong isa;
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    uint64_t id;
+
+    id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                          KVM_REG_RISCV_CONFIG_REG(isa));
+    ret =3D kvm_get_one_reg(cs, id, &isa);
+    if (ret) {
+        return ret;
+    }
+    env->misa_ext =3D isa;
+
+    return ret;
 }
=20
 int kvm_arch_msi_data_to_gsi(uint32_t data)
--=20
2.31.1


