Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA44DA7A9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 03:03:46 +0100 (CET)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUJ0r-0003XR-PQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 22:03:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwf-0006GG-TC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwd-0006OM-OP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647395961; x=1678931961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bODccYusAyNRfn3J92sbwwBbUSHGlARsLyMwJzFOA6Y=;
 b=KQgB6KU1x3AUeJ50eu/Ap3DmVmHA3wsGA/9tv4Gc/2NJlhY2sIEIhsFN
 jv0i0bCRDSn3NYh+daBOFVRq/9ZUZedpbv7n3MRgnpwiiWD1lSB/oHkNK
 /SSRi4lZTQTCUuKSos2ETBYC+jqYVjGeJ1wUYMur6KVkIZ3TbH+mMF62j
 0+12FvBpXyg4XBHsIsUf2ycQ3wVPqyqetl9dLujdk51gZSgfhyAi1g6g7
 a3snVqc/ZuUuzzbdLjo8jDIQrHnVTpKBNvlqL89X/DddVjAP3Lr/hQNzD
 RhmR2rCt4HIizk9IDSQRiy07Ze0DdxmwUMf2gMz8C2USdMIbgtlrpnsHS g==;
X-IronPort-AV: E=Sophos;i="5.90,185,1643644800"; d="scan'208";a="195462033"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2022 09:59:20 +0800
IronPort-SDR: NsAoT8UjFMVlM1m2enpMVy/bM2VlpEieRNycVDiJzvRD/Vwk8KYw2DWA5tiEF5oiHbCgFowcAL
 sV1yOuVZwgY9wBpNL4WlNg08F+9ugbr7XZBomou4acC5ueYsXDn82xwvLnvOZ3vnNzNuCG4lDX
 LFas5ffp3JqRq0V88/zztxaKBONmp042xmeNxCHrDiLmfTzz4GVClsekLQuAZ1qs/gMLx+MOp9
 FnRk1D8YC0uZD7b2eym7pcabs0XUZfcpP5EhsooK+Fn0A8AUx07Xh9ojmmiviwh3EOsoUFhiAX
 Ny7vgfiVI/3uzqMuYSrykS6+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:31:26 -0700
IronPort-SDR: LHQTAwnsPR19ETnSaCX5Wthif1b5lCXSBPDoo/v1Ee6a+ooEDRm3SL+4ooQDNk713k4NkKr5sz
 FNDVi/kUAUqhOQsBr2UfCMaQEaJAHppMjJxPjXtT0xaWy8TaASREXryINeiotabZ0WLEymjN2L
 5xwAiPcIP5SmC4qop1FTuyKWuA4VLKNMAlgjuaZMo8/usCAUK+c5bl45P6W7CNLj0gN4fNH/GZ
 U96Cc2TMpIfdexSR4v2TPPisZDe/MJsY6tvDwiubUN+chsCHMThQJSgc/uXOd5pdSYjA4fdV56
 3QM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:59:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJD3Y4X5rz1SHwl
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 18:59:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647395960; x=1649987961; bh=bODccYusAyNRfn3J92
 sbwwBbUSHGlARsLyMwJzFOA6Y=; b=TfvR0+Plu5Rjrbi7dUItSxtMUiRgF0m8JP
 Tbzd3SOAF3jj2nuOtsuIuFXDiLu1b8TGsWJGcHGP+bWlw+2FjgZ5Q6ANz18yUMJT
 bbqQfZfPbhk9Hv4S2RVGp+FHSuTvfwksBn3jgIHIPBH9cnHxRzxJJg9aClMepoV6
 7v1vyQ2ri1aOxg7qGS389oQDee9sHdt5NZcqCKHZvJjOrGGJjBggmC+CW8t7Lupd
 Dc1ZLvNJ/TnlZ83gsKV67j/nYbiiAkHO5IXNaSBZbGA/t7Vlmoe5/+few3GRUCS/
 jug3OO0aWGeNtN0LnFJnoEij6tXpwTswWCobmQzroncg/wHyuRXQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K51kmRoooeLe for <qemu-devel@nongnu.org>;
 Tue, 15 Mar 2022 18:59:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJD3T06lwz1Rvlx;
 Tue, 15 Mar 2022 18:59:16 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v2 2/2] target/riscv: Allow software access to MIP SEIP
Date: Wed, 16 Mar 2022 11:59:01 +1000
Message-Id: <20220316015901.3787779-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
References: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=0672150a7=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
---
 target/riscv/cpu.h |  8 ++++++++
 target/riscv/cpu.c | 10 +++++++++-
 target/riscv/csr.c |  8 ++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..05d40f8dbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,6 +173,14 @@ struct CPUArchState {
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
index 41b757995d..68373b769c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -706,7 +706,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, =
int level)
         case IRQ_VS_TIMER:
         case IRQ_M_TIMER:
         case IRQ_U_EXT:
-        case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
             if (kvm_enabled()) {
@@ -715,6 +714,15 @@ static void riscv_cpu_set_irq(void *opaque, int irq,=
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
index 0606cd0ea8..48e78cf91e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1403,10 +1403,14 @@ static RISCVException rmw_mip64(CPURISCVState *en=
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
+    }
+    new_val |=3D env->external_seip << IRQ_S_EXT;
+
     if (mask) {
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
--=20
2.35.1


