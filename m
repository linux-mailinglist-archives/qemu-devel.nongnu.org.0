Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652F674E9B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1t-0002KS-Pu; Fri, 20 Jan 2023 02:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1H-0001DF-F5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:04 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1F-0004qg-GV
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200461; x=1705736461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hehPgQWOMMZWoDAuH5kxYAfsiSPA2nS6XH2RvSM0D5w=;
 b=ieeCH6O/XhA6TVZXOeVhbyxqs0S55XWrRdGFNYlJDgnivsSAmpbmKClA
 B5zsdNHgMDWRO7KTUtGvMmZqnMPEzHDSIPE0Fx4Yg0d3MO0l9Eau7WBss
 opA2AYcW2B9bV6sh1S1zAPnW7xafxKzIRyrTdU3I580Ge2AIyty2amBGF
 n9gAEFe6IM6+r/BNz+pGrRTCEsp80pSTr79ZEu1hb7Zs0U0sNguZzQFsB
 fxDlJLCuJ6rzGe7eqv7Rmb2Xxd9lR0NVwYHgqy2JK9RwV7eS4Wd6c/tQ0
 aiId3aYdQPQPGlURpTcN6JTSW9LedEONHK9SzfuH507JVKhUsvHRRTvhp A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176756"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:20 +0800
IronPort-SDR: awKe2mdIToE1EnwoFJZTKWWNcpoo5d290zccNubf9SmQ3LmwzZExoDnxcN+qAO468RdlPSqlYP
 wRMLd7h60TDLpXSdp+dTJbtGDqeoHqY2s6vWS6KiTeLqwHrZgpnpY4cj+j1d2O2Eyj5q8DeHx8
 RDuKBwWGHllRnVlp8yZhKx/FoIAbpd6bkpgri/UJxvYMRHsB6ASWy5mjFwuqtaBx3wh3QIzy3T
 2aqWaB7CmFu2zJ0bX0jWnh3GAhsdHXELK3yurjRYzMMvJO/12olFQsu42Bbt4V7hvmPza1s7zl
 nmQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:59 -0800
IronPort-SDR: u3/1RMeWexr6CiWRvFhlNRl+Yti0HDA2O23FVd0dhxlZlUvLSKFiaXCKIHwcDD7bheIAG2U+Jj
 ST5vWUSgXVQ786ndmEIFRMhrloPCzZn/LUPWhTvI/BYvEuNM2Q2NFROY+Kfor49bfkXXwNUehQ
 4hcj2DKHA8HARUV5yI7tanOGIJnpdq+1OhurDS4stR4DCO/UbQS3SWqmdy5KjP0DiycSgZbGBS
 r1S3Rq7e7sE4wk13sJ8TGqnrosEC6cAIst1jx5dcI60SuQgDazE+CkMKPSKBoAb96JdRYbeFIJ
 JmU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxw5J5Cz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200420; x=1676792421; bh=hehPgQW
 OMMZWoDAuH5kxYAfsiSPA2nS6XH2RvSM0D5w=; b=TFDAXeJpCfL/PYCQv3/aC4a
 T25iGsAugp9VfQFAMk5UH3F9LzXF8QelSx7KgsUOekIgCf4BUrE+e9a8FUZEbRZe
 yV9Mz5FTD2Yzc2v6XvrQjdGSxCDTczU6upkSO6s+MolFrNxnZZZPP/2qkPIgYoPj
 Et+kbousN66XnDWKOrPE9E8xYeUs53bF8kmf1WaF8jUUsQ5RYEIIGENuCJRFSZNB
 vz/AkF6Egle8i3XO6Y4TbyuCNxSiDigm7CWtAU+XfvaS2DrYzDwov1z9CvHv9K1B
 sMBL/qWZ8c4IRDcK80xQ+OTWcCAa9yh+pXfTvw05Smmrzuzxt+l+OTIMCBXBSBA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id u5WUcSCo5ZPl for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:20 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxt5DSrz1RvTr;
 Thu, 19 Jan 2023 23:40:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/37] hw/riscv/sifive_u.c: simplify create_fdt()
Date: Fri, 20 Jan 2023 17:39:04 +1000
Message-Id: <20230120073913.1028407-29-alistair.francis@opensource.wdc.com>
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

'cmdline' isn't being used. Remove it.

A MachineState pointer is being retrieved via a MACHINE() macro calling
qdev_get_machine(). Use MACHINE(s) instead to avoid calling qdev().

 'mem_size' is being set as machine->ram_size by the caller. Retrieve it
via ms->ram_size.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bac394c959..2fb6ee231f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -94,9 +94,10 @@ static const MemMapEntry sifive_u_memmap[] =3D {
 #define GEM_REVISION        0x10070109
=20
 static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
+                       bool is_32_bit)
 {
-    MachineState *ms =3D MACHINE(qdev_get_machine());
+    MachineState *ms =3D MACHINE(s);
+    uint64_t mem_size =3D ms->ram_size;
     void *fdt;
     int cpu, fdt_size;
     uint32_t *cells;
@@ -560,8 +561,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL=
, 0));
=20
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc.u_cpus));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
=20
     if (s->start_in_flash) {
         /*
--=20
2.39.0


