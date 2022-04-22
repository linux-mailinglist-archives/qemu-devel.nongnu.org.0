Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBBF50ACE8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:44:12 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhP9-0007DD-SX
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIw-00072C-AD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:51 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIu-0005IK-7Q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587864; x=1682123864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pj1vy2upA7H02vG84N/XeXdHiUcQhvUaC6Hh0DctfCY=;
 b=dpjzoPKX5CAhxkWr6hjNnE9jw9gHx+vOcBThBrxaFWgRY42KANVxkgGn
 JOJfIceJDVGAGf5sqvqfuDpiqa5cE97dnV3CqFkPD1TCwGnmJX9bez2VT
 KtsV8T38FZLKyDQTbAajgC84MPGQixW8XVyDssPKKDB6vWhHh47X9/f9N
 9DjOElO0r3XV8LAnzwD7EV50rgBCOrctpmawltFFjC9GHyfQydlwSfHdh
 tdUTRC5MDux563y7pHaiClnxeUqKrejKOqyLuTHwAwUikan4vdNhCfROO
 PbKtX2f26YxIlNEThZXh5C0cQIvDKjuQO9muES5bkEV27xxd/nqJCAe0m g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715749"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:43 +0800
IronPort-SDR: vRtTPYtPEXSMSUqYvL6xaoqrjQkUQU9RvW5FR12rLCYTYUfO/BxkIyZY4M9daLbwJG9VX2H05a
 kB7dfwVK1LfsN4/M8d58cgKx+0KCsFPdx7Uv97p2P//lFw33MhxrLNoAXF6L2Wufd8SOGO/Wya
 jhAbO0l/6QPR6hCiNUXuqf08eTthoSpVfIUS9MK7wI2PPAcTPxkMUuPrag3llWkqyryUHPFJzv
 Fahu7XFJ7dzoyVmW4+oq3ZLkBHNQZZnrJiDs2sXzEqidiuRy/gsOXvccdIRPXLAvxhVPabmETT
 vD1vIMEr+Z+jxqRwCgg435Cd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:00 -0700
IronPort-SDR: 6puao78CaZ4+GgOkfV6IwMh9e8LBn+QzPxJOZsnu7ryUhVkhhZKuOF7TyPRcffPvCxGRZCFIfP
 /lUonZM45eYcpzGb45kJOpNEfurFLdC9GGIDd9t253jjw5wSP9oIxbUojVjdqdpBrAkn/HKKIY
 f7lzlKyZrs/SumVjvjnloLqTUtlVlLQY2f90f9zpu2kzEQ/OU+8IeG44QCMuHWRqdAixARaa7P
 ShU4U1EjZKOw0MXDWPX09KEx/YihGzyRC1pR76Q0GDzlgQdOOFtuUcqkkpJjocPr1qE+0ar2WX
 YMw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVH21NJz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587862; x=1653179863; bh=pj1vy2upA7H02vG84N
 /XeXdHiUcQhvUaC6Hh0DctfCY=; b=VxEGwr3fgvmgBeh373RDP1j7x4uaQ/lHa4
 Gy3b8f7i3J3jcFEmdQLbFERWFbjMEVvImH5GhS1RbfHOVAeRNDBcbJ93SqnR3KiE
 aebMXVS5Lu2Ap50wcOJPhwKRQ8SeRxKfq7zQ+tiVG3Kt3MHmGTuN5ALHeIY8WGex
 3ASheydnxYBgXfIaCIkyaUBa6MH06G6/ocmrl1A7+/5xQUo5+QqftuBwTX83WuVB
 EqlM+D84xfmYG311RcAbq7xbG8Uc0HdUYgOw/KhJRWxWOZwIwnXPASIyFSYW0zU6
 dn2xEWXANJ5P75PwdEgB6ovlvoTr309PSlpqxshl61/ew4Yg869Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wzpN2JgxWAba for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVC4FlCz1Rvlx;
 Thu, 21 Apr 2022 17:37:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 10/31] target/riscv: Allow software access to MIP SEIP
Date: Fri, 22 Apr 2022 10:36:35 +1000
Message-Id: <20220422003656.1648121-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The RISC-V specification states that:
  "Supervisor-level external interrupts are made pending based on the
  logical-OR of the software-writable SEIP bit and the signal from the
  external interrupt controller."

We currently only allow either the interrupt controller or software to
set the bit, which is incorrect.

This patch removes the miclaim mask when writing MIP to allow M-mode
software to inject interrupts, even with an interrupt controller.

We then also need to keep track of which source is setting MIP_SEIP. The
final value is a OR of both, so we add two bools and use that to keep
track of the current state. This way either source can change without
losing the correct value.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/904
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220317061817.3856850-3-alistair.francis@opensource.wdc.com=
>
---
 target/riscv/cpu.h |  8 ++++++++
 target/riscv/cpu.c | 10 +++++++++-
 target/riscv/csr.c |  8 ++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e129c3da7d..b90ca8268e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -177,6 +177,14 @@ struct CPUArchState {
     uint64_t mstatus;
=20
     uint64_t mip;
+    /*
+     * MIP contains the software writable version of SEIP ORed with the
+     * external interrupt value. The MIP register is always up-to-date.
+     * To keep track of the current source, we also save booleans of the=
 values
+     * here.
+     */
+    bool external_seip;
+    bool software_seip;
=20
     uint64_t miclaim;
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 78fc7b22ed..cfdfe787de 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -708,7 +708,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, =
int level)
         case IRQ_VS_TIMER:
         case IRQ_M_TIMER:
         case IRQ_U_EXT:
-        case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
             if (kvm_enabled()) {
@@ -717,6 +716,15 @@ static void riscv_cpu_set_irq(void *opaque, int irq,=
 int level)
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
             }
              break;
+        case IRQ_S_EXT:
+            if (kvm_enabled()) {
+                kvm_riscv_set_irq(cpu, irq, level);
+            } else {
+                env->external_seip =3D level;
+                riscv_cpu_update_mip(cpu, 1 << irq,
+                                     BOOL_TO_MASK(level | env->software_=
seip));
+            }
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8b6a1b90f1..a09126a011 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1498,10 +1498,14 @@ static RISCVException rmw_mip64(CPURISCVState *en=
v, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVCPU *cpu =3D env_archcpu(env);
-    /* Allow software control of delegable interrupts not claimed by har=
dware */
-    uint64_t old_mip, mask =3D wr_mask & delegable_ints & ~env->miclaim;
+    uint64_t old_mip, mask =3D wr_mask & delegable_ints;
     uint32_t gin;
=20
+    if (mask & MIP_SEIP) {
+        env->software_seip =3D new_val & MIP_SEIP;
+        new_val |=3D env->external_seip * MIP_SEIP;
+    }
+
     if (mask) {
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
--=20
2.35.1


