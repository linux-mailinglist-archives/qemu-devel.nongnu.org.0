Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5A653923
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nD-0001u7-Fs; Wed, 21 Dec 2022 17:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nA-0001lU-O5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:28 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87n8-0000Xf-VY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662546; x=1703198546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCE7CztmzSZYcLhiaCvb74bOC6OBI6o+zLLsd/7OGTk=;
 b=ngyNpIaDuJdhg8I30OoG+HBB4zd+S1oouz5clDx8q9MA50DD9bXZ3Pd8
 gz0TbiDP25SeqHjInF8lEN+7VEn/j4KMssi0y4l6AceRx9KT431mBOP01
 raN8bB4vNdtfP7WoM+HECh3VnbtEqC+LFX/ouCpJznJPm6DwZhZ6tCINW
 ao9QwAIaa3JQaXgQ71Y+jd8bOutoBP/Z18N/a9G58YW0Q9Kyr05/W56vc
 75Z00qjItS7vopk3dJOnq1OW3kMm3vPU1Y7lon+B7C/t9wF6SADWayknX
 KfiM9gJPjSKC5HCC0qTYP6HTzyDeRgM3u+3stDxNI97Fi3WGgBHqNTcjz g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561409"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:33 +0800
IronPort-SDR: 9vvCJ5mlH3sqLoWyiizoqZVoYi14EElhVBGAi2IFoJ5VwDsHfCvo0fWUZYHukzdL8tAgXciuJM
 FHHIN0CGVVXwGR32vILRXSrN9x1l9wlbrFYsR8o6q6WViqqbO1DSdB7uqzjY8lxyDdIZu6JzOj
 nMPDv0NjjcJE9Ra2YZLRlhD1az+/ubv61kWrGrW9LD0ge30AJzLZqyKVtY1H/xs7L1HYOUTFv1
 DvSsfxwvlRJn54F0ZmNt1mhn3+JQFutpQEU9o6PIwBTpMTBwZaRFq8v35HZ1ePKjzNjprjmtfg
 25g=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:02 -0800
IronPort-SDR: MquCuRuJkCS2pUCtmUgUF67/fIJiVCkl51ZI6ZUegIInMPu41DY4ffh66ooIDKoR9oxjRRq5Wo
 Izp/Q2gAET/Qp649bCUBEAKxso384LLJeV16oTmG6Y3Zy0fB5N85YyXVlw/cXdSrG7ViyLcyZ+
 5cPlUNgfXq64GIadaOdZIRdD2R+5jimoqWBAbApn6DjTWMGynUDv5Z27Ng3M5XkwwdEzHg17hd
 +CIyCmdICSVTkj7TIH7aLbFJsa2ejq6RWG10kwTA1gdEFKFLvHANbUUkjbkErXhyPrLBet52A9
 G6s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMd0wHWz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662492; x=1674254493; bh=ZCE7Czt
 mzSZYcLhiaCvb74bOC6OBI6o+zLLsd/7OGTk=; b=KLoD3/hghA5SXf81wLri6Un
 E89CvNFGjY9IeG5WAjYLGOm4elRiktxaAhBAmh7Vvm3oSm6mrRufP7QYKlrcQRNl
 e9QfQDbDcKu81oWNnwAioEM2uKifkt12XC9zd7Ktmlg0ihb+71ETMglw7KLouJiD
 GziHHyUyZ5k/9lxIb+tDjKPMt2yN4UW1JApcSTmUdj41ZR69otl/dneznbHd2r4+
 JgCrJ0k+iV0xfOiHL91ZdI3ZWT000cAVSU/221MwkbmlqWs+3anFj9lMyNDx50dG
 /+Q5f7DG9Hc1GkoE1mJXNfYch0UhmpMCFFogaleq/cqLR7Sp1M7zYfuYBaN4Kjg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Jt1M5hR6Rltv for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMZ3b06z1RvTp;
 Wed, 21 Dec 2022 14:41:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL v2 30/45] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Date: Thu, 22 Dec 2022 08:40:07 +1000
Message-Id: <20221221224022.425831-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in sifive_plic_realize().

Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
RISC-V machines.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/Kconfig  | 1 +
 hw/riscv/Kconfig | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ecd2883ceb..1d4573e803 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -78,6 +78,7 @@ config RISCV_IMSIC
=20
 config SIFIVE_PLIC
     bool
+    select MSI_NONBROKEN
=20
 config GOLDFISH_PIC
     bool
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..167dc4cca6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -11,7 +11,6 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_IOSCB
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -37,7 +36,6 @@ config RISCV_VIRT
     imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
-    select MSI_NONBROKEN
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
@@ -53,7 +51,6 @@ config RISCV_VIRT
=20
 config SIFIVE_E
     bool
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
@@ -64,7 +61,6 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
@@ -82,6 +78,5 @@ config SPIKE
     bool
     select RISCV_NUMA
     select HTIF
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PLIC
--=20
2.38.1


