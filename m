Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78A3FFAB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 08:52:40 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM343-0008RQ-Hl
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 02:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM32E-0006xz-6q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:46 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:32486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM32C-00012I-9U
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630651844; x=1662187844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Os/7HjmxGUjIby/5+8VxBkiZOflnspRZQ1yyW09TghI=;
 b=GVOyckWLCO+8b678tFfOv7QgOdVFVYGJqQsSbbLZw8hJNoDqZ8weZ2zK
 iicdHeoDlAE8aA9NrKQEapAie5NbA30dFCZOZ87NDZKVnf3TFlAGb29yP
 sGLPWoy2P99vaFNYcoTdo5priGSj/q1a1K5omozKGFrqEZGryU49/Wd1A
 o0dN6ebV3kTo5SAKDaCWeLBlsAWGYi3mwb9arsHb5ajNYxOsj2t1N3h/S
 rQzc15E0LvTQyuUUcDzR5Uxs51PkTp0gJPVy7RDpWoB0McET4sIPTIfxF
 8T5rL4qP1bJ3EhbfnW/PJsXbntgBROyUKKGBYlofVzDSSIR5Zdgd3E+IO A==;
X-IronPort-AV: E=Sophos;i="5.85,264,1624291200"; d="scan'208";a="282909106"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 14:50:42 +0800
IronPort-SDR: NUf6PtjQv1M8vRGqEOyh63LaiYtqHKc6l57qr7DpHxNGLY+lDtSLr84tzcfFunQS1oWHDoifed
 iRPzh6KhO/MIoaD7IlrtuZ+DkXfbhrnJkUjj4htCHuROehV2Z0gO05NqdfJg/AW3ryd2LbzViO
 Zb8wWGqvtfR5xqEcmsDeNKQsDQMD1s015OerlXDzf2IPRZG40uw9yLUbDXrS3vc5tBXb/bGDvQ
 uxcvuRF8pm9iUysiAVYbVN/KbAF2QVWelUIsUVk03LZMAogu8OMLaoyhIEyTm6W28TWEXhrWC/
 H29uZXTkMHn+srzqKZqearL1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:25:46 -0700
IronPort-SDR: TIUJIhvDFwHAJGVdh/mZzt5Qz4OjDUCoe9IrmrwYEJlUsb3e+5nKFIX3jRXDFziLoLviGBPGO0
 5UxoFzej3FoTn2idxkhjvIOvHP569pTFCkqwJiILKUjhxgskHglLqjJAwXXvqlZjUKN1PhuMY6
 ePNCuhkLJblP7zqZ41oeU9U/9ON+eGZnnVN10JG0NeHWGST2c6DWnK96Q2EX/N89UnD25T3juU
 h2jswtSbwK/rOcVAW6sH+o39vLfuBmyYHfzUaPgH11hthVFhBtjj8PHLqAi0c52r+M9yqXaC3e
 RtU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:50:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H17jG2bSWz1RvlT
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 23:50:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630651841; x=1633243842; bh=Os/7HjmxGUjIby/5+8
 VxBkiZOflnspRZQ1yyW09TghI=; b=QPN0lfdgbR3Dnl2ISALpzLK1FKUX9DRQfC
 MK/SRQ/CDIxa49r45zaTck5/XxWlc/Atu00vEJf8OPEFEQ4NtfICRgatBL7L60GI
 nu6GZZL7gupjkw4tIUJ4s9ZN9ggpZdxwMnx3WCKAFgsKdfD3QK5Q3MrHuUXBQi3l
 hqhYXD2VFRiCex7cm6PIIXN6+2cqRzSwt4nUHFNeg7bUOirCVHPfQq5Ws1is9V7m
 71/snlkCK6ohGu6Cly+jEQUBdV+xEGxW7+sPvIuySJjprCkocf5ffIDlbMhssHXr
 peoSCnREezAQeAUmCfUEHLG3+vBTZpdZuu97BnDGoYILlACHu0IA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ILNif0qa3Pio for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 23:50:41 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H17j83gh8z1RvlP;
 Thu,  2 Sep 2021 23:50:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/3] hw/riscv/microchip_pfsoc: Use the PLIC config helper
 function
Date: Fri,  3 Sep 2021 16:50:29 +1000
Message-Id: <31b6dc8e7bacc4f197f6ca5c90a1075bfdb6c75e.1630651786.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
References: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=873c9cf92=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h |  1 -
 hw/riscv/microchip_pfsoc.c         | 36 +++++++++++++++++++-----------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index d30916f45d..a0673f5f59 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -138,7 +138,6 @@ enum {
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
 #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
=20
-#define MICROCHIP_PFSOC_PLIC_HART_CONFIG        "MS"
 #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
 #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eb8e79e0a1..ec237761e7 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -128,6 +128,28 @@ static const MemMapEntry microchip_pfsoc_memmap[] =3D=
 {
     [MICROCHIP_PFSOC_DRAM_HI_ALIAS] =3D { 0x1400000000,        0x0 },
 };
=20
+/*
+ * Return the per-socket PLIC hart topology configuration string
+ * (caller must free with g_free())
+ */
+static char *riscv_plic_hart_config_string(int hart_count)
+{
+    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
+    int i;
+
+    for (i =3D 0; i < hart_count; i++) {
+        if (i =3D=3D 0) {
+            vals[i] =3D "M";
+        } else {
+            vals[i] =3D "MS";
+        }
+    }
+    vals[i] =3D NULL;
+
+    /* g_strjoinv() obliges us to cast away const here */
+    return g_strjoinv(",", (char **)vals);
+}
+
 static void microchip_pfsoc_soc_instance_init(Object *obj)
 {
     MachineState *ms =3D MACHINE(qdev_get_machine());
@@ -187,7 +209,6 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
     MemoryRegion *envm_data =3D g_new(MemoryRegion, 1);
     MemoryRegion *qspi_xip_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    size_t plic_hart_config_len;
     NICInfo *nd;
     int i;
=20
@@ -259,18 +280,7 @@ static void microchip_pfsoc_soc_realize(DeviceState =
*dev, Error **errp)
                                 l2lim_mem);
=20
     /* create PLIC hart topology configuration string */
-    plic_hart_config_len =3D (strlen(MICROCHIP_PFSOC_PLIC_HART_CONFIG) +=
 1) *
-                           ms->smp.cpus;
-    plic_hart_config =3D g_malloc0(plic_hart_config_len);
-    for (i =3D 0; i < ms->smp.cpus; i++) {
-        if (i !=3D 0) {
-            strncat(plic_hart_config, "," MICROCHIP_PFSOC_PLIC_HART_CONF=
IG,
-                    plic_hart_config_len);
-        } else {
-            strncat(plic_hart_config, "M", plic_hart_config_len);
-        }
-        plic_hart_config_len -=3D (strlen(MICROCHIP_PFSOC_PLIC_HART_CONF=
IG) + 1);
-    }
+    plic_hart_config =3D riscv_plic_hart_config_string(ms->smp.cpus);
=20
     /* PLIC */
     s->plic =3D sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
--=20
2.31.1


