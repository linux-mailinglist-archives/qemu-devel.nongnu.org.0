Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F54959F5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:32:29 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnTH-0005Gm-V8
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:32:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxa-0006oN-Tn
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:46 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxR-00043z-SD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744773; x=1674280773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t8qL4vn7jVFxlFStPbaok4siaiDlV6DUKqRng2liUmw=;
 b=cwuzqOOFcug8gLcuhidse71cdSa+pojEz+gb/6PVQbrfZjKkxFfvyAa9
 2dea+vr46m9TWZUgBB9Wa/OKAnkdlA8oaRbQuZaKoPBuApd5DTU7RFzGP
 0YzvQe/DQayeirnU7JK7eNGYL+HAgqVSXbPj8XH7WRtWYNBLe1uAOmhS9
 elvrBpY6B1WOXftd4hyBD+f/3QZkIWo23zIBo0xcv54F5yDURffgaUSyr
 FgR7JQLBCYeYX/uZ/QR3vidPiB8GBfX7+Dox3S5pL5X7w1WlxtPJ4VcAz
 PjZ93KJ7El725oh+9qUEbVxttFw7jmo+Z/2sucYFK95fCik/9GItX7IpK Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976521"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:31 +0800
IronPort-SDR: SgL63+Wl3oWQgS2ulhHBt08Dh5QxxE2ZaBqqz8Yb1JMea/xZuwyCR53nN4f5a4WjHe8gWVRaSD
 nF0t1LDAWm3SuhL9zuXv4UmOMjl9a2+bXeg7dF6OCGK2sCD21nzxR1QUaUe4ATm8SYRYGgUkI/
 FTGOwZgsIGJHEOb+znbQs0zuo5GbadoAroblLOgmqmj9CYVgO0jl/yI3LdYg2Nk6rywEzUfbOh
 Td2EtsSA8P0RgwQ6LINMXlAl27KErhMdsRPWG80JdsauwGEYXeX6jXyeIr/SrGrNElzYMe/2V4
 leGJ42IrwhGLYVULC01dfDso
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:42 -0800
IronPort-SDR: RPk5+JulY35LbC1Dj8Sth/qAoioZ/lpMCk5M1Wui9bcgfablZ1CPSUTiQF5n/H9oEFmtkTIVFs
 0EElP7Ef1XgFtAMzdV3BoRRQ7fIQVYxitELsXXrAamG+Tc12IDvSHOMFEihXMF3IdwbE3tHk0a
 nQ6Z7h0gPv9WtB8b5gnEdi76+JYXY/uOVJMUr8JmQGlpgIZCbAGWZBF80O0MMAHMmfF5nJbbUu
 AOHnUYgx2UxjgeoRoDl3QWWfxQ+Xndq6PrscZ442RaKiEuWkgPwZvHA5oCM1M4sRCiu7igEnD1
 K4c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xb0D96z1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744770; x=1645336771; bh=t8qL4vn7jVFxlFStPb
 aok4siaiDlV6DUKqRng2liUmw=; b=fyxskvV8mNku02rhvPKffGytCt+b5V04HF
 swZH9XFsCobC5+e4z8nMa0LeJs1ZQ9JHi5AbtGDMajurF7f4R9DIxjcmTXJv+fTi
 dRq136EePtSH1bic9W3SjoVRh2wkkFwuGk4eS7tyT5PSG3ABFTaF+96bLYJmkODi
 C/f+sMm/01PzWJs4TkZTM7aKKS/u4er7X/X34IAsZt3eBJ+RBYrqKvejhlsgf85y
 NDS8RZbmmOPv1CwJYZVVyOxJ1Ym/q6LUDWrNTHvEJPlKM7wx8jqI8OZJio3oF3rK
 xCN3wNx3KmEeuoD1wPvtweYBtKIAb2DkFOp8vTvSSWTF8pHLkv3w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Hd3i-ZAKFg0n for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:30 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xV3hNvz1RvlN;
 Thu, 20 Jan 2022 21:59:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/61] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
Date: Fri, 21 Jan 2022 15:57:40 +1000
Message-Id: <20220121055830.3164408-12-alistair.francis@opensource.wdc.com>
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

Use char-fe to handle console sbi call, which implement early
console io while apply 'earlycon=3Dsbi' into kernel parameters.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220112081329.1835-9-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
 target/riscv/kvm.c                 | 42 ++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/sbi_ecall_interface.h

diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_=
interface.h
new file mode 100644
index 0000000000..fb1a3fa8f2
--- /dev/null
+++ b/target/riscv/sbi_ecall_interface.h
@@ -0,0 +1,72 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __SBI_ECALL_INTERFACE_H__
+#define __SBI_ECALL_INTERFACE_H__
+
+/* clang-format off */
+
+/* SBI Extension IDs */
+#define SBI_EXT_0_1_SET_TIMER           0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
+#define SBI_EXT_0_1_CLEAR_IPI           0x3
+#define SBI_EXT_0_1_SEND_IPI            0x4
+#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID 0x7
+#define SBI_EXT_0_1_SHUTDOWN            0x8
+#define SBI_EXT_BASE                    0x10
+#define SBI_EXT_TIME                    0x54494D45
+#define SBI_EXT_IPI                     0x735049
+#define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_HSM                     0x48534D
+
+/* SBI function IDs for BASE extension*/
+#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
+#define SBI_EXT_BASE_GET_IMP_ID         0x1
+#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
+#define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
+
+/* SBI function IDs for TIME extension*/
+#define SBI_EXT_TIME_SET_TIMER          0x0
+
+/* SBI function IDs for IPI extension*/
+#define SBI_EXT_IPI_SEND_IPI            0x0
+
+/* SBI function IDs for RFENCE extension*/
+#define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA   0x3
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA   0x5
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
+
+/* SBI function IDs for HSM extension */
+#define SBI_EXT_HSM_HART_START          0x0
+#define SBI_EXT_HSM_HART_STOP           0x1
+#define SBI_EXT_HSM_HART_GET_STATUS     0x2
+
+#define SBI_HSM_HART_STATUS_STARTED     0x0
+#define SBI_HSM_HART_STATUS_STOPPED     0x1
+#define SBI_HSM_HART_STATUS_START_PENDING   0x2
+#define SBI_HSM_HART_STATUS_STOP_PENDING    0x3
+
+#define SBI_SPEC_VERSION_MAJOR_OFFSET   24
+#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
+#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
+#define SBI_EXT_VENDOR_START            0x09000000
+#define SBI_EXT_VENDOR_END              0x09FFFFFF
+/* clang-format on */
+
+#endif
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 0ba64795d5..e90e2a6709 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,8 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_riscv.h"
+#include "sbi_ecall_interface.h"
+#include "chardev/char-fe.h"
=20
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -367,9 +369,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
=20
+static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
+{
+    int ret =3D 0;
+    unsigned char ch;
+    switch (run->riscv_sbi.extension_id) {
+    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+        ch =3D run->riscv_sbi.args[0];
+        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
+        break;
+    case SBI_EXT_0_1_CONSOLE_GETCHAR:
+        ret =3D qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
+        if (ret =3D=3D sizeof(ch)) {
+            run->riscv_sbi.args[0] =3D ch;
+        } else {
+            run->riscv_sbi.args[0] =3D -1;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: un-handled SBI EXIT, specific reasons is %lu\=
n",
+                      __func__, run->riscv_sbi.extension_id);
+        ret =3D -1;
+        break;
+    }
+    return ret;
+}
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
-    return 0;
+    int ret =3D 0;
+    switch (run->exit_reason) {
+    case KVM_EXIT_RISCV_SBI:
+        ret =3D kvm_riscv_handle_sbi(cs, run);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
+                      __func__, run->exit_reason);
+        ret =3D -1;
+        break;
+    }
+    return ret;
 }
=20
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
--=20
2.31.1


