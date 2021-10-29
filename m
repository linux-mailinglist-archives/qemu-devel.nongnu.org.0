Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCB43F7CB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:23:22 +0200 (CEST)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMET-0005r7-Km
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2s-0000i8-7S
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2p-0004tB-7n
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491479; x=1667027479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEw5q9HNzhkql2zKkXPMJiqfgwFvkdBfp9K+I2P679s=;
 b=HlMD2HbxC/mOdBAMz4p7khgKJ46Q9XSXbmc+vG160ZPOglWOAGp4WN8j
 iGvvv/SYNaTzc+Zaad8KnsfqY8E4FqHJVt0CG51QJ51/PMeedQSLL+MWj
 NG7sHUlC4jXgWk3YrwEqGNhIwL6oNi4TFwnzNXCOqIaBaVGKRtZaDOnfY
 Of9Mddt4sKT7HW4yqiS78nP2HfOGbdYBBU7o8q3vnXED0OYiSWbuzWMLY
 KmtD5gkbIqTD0ZRzIL8Rhz2DXmzjVD+pVmW6dS0K1p1Sgbi/X16MYnsOy
 JShR169q9m1KxMhsLOG3SWYZkjYUYh5bM0OAqBYoUc49cK862RLOx1Kaa g==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="185100394"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:11:19 +0800
IronPort-SDR: +OTs42sopD0mTHApBNmvTIKjUb3UXbKcATN9+eQAUXQGVvyBv7rVPQ/6ptTCiHtgu26nrIchK0
 D3AR3Lcb14Z24ai+kTnZAtIzNeJ18s+j4hevv2Jo+sCFKf2vY8EOvihXfoW8FfZZhbnv6r4VkU
 mEtFBFYESJbA338dTD8+JDgf21k6HWv1AJNzQCGdwiRY81B4e2fBXlK8l3RuhgL8DuREGEa2te
 rae/98WpVte5fQddPfTkkenX1S5TZ8edSdUcst7Bagbt98TH2f3WdVdig6yhr5ut1KIXp+yDPd
 /V5MuA8Fkt3jT0YwIgBws1OV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:45:11 -0700
IronPort-SDR: 6FkECiXk42D4tVp9K0eLpvhOOtA8FxcyrUcogucK6OBHm8UXc/HOBDA8grsXmocgV3o7SCyUom
 lwX4gyJsk8YnPt74zwyH+QT/G4s4wqa/3/yl1EwT+k5o/XsHDvsdeFrEkNpkJyzEO6LKngGL1n
 QEGahlERFJXt8+bUrS9o1CTrH3uN0nxIiWcyb2fCBJHVusoTii9c+mIsRKwxWD6V7UW+kkPVxd
 +/qncpQRAS7nTQGQjEAEi7uGR3+wUYV7NYgYm1BHe48e/pPdAbCS6JyapEnSVjK1J3pMHfh5DO
 TW0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:11:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYWB21hhz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:11:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635491477; x=1638083478; bh=KEw5q9H
 Nzhkql2zKkXPMJiqfgwFvkdBfp9K+I2P679s=; b=Y6N6IqwirKJvwvb28PyKKsr
 WnEUF8qJux9eg/wQdFO+sxMicXtQvaOq0Oe3f05IAdFRI11W3mOx7p/C2rUZZDKB
 ZUCFfgHtwI6zQiAY545qSRbgFiktYZONLTPWKXD8o/DWoyRiFUDyBqwcMtHg9ggp
 uw0JVfg2FC6RsRhi2FDQ/FIRM6gZA5QpYAybffNZS0wqledz/K9lr4ofSoChBPMD
 lsDfJdcNzzOX4IpERh+c6C7PdFAMOrVYR3Lbpw7AKdKjgqh+e7RTUtl4PrFA8kAa
 sgbZPTM9sZjYl49lm0ohdOLJJqwxSCmKbTCkNjYqFRLXoDzQ7QH5wF3HJTrN2Xg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hhwIc-9mVhsz for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:11:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYW64dR1z1RtVl;
 Fri, 29 Oct 2021 00:11:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 04/18] hw/riscv: microchip_pfsoc: Use the PLIC config helper
 function
Date: Fri, 29 Oct 2021 17:08:03 +1000
Message-Id: <20211029070817.100529-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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


