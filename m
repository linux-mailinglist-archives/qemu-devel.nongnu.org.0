Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD325097F8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:44:48 +0200 (CEST)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQYZ-0002L0-Fu
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRN-0005Im-0H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:21 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRL-0007xw-06
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523038; x=1682059038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lvbWS8dUER0K+FCnC0yXx7N/Nyk2+FNL0e/7MV+/RHY=;
 b=CAv/Cks0QUk9bCFPZ9P9aKDpnHrqIeVqLioF4BOKy76n98hDk5l96fA3
 zkm2xln0GNQhdQSNu6VXbqalu8Wf7AUdAxyA/DC+OBNvrRexL2cBueEDB
 yZiX8hGEHdg5cv7xKc2oORzGgrSdSZ6aZk/XGaKjs2i7JxMLlJ4cpYCvu
 OmhGgkhsI+JqIJZd7gkcJJIV729zpKJ7bwj78Qq0JHicYx9HX7HLlhT1x
 9Y7HixcKYz0wzUP8rwfH4w3bB2vBHGOCeO4vUYNMaPzOJANKDs0GhhBae
 583tQq8fQ8t//SgZZwi48mA8s4oYVCdY84+UZYewCuAptTY6S4q6OnheE Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639969"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:18 +0800
IronPort-SDR: 4G1rmboXoLWGuY4KsJTl/bW89OS9y3CB0l5UvB6PGd4gLNkRKO+FwzCIjx+Z0dT17I/QejNA88
 ab3BSIkKw6fEhpv+SoAs6HQrOCXU60HbfWvHQWVDW7+ddct1BGodLB9pAiGMnqZahbvASDyr2T
 BRyS1c23prXAfKKNDlr3W3t/iJnEWzcLNKieGuwtV/JEMYwL6Nh2rNrrwE1zSnp+ZFdUSvties
 yIWv5VGDatktG4DucqoC9yvlYV9hMXgVCvSptugtjXWt4PMbydtE3jTxdA4IWVwwRoDRGX0JJU
 aKGfWMbpYlJxqJolyKsxQj38
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:20 -0700
IronPort-SDR: duk75FmLWL3tcT9UGrW+ILASaKkRl22mO5lf3DSI+ls3DEf6PD5ZSYy3+BPvfrW64dNku+6kv0
 SXrdYEwIxhligziU/uxTjA8xYmEOAqjx/8rTaCTCtrmXqc5RdeMxtUxOSFGL0V5l2i2C4Mqp1w
 3cJirdSEgBqQ8KEWwyGmFvXh5sa9k6TJTG4XrKxSo6o08vGFh+qfQKJyZDLeYZ2POH+pz1O2g9
 45ZQXt7G0XXxhX7o99jM44jh7thquWkDN008+7J88BzMkUcRcOBrl41mv7u8DF8qfZQDCTq4mW
 CoY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWf0G1Rz1SVp1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523037; x=1653115038; bh=lvbWS8dUER0K+FCnC0
 yXx7N/Nyk2+FNL0e/7MV+/RHY=; b=HsDAPAz1Tu5BWzsCAX+NRSniMxjcUJAlDS
 Wmm6IKP3CCKBlJkl2I0EaqxHOsQZknVOVWE3m1ep68biPs2XPL54jojXOdiGC6lF
 95y2aNUjJ/P5E5+Iq47Dr1F9nZVxJif/HkcJh5E3FemKnEaTxVRjn6hGkAKuIVKx
 jhNdUCH4u6m0D9ObS5Y4TjZ1ikLFJ+bdNavvM3o4LQujCP9x6hQXB5W9eBsIPmr3
 JGAZvK1iLUW1o5Hcgccsh72GsYJ02VZDcPqd61cQRypQyKXyuKQ4yu/eeFeyp9is
 1OfNgbs3EuqnPAMbO7MRIOJuCX2M9PmQdnFr84YDyCkcnN7yR2MA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0DdrIkTtgYHX for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWb0s2Wz1Rvlx;
 Wed, 20 Apr 2022 23:37:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/31] target/riscv: Allow software access to MIP SEIP
Date: Thu, 21 Apr 2022 16:36:09 +1000
Message-Id: <20220421063630.1033608-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 1ef1b9162f..d7322df4fd 100644
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


