Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF3943DA92
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:51:54 +0200 (CEST)
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxOL-0007mO-5I
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxH9-00082J-Eu
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:27 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGq-00027Z-UD
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396249; x=1666932249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bhE2KAm4XELUw70Wt4uFjyOwGrHqZPz8+o1YDvNMX4=;
 b=jMVfh+5frPo0BHcocBdpLJhBauLtx+Ra6km4V4PRC1/pc1KHGEz0LAUR
 VcKbcM0ENgyPAom6YgLcN6uaFSQ0WqpVN66yKgiJu6jTzLnu8bmGY7lB5
 sadr6+tn2a/OeiYnNFYXgGWCiUM3BttFZ3ugXBPOr/ha5BELIKU1t3f83
 e07Mj1h265QlFK1921NRmLkjpP+DcHfNK0u+UVWzTl4YaoeTdo3njTCZ1
 nMLhm/erWT4PnMnhOD6O71fyMXLy+3tOqBizqZTir1Q0cZoV+LOB+GkTI
 MZ8QOPgcOaKq/VtoBrUiF45NrBYxDxUXqkFGQ4qn/EUDWOF2AXPWXC80Y w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975481"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:08 +0800
IronPort-SDR: UEebte33cNcs30NQ5k2sD8MhWeY0buvUnySYsRgJz4wn4GfWAabCtMeRxUuo3ZBD6Cty0P6+0Y
 zUqhQCcrUPZaMwvi+4zHYoUVtRhdc4+fYEPKw+ugwXC/pa9dUmrq74wLVoLk7p0GJrynqVEYcl
 lGaFodeCn41rx7Uafg2X7wEJsAccgn8CLbC/VDs52LUoB0Slxk/Gp0wMxmHiS1kGSfRK9Rxy9a
 9hjAaQ4BHgxuzrEu6jPwdjRX9evGcpZqAsa6Dsaldr+1qRVyBZogdyF/jlp3DbSWzAfhkRAzn2
 8Drr1vCwNpxr5fae0C1YSyyg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:03 -0700
IronPort-SDR: 3hFjp43mOltsfChAkDKlLnE3VlcIOakNnIFloAc3FIYfvDbFNXUmhhbq0ayIq1jictOES1xJuz
 D24x4+hGSoYw/OAwMErZuk+Ugf1wn51AlN8CxssbV5nNUHNH2eWqVBcVThj2wSM9iXfSH4Ka4A
 /pF2G3fwWWeXJWbtZjobjgltgMrUZj8z7Kin/DVH2OjtUl/fNGwZxbSpp95dA2OKImZ+bpeskQ
 K/zzDaXB65ACW0Psluc8Tkgf2GsmOIBDW0juKxj1oQF2px4CGLps4gvj+x2ejItm9vXa2wY6nd
 ds4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftHq6lsMz1RtVt
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635396247; x=1637988248; bh=2bhE2KA
 m4XELUw70Wt4uFjyOwGrHqZPz8+o1YDvNMX4=; b=MiNm0ptYmFDI7bIqG8IgnEE
 MwLud8Lofaf7imOifty/bQ76SgQflxiUxOJ7Cy3i6RsVvSJ7Ty78wrwgh2CiivpY
 FcfwQYaxX0TNKodjjbnh8U4bdWwYbAjB8f3Is2ebCCuVUxX7N6taX7Bjt8OclcYq
 KjubPMSIC07wN6gTzEb5Xi/t577jC2+c37vwHEghQbUKweGUK2uvxel5IqkgswyU
 wEajZuKzyPwqwJm/kCLQDOetsYSd8qUnKtaa6/MeOlcZj3h4cWJLD68FjnwI4OM2
 h2oVrdbN/bdai92LbbdqW7BKM6MVkJsuFdRnWGxooWWF8Z6rH2V7OYzq2cJ6k5Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Q79fKvkrHqm9 for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:07 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHl69QSz1RtVl;
 Wed, 27 Oct 2021 21:44:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 03/18] hw/riscv: sifive_u: Use the PLIC config helper function
Date: Thu, 28 Oct 2021 14:43:27 +1000
Message-Id: <20211028044342.3070385-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211022060133.3045020-3-alistair.francis@opensource.wdc.com
---
 include/hw/riscv/sifive_u.h |  1 -
 hw/riscv/sifive_u.c         | 14 +-------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index f71c90c94c..8f63a183c4 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -156,7 +156,6 @@ enum {
 #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
 #define SIFIVE_U_COMPUTE_CPU_COUNT      4
=20
-#define SIFIVE_U_PLIC_HART_CONFIG "MS"
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0217006c27..589ae72a59 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -811,7 +811,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    size_t plic_hart_config_len;
     int i, j;
     NICInfo *nd =3D &nd_table[0];
=20
@@ -852,18 +851,7 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
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


