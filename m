Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0143DA8C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:48:08 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxKh-0002U2-Nb
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGy-0007qO-RK
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:19 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGx-0002ce-7f
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396255; x=1666932255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEw5q9HNzhkql2zKkXPMJiqfgwFvkdBfp9K+I2P679s=;
 b=NN5eI0U5hOKiXNCqawtH70FwkQSxHo6C1A7uOSgkmPiCXsoTllYiQx85
 mIdJO74jqKH7/ft9bi0uC5bileKY4q2WnaBVriG2ax6mFXM1DJ+pUWJM2
 EoqOySR2CAWNL0vpDF0b5+siJ+7BZytSNDKdIiREF5VIKjE031+FQtxbT
 F+2lTfl3l7513WVYeP88uk9rHCIFsdma5e8tkLIb4qpC/RTxDMA2ufZ/d
 gMbpYuS2lOQKVRhNGcS2Acf/7n6tsDub1C8TjBJ1pddwKt3Ro10oUoFeO
 OdTbQLvyoHdGFsZ80wPpxcq4XLYWiLndZEz22Um3HGQivX7D1YmbRyJ8N w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975485"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:13 +0800
IronPort-SDR: HWEq5ri6s81yNlsA+YpeUmHeBm9HR+FQHvpKbZky3UE42r5h4xVqzLPDExtFqQxIgMuwmr5kHp
 Pf4MXkmekUZtoTLT2743UxMvTKEajaZVr44YnulkTZEOR8em3A2WvR6sALkBtzbKMl0zLh/dZv
 60dJ5QyGqs/gSQmnBAIy20/+kSi694dcWqLG6//hcH1neJYiGUXkEbk0NOR7HKYMCHE+p8MW/Q
 vbPdpQdVE1lE5HdayP+aEZjOh6gXKZf7zjnPKvLDHf+f6BBvmaXEc2/9yxA2FF+NlEeBNTIzJV
 1EKULkWOVnPxXG4p1GRHgh3N
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:08 -0700
IronPort-SDR: ZrZhDryOH03oQzhJCwO9MNhruzKHbTvT1fzwe/P7N/YTDfM6HYqnLZ8TYbrDOzDpyPhWJ9qFkm
 7zjJtfKyaICTC4EqnfZLXWpH5xzs3QxACHqUKW+X8AKRwa0AHFd9MAHMTvaJwoMgja8JT6snXe
 nmTY1IhyhIJhp7nq7rlHhgaYWPCxm9Ygm7jCOKYUurqLAGtZAHjVZ0qlBV+Y9Xc1PoComWTGU9
 whe6jjlpLdF7ciwHlz8gS09VwuRuwe4Q+0G801BDMLbH/bxgFhmN+YZUF5oH8laQ0GzeKW/UfD
 pP0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftHw6lSJz1RtVp
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635396252; x=1637988253; bh=KEw5q9H
 Nzhkql2zKkXPMJiqfgwFvkdBfp9K+I2P679s=; b=eHV53gA4BKJxsSl1MruIPVK
 PQgKSc/Q+WZtQYXwg7pUbEskVBMoJxkP3oiRbvno9MNKNLOO4OSYXOlq1ckkpSx/
 Xn1ZcjlXGnRyWgGITqyTFmZDCY3eDwwVdB2yzdMv43Y48iApqDemEPpx8JgMKurC
 DdtXcZV1JkwvKttts9TkxGVSNTeCEwB/4ow/GtFMbpDKdtCKaXK3YbRbWTnpPH4d
 Ska2o5X9UkDrmHzUSuBW1MUmCvBPbfem+MARgWLfD0ZfB5jw1k1ZV2YdwuRnEmrL
 ke2szETHuLrVWFmiX5Rb033VZPiDR4NRSBkZ4dM2kZaWGfaKvwIlNxM9kFhIRXg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XnsFDBuLVHp1 for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHr3nx6z1RtVl;
 Wed, 27 Oct 2021 21:44:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 04/18] hw/riscv: microchip_pfsoc: Use the PLIC config helper
 function
Date: Thu, 28 Oct 2021 14:43:28 +1000
Message-Id: <20211028044342.3070385-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211022060133.3045020-4-alistair.francis@opensource.wdc.com
---
 include/hw/riscv/microchip_pfsoc.h |  1 -
 hw/riscv/microchip_pfsoc.c         | 14 +-------------
 2 files changed, 1 insertion(+), 14 deletions(-)

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
index 3fc8545562..57d779fb55 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -187,7 +187,6 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
     MemoryRegion *envm_data =3D g_new(MemoryRegion, 1);
     MemoryRegion *qspi_xip_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    size_t plic_hart_config_len;
     NICInfo *nd;
     int i;
=20
@@ -262,18 +261,7 @@ static void microchip_pfsoc_soc_realize(DeviceState =
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


