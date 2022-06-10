Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F2E545B2E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:38:32 +0200 (CEST)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWPn-0004Wj-V1
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFN-0003KX-PV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:45 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:11850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFI-00012d-Qa
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835260; x=1686371260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ga4gp3tI0ndepXVtfWFEcl1KmK6f+F5y3IHXfL2ClDc=;
 b=IGgq0VNaoA9lhhk7fOuNOebT5Wj6ja6SmlFOlu1MH9KH5SyKNoZJQ0ji
 WHURtvZW1XUWoLfJWYtH7gxfjWSbFS4czTXiTrR7tX5/yg6eThqK01tC0
 UNxS4rrXhIQoiHlOv1RzbcHK5YJM3fImM2LY0Qg8LQI5TAVSTvA6ssy47
 TrD9Huk73YanCqmUnM/eH+eg8lCAI4iYZ7T1IiUnobLt2s7tGH8dlZvLF
 Nn1DQwMTJiWeF8H2vyudIcJNbi02nudmS1hOtfv/qcV16rtu+lEB+9QGg
 3iT1erZRH5nR+CqytPGQzC1aLKLFp1MGcd9BV6GiNvUc5fg3WU90/quGq Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046435"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:39 +0800
IronPort-SDR: hRbF/c0dV5PFOIb0O3axGabj7y+FkVCm0yhQuvm8ZKftahUwvxCKZ0xGUwRS+bMxN5aL2Od8rk
 011cKGZLRjxbtb3qLeVGh5DepQoU3EnCSlnmJUsc4Towi7KEqjxKWvgwCcOTU/7EcGq6XQe9c2
 7rx2apywYqAsaPf/MzL2b7agyNvDLK4yUmxzkr/+7nRlty3zMgGz/+UYsR1SW0jv0NxIMe4l5H
 ie6p+HWQSCszOArV6pwctipMHST1MUk4+466UCzdHbnye0VpgRfhKo9P/zk7Jv4P5R35Qtd7mb
 vDXXW6Iid1wcJ5Hbctj0x+LW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:47 -0700
IronPort-SDR: NOouT7HI3PhrsdsMjxQteAQnhxWCIQAkFagS8SKmDbX9LU/4SDh7cRCX5O4uMUlkS+BwNB5Y4N
 NGhiuEA+BRy4q7op1LQHcGtZaWe04BDzIh9s4OHFngXL0Sz8z4D6r/gukE1GW3QRB0VJ6JsdkG
 bqtYX2Hi63O1gkaI8rwOC4Y0xcQRXmD17OkgGj/vFl0i2vt8TFfteagqzx7+cUX5k+rn3wSPHH
 hHrvcv4YeVMftf9WXcb70e+2DJ54SLwO/Z1QK8IPgVaI8bJIF9Dtl5iexHy59VxVLtjIgsG4D8
 RXk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gz2T6Pz1SVnx
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835258; x=1657427259; bh=Ga4gp3tI0ndepXVtfW
 FEcl1KmK6f+F5y3IHXfL2ClDc=; b=fjFblO3fqZDwu843pzkjzewsYur57w1vG9
 c9mIS4P8vcnTEDIM25n4kVCcUnOAdsBOCwg7bLsDd/qYhD9RCEqGowL1fdWeR1xG
 kD3TM7qjeoiwLGOmARl/3EF4HfoDjI/YgjEdTL8joF3hIuqDSQREZDoh39NzjFh5
 EWIYq4vnZu2EtHt6/pqvCDpECV5cA6xCi/4p6IeqEILQ60NhDgvoW1d103RW0G/W
 eAW5x1BUSn+vaq3EG6o2drnZhVzPVahbsHJi9nQ2mdhk9SGjoVtZGIpZAG8ToL/z
 V7ErqWsi1MODlHfzQ8lKJwH/nmlHjwuhAIV2TAn1UIoqXYi/DesQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6kZnWrFu7Uz0 for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:38 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gw2XWmz1Rvlc;
 Thu,  9 Jun 2022 21:27:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Bresticker <abrestic@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/25] target/riscv: Wake on VS-level external interrupts
Date: Fri, 10 Jun 2022 14:26:36 +1000
Message-Id: <20220610042655.2021686-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Andrew Bresticker <abrestic@rivosinc.com>

Whether or not VSEIP is pending isn't reflected in env->mip and must
instead be determined from hstatus.vgein and hgeip. As a result a
CPU in WFI won't wake on a VSEIP, which violates the WFI behavior as
specified in the privileged ISA. Just use riscv_cpu_all_pending()
instead, which already accounts for VSEIP.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220531210544.181322-1-abrestic@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu.c        | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 890d33cebb..194a58d760 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -489,6 +489,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteA=
rray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
);
 uint8_t riscv_cpu_default_priority(int irq);
+uint64_t riscv_cpu_all_pending(CPURISCVState *env);
 int riscv_cpu_mirq_pending(CPURISCVState *env);
 int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bcbba3fbd5..0497af45cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -391,7 +391,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * Definition of the WFI instruction requires it to ignore the privi=
lege
      * mode and delegation registers, but respect individual enables
      */
-    return (env->mip & env->mie) !=3D 0;
+    return riscv_cpu_all_pending(env) !=3D 0;
 #else
     return true;
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d99fac9d2d..16c6045459 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -340,7 +340,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *en=
v,
     return best_irq;
 }
=20
-static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
--=20
2.36.1


