Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1B5333C8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:06:38 +0200 (CEST)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdbp-0007rf-Ur
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHl-0000cO-GS
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:53 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHh-0002Yx-NR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432349; x=1684968349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2in1ZYlwj8ufywlVgOnwd3niFo2pOS1FCdvDvCNnzJI=;
 b=h7/1fnsJOKlsusc5k2Sdjj9yQgdhoR5NfqmB78ED3izdEIslbHf7bZyp
 nhw1Qpb/puO5iW1Zrh+TGB3GogSLs/8UEesUE1sxMA5kAfz/i84Tmzer8
 HU4F78NYrMaJ4W5uCGS7czr0dhHcZPZpxrPtAqtIehsF6FMVzy1ZVnWAx
 n7nBakZF1q4dkYeWIglwrdqe/OTcurtUl6PTKNgfJ1E4VUMPfBsW8mhdE
 HNdf2qysAwhT6oD3RTqmLzs1qOaauPDdHGCtfscwEvkUwxAodi1alMDZP
 30wJxEt8KgYxcriXbuF8F40fSfh9Bo8KdGjnv6lCHcD0K28MVnN0aheS1 g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566710"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:28 +0800
IronPort-SDR: 3aw5TzJ3/mRsIGJUyM4Mkk5op4Fx9zlB83mbntj7DqU7775caFoS2kt2xhB5NGyKWjf2sOtAM4
 aBXIWap6FkRzRBJ/SqAjLDpMXuZa5osWxRAWENLSjuVl5qOUKQ+8yrM/jQEe2j+l8RTxT03W1a
 3OWfA9wLVRrud/8cNlYsVmer8XeSuMcc6O+IkKt5eD4LolxKb1wq7UcNcM30BP4Zu/VevMpYFP
 LcFzmQSt8cwlFkO4NH1FVGcrPHrTifgQ+/BjGQ579Cr+WZ79DyZCob4au/h8fiE2jmszCUVD/b
 4w3hCK2aBhGGvHrjnTEIqysb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:05:00 -0700
IronPort-SDR: 7S33fcZZctK3fYbyYOU/usgT05s0CyYAUvrMFeaZKlwNj/lZwNo1tlwLafBgvqOHT/hj4b0n8J
 YVg2TA/HWw4C92iW9QdK+ov85rsh1E1bLFdFk8QDgBWx3xlJMP0/8ca7CsyqgH+Bi0C5F8G+db
 nmvclvTuPaOalQIy+NDrjUSAdzdoEUCT2r5x/p3mFy+xiJoBscKdgBIP+jvHZdHccohe0s8Efw
 1Qy8vUHlWbhWTuS7h836f1wyeBZqGaIsEPGm0W6mtrnkcy2vf1k2xHrr2y5fG1jHlYyTfy0CI6
 gJ8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RW6shFz1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432327; x=1656024328; bh=2in1ZYlwj8ufywlVgO
 nwd3niFo2pOS1FCdvDvCNnzJI=; b=cCCQLnKwjMlYKabGVDhFCZ8PuUn+SMwYti
 EKyyVVSR6fNMqbVJNVBYEnj+f3juAQDxTv2Yirn0jvMVBIw/hS2/wI2YvBwvtmAn
 BqQ9Es/BLPR/fLuSfRsx8QG2LQN1k8rRqY4yUniuo3vTNsZtJVM7sadciiSgclGD
 YSPIQ1Jy/R8JWt42C3saiydgcG2PBogXrfBxQGwzfRq4Ic1N8FmNarS940Dk/WMj
 F1hN43q3cvXC4F4ZX65jbn6lMTmw9lYFFmDO3fvNkhcZ/o0HZpkRBP5lN2QVWYPl
 ZQdY2iOss1A9Mu5DDlpfi6n+jSxFYdYR4lqkaJ7sG+QKwCzyCzUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WBHHUvNnSwc1 for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:27 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RT5Pzrz1SVp1;
 Tue, 24 May 2022 15:45:25 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/23] hw/riscv: virt: Fix interrupt parent for dynamic
 platform devices
Date: Wed, 25 May 2022 08:44:25 +1000
Message-Id: <20220524224428.552334-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <apatel@ventanamicro.com>

When both APLIC and IMSIC are present in virt machine, the APLIC should
be used as parent interrupt controller for dynamic platform devices.

In case of  multiple sockets, we should prefer interrupt controller of
socket0 for dynamic platform devices.

Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating
platform FDT entries")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220511144528.393530-9-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 244d6408b5..293e9c95b7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -478,10 +478,12 @@ static void create_fdt_socket_plic(RISCVVirtState *=
s,
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
=20
-    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
+    if (!socket) {
+        platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+    }
=20
     g_free(plic_name);
=20
@@ -561,11 +563,6 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
=20
-    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
-
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
@@ -704,10 +701,12 @@ static void create_fdt_socket_aplic(RISCVVirtState =
*s,
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
=20
-    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
+    if (!socket) {
+        platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+    }
=20
     g_free(aplic_name);
=20
--=20
2.35.3


