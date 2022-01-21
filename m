Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C644959CB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:19:14 +0100 (CET)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnGS-0008Ad-Pz
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmx1-0006lf-6j
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:08 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwx-00040G-Su
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744743; x=1674280743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Mxt6+niEf4WETwk+6PeKYyIx+2d82BH7pLHtt/UjZo=;
 b=NWs9pkBURmJUJBQW7qzrKpxKRki6MF00E0MCXHpPYAcRSrbqyEdjTi+d
 cTljY/26vbMSqwMSgmTCDrIaumDyIuUB5Gsmzaxht2cyAomRbzVO8EoR8
 5HLyQGB5kqtkkFQcLDqt/xn/p+VpDSmPra5jOeup8mB1+7TyqQ95kW/3E
 Z1BFF3E9IHO3pwqWio3V6bML38v3f1xE2PPFE9jLxcUPq7cLQ6CndI038
 olH/6bFBLb66FPQ3sZeh5JzPoH2LL8SNtWvBH1TjuYQlARDzXinINybIR
 u73BAcdM1b3eFQ4wbLBERTKIFrKq9aQEt/ZZKoqDcXmEXciTGSiiZ8IzJ A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976483"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:03 +0800
IronPort-SDR: mc2qenAfoWXZhlO6ebbdm7CciJfmRFzoN2j+uhckHy3CK44lzhvTP5b5G2PzEU2dh1B3MolTlv
 +7uCiRqv3oxAS7WL3nL7ZYagSSYhozrVENmeH0kL7ZAZgyiVTpV7jw5HfpLbkrkzraMOMJBc/P
 ifyig3jCD+E0MaaseXhWAnES18O+8fhOZlYzBCfxCKFGV4VQm0g6jN7siPZmsoRFJPQ48Ya7X9
 qbeECYOqq8VHPtXr28Z6nUl07/vQuLZ7jkPTbxokImExec5qs/w+vQC00j4w5DSdjv1M8g5vuo
 +MZTbGurZ8w8IA9Qwq3jbZUh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:14 -0800
IronPort-SDR: JqOiKzYElYwFiqKpAliCVXnq4HYs9iF3US2z/WkMUyqfeShE3lJAaY+KdsJsIwIYyILvJ0jBKQ
 X5mG5DcHP3KfweYWeIkpJOtXgAF/8WsJaEh/F6OXvVpX0/kXrj3AzbpmpOuaTlcBQSZHDbjLBR
 /OCZME9Y8RpOLiRiq72g5HaVtQcujyAg+OkKPrI4qmq6aLYOlCshDEtAoyvr+Z4XoFxTAz94AG
 TIZv+5+zejhxkumVILE/tFXHlr93+wqiYA1K3nd8m5H5jyYyeEFy56gKDrR6FZUuINfSHP4Ldf
 yqs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7x307Gyz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744742; x=1645336743; bh=7Mxt6+niEf4WETwk+6
 PeKYyIx+2d82BH7pLHtt/UjZo=; b=LnADJjg51fPAB21yv1MLag2a1Qo4rFzJBU
 8DgWEead9aTFoaxW1tZxLrw3nvAfujov9EutmhwLSiddzpAaoC38jB6s/VmR5A7c
 vV2AUNS7KUHI5jbYAxNQOGs9Gc/IkjG20t1MwrOV3IuJKDi7lGS6rxz2WGd4zSdC
 g39spttSO3kMgLCNrTYcT966pNvnWR1CD2/173uB+G23Qc2v1/TESB+pbR1V1A4y
 u+2oLQD1DJacajvaxsb1pCHQCDjNTLohWQJ1ijAcH1vrcj67g0ZVOcztSBMLUj3J
 hlqev4PxTHm3WwYg4B4SkIYQ+vAnQMtObf++SK9zxs3YpRKdRjSg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3MtilVlM2kqY for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wy6PyXz1RvlN;
 Thu, 20 Jan 2022 21:58:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 05/61] target/riscv: Add target/riscv/kvm.c to place the public
 kvm interface
Date: Fri, 21 Jan 2022 15:57:34 +1000
Message-Id: <20220121055830.3164408-6-alistair.francis@opensource.wdc.com>
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

Add target/riscv/kvm.c to place kvm_arch_* function needed by
kvm/kvm-all.c.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-3-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c       | 133 +++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 target/riscv/kvm.c

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
new file mode 100644
index 0000000000..687dd4b621
--- /dev/null
+++ b/target/riscv/kvm.c
@@ -0,0 +1,133 @@
+/*
+ * RISC-V implementation of KVM hooks
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+
+#include <linux/kvm.h>
+
+#include "qemu-common.h"
+#include "qemu/timer.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
+#include "cpu.h"
+#include "trace.h"
+#include "hw/pci/pci.h"
+#include "exec/memattrs.h"
+#include "exec/address-spaces.h"
+#include "hw/boards.h"
+#include "hw/irq.h"
+#include "qemu/log.h"
+#include "hw/loader.h"
+
+const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
+    KVM_CAP_LAST_INFO
+};
+
+int kvm_arch_get_registers(CPUState *cs)
+{
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
+int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
+                             uint64_t address, uint32_t data, PCIDevice =
*dev)
+{
+    return 0;
+}
+
+int kvm_arch_destroy_vcpu(CPUState *cs)
+{
+    return 0;
+}
+
+unsigned long kvm_arch_vcpu_id(CPUState *cpu)
+{
+    return cpu->cpu_index;
+}
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
+
+int kvm_arch_init_vcpu(CPUState *cs)
+{
+    return 0;
+}
+
+int kvm_arch_msi_data_to_gsi(uint32_t data)
+{
+    abort();
+}
+
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_init(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
+int kvm_arch_irqchip_create(KVMState *s)
+{
+    return 0;
+}
+
+int kvm_arch_process_async_events(CPUState *cs)
+{
+    return 0;
+}
+
+void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
+{
+}
+
+MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
+{
+    return MEMTXATTRS_UNSPECIFIED;
+}
+
+bool kvm_arch_stop_on_emulation_error(CPUState *cs)
+{
+    return true;
+}
+
+int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
+{
+    return 0;
+}
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a32158da93..95340b44aa 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -20,6 +20,7 @@ riscv_ss.add(files(
   'translate.c',
   'm128_helper.c'
 ))
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
=20
 riscv_softmmu_ss =3D ss.source_set()
 riscv_softmmu_ss.add(files(
--=20
2.31.1


