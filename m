Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA84959EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:26:28 +0100 (CET)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnNT-0005pm-62
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:26:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxh-0006q6-Uy
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:54 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:9014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxe-00045v-Fp
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744786; x=1674280786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWAnr9MuS2FDQIY1PgCeYFbKV/fQuIp/tlMSrQcRBvQ=;
 b=QNnpbs6VTquDEITP7SPiXDex9eqUpE24PwGZ+cPDz7HLgzp5KiYSzCrE
 /UB/Cn5A4csCCu4hnm79JT3YrEpHP9O+l17f5enKAZeD9m3bNwMy7oYAo
 WWyrY3EHvO79U6RMRTjgh/syoXXIhCx7dOcE8QuvGHQx06TXDurTikQct
 ODeYZJ5cZEbGu8EW4ppv5M7479KSfPWdXeAC5X/OwM7oNUxc/DeHuk6UB
 vZuF4kIqbtJcBN3E1Z8v58oz6Hi7wpksqL9Es2fIwjmVyri9q8pFxeA3w
 OlLp+h+J3kAbXgid1G4TOLLV4pBXlZIy4p62mx3LKHwZNPGlQt1OTU7/P g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976533"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:45 +0800
IronPort-SDR: YY1tUoZTXI7r6o2rUjZyc9+g/kwDj1o1u5KaDjfVPP6TAMB3t8dxbtPXu2+3q5F0FimShMXpg6
 5+4+XyvrPyR1Hd0ancz7PXTrGHBygCJweDstKNkITohcBj5OX0+H7weirKAgwnLNzmXX/N1Co9
 dLVM9YXnmd6Wtcrk/dfXxgj1D2clhndjE51+obYAsHxYqod+TLC7ZpDrwFyXf8fRzna3DUarKx
 Uf8q1kFnwd2T6PeywynNhEP74iXcK0JnjetyW55HpCxmPM81fDLi78CujTdBmWauD9Q8wQ4mW9
 WLM1FtRnU51WaRyE1jUgSBfp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:56 -0800
IronPort-SDR: dAydg9etHaobabBHb/0xPSgnlZyUA5KJ1ZkKgxmAIgWLF2sjyBP8/EP03Zs8dD8ZnSDpBpoQpR
 ADnIDMnxWVJbkGTUu4Yls92D2bAmRjv4pt50UIq71otwiZZ9OM5kNJ+zSQ+Ng72TPeFSY6bEeq
 zrjsVuPVKCaFdodUWoQ/keLLgzrVXFlEz5v1SKk+/+ODEHDATqixJ1ioBfpmkHYSgvA/BI/AJH
 c9tukUjD3jcgsUkC9vVMWKdeRjvBZUoeUClckS1AgXCawKHGH/UFWnk6LEUTBcxbNLirXNeGhU
 2gE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xr55hCz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744784; x=1645336785; bh=MWAnr9MuS2FDQIY1Pg
 CeYFbKV/fQuIp/tlMSrQcRBvQ=; b=iMXvmu26u/usDFh9BVcNvK/r95/v0eRqAS
 kXwsE+a0cbwrpj19oF9NxGl2HCrSKN6MfQf+H4ys+8Ygy8oyspetypkqBlnVy2vT
 cdPKX3zUGMjonADOOx2w2ypJd9S0BXM8gSh9nuvv0hdKBqOnOeXkukZgiRGZsU8Z
 pqi8KqLn5YlGutXuM1HDI5B/LXtsEVXwhSs5TM7XMjES9cz7Wyi+W/MoJ4+N09E4
 vCPj/erHxKavuN2fGvVcj4dNTh9gIe1i+x6AdMhxCxiGHJeJPPJXVEQ12HgVR9l0
 Tb8RzVnV1mMBN8wrkdvCScpw1o5EYrVynWRFJ08FCojBR3ZvQXjg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id goIKBvBgb0P2 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xm5pCxz1RvlN;
 Thu, 20 Jan 2022 21:59:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/61] target/riscv: Implement virtual time adjusting with vm
 state changing
Date: Fri, 21 Jan 2022 15:57:43 +1000
Message-Id: <20220121055830.3164408-15-alistair.francis@opensource.wdc.com>
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

We hope that virtual time adjusts with vm state changing. When a vm
is stopped, guest virtual time should stop counting and kvm_timer
should be stopped. When the vm is resumed, guest virtual time should
continue to count and kvm_timer should be restored.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220112081329.1835-12-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index a43d5a2988..e6b7cb6d4d 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -41,6 +41,7 @@
 #include "sbi_ecall_interface.h"
 #include "chardev/char-fe.h"
 #include "migration/migration.h"
+#include "sysemu/runstate.h"
=20
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -378,6 +379,18 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
     return cpu->cpu_index;
 }
=20
+static void kvm_riscv_vm_state_change(void *opaque, bool running,
+                                      RunState state)
+{
+    CPUState *cs =3D opaque;
+
+    if (running) {
+        kvm_riscv_put_regs_timer(cs);
+    } else {
+        kvm_riscv_get_regs_timer(cs);
+    }
+}
+
 void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
@@ -390,6 +403,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     CPURISCVState *env =3D &cpu->env;
     uint64_t id;
=20
+    qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
+
     id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
                           KVM_REG_RISCV_CONFIG_REG(isa));
     ret =3D kvm_get_one_reg(cs, id, &isa);
--=20
2.31.1


