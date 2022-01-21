Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B00495A15
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:41:37 +0100 (CET)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnbt-0002qF-Tr
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:41:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxa-0006oM-So
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:46 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxQ-00040G-HS
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744772; x=1674280772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jcDgzCR1d4N0XkvAublXv0+ezCSv19gF+QFUYEZ8Mc0=;
 b=cMvYXm7dI4fzJZG+62OwTvWAz+vFslxmt5uW9K7ZSD0OLU0dLA243W3h
 9HOHUGojnucVF7jBuHidY/QmjC9UT8EuwYu09ieeE3N4gOQQZ8i7/t1gy
 XwOgGT6kH+grbqu6P86162y8h7e8WtOASpFLZEN0AMb1pPE5rHeQyGTC7
 PMJrQtSYh36i3L3M0AFPBcut2Jjb7AYAFOxUX+OYZQF4JVOohBinKn+Eq
 y8h+Wjjut82qyZ+VZmtyJPk73pkFck6Mzq/J4t0+eSSTluF5X/qUiNlv0
 yhJ4j7kvKyADWJWJufx3Xe8wnDDEsWRJ3RQQCUpARDQrn0ADcUzphEpiE A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976519"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:26 +0800
IronPort-SDR: WfFqWBXePpaYov5xMXrk6SgdsnQYHY50NPWnJwmUFXP2S1sThBiZUY3NCGfVgKv+w5AiUVXLTW
 EJcmVUIWOpAEeiMWDJLYP3BU74ELS3gXjmoVvX3MFJAHKswHXNjFHtNAhSHs19gt6YCDwPmFpk
 09YvAY7LhT3OLQcuvKyib4oF4XpVWJMADnDAPgEkf6C0wynj2QRlaNwFW+WdfusjEzx8oCMIZ5
 Laijl2lM48MOLy7WELS036NcgxDkcQrv3dh72gGmcCwb8uBZNpriK3f7x7OgHT92VOZUlvcRmH
 rUMhApxP69CpYC11RsjWTw4f
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:37 -0800
IronPort-SDR: s6O3ilBqjuGE/BYsDc1w/37pS040G3WdX7zl92dMcGVW9CqhjAGkMQtNA5UjLFQmswUrAk4CaP
 WxUSEp4uWdc0IXROjfq0Wk+SHuVSBscjoiEs9Ph/DYlY2OtHQkzK6lzKH2C6Pco0ugDe/K4+dR
 zzCMLOCdGVkjSlIVJzGjBW5CSlnKAsoydp05aah/q7UjwgyPqsio2458VnlvZkg+gepCoI0tHH
 YJBTD+mswG6idNQ5MIzsVOOVKJZm40db5u7fvCFQNX/Mxl/BtW7TT3dTk7/aFJhuQw6H/gNs+z
 AgA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xV16Qnz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744765; x=1645336766; bh=jcDgzCR1d4N0XkvAub
 lXv0+ezCSv19gF+QFUYEZ8Mc0=; b=LZ6oKBlyXbvblgQrVjrA91JhSEZ+jh+V8q
 mP76BHMF4IPKKMmMzuCLcARCX8H5S9PRmxnI+CCbs9323gNSsuiB5HUjHbrjl5uX
 K8Ezy51yCdezyrX+iIU1OIQMigW0bXbUikgjB0ivpw+t5hft0iLgxxr7uAu+k5z5
 f/dPBJuxuh73t1R/JgnDTsTlkJA9vwkMHDKtabYNEiD4n/15y2ynSol7kaOQcaiG
 ZlYNrLi/LaeECAORW4VLtitvHMrhwV+L9Uyow/t3BkLN2+kLCRbzJV78EyKpIXe7
 gO0NTSpkm3FaY63lzyWdpQfi3Ip3+8yk4Eg919LaSN9S7RkMoKng==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EZN9cGNukbSW for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xQ1CN7z1Rwrw;
 Thu, 20 Jan 2022 21:59:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 10/61] target/riscv: Support setting external interrupt by KVM
Date: Fri, 21 Jan 2022 15:57:39 +1000
Message-Id: <20220121055830.3164408-11-alistair.francis@opensource.wdc.com>
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

When KVM is enabled, set the S-mode external interrupt through
kvm_riscv_set_irq function.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-8-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm_riscv.h |  1 +
 target/riscv/cpu.c       |  6 +++++-
 target/riscv/kvm-stub.c  |  5 +++++
 target/riscv/kvm.c       | 17 +++++++++++++++++
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index f38c82bf59..ed281bdce0 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,5 +20,6 @@
 #define QEMU_KVM_RISCV_H
=20
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
=20
 #endif
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a6922dde05..53b0524830 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,7 +630,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq,=
 int level)
     case IRQ_S_EXT:
     case IRQ_VS_EXT:
     case IRQ_M_EXT:
-        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        if (kvm_enabled()) {
+            kvm_riscv_set_irq(cpu, irq, level);
+        } else {
+            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        }
         break;
     default:
         g_assert_not_reached();
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
index 39b96fe3f4..4e8fc31a21 100644
--- a/target/riscv/kvm-stub.c
+++ b/target/riscv/kvm-stub.c
@@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
 {
     abort();
 }
+
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    abort();
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index d5c6a9d41a..0ba64795d5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -385,6 +385,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->satp =3D 0;
 }
=20
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    int ret;
+    unsigned virq =3D level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
+
+    if (irq !=3D IRQ_S_EXT) {
+        perror("kvm riscv set irq !=3D IRQ_S_EXT\n");
+        abort();
+    }
+
+    ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
+    if (ret < 0) {
+        perror("Set irq failed");
+        abort();
+    }
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
--=20
2.31.1


