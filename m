Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A169547694C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:59:24 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxirT-0002TD-OI
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:59:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinH-0002iB-PY
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:03 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinF-0003rR-Qx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630501; x=1671166501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CJtqDU6sPemWcmNX1wfyiQbcFiKIABpaeUjMPTCGpig=;
 b=PYdwqREtVgs6w6XyJgiDNEsQDZOA5rJh/Tpa6rTbZAMywJCPW75kEq1Q
 byKU1ZX5vWap2J+LejQbTY9adOnh48liD4bMNROkxd8yUKOybse2WCMJI
 OFWQdE0zJgVfgruBYWKXLNcErhl+L6H97h+oHp8n6oBeFEAlwFv+Uf0fR
 1lfBg012zuq48/V40pO2VywZW7TVFwaXDe25Q4g1Go2sRXnrR9w8PywU8
 SIFAICyVWLGvWLbtW2v8CI1dfR3DpwCABOAZHADcYI65DC1+sHEJykFvl
 vg7fEi1O5nwF4nTXnG8Ok8vuuO01JHvbSHR/aJ0k88LeJ6oHmxzwxyUAr Q==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354570"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:00 +0800
IronPort-SDR: VicPZ297aniNbfi8b0uMuJiEvTCs9dnKUNAjDwoNxhwSd0Y+NVm4oFkGeC84SrEGzMtKUzQBz5
 eCfw+c1drkVcUFA9tmBEOqP+CtXRok/Oc2g43Pg+HEY/S0J89nGy2Kkj0Hye+3Q9osmG69GZ2R
 L790XJ+2aOr4x3+XcA2CVNCqk2LtLu1gzfhLDgbd1Y+e0jUq2Ibt9IdDLqZHwkUscqDyBIVxDO
 rsAjGE0nLq3kEgrX8Lytp7ZZKelKosETEMXfrQeM+Wo4FTA/Wow/cVj2GMjz7wmqxK6TL6K2rr
 TebKVtBqCT0um0A2I/9CCXtn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:54 -0800
IronPort-SDR: bR7rhvI4tKx/foyjdnbRtBG1whcp/dKcuaD9ELQRBkuLxQtHDh/gD6ImXrY0V3yq5s9jGMyyve
 scMAWGXsNLNJdLrHzbVSEFx4nyEREDUgHuup+9yeXGJTKTHrwRtHx+pgy/B4pk1v/0XijORFI7
 fS0I+J4Dwi7Kzt+md+8Oz1GoGiUKfIuDivU6AjM6FoRr0rza50ej7h78GhDI6kcb2a/iboQZky
 4MvCUg3NfLmHTjF9jyyyBmDEIHURnEbqWNwWWluWSaRtWXadhWS8INvUYnoHM0XlXtnQwsnLFe
 5yg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cm3R51z1Rvlf
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630499; x=1642222500; bh=CJtqDU6sPemWcmNX1w
 fyiQbcFiKIABpaeUjMPTCGpig=; b=pz8tFgGBuNfAeHXB/riSMcbUOj9qGaG3Gp
 S2fLvxcyvDkYPyPKQOYP15FAfy/dbLZ/5P/DJRFVm/QwtzWsLyBWy6BJ3hFYLHV1
 yHo4wEjMDw+70Y9q3orqTfn1OkcWn6IyMcZKXKwOq2FOr0vb//wVVs6Ce8dah6rs
 SJuDl0xdYxzFMw7rFMGhvJyG3sO4TNz2uqewb494roM3Uhtf/mcF02AagVSfJMFw
 nOfA+T3DxNzq2l5jMDqYP6vi4gv58/8Q6AnFV32wY8sDfBPG7HhmYDWpPcd1VrfX
 O3Ue27ci6PdQzugP+nLqa2HnBbcWd5PxKbm1H+dZcpwoSr2ze2IQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3vhGI7UpsDB5 for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:54:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cg13Dxz1RtVG;
 Wed, 15 Dec 2021 20:54:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 4/9] hw/intc: sifive_plic: Cleanup remaining functions
Date: Thu, 16 Dec 2021 14:54:22 +1000
Message-Id: <20211216045427.757779-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

We can remove the original sifive_plic_irqs_pending() function and
instead just use the sifive_plic_claim() function (renamed to
sifive_plic_claimed()) to determine if any interrupts are pending.

This requires move the side effects outside of sifive_plic_claimed(),
but as they are only invoked once that isn't a problem.

We have also removed all of the old #ifdef debugging logs, so let's
cleanup the last remaining debug function while we are here.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
 1 file changed, 22 insertions(+), 87 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 44d24b3c59..746c0f0343 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -31,8 +31,6 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
=20
-#define RISCV_DEBUG_PLIC 0
-
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
     return addr >=3D base && addr - base < num;
@@ -51,47 +49,6 @@ static PLICMode char_to_mode(char c)
     }
 }
=20
-static char mode_to_char(PLICMode m)
-{
-    switch (m) {
-    case PLICMode_U: return 'U';
-    case PLICMode_S: return 'S';
-    case PLICMode_H: return 'H';
-    case PLICMode_M: return 'M';
-    default: return '?';
-    }
-}
-
-static void sifive_plic_print_state(SiFivePLICState *plic)
-{
-    int i;
-    int addrid;
-
-    /* pending */
-    qemu_log("pending       : ");
-    for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-        qemu_log("%08x", plic->pending[i]);
-    }
-    qemu_log("\n");
-
-    /* pending */
-    qemu_log("claimed       : ");
-    for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-        qemu_log("%08x", plic->claimed[i]);
-    }
-    qemu_log("\n");
-
-    for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
-        qemu_log("hart%d-%c enable: ",
-            plic->addr_config[addrid].hartid,
-            mode_to_char(plic->addr_config[addrid].mode));
-        for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-            qemu_log("%08x", plic->enable[addrid * plic->bitfield_words =
+ i]);
-        }
-        qemu_log("\n");
-    }
-}
-
 static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t v=
alue)
 {
     uint32_t old, new, cmp =3D qatomic_read(a);
@@ -115,26 +72,34 @@ static void sifive_plic_set_claimed(SiFivePLICState =
*plic, int irq, bool level)
     atomic_set_masked(&plic->claimed[irq >> 5], 1 << (irq & 31), -!!leve=
l);
 }
=20
-static int sifive_plic_irqs_pending(SiFivePLICState *plic, uint32_t addr=
id)
+static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addr=
id)
 {
+    uint32_t max_irq =3D 0;
+    uint32_t max_prio =3D plic->target_priority[addrid];
     int i, j;
+
     for (i =3D 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =3D
-            (plic->pending[i] & ~plic->claimed[i]) &
-            plic->enable[addrid * plic->bitfield_words + i];
+                        (plic->pending[i] & ~plic->claimed[i]) &
+                            plic->enable[addrid * plic->bitfield_words +=
 i];
+
         if (!pending_enabled_not_claimed) {
             continue;
         }
+
         for (j =3D 0; j < 32; j++) {
             int irq =3D (i << 5) + j;
             uint32_t prio =3D plic->source_priority[irq];
             int enabled =3D pending_enabled_not_claimed & (1 << j);
-            if (enabled && prio > plic->target_priority[addrid]) {
-                return 1;
+
+            if (enabled && prio > max_prio) {
+                max_irq =3D irq;
+                max_prio =3D prio;
             }
         }
     }
-    return 0;
+
+    return max_irq;
 }
=20
 static void sifive_plic_update(SiFivePLICState *plic)
@@ -145,7 +110,7 @@ static void sifive_plic_update(SiFivePLICState *plic)
     for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid =3D plic->addr_config[addrid].hartid;
         PLICMode mode =3D plic->addr_config[addrid].mode;
-        int level =3D sifive_plic_irqs_pending(plic, addrid);
+        bool level =3D !!sifive_plic_claimed(plic, addrid);
=20
         switch (mode) {
         case PLICMode_M:
@@ -158,41 +123,6 @@ static void sifive_plic_update(SiFivePLICState *plic=
)
             break;
         }
     }
-
-    if (RISCV_DEBUG_PLIC) {
-        sifive_plic_print_state(plic);
-    }
-}
-
-static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid=
)
-{
-    int i, j;
-    uint32_t max_irq =3D 0;
-    uint32_t max_prio =3D plic->target_priority[addrid];
-
-    for (i =3D 0; i < plic->bitfield_words; i++) {
-        uint32_t pending_enabled_not_claimed =3D
-            (plic->pending[i] & ~plic->claimed[i]) &
-            plic->enable[addrid * plic->bitfield_words + i];
-        if (!pending_enabled_not_claimed) {
-            continue;
-        }
-        for (j =3D 0; j < 32; j++) {
-            int irq =3D (i << 5) + j;
-            uint32_t prio =3D plic->source_priority[irq];
-            int enabled =3D pending_enabled_not_claimed & (1 << j);
-            if (enabled && prio > max_prio) {
-                max_irq =3D irq;
-                max_prio =3D prio;
-            }
-        }
-    }
-
-    if (max_irq) {
-        sifive_plic_set_pending(plic, max_irq, false);
-        sifive_plic_set_claimed(plic, max_irq, true);
-    }
-    return max_irq;
 }
=20
 static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned siz=
e)
@@ -223,10 +153,15 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
dr addr, unsigned size)
         if (contextid =3D=3D 0) {
             return plic->target_priority[addrid];
         } else if (contextid =3D=3D 4) {
-            uint32_t value =3D sifive_plic_claim(plic, addrid);
+            uint32_t max_irq =3D sifive_plic_claimed(plic, addrid);
+
+            if (max_irq) {
+                sifive_plic_set_pending(plic, max_irq, false);
+                sifive_plic_set_claimed(plic, max_irq, true);
+            }
=20
             sifive_plic_update(plic);
-            return value;
+            return max_irq;
         }
     }
=20
--=20
2.31.1


