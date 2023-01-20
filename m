Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C63674E96
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1m-0002DM-9R; Fri, 20 Jan 2023 02:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1G-00015W-2q
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:02 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1E-0004pk-86
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200460; x=1705736460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jd2Yqpp2DjWgjp0bIM6NLMoA9/CTlGxY2BkJZ/NuQ1E=;
 b=QpfaTthU0WYaMxqfQ5RHsAMXUnhKUUCZk4ckrmU1ZXGcajFpWmcV0ke/
 DaxY2eAWk41q4n7uoBVJSeTuzcw+qis/2h2zHMYsCnXT+qaeWETzV4XQy
 lGxtx6f4SHjQP86I/l72W7avi0jPz7rk9XJ4dC84LEU/FQb3VGDxBQB+p
 sEy83sv1XBQ5j1iul9KWDNe6J00IaONr5ACXe7BoAGqjILl1GnuB59oqt
 4qqeeBOIV/OlhWlrwuIn4dc1gJLYSn06jEbwCnyGbanE14uqOdU5ArdPV
 luvSSoIDRH3r/7DE3d4Du1ozarGYkMIP0qAJZjKnTMhP3eOIyDxoKaMOc g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176753"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:19 +0800
IronPort-SDR: 7be6y9y8NI7yDbYAiIlqGiFS3lXISOU6y7q241AK/YRwhbaId7BJoX3u9xU4t+Xz8Rdomz1j/6
 2OzCa/b0UVEgbA8/J2Xi2yAiv/aeF0gbR8+u5iD9awsvEoar1cwh53LqK+2GeXJQKSQIRfKw+J
 HMCqbpxsNmpk9VgWfHdPN0pIvwoXb2Ow3e/YXO/Q7TeciGPLEMnnpMz3LW2okwmpgW468Qwpei
 PNWwMt9+S7nowxegr9TaoH9zPV7xV123a+6TTaRCCekDtoKwD1tuRTro9rGqMKsNQUIOgzvbfp
 ZEA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:57 -0800
IronPort-SDR: wm/L3xaSKpJFkzUmSdIQtnPO5UY1kT00WSQ5VgkSWvFINHeP7zwy82VQSPvYsRNYZLfz+pWNa5
 TdLlV+TUw0dbwej6kvA2R9R2nXpWzFbkYq3x20kZcNR1SR4t4R2z/6YGXDPuWcHwFPX5Ri3oAt
 +FtMW1+Uu3PQ8O4dz8F6gFoMYvck0f4iQ3AmIjlJBdrL3nzR1YCZIlH4DJ+TXWib7yyZujbvoK
 STbnnjF7B3h5z38T1Qj0aXxxbu+AjYWjwdA1mqLKLmZHWE/nnGEnScPmTy4/t5zxP7Ejs+NHKh
 rLI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxt5Vsnz1RwtC
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200418; x=1676792419; bh=jd2Yqpp
 2DjWgjp0bIM6NLMoA9/CTlGxY2BkJZ/NuQ1E=; b=XZGjuWuTlZALAh6DkgeNwn2
 wyqeI7Aq2jrGVtRuc6SV4xlaKP3xpW92qMFM9kzdG66o9Kw222nmSpAEOZxA64GJ
 EXFF/+SVVDbEFtgZNJn0xHX7AT+yFt0ViJkQes7k3pa/Ttwldzq72ouXmApSNNzw
 2OJGYQDD25CsGHRoBd+IYEjbew7ujLVS/zBGEZnGM77GdfHjUnmIJxHh+/vWmW/y
 Fnlv8wdR2A4hhJ0BxXCKaRdfGqOB71vSNVMLK+2VuAnVUFzhy9/O+gsWrXz7pT3m
 R7ScaqlWDHejfe3qwHBlSicKHk2KJpQQbYqGRedQNHNrkMTLqoXBehXwyuJ4Q2w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PxUP2E35S1ch for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxr6FQMz1RvLy;
 Thu, 19 Jan 2023 23:40:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/37] hw/riscv/virt.c: simplify create_fdt()
Date: Fri, 20 Jan 2023 17:39:03 +1000
Message-Id: <20230120073913.1028407-28-alistair.francis@opensource.wdc.com>
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

'mem_size' and 'cmdline' aren't being used. Remove them.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-3-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c8e35f861e..1921d3caa3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -999,7 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, cons=
t MemMapEntry *memmap)
 }
=20
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
+                       bool is_32_bit)
 {
     MachineState *mc =3D MACHINE(s);
     uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
@@ -1507,8 +1507,7 @@ static void virt_machine_init(MachineState *machine=
)
     virt_flash_map(s, system_memory);
=20
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
=20
     s->machine_done.notify =3D virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
--=20
2.39.0


