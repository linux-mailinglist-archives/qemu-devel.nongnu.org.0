Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB6674E75
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1m-0002AD-A3; Fri, 20 Jan 2023 02:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1U-0001aF-Sg
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:23 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1R-0004qg-Pu
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200473; x=1705736473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfY2u8dhIoaTPk78wdVT5ZKWXL++drd/MLsDGfqJElw=;
 b=h0htQRPJiCWf6PDK2VVRa/FK3J3G1Jgvh1qYnXbXm6lGinqzW2xeRp2N
 FAa8d+BNGpQMKfCgUDrfeIzEcd9cqqlBgYt+RN8G/NQN3iwxizlnsYRMJ
 3VuaFHTmh+6+SIqW96Lb1rdXXo98qfYw1RN4qOCsak0IzKdQvsgr/lOjP
 Njfw12VN+OYDPUFHDshK38A/KENzmwEuhkTH/P2j0Znw7O+rQoJkSxD29
 8/wysRbYY9OfmaByjlzuf/DQEZpOdnHhMZm2Q7GsD5xJ0tyUPZ7u856cP
 KAN6EMhaUpfobX4Pz7+dT2PVtMp19kX6onfK1tmkELD7T1YSqVuuZsKi5 w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176762"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:26 +0800
IronPort-SDR: VdxORRVS5p5a2b8TwSlH0pxritaFYbM9qxTZLa0G9wSe94t+XJErwVom8x6m6ZFlq2FLeZ0MWP
 BnuaUL8sfy6//X3XsWAMqz/+sQXxhOXUxtKjmgcGQN+yZth8LjHFV3qUraXtL/YXHP33hngdZ+
 Rjn4qnGeteuUk6n0gYxcoD7yg4eBWgA7stgO0+Hq41IGPnq4axI04nzE0VAMdUYC8zTnGI3apF
 Q3SizDRGl9/N4FOQ590ICcL4U/PZ2K6tAd64xzonj8TYqF2b+FneQ0QS8MmMdd6gMMW53fHFM6
 VsY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:04 -0800
IronPort-SDR: klrZKdWMkz9ROVozbYIcJG+zLEgK0QTIszxpawfTlU4vdL/mXaM62lYUmo+Ig87m+/ZX8EgohW
 Z9sP3VI58j/GURbRQ4hOpBRMl91tCDn516WuxgwecRAuV4O8jceatisywQV2lOMiQ/mIPzQg7P
 hNV37H6IqrlQBJ/GjzTqwWWtGcoqHia4Fi16XyQHh6E4EGrzkXfwI8DkML3xwZ7KVCCjHcG7ny
 ZUAcUSZRs6p2I+ZWpKe7pEvkpomtc9GUZYiggSh16uQXzXE4KMoHz7it/s04k+e7lEH7bICL50
 lOU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyry24QBqz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200426; x=1676792427; bh=rfY2u8d
 hIoaTPk78wdVT5ZKWXL++drd/MLsDGfqJElw=; b=X7K71gQ6jEcIP78q5FFot0k
 Ru4Vf87th5QLtA1erQT52CIQRuTdJiq1PLMKw9GK8e38u8n5nv9NvKg/rKa4nQ1x
 zGgtw+wyM5N37fmeKwkgw6RPjGG3dcBIK2jHIc8CsfR4P7wJVOVNIGyEHb5v+e8K
 y66o1YBErSfOrJBDNtlLq3iDOthj3jALtuv+Jt8uHdLQXZoGnR4CEKv9sU7w9y1/
 LaSxrt9vhNmEuC+xhV1pJc95xbNG/MJ+jM/7f3Gg53G/EB3yR0N0KwQCBK52O0G2
 LKbWGhf3kPU3p7FpPY5um25r71dUXMUHOdLHerzi/TgCeHM6nHcrP2czGOr/AHg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WWQmtmHF3qoL for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:26 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry03bQSz1RvLy;
 Thu, 19 Jan 2023 23:40:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/37] hw/riscv: use ms->fdt in
 riscv_socket_fdt_write_distance_matrix()
Date: Fri, 20 Jan 2023 17:39:07 +1000
Message-Id: <20230120073913.1028407-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

There's no need to use a MachineState pointer and a fdt pointer now that
all RISC-V machines are using the FDT from the MachineState.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-7-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/numa.h | 4 ++--
 hw/riscv/numa.c         | 8 ++++----
 hw/riscv/spike.c        | 2 +-
 hw/riscv/virt.c         | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
index 634df6673f..8f5280211d 100644
--- a/include/hw/riscv/numa.h
+++ b/include/hw/riscv/numa.h
@@ -100,9 +100,9 @@ void riscv_socket_fdt_write_id(const MachineState *ms=
, const char *node_name,
  * @ms: pointer to machine state
  * @socket_id: socket index
  *
- * Write NUMA distance matrix in FDT for given machine
+ * Write NUMA distance matrix in MachineState->fdt
  */
-void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void=
 *fdt);
+void riscv_socket_fdt_write_distance_matrix(const MachineState *ms);
=20
 CpuInstanceProperties
 riscv_numa_cpu_index_to_props(MachineState *ms, unsigned cpu_index);
diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index f4343f5cde..4720102561 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -164,7 +164,7 @@ void riscv_socket_fdt_write_id(const MachineState *ms=
, const char *node_name,
     }
 }
=20
-void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void=
 *fdt)
+void riscv_socket_fdt_write_distance_matrix(const MachineState *ms)
 {
     int i, j, idx;
     uint32_t *dist_matrix, dist_matrix_size;
@@ -184,10 +184,10 @@ void riscv_socket_fdt_write_distance_matrix(const M=
achineState *ms, void *fdt)
             }
         }
=20
-        qemu_fdt_add_subnode(fdt, "/distance-map");
-        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
+        qemu_fdt_add_subnode(ms->fdt, "/distance-map");
+        qemu_fdt_setprop_string(ms->fdt, "/distance-map", "compatible",
                                 "numa-distance-map-v1");
-        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
+        qemu_fdt_setprop(ms->fdt, "/distance-map", "distance-matrix",
                          dist_matrix, dist_matrix_size);
         g_free(dist_matrix);
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5f12d80317..badc11ec43 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -174,7 +174,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
         g_free(clust_name);
     }
=20
-    riscv_socket_fdt_write_distance_matrix(mc, fdt);
+    riscv_socket_fdt_write_distance_matrix(mc);
=20
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6a2422a8cf..e6d4f06e8d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -805,7 +805,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
         }
     }
=20
-    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
+    riscv_socket_fdt_write_distance_matrix(mc);
 }
=20
 static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memm=
ap,
--=20
2.39.0


