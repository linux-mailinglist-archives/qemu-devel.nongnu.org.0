Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33403674E94
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0A-0007lk-IT; Fri, 20 Jan 2023 02:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzs-0007ch-AU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:38 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzq-0004mc-Ah
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200374; x=1705736374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yf7KWOAqQj5uEmXiGlPlgmbflZZe24Ms6Lj0x3HmqgM=;
 b=aRRCqrK1hF2ekU/6uWwjRlbcxh7cO+2IMhvVTVTbNXyLSD6NmsdD3bjq
 i05hiJxmFl77Jtz167iCrskWDxLfFnZ1quSM2cUY+iXzeMEoBH9TJN11V
 lUFdt4+VzUhl9LAdijjVL3O5e+nTcX5pqjRih7Oc4ulek9bbu8HokxI63
 QLCiGd4g18lESAoMSaCZuUIkJRs228F1RCm4sqzf23HI1Aqq+ZVWU0mx9
 /+cIkhAWYBIv4AdHw8VOPW9mW6g5GcL84Ie2zJmI7xnn4l+nLLpc3+bDL
 Dgx7fDGYxlihZH3X8ibi/GkWKsxgAdiF6CvHKF4tbLWekYsCvWc4qZ7Lt g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176683"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:32 +0800
IronPort-SDR: 901sdJgUrCIef3HZ3S0PbfT/yzqJfYfdI5U0X641tsm7V4Vxb1ddbVcJs5x1bJoIRBr5hHrR1H
 yEkbvhvePgrvyDRTrEaSLREoyKv2GqnRhJ+jA90FGvzAurCFbKSS910vT0kxxoUHdMM7aeqO1a
 p3g+p2ohyJXKxTO6ijQ4XTD53ek5f0I/R3y5eEoOa6So8gGtSEBwbt7K2JKTmcs4TsIKE3zDZD
 e9F5z/qhU3Ovzdxov7wMkR91YNMG52kh8kPGBe5lSlVKGIE6XbwhCU8SK9YcJuUB1d+CIIrTaO
 AA4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:10 -0800
IronPort-SDR: fSFWwWtpyM/xGUkTgWk99putk8m0+DqNAOwMuI9X2Z1ZBJfvgjHnoKYceAYY1jHYyTP8be7EbJ
 Paa2eNdUesq/5uYwvQiID71JCEx/VcLeBtw7blRTm5gAGvJEWqEAHzOwz4K6rNpnogC6Pe48Ye
 OQIVK6dX32h+BkC6x8XYEXYfQO7JPnK17V221zXSFYfedPH/YxtZsKKePV3e5TRD5z5Pk2KyeO
 WDLBTNNWG062x/2wnh4B8o0+6zGk44rF/iQX7bvJel1uGfENo90GxIwn/5HTcqjPBunuo/HNAI
 iJI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrx03cXKz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200371; x=1676792372; bh=yf7KWOAqQj5uEmXiGl
 PlgmbflZZe24Ms6Lj0x3HmqgM=; b=rSgKnVM2jwaRcnxHqK/lkHY22LMQysrX3H
 /5LdrIuc+H+3wUiVjUkdUjlWakjlJ9wwEra4il+PD4+Nu/Md2hd64qnViLTEMIQ2
 AavY1V75mg35yCgHsgTAFx4UWKxx9729B2ufMciE3zRbXcvwxRdKnaJ2zeClezKo
 XYmmryqVcx/vvMh28QwR6yZtDeHcePCeVn0H4jYaF6+rn4WDcEC8hwSzkZIB6FF8
 3c+uu+vI6DkEwRKn4iPGL7f6a99rm329rhsI6TbsZ+D9+zXHPgsMH4KZH6xTEKv2
 AhIev/07XCjfQaMHVPOsDEkJIZu8/MQrh54vYHiM2buJ3RjmMIZg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nZXMnH4D7PvD for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:31 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrwy1R3qz1RvTp;
 Thu, 19 Jan 2023 23:39:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/37] hw/char: riscv_htif: Move registers from CPUArchState to
 HTIFState
Date: Fri, 20 Jan 2023 17:38:41 +1000
Message-Id: <20230120073913.1028407-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

At present for some unknown reason the HTIF registers (fromhost &
tohost) are defined in the RISC-V CPUArchState. It should really
be put in the HTIFState struct as it is only meaningful to HTIF.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-6-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h |  8 ++++----
 target/riscv/cpu.h           |  4 ----
 hw/char/riscv_htif.c         | 35 +++++++++++++++++------------------
 hw/riscv/spike.c             |  3 +--
 target/riscv/machine.c       |  6 ++----
 5 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 6d172ebd6d..55cc352331 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -23,7 +23,6 @@
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "exec/memory.h"
-#include "target/riscv/cpu.h"
=20
 #define TYPE_HTIF_UART "riscv.htif.uart"
=20
@@ -31,11 +30,12 @@ typedef struct HTIFState {
     int allow_tohost;
     int fromhost_inprogress;
=20
+    uint64_t tohost;
+    uint64_t fromhost;
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
     MemoryRegion mmio;
=20
-    CPURISCVState *env;
     CharBackend chr;
     uint64_t pending_read;
 } HTIFState;
@@ -51,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_i=
nfo, uint64_t st_value,
 bool htif_uses_elf_symbols(void);
=20
 /* legacy pre qom */
-HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
-                        Chardev *chr, uint64_t nonelf_base);
+HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
+                        uint64_t nonelf_base);
=20
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..61a9a40958 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,10 +309,6 @@ struct CPUArchState {
     target_ulong sscratch;
     target_ulong mscratch;
=20
-    /* temporary htif regs */
-    uint64_t mfromhost;
-    uint64_t mtohost;
-
     /* Sstc CSRs */
     uint64_t stimecmp;
=20
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index f28976b110..3bb0a37a3e 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -100,7 +100,7 @@ static void htif_recv(void *opaque, const uint8_t *bu=
f, int size)
     uint64_t val_written =3D s->pending_read;
     uint64_t resp =3D 0x100 | *buf;
=20
-    s->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16)=
;
+    s->fromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16);
 }
=20
 /*
@@ -175,7 +175,7 @@ static void htif_handle_tohost_write(HTIFState *s, ui=
nt64_t val_written)
         if (cmd =3D=3D HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such *=
/
             s->pending_read =3D val_written;
-            s->env->mtohost =3D 0; /* clear to indicate we read */
+            s->tohost =3D 0; /* clear to indicate we read */
             return;
         } else if (cmd =3D=3D HTIF_CONSOLE_CMD_PUTC) {
             qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
@@ -195,11 +195,11 @@ static void htif_handle_tohost_write(HTIFState *s, =
uint64_t val_written)
      * HTIF needs protocol documentation and a more complete state machi=
ne.
      *
      *  while (!s->fromhost_inprogress &&
-     *      s->env->mfromhost !=3D 0x0) {
+     *      s->fromhost !=3D 0x0) {
      *  }
      */
-    s->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16)=
;
-    s->env->mtohost =3D 0; /* clear to indicate we read */
+    s->fromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16);
+    s->tohost =3D 0; /* clear to indicate we read */
 }
=20
 #define TOHOST_OFFSET1      (s->tohost_offset)
@@ -212,13 +212,13 @@ static uint64_t htif_mm_read(void *opaque, hwaddr a=
ddr, unsigned size)
 {
     HTIFState *s =3D opaque;
     if (addr =3D=3D TOHOST_OFFSET1) {
-        return s->env->mtohost & 0xFFFFFFFF;
+        return s->tohost & 0xFFFFFFFF;
     } else if (addr =3D=3D TOHOST_OFFSET2) {
-        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
+        return (s->tohost >> 32) & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET1) {
-        return s->env->mfromhost & 0xFFFFFFFF;
+        return s->fromhost & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET2) {
-        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
+        return (s->fromhost >> 32) & 0xFFFFFFFF;
     } else {
         qemu_log("Invalid htif read: address %016" PRIx64 "\n",
             (uint64_t)addr);
@@ -232,22 +232,22 @@ static void htif_mm_write(void *opaque, hwaddr addr=
,
 {
     HTIFState *s =3D opaque;
     if (addr =3D=3D TOHOST_OFFSET1) {
-        if (s->env->mtohost =3D=3D 0x0) {
+        if (s->tohost =3D=3D 0x0) {
             s->allow_tohost =3D 1;
-            s->env->mtohost =3D value & 0xFFFFFFFF;
+            s->tohost =3D value & 0xFFFFFFFF;
         } else {
             s->allow_tohost =3D 0;
         }
     } else if (addr =3D=3D TOHOST_OFFSET2) {
         if (s->allow_tohost) {
-            s->env->mtohost |=3D value << 32;
-            htif_handle_tohost_write(s, s->env->mtohost);
+            s->tohost |=3D value << 32;
+            htif_handle_tohost_write(s, s->tohost);
         }
     } else if (addr =3D=3D FROMHOST_OFFSET1) {
         s->fromhost_inprogress =3D 1;
-        s->env->mfromhost =3D value & 0xFFFFFFFF;
+        s->fromhost =3D value & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET2) {
-        s->env->mfromhost |=3D value << 32;
+        s->fromhost |=3D value << 32;
         s->fromhost_inprogress =3D 0;
     } else {
         qemu_log("Invalid htif write: address %016" PRIx64 "\n",
@@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
     return (address_symbol_set =3D=3D 3) ? true : false;
 }
=20
-HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
-                        Chardev *chr, uint64_t nonelf_base)
+HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
+                        uint64_t nonelf_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
=20
@@ -281,7 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, =
CPURISCVState *env,
     fromhost_offset =3D fromhost_addr - base;
=20
     HTIFState *s =3D g_new0(HTIFState, 1);
-    s->env =3D env;
     s->tohost_offset =3D tohost_offset;
     s->fromhost_offset =3D fromhost_offset;
     s->pending_read =3D 0;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index bc4953cf4a..fb4152c2a2 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,8 +316,7 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
=20
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
-                 serial_hd(0), memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
 }
=20
 static void spike_machine_instance_init(Object *obj)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 65a8549ec2..c6ce318cce 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -333,8 +333,8 @@ static const VMStateDescription vmstate_pmu_ctr_state=
 =3D {
=20
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
-    .version_id =3D 5,
-    .minimum_version_id =3D 5,
+    .version_id =3D 6,
+    .minimum_version_id =3D 6,
     .post_load =3D riscv_cpu_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -384,8 +384,6 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEV=
ENTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
-        VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-        VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.stimecmp, RISCVCPU),
=20
         VMSTATE_END_OF_LIST()
--=20
2.39.0


