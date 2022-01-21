Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E234959EB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:26:29 +0100 (CET)
Received: from localhost ([::1]:49734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnNU-0005ke-6A
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwv-0006kd-Tj
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:02 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwt-00040G-Iq
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744739; x=1674280739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mUZADo7Tq+txiFZaUQBMhOkhN7lV9jX262x4v3R58k8=;
 b=nkIytf+moN7wLs3XaLsBA+vk/Uh7/oodpGSg4GOmWtiGPaDXlE5H9ues
 Cq/nO4p+gtj6Vh6stEBCfWNYakdtCTvig9T2ewS685QIaWaMmqRZnlCEE
 mMtdFdKFUvsKeSZz8/uSukqxiB4JI/mDJOwqLIi9m0iaF0fecoQLEnaeV
 87k3NksXzkE6uK9DWTSHKEOcY/eTZhHWDBIauqTf3T4VScAWidA8vb0cS
 WpUe4FSLBJZK31KpuRvAPKZzhXmsyHIyTDPfi7k7z/fokBaXSVSkfhIKX
 2suYt3TRfgqc7Lk0oI3IUGHhqITgyWBAJmSahM+N8J+PuixIf603Nh/+e Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976481"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:58:58 +0800
IronPort-SDR: mMT7qDEUNbAIfBpwoYjsfVEALfcJ75F6SJ6fcwESQqgKLoTibnQ+DJZlCbUGvDt0cewPsASeqW
 h/z4gR6Vwnndol0T1sQWnX2iUWteFFyNzv3kR7KSE9nYyo9VaLM7CqbMyt1ejwLjRLfWP2UnwS
 GEVsf+xzEqkUZahUybKprMnGjOADPcOgUOKptMtLSG9wyiPpw7X4lrkWPhUhRtxMs8XeM8x2Pg
 C/rb9igpnrENzW3XLCv8j+g1ALmRNGyEkoSMcep8gKO1BU+PfsjPgDrf8I6EaAUpvGCvYisU+s
 FXKsGVyw8Me+kHo2+jsgnMdH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:10 -0800
IronPort-SDR: hewRf4mOJQDkqWNp6xXXu1mTZzbRwPTR/YgDeZZIj+ZGNTiku+YWbXs7FubcFfkxJqTz+wSqtn
 aI6TDTP8XND1Ad2C9G/6srrQUU9QVEzNEj/Uu+5WoHL0kNCr8NCTcz9aUl4y/eb5tshX62ZI96
 Pa0ox4texa4hTKNITj7O4NIL5ELFroKDF+LVl7M2kecWqwUQ+j+q96S5oAHcKGqD2fVVyNEPf4
 p+Ug1XGr9bse/kqPlohrRBNomeh+kfKBdvFQ8i1u0yeL0eAeOt3bu5aqdCVQwlBj/uar7Cgm1T
 +RA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:58:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7wy4STGz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:58:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744738; x=1645336739; bh=mUZADo7Tq+txiFZaUQ
 BMhOkhN7lV9jX262x4v3R58k8=; b=mCYqhOMOIWDK6mgGv+NQjeWCyy2N2pl+Hf
 yLa/wIXvwOowy8pTtKjUcFHx7qTdMe3WAAltPA7GDDnZcAShjcSU22AgIGRiUhvd
 iMcy5gAEzrRxbJTeRvWM953VIThuZFdtEOwuVbE0npxYzlFtGoTuIoX38/UKhguG
 7O9Jfa57iWOW1C/cmsTtFQ6bHcwZqDbqiRkfOOP5WVOO/YCEp4bP8y/jIZQxjLN4
 dxETBqQTml/I8ifzKjXBKSyPitYJBQJm7kwNVXhs3BVQdv4NJfw7qjpj8hvHJji1
 FMWBbPr5jPsNgy5AAx/diK54lnV1m6l5GwfgPsBnAzxSuPJrn3YQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LMOhEptB4E3K for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:58:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wt33Z8z1RvlN;
 Thu, 20 Jan 2022 21:58:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 04/61] update-linux-headers: Add asm-riscv/kvm.h
Date: Fri, 21 Jan 2022 15:57:33 +1000
Message-Id: <20220121055830.3164408-5-alistair.francis@opensource.wdc.com>
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

Add asm-riscv/kvm.h for RISC-V KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-2-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-headers/asm-riscv/kvm.h | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 linux-headers/asm-riscv/kvm.h

diff --git a/linux-headers/asm-riscv/kvm.h b/linux-headers/asm-riscv/kvm.=
h
new file mode 100644
index 0000000000..f808ad1ce5
--- /dev/null
+++ b/linux-headers/asm-riscv/kvm.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __LINUX_KVM_RISCV_H
+#define __LINUX_KVM_RISCV_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+#include <asm/ptrace.h>
+
+#define __KVM_HAVE_READONLY_MEM
+
+#define KVM_COALESCED_MMIO_PAGE_OFFSET 1
+
+#define KVM_INTERRUPT_SET	-1U
+#define KVM_INTERRUPT_UNSET	-2U
+
+/* for KVM_GET_REGS and KVM_SET_REGS */
+struct kvm_regs {
+};
+
+/* for KVM_GET_FPU and KVM_SET_FPU */
+struct kvm_fpu {
+};
+
+/* KVM Debug exit structure */
+struct kvm_debug_exit_arch {
+};
+
+/* for KVM_SET_GUEST_DEBUG */
+struct kvm_guest_debug_arch {
+};
+
+/* definition of registers in kvm_run */
+struct kvm_sync_regs {
+};
+
+/* for KVM_GET_SREGS and KVM_SET_SREGS */
+struct kvm_sregs {
+};
+
+/* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_config {
+	unsigned long isa;
+};
+
+/* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_core {
+	struct user_regs_struct regs;
+	unsigned long mode;
+};
+
+/* Possible privilege modes for kvm_riscv_core */
+#define KVM_RISCV_MODE_S	1
+#define KVM_RISCV_MODE_U	0
+
+/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_csr {
+	unsigned long sstatus;
+	unsigned long sie;
+	unsigned long stvec;
+	unsigned long sscratch;
+	unsigned long sepc;
+	unsigned long scause;
+	unsigned long stval;
+	unsigned long sip;
+	unsigned long satp;
+	unsigned long scounteren;
+};
+
+/* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_timer {
+	__u64 frequency;
+	__u64 time;
+	__u64 compare;
+	__u64 state;
+};
+
+/* Possible states for kvm_riscv_timer */
+#define KVM_RISCV_TIMER_STATE_OFF	0
+#define KVM_RISCV_TIMER_STATE_ON	1
+
+#define KVM_REG_SIZE(id)		\
+	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
+
+/* If you need to interpret the index values, here is the key: */
+#define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
+#define KVM_REG_RISCV_TYPE_SHIFT	24
+
+/* Config registers are mapped as type 1 */
+#define KVM_REG_RISCV_CONFIG		(0x01 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CONFIG_REG(name)	\
+	(offsetof(struct kvm_riscv_config, name) / sizeof(unsigned long))
+
+/* Core registers are mapped as type 2 */
+#define KVM_REG_RISCV_CORE		(0x02 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CORE_REG(name)	\
+		(offsetof(struct kvm_riscv_core, name) / sizeof(unsigned long))
+
+/* Control and status registers are mapped as type 3 */
+#define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_REG(name)	\
+		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
+
+/* Timer registers are mapped as type 4 */
+#define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_TIMER_REG(name)	\
+		(offsetof(struct kvm_riscv_timer, name) / sizeof(__u64))
+
+/* F extension registers are mapped as type 5 */
+#define KVM_REG_RISCV_FP_F		(0x05 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_F_REG(name)	\
+		(offsetof(struct __riscv_f_ext_state, name) / sizeof(__u32))
+
+/* D extension registers are mapped as type 6 */
+#define KVM_REG_RISCV_FP_D		(0x06 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_D_REG(name)	\
+		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
+
+#endif
+
+#endif /* __LINUX_KVM_RISCV_H */
--=20
2.31.1


