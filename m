Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4665065C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jb-0000fP-P8; Sun, 18 Dec 2022 21:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jZ-0000V2-Kv
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:29 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jU-000190-UY
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416304; x=1702952304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCE7CztmzSZYcLhiaCvb74bOC6OBI6o+zLLsd/7OGTk=;
 b=VzxF6xVQZD5Qj0p7nBdvrk7yoCEsrILcKbU0VAQRCHDFMh0Oi3eUUB9R
 k0Ipq+mxDGsYwvjrqlnWbQQ1DE6QHB79Ao9F6H1CzvvILzlkyXETx2Ge1
 jf6CrXWBoMuZhlCyT/VojX5Mb9GrzYHPe8X60rs5VqhLbJvpwsEtedWd+
 Yx0AbCLXlCfO87RdwMkg4UuC5RrgSVnisT0G1jZIMGzvr7UBrPRbOb88b
 jbvQbQgY9vL+Hmflm2ttFZk3kBxoRWmqfGApkbCrkKmJSWjNTsiwkCjVp
 EwY3fYsy8ccwknVkcjoD4kRnEE4PfogqsMUuCDox7LH6OgCYjWG/kOuVO g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056799"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:23 +0800
IronPort-SDR: kJEFg2k9ln8bnQlac60uNgrOE9f2Oyoqk7ouFJrIlX/IK3nOJRkMpBFG+rTLXnRgy88gs4av0C
 j8p3X2Z4JVHQXFgmRfjAXAOm+NRbFJGCdHwgpcMllO3jqd27qitHX9U1PcKeOeuqJUGPHYqBSg
 YuWl+fgpP3eNKRcCn0brRgVX5Fqi3ncqFPGCbZh0CEIyy39T4oFN626JJzHwIxDeIxKyc/+DJd
 uBiugZ25SEMKd1tJBkn/XAinb4D6EYClH7k8mr5fPfFCIEOszRIYDzTUxNjtP9XNz3+k0ZL3ft
 x1I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:40 -0800
IronPort-SDR: grasaSiLmguwAEfKCcBxC2Uqa0Gip4m4L4Yh7DoH4owbkTPeUq8rR12J6cv9p7+Nf5k2HWBRd4
 ALUSsJXhuUPlg7hv46d6G8GDZj9POc61Pfz7VwgoNfSqBWAnyFMaH0a66ieDMyWtmAXcfgPdE0
 5LrbyoYwNEy6Bvibv89gjr3JK1/zO/jqFe4q0oQcDITlaRazfN/ea5+9CaZK4yWkOxtOC+OJEa
 MRGoXyeCXH/3Wdb27eoBbPdBE8Jl4R4LoDKQUdirJPZYIc+4t6ce4k5+NVTW/Iq8bIpbvMit7r
 I3o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KD0Ps2z1RwtC
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416303; x=1674008304; bh=ZCE7Czt
 mzSZYcLhiaCvb74bOC6OBI6o+zLLsd/7OGTk=; b=orP3e9ICffQQAWXsAu1L7x8
 etI1YKdtRr3nX6/kHqSYPcFbiLciY50rQzduFD3GAuzeVh5/9f3PMePZG1XlWKIx
 BYAS8rJeb3TvyhfFsS79SvFEsIhorXErfbG9PJ0xE23IIB90mbPPSuzg5r8O4tmY
 T+eYx9uiDlN6JVx5VbZgRaBIHpQDJcMwgNAjXIKM5mFtijcHzH5lLtpU3DKekUC3
 wJpWdXoCmwtrOar8CtWzzKbf+RWzr2dGeCyqGcA7+Nfk8iDoHpLtAIIaSMHI7Gcm
 pJwb8TPe6zFzP8qXq4La8Hb5WauKkA+dzxiBtVN4uKink2pEUskdnDFtKnDePEQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r14earm-hI4C for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:23 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3K95RJBz1RwqL;
 Sun, 18 Dec 2022 18:18:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 30/45] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Date: Mon, 19 Dec 2022 12:16:48 +1000
Message-Id: <20221219021703.20473-31-alistair.francis@opensource.wdc.com>
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


