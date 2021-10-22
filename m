Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0843718B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 08:07:33 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdniG-0005FS-5P
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 02:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndF-00062I-IJ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 02:02:21 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndD-0001SM-Nb
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 02:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882539; x=1666418539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CVP41j0XpGQomNwTD1s3KaFed/4DhPS/Sw2Lrswrivc=;
 b=dFWKXx/qloe9qTXQA4BaC+6LmV86yk41/D4cDGugY5AnDki7HlPbZeUy
 imDSn79wb2pvIVRzfhPYIzSX1Fxk+f9s0tWnN3mfInPTOwBjYXVrldEsC
 3A1MeTpg2fZxUcqyHRPqAMmSZ+39xOYR7nP5pCGTKjIHpzqhPgNxoHTDD
 KyZ++Sr5S1FT36fsrb6JP+4HW/y6eIMhKlv3Veyk02ZvTqWBDk8aCk34U
 zZ9NTUEcRb7zoCK3dXF0wOSwO/Yth4Wfff6PYeZlXPE5FQGGufS3A2F1O
 8U2ingAqWYcYXnQda7ru1pURpiZRhr/8BYVxmz9gOf2H1cujDbWzjYv6k A==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="182601933"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:02:15 +0800
IronPort-SDR: jeBbeEXifRJnmrs5l2mPRnJXRQ3O4mbwP8YwTfMJE3hsWjnfeuPDqOBDU52y8lTu983dTq+PWM
 9vnGS2xD+1+3gZOx8zrwEq/ZyRpZwpbVkdfIq0+BcxI6dzkOgEva+CyY28FV3kYO/6EUk4De5C
 8Nc4HHtyz3cCYi9eeb7i1eWFdcd2Jot26yFbQnALzS181eVkQIP3B/fk8lbjL+3WDSxNoy1XpP
 wjzbykRlPcN4iA4iluSFBtl6NGvTkgORP97nV3Qkfe2kupzj6zTlORIjh4kqDU/sRxQ8ltU/6i
 MTiUfuB9WAwER5z7z425yE6k
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:36:18 -0700
IronPort-SDR: feS7CzqJn6SfORthCA04fjZFuwKNO2XHSgSaE9z4QVHjLuHqaLrClWFRORbE9D4x/ov9nQhHHH
 ExySYAuDQ93jIFCdPHOVQiTAC+MMuNLbHpa+iIegOqYnYD3qkDdHrhynt19as8d2lB+N4k75db
 EPBtmizBDH81V0tfGXTNNIYA9AuwHLbNUC7qXfqbuqkREtc80lI1uKCIzEAQ5WaP2S5ezZ7VoZ
 u3MC3lW0HQovawU/8JbKaOff7Fp5JfnqqVG7U0ZYrPhKW17d0wQAS4DXazvNYpNXeizM5WATy7
 so0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:02:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJc2xNxz1RtVw
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 23:02:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634882527; x=1637474528; bh=CVP41j0XpGQomNwTD1
 s3KaFed/4DhPS/Sw2Lrswrivc=; b=ZKq3c7ZRP5Gu9oJR0ZS1AY9PQD8+pBjf+6
 xQtUAIwrvGTz7N7ebtYyze1fMfncGWvzEaRsQ4mvxic8F2xHx5ZCU/A7IAYBvsv/
 RqRS5a52ZBO9NDo+uofYkHsGnhOMrMovPdrPVVPsR+p9daLUeZFfBuuIaXMi1eI2
 LD9CEZEF9jVKMdTjmlpom6FdBeKzPdAiRz62Qxk46kEK4zdkHssHk6aI0BekbrqH
 1g2UaphUbOU8qEgQcIPsalbFn0TIODcE88kahsYeT8XJSwmCNh7Dqtion1cxodNI
 Wd+Hiwye2kyJ6oiTq5gC2N7IzUZhT4eV2I88na8l2a5r/vVPuFVQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id S6lQOzSU2diT for <qemu-devel@nongnu.org>;
 Thu, 21 Oct 2021 23:02:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJT6H11z1RtVl;
 Thu, 21 Oct 2021 23:02:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 4/5] hw/riscv: microchip_pfsoc: Use the PLIC config helper
 function
Date: Fri, 22 Oct 2021 16:01:32 +1000
Message-Id: <20211022060133.3045020-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index e475b6d511..843caabae5 100644
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


