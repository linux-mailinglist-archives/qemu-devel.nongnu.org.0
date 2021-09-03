Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119693FFAB7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 08:54:09 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM35U-0002GF-66
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 02:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM320-0006t6-Us
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM31x-0000nw-S8
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630651828; x=1662187828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OYcMqf25wK5XjrbIbK/lfGfNWwWTK2uMlXb3O+AaOsQ=;
 b=UfaoNuhV6ag3xIcubmucTWiYUr9t2nrcBnyXhYQePQhw94jqzvsFzSVH
 222B3OWooyekYcHaRbYtfcqFm53QuGiUHEZyZ3ENSq2RQlkNKqX6CEKrM
 lGtQo5ZqvQOJnkjtUVLxxSoOjtlR5qdFVkBO80NzCJumSA1PnimlTjdpJ
 bh7V8eTIUc1F2iewsNGrAz8YQ0XOBdR3hPrbqJHhQgvUw0IVLkQ2c855F
 Yrf4RGnkv9DdKtf+ndmzHlqSzLPYC8N9JqkpPfJVsl04T/3P6wj0SEotG
 crYsNNUXygydCQMtciE+wu5w+iGeY21tYg9vMN6lTY5SuLOxdBsjfK+Mj Q==;
X-IronPort-AV: E=Sophos;i="5.85,264,1624291200"; d="scan'208";a="179111952"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 14:50:25 +0800
IronPort-SDR: A4Vib8u4FAAXk9b/l7V57vLZeP/7NgdaefjmAlR3jMKlpRIOXFLlAqI+cAXEbszT0J2fLAiVbV
 jzJ+7VQHmNwU7CR8yX48qR9Nh3MdBQTiO7L5T65Kk4WoFlsnU6ASvVAGPcJJnUjHZZRR7QPATl
 uqyIsIuTPZQZfw7XQjlPFJn7/ZJab/FaFhBWr9Ei+IgdKJO22qoxwUhktSSvR8Pi2NnSAvmjFv
 ZVObQrNkbMm9LqdkvWt2C9VRs3C3DPV8bZG4lCs1f4Av8Zx/oOOcKQ1BIb3VNpUnVUxPARtiS1
 8bgGNg/BTQI0U0KzamzKkiuW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:27:11 -0700
IronPort-SDR: j9F8fjf0w3uqzi+MOj4RndK+3QvuCo/PWowbMX2ZSh8fnLP5FE5DqjXcBMTlGzsQDOhS3XoiZC
 qpGeHd1cyhxutXiggrIdO2AFpnjFgjsAlB2H7xln3QOUfKy+ggnNdJENs58FrLez+77I/Tjewq
 MNc0TV2oCQRJ6VqmQs02MGAAQXVdPECN2D+3kCKd1yPvub+AowTZPHmpa9nJmCB07S8jwL04CZ
 QV5Vk6KXfuBxMDSkT8j+Ip89T8g7FbAVsPcsW4Pn4hGj7Mp0hnypKIhZyik95KPp7aU/FE25B4
 91c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:50:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H17hy1xYSz1RvlQ
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 23:50:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630651825; x=1633243826; bh=OYcMqf25wK5XjrbIbK
 /lfGfNWwWTK2uMlXb3O+AaOsQ=; b=LiB//bvXJrxCgvvQlbrFQXQNJm6WBY6h32
 gmoDjk533/JqlGLDB8LE+qLRHQvVJJd1OOdM7NZJanZ6+w7jBv50cxgsMbO3mg1P
 HJ4JPZk4Q8cJqqTeaViKVVpKQAhRK6Gy84WzVGlb6QX2L+M2O7qYG7pTK2T4FfVe
 0hJrTMcMswBBn00UXTdVXWqMZCQliLvtv3A+yi5eoISGSQMPrcl4VkGFLSYF/M70
 L+OWmJdu+C0mphq6CnFaKXMADvXqqoJErdTyZRw8YBVzAC+r1EdBzLN6iAUMYjZo
 ormga9/QxTxqEfnFS+MIY4Mk+DmXCJzlmBN+LyNXp7uKn3t151PQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DC4cH-UULCHN for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 23:50:25 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H17ht0N5Mz1RvlP;
 Thu,  2 Sep 2021 23:50:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/3] hw/riscv/sifive_u: Use the PLIC config helper function
Date: Fri,  3 Sep 2021 16:50:16 +1000
Message-Id: <6aef8a640e38e52b8790fc34a9b9b3b0f3a88a43.1630651786.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
References: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=873c9cf92=alistair.francis@opensource.wdc.com;
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
 include/hw/riscv/virt.h |  1 -
 hw/riscv/sifive_u.c     | 36 +++++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 349fee1f89..e95fd15298 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -71,7 +71,6 @@ enum {
     VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
-#define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
 #define VIRT_PLIC_PRIORITY_BASE 0x04
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6cc1a62b0f..9c51b4d052 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -738,6 +738,28 @@ static void sifive_u_machine_init_register_types(voi=
d)
=20
 type_init(sifive_u_machine_init_register_types)
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
 static void sifive_u_soc_instance_init(Object *obj)
 {
     SiFiveUSoCState *s =3D RISCV_U_SOC(obj);
@@ -776,7 +798,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    size_t plic_hart_config_len;
     int i;
     NICInfo *nd =3D &nd_table[0];
=20
@@ -817,18 +838,7 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
rror **errp)
                                 l2lim_mem);
=20
     /* create PLIC hart topology configuration string */
-    plic_hart_config_len =3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
-                           ms->smp.cpus;
-    plic_hart_config =3D g_malloc0(plic_hart_config_len);
-    for (i =3D 0; i < ms->smp.cpus; i++) {
-        if (i !=3D 0) {
-            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
-                    plic_hart_config_len);
-        } else {
-            strncat(plic_hart_config, "M", plic_hart_config_len);
-        }
-        plic_hart_config_len -=3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1=
);
-    }
+    plic_hart_config =3D riscv_plic_hart_config_string(ms->smp.cpus);
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
--=20
2.31.1


