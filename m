Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4E4DBF83
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:27:39 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjbm-0000JO-VG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:27:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTT-0001v0-Od
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:19:05 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTQ-0004O8-Ef
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647497941; x=1679033941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C5wN6WlN5i9pO/tHVRZgvTh0eiaKx6kGq+rPWLq5OMs=;
 b=cGzL76NO4Yzt3Pz8WVlV9ZKESYAadb6nFQ1/9mZMpJHx4jpKGBIf0oGH
 OWWFvGZ3UC488z3cM5qA29tM6MPxsMTlVlyOaUmQuW8BepDR2S+1pSKQd
 VZU1eEU/OG/6Czgg5Z0b2OWTM+NvFgRSqjG+usY8/aEPKjQUJ1DrQ5xsa
 nLbproqcye1a8eYI+J+Vi/V53cLV8yWIw4NMvDiaKZ3lbrZSLWpwJotR3
 o11ZNh3E3P41CX/BOJCRXMcmid8B5MfkhPvdvi5CBxjg2sLTzIjFYd/TL
 UW4Xxyk96ZhGoPTWWZjEaOBl+9oVR2XcrQlJmAh6fbmIu1Rvd9IYc/mBN g==;
X-IronPort-AV: E=Sophos;i="5.90,188,1643644800"; d="scan'208";a="196509682"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Mar 2022 14:18:37 +0800
IronPort-SDR: gr7eZUEh/D8ScaRUwV9/mCyNmvNWVBqDZo/h/6YNVtubxdfoP1bltK0PfXlxiBI96+eNd7K7K+
 Uxc9v08hI5UL3U/GZXQn99rYZP+sJyBB1ze2WlwkPxKWY9vZyl3mlCa7z8nluqC+rwZ5qggTCy
 +RzoKsLD6mYUysUywOmWbSr1iqJGEyu3iQZfYt9XwFrfr5MuRwdQJmPlLTgUXlqOLNy11+8oAB
 4iSzSnxzPmefe6PoVUOuSdsEUJkOE5dBU8pDAhRVo9ssfGzlMTnJHQmeB2oawfGIvxcrn5Uutv
 CzlF3JZz92ZjiA2PxvbHXs0f
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:49:41 -0700
IronPort-SDR: /s52VTthSxtDuEzXDo6ON99eQwBhyer9rVCcRzFkmToKcW4TYqH/gYxl/Hdl3kh09mX76rt98q
 DwsxYoj7L2kYY24tbeBfjun9+O6jRj1acgpjnsBtmQeOOZebWL/FbDfwF1w/UCwxh771kWsjUl
 xgqIeSFpmOHPvYIKgMy/BqwBHRZoAIy4FFlUpC37q6Afuqea5UxEL5OvH/vujkAwwM9mv9clH1
 flkeKiUn7xkrtFczm7fxkQgW791HMVs2yH6ct0/CHxjIGKa0hNMAFoCkfOKW/N03FiJ2SV/diR
 07c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:18:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJxmD2lXVz1Rwrw
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 23:18:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647497915; x=1650089916; bh=C5wN6WlN5i9pO/tHVR
 ZgvTh0eiaKx6kGq+rPWLq5OMs=; b=hylb7qYs2IJJOqVCCLqrkvg3m8fc27OJc5
 p7+QlYKifPNOX04s0xyPnpTDVt4aIovjOAztxfQ1qxnIaSl3s+9NArFMcNTkS+kk
 kPc+5BAeKnNHnF03sKFvurFmfnAJ0U1V6u2Rh8/YAYRR7gN2IYPpBxs5OXYkrycL
 Vf6pclyweqrMHZGJy1jT+JuomcUKF+hICmQFz7xDZpEbXUkOP1Ojynce9LOOM60o
 xo3t0SjoW1IxsXzC0vn+8xmiJ0I2nhrgHLeK9UqQ0Z85f7DT+4wRsZB9CbD4NFwH
 OUezfinx6LP/EpCx7SOk9BfGdJcfPSOeEK9dIUXEoWwdVNs9ojIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ckR3xsf6pxOJ for <qemu-devel@nongnu.org>;
 Wed, 16 Mar 2022 23:18:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJxm66fjmz1Rvlx;
 Wed, 16 Mar 2022 23:18:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/2] target/riscv: Allow software access to MIP SEIP
Date: Thu, 17 Mar 2022 16:18:17 +1000
Message-Id: <20220317061817.3856850-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
References: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=068022f98=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
index 0606cd0ea8..77726ccefb 100644
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
+        new_val |=3D env->external_seip * MIP_SEIP;
+    }
+
     if (mask) {
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
--=20
2.35.1


