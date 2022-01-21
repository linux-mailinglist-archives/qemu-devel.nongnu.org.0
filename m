Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0A495A47
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:05:47 +0100 (CET)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnzW-0001fH-Ag
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:05:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxd-0006oc-3B
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:52 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxZ-00043A-Ry
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744781; x=1674280781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmbQ/ORiNcIEjhWxhBGyJulShQ/Q/k1kRzakz3eoAEQ=;
 b=O/pwq+9jx4mNO2LlmpCRiabCChtK4CvI+6UxoedT+H1xwOWLkAVGFMAb
 S4u+nixYORd/ZDj+sR1sdGwLn5DojEUX++/6+ivP0zDNYW3fhmmonFpdq
 W1kK/8ikVVEjN8Px8DMxRhfunXMqE6aLIjM7xios3BRtTEDoY/LmIEhXW
 TVSv+PGr1bTzl07NDQw1vHeFntYqO2wzFoRt8x0aakc6Pjn+j1MfPxSxz
 x49j+2UNfpVLjG4O97CZUJXFk6gLXnSbUisEmCFAvUHJln+E2O4sdNxak
 8BNM8XF6uZtOXsTW7vg8hVFO6R5TVptgNiB4r+mLVIQhYhpNPR12crcpU Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976529"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:40 +0800
IronPort-SDR: Sgpw0OujWdscDzUFNpncesj0U8/0xLeLZRwSEAQ1XDRQaOTigM216fu8kylxGm2EkF0jsp2/vJ
 h74QzYc6umF46NqvkTTAg8245W4selIWuHGR/JLkNtoL51u5/uv2p5ZhBtCcPQ+8VKrBGXOju0
 oGAqu0kmumLgnnp6EvVFMzUyHV8vNVNcCeyCN+HljjyxBnBabcXsPuN97B10dOKkimzv509ZpA
 /gPoAn7SxG4sa5bHVOL8C5Fr7Xh5z9k0nqHltPVb9ZuQyLcmnQxdylcnNsVAFVC+Axw3EpvwR5
 0xqYvP+zpkCq0Pcd/BXagHdM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:51 -0800
IronPort-SDR: x65nL4lIPP2/N2Q+OxYL6N1PBBks7gYGtbIHsLNSszdQjQfrYvl1OlxWkH7cdxn4PG2UQ2yNhF
 5+1yPmmoMupqlMKYA/In3zj76HoiFx6+dEpRS2jDCyZPartYIpj6borxY6HadhU2j1IuBil5C8
 34EQYWAR96K8b6MDe5Uxqz5s4YdOACfeP4cvYKdsik9ZsLu/l9SjAt2jDECcUiJX+2mqFwC/K1
 H7BkrUU9Bf5xAP2Fwf+Deb1W+AKk8+a1buH6TCexmDcUai1PFYaZK2UIzjMoKFWL8Qm7cpddws
 joQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xm438Cz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744779; x=1645336780; bh=cmbQ/ORiNcIEjhWxhB
 GyJulShQ/Q/k1kRzakz3eoAEQ=; b=S++YpBZm8PQ+UoFVbuhs73NyLxKtBFAkCc
 N42Po9ZgbiuNMmZ5E+LZqYFp2kCPloDRjlrQQx3jZHtugIrwHQSXOTVQNi8CknHe
 6hsSNPZFXfuMB0W8zQB/3KWuO8tqTz/LC7Ii85ASk1i1Qqh9aNzkegYc0qGaj3Mr
 GW+cMdzzCTL+MDKr+1VDxkKu6PqRvHWpsaIBqw8pggRHc7j4vpjtAjpW48P5ATIQ
 tyDPL1wqIcRbqbmO1Fy2FrAYnVhNkAlszupZKq4mjaBQxDR0397EZUmBWu4CLoxD
 H9i0DxFa5fHXk6TNW5BiwjYX6hJiXLkNpt3Vp1OZ8WLFGpfSF8zg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YTAN_se3yoVs for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xh2R0Xz1RvlN;
 Thu, 20 Jan 2022 21:59:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/61] target/riscv: Add kvm_riscv_get/put_regs_timer
Date: Fri, 21 Jan 2022 15:57:42 +1000
Message-Id: <20220121055830.3164408-14-alistair.francis@opensource.wdc.com>
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

Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
from KVM.

To set register of RISCV_TIMER_REG(state) will occur a error from KVM
on kvm_timer_state =3D=3D 0. It's better to adapt in KVM, but it doesn't =
matter
that adaping in QEMU.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220112081329.1835-11-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  7 +++++
 target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 73ced2116b..22c94d3c57 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -273,6 +273,13 @@ struct CPURISCVState {
=20
     hwaddr kernel_addr;
     hwaddr fdt_addr;
+
+    /* kvm timer */
+    bool kvm_timer_dirty;
+    uint64_t kvm_timer_time;
+    uint64_t kvm_timer_compare;
+    uint64_t kvm_timer_state;
+    uint64_t kvm_timer_frequency;
 };
=20
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e90e2a6709..a43d5a2988 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -40,6 +40,7 @@
 #include "kvm_riscv.h"
 #include "sbi_ecall_interface.h"
 #include "chardev/char-fe.h"
+#include "migration/migration.h"
=20
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -65,6 +66,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, ui=
nt64_t type,
 #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CS=
R, \
                  KVM_REG_RISCV_CSR_REG(name))
=20
+#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_=
TIMER, \
+                 KVM_REG_RISCV_TIMER_REG(name))
+
 #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP=
_F, idx)
=20
 #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP=
_D, idx)
@@ -85,6 +89,22 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, u=
int64_t type,
         } \
     } while (0)
=20
+#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
+    do { \
+        int ret =3D kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &reg=
); \
+        if (ret) { \
+            abort(); \
+        } \
+    } while (0)
+
+#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
+    do { \
+        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg=
); \
+        if (ret) { \
+            abort(); \
+        } \
+    } while (0)
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret =3D 0;
@@ -236,6 +256,58 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
     return ret;
 }
=20
+static void kvm_riscv_get_regs_timer(CPUState *cs)
+{
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    if (env->kvm_timer_dirty) {
+        return;
+    }
+
+    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
+    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
+    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
+    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
+
+    env->kvm_timer_dirty =3D true;
+}
+
+static void kvm_riscv_put_regs_timer(CPUState *cs)
+{
+    uint64_t reg;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    if (!env->kvm_timer_dirty) {
+        return;
+    }
+
+    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
+    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
+
+    /*
+     * To set register of RISCV_TIMER_REG(state) will occur a error from=
 KVM
+     * on env->kvm_timer_state =3D=3D 0, It's better to adapt in KVM, bu=
t it
+     * doesn't matter that adaping in QEMU now.
+     * TODO If KVM changes, adapt here.
+     */
+    if (env->kvm_timer_state) {
+        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
+    }
+
+    /*
+     * For now, migration will not work between Hosts with different tim=
er
+     * frequency. Therefore, we should check whether they are the same h=
ere
+     * during the migration.
+     */
+    if (migration_is_running(migrate_get_current()->state)) {
+        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
+        if (reg !=3D env->kvm_timer_frequency) {
+            error_report("Dst Hosts timer frequency !=3D Src Hosts");
+        }
+    }
+
+    env->kvm_timer_dirty =3D false;
+}
=20
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
--=20
2.31.1


