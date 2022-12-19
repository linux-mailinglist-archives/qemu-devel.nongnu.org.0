Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52738650667
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jh-00015U-4H; Sun, 18 Dec 2022 21:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jf-0000yN-Lj
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:35 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jd-0001BQ-V5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416313; x=1702952313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xc5MYHOMGVFtrxdnb2BOI0WjdZAtZsCNEVi1/TetPEQ=;
 b=Lsw0o/INu34tl/Skowq3WBHQ4rxsV5neqE9fskf2Z67SqxeJ7VAglaHU
 pBHbj0BOmavglQ1on8+PU2OFp7qyiEABDdDec3GBJ0K1JYMGNZ5paNV6W
 OSiRPSvUz0WMctujLuaZLUV3tIKSN3vyqDR+0UH+z82bBTEvl2Fe5tgbU
 COtP7YUrRm566Qj9azm8ZzelfcTpEgERHc1kw+c9N2fHnxM2QQ/vdR/oO
 DaFEEVKIQbiXARIP11JDNKnCUXK2e0tw43yuHhKFihtfoHxNK7xE6IufE
 78ES8Y7cC3i3yuvPE6haKxSC0rBTt/JYUXlbAV2sjc05Kc+n5H+Uqjp1J Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056807"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:32 +0800
IronPort-SDR: a6+jC57RpnI09GxVy/7MVL+nOltr8AQZWv8/QXQndV1gkL3M6hHZz+IDqm7HLVMR0wduhnaAUr
 crS7Z8PoIphTvmMDkCvpFi6ttSxgAzqpTO4RAosM6DEy7KcgZbvN6KH+nY265jubCVFqSdy2o5
 UUamk5vOJqk61sstG9Dkr3Ns5lw1y8Ue6r9vzTisropzt5s5qzp///03FyxfqDPnsAfB3/8DyG
 JmX7GxvK8KV0TEDCf6SgSTB7oG/UvXX1XlW/GGqc4qd+8iW18FY3g/8v3WECLgOo8D7q45a3LO
 zvQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:49 -0800
IronPort-SDR: AnHGAS+CGy/Xtv3mnPZCWTGRMt8SPdKOmr/irtZ/9jZApCpuUubvvdjBIh4FqlT9wKcnyV4osa
 4kEXkionNAqyrwmpj1Ixuhbm5hRGzrkPYXmh5fr0PLwiE6eKPeQtEQ06To/jUtiCbx5Td+DK3C
 tubRIKlBmAg5t9JvT6sSeD3XhnxCmfkmaYmF4m8BUvrhBZ6n95CSjT2qGN7x4XRslJrrYArnGN
 yGqZWHGX0GiSliy0Lj6WP/I3ORJyRnz4nOLINdz017dJXBHf27XptOQToZcevVRMAHQFdVIKhe
 gqc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KN32x4z1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416311; x=1674008312; bh=Xc5MYHO
 MGVFtrxdnb2BOI0WjdZAtZsCNEVi1/TetPEQ=; b=TE80D90aVkuKNQ8i5nnVoe3
 2SF9lT+R0+XDtJwtQHNfR3S51dO6wEDLLOrdEKeA/GyQ2EVAXJnhuY8yvc/sBCxg
 oFJgZRVx+dldavRW1+YN8vFFoBc+Z4W6XdDAN1tDR2+gnO/XQWmlos8c2oOnIf2m
 zqrgjYcXSN3j6niPrIKhD4Z181cCY7+7bFMBJh2mmjETEXOupDe0q7KGp6qG6cNm
 EM68gMit9ilwV+g44uTXvw7LWIgnj8AwvYdHgoYAYz9x+t3/BGo475t06Us1TL8s
 LOtYF/XlZtjNtWuD2+joffZtgY3f8Xw8h0DuIabKkRPgxnCyPbLrDkVeNTflYEw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ocnYBAsO5SPI for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:31 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KK4L18z1RvLy;
 Sun, 18 Dec 2022 18:18:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 33/45] hw/riscv: Sort machines Kconfig options in alphabetical
 order
Date: Mon, 19 Dec 2022 12:16:51 +1000
Message-Id: <20221219021703.20473-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-4-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1e4b58024f..4550b3b938 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,8 @@ config RISCV_NUMA
 config IBEX
     bool
=20
+# RISC-V machines in alphabetical order
+
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
@@ -22,13 +24,6 @@ config OPENTITAN
     select SIFIVE_PLIC
     select UNIMP
=20
-config SHAKTI_C
-    bool
-    select UNIMP
-    select SHAKTI_UART
-    select RISCV_ACLINT
-    select SIFIVE_PLIC
-
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
@@ -50,6 +45,13 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
=20
+config SHAKTI_C
+    bool
+    select RISCV_ACLINT
+    select SHAKTI_UART
+    select SIFIVE_PLIC
+    select UNIMP
+
 config SIFIVE_E
     bool
     select RISCV_ACLINT
--=20
2.38.1


