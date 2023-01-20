Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB7674E3F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm06-0007hM-7C; Fri, 20 Jan 2023 02:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzr-0007cC-0Z
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzp-0004mQ-DA
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200373; x=1705736373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU+wBVzNNII4v6yI3sENTRDyq6Z7gbdYbVey7yTnsYQ=;
 b=LxtTbdIrSKazrG/Dfe6pRJihbZZNp7T/HppITjv9JlHnr9XGJDIFpmh8
 tLvtDvgdvF8fzRWCueDKT2St+NsXJukEBzqzHB9qu3bQcPvM7cFgAaCGg
 2GNmJAKDrErybzsTseYZBmgRU7w83CsbzDcEkmM08qAkK/Epd7QG/CEjn
 zikDBOHoZeYWYffejdsDPmbU2PnZCx8dg2tNnxEA5H4K3Z1rK8I/Uv9un
 71UxOMhACX2lVl4bVSqDhUuCOaOlkpnm5FMmAikTGulspCHSwJ4mYaYXL
 Ki0PV9vlR194Xm8/hXw+ml1ZHWWjreWfhx799fxHFneB/vThTCVqux/Hz A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176678"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:28 +0800
IronPort-SDR: ltl2yaDWpMIkkJ59d9ptEIEbd29gvUOCcvm+fVp8JOpbFAkGHsKf1mDRonvbU3lW6R6pbgxzoS
 npW4tfPO91ZYuL+bvr3LfQuyt+VkMSm9mO7ysc/7fQd401ws+GTTS6BAaMWXxoQlau6z2leyUT
 oEbjm2ffgCXIi9InaSqPynybNQU4CJqammOL2+NjXOHABuFinTlIByfUV2XX5CHpJxCgCd59a0
 7Qy5vNPrtStKmaxuIX6W2pDQbDVFTjG1qyHbGTcBFq38iUWUh6fzGTFU+XDDeATYpWgsq3AVWn
 Puk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:06 -0800
IronPort-SDR: Z0mjipGPGf9fAnKurBC34ELBpwCz8o8ZvSG7ySC6QmFZn1xKX9S/yoHKboPXkSLUprJWAtEJH6
 +4ucoxxssXpMURybRaqa2ec1TY6oHO3jT2BnK/ZYO1i/o43XZHmi0ZJ52pkWqKqorJH6QfyKGa
 X7fMig0exZ+svAVJ9d2vr2BCK+Go12pAfleVE8W7W4Tt63wzc404Y+bkxWcFc1hBhVw+vtEDPL
 oaQVNa8d41m6ZAz1XXN8kb2FDvaysn8FKhck53FrEZ4agaR8TTCe0InlOGFzAmcsyg6MiVJZPw
 gMo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrww3vZxz1Rwt8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200367; x=1676792368; bh=CU+wBVzNNII4v6yI3s
 ENTRDyq6Z7gbdYbVey7yTnsYQ=; b=eecbQ7oBy2UtTGm05KD2YMOAPNybXh+4dq
 PZaCefKqCOBwhhkFxQxULS0fkSdNm6wXkSRpsmIO0e0a7Hg+WJeNRsBWXtiag351
 UtEtbb3uNK9eoB8dGhFUnDHq5rXJuVQzNviB1k6WqbB09zs/RpPZiXsinseXA7kp
 rNotq3RW2AmqUKyjLqaIwl/wbwPChwm6ploaaDnrMJYrobObqz2h9aW/O3oFenfC
 tEsojnesH/Xm2Qnt33YWGVIi9EBdp2xuwHQSqQk4eJtBDnc71VM7lN6Ct7Jt0Stz
 YTPVHIRMEyo4G7+Sfu6gigIlQ9gehbH83LI/IEPvTJ8fhVhkqh4g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Pmo1b-1lPgaI for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:27 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrwt3vX7z1Rwrq;
 Thu, 19 Jan 2023 23:39:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/37] hw/char: riscv_htif: Drop useless assignment of memory
 region
Date: Fri, 20 Jan 2023 17:38:39 +1000
Message-Id: <20230120073913.1028407-4-alistair.francis@opensource.wdc.com>
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

struct HTIFState has 3 members for address space and memory region,
and are initialized during htif_mm_init(). But they are actually
useless. Drop them.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-4-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h | 7 ++-----
 hw/char/riscv_htif.c         | 7 ++-----
 hw/riscv/spike.c             | 5 ++---
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 3eccc1914f..6d172ebd6d 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -34,9 +34,6 @@ typedef struct HTIFState {
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
     MemoryRegion mmio;
-    MemoryRegion *address_space;
-    MemoryRegion *main_mem;
-    void *main_mem_ram_ptr;
=20
     CPURISCVState *env;
     CharBackend chr;
@@ -54,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_i=
nfo, uint64_t st_value,
 bool htif_uses_elf_symbols(void);
=20
 /* legacy pre qom */
-HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_=
mem,
-    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
+HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
+                        Chardev *chr, uint64_t nonelf_base);
=20
 #endif
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 088556bb04..e7e319ca1d 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
     return (address_symbol_set =3D=3D 3) ? true : false;
 }
=20
-HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_=
mem,
-    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
+HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
+                        Chardev *chr, uint64_t nonelf_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
=20
@@ -281,9 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, =
MemoryRegion *main_mem,
     fromhost_offset =3D fromhost_addr - base;
=20
     HTIFState *s =3D g_new0(HTIFState, 1);
-    s->address_space =3D address_space;
-    s->main_mem =3D main_mem;
-    s->main_mem_ram_ptr =3D memory_region_get_ram_ptr(main_mem);
     s->env =3D env;
     s->tohost_offset =3D tohost_offset;
     s->fromhost_offset =3D fromhost_offset;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 13946acf0d..bc4953cf4a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,9 +316,8 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
=20
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0),
-                 memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
+                 serial_hd(0), memmap[SPIKE_HTIF].base);
 }
=20
 static void spike_machine_instance_init(Object *obj)
--=20
2.39.0


