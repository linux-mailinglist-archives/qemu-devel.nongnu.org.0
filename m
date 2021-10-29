Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985943F7C2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:18:33 +0200 (CEST)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgM9o-0007kp-CH
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2m-0000bc-Vn
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:17 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2l-0004tB-9F
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491475; x=1667027475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bhE2KAm4XELUw70Wt4uFjyOwGrHqZPz8+o1YDvNMX4=;
 b=UKJxVqQu9Q/Zy2gQQwHO234bco9IqbT4yUQQxZhS/ZOswHzqnYnRiigB
 qzFvU0JBgl/1i3GTrKAtl3I43bvPCe0/hU+Ne/fNEZCytZFbn1Fu0syFJ
 0GbK54cigmmqdTdONg4LMEkVWVbLUdgLC3urEs4QXPxvb7KeZtYDJa7wF
 CHvz3MauQKxZexV/eyp9UUoURHJWaBoiqGK/aPBNVLlNNhoKJnisGAV++
 72mN++e8dD3enh65XCVWjHj12a5Ujsaz6QhBm1zlQceb1u48mgYri4prp
 zwywzjTE4BGxfkqVoKBpUHWTQNljJ2Kf0jfXXAZ0MZoFuvX5Stph3V2VT w==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="185100390"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:11:14 +0800
IronPort-SDR: KqDpqQam+QUKFzJ6HVzKYNhnOkKE7GFfYzg3AJZcj1WChpVVANALOUgDEjkeVr6Kojc04/1p5E
 WssmhtmDEBgVG+WmQ6HxaPwJkBp7Yu5Colq6vEkG1saNZ5EPdztDolIhWWH0WxzWhXCR72Jqu9
 APeB8Aw1UPj1+Z7b6AaqwJhwKogWo9tm5G7c7SmgsrbFR90gXH3F8g8JbiQYhQR2JM/qJcOmv7
 5ZZm7jNC6uGlsblXP9EhJjYf61CkB4srrr6GXuCNk5R8rU7D98bqg+6vS1qFIGDfAi5pL2/O8k
 mSMPotOvzGrotssIbIxCisD5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:45:07 -0700
IronPort-SDR: M1/OGsI5P98BSfbglm4hOf6FxY8KTy0aMYOL9M0mJVqokJ+/wqIG13X8x+A/1p8iqPxHeu1Rm9
 +mGSSXAJgchUTVMHkVzq558Sea4aqIBR1uVwKkizsiBv/fB3tkqi4DZNtr18srVGvOGW86lml3
 JyDH1XfJWJdRWs0SvjAquQp2pB+/fPwHOM8nm1XcqMY9JJ+MxCeu5Muet+fASPWpcMJ0YPxYhS
 Ix/RduWqC0fNrbVwgBNuPZ4pKbg95JogYHQZISjxOec6UrxceQNAzz5b7XmG7iyCmCWGCnWOK6
 XMU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:11:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYW53srdz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:11:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635491473; x=1638083474; bh=2bhE2KA
 m4XELUw70Wt4uFjyOwGrHqZPz8+o1YDvNMX4=; b=SX13sF3grjIAVnppkBkDY8c
 u4CXOdT9F8dR4hoA8IxeqtQcoCtYvEwkvOWUEhHjLhlcsNvN2VFCXk6Ep3Z97sst
 zribM2+VGrEXhW61jZscL1n3SDZQL6R4KFr1B1NF9mxbGBkkttXW2vhBpXBKuGrP
 4ltVfvKQs6EUsmWrHGZZwUp09+jKaiTArec68FtWg+b9mE3YiqvdAgIsNnE2KE3s
 yWbSkxrxHkq9sw3AEfmxHJEFcZU/IUKRubZGM12NjT6RZ/Hd8T2Itki1kKT+usd1
 T8y8wDgwwvwFv42ZU1ndN3XyOoHBSQUKrzI1X7bFxAB3kyBXug/fOkcpcvGdSAA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3ckFhMeAyOr4 for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:11:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYTy1dpkz1RtVl;
 Fri, 29 Oct 2021 00:10:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 03/18] hw/riscv: sifive_u: Use the PLIC config helper
 function
Date: Fri, 29 Oct 2021 17:08:02 +1000
Message-Id: <20211029070817.100529-4-alistair.francis@opensource.wdc.com>
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


