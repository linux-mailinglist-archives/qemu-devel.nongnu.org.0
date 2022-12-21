Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409D65392F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nP-0002Nr-By; Wed, 21 Dec 2022 17:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nN-0002Gr-3A
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nL-0000Xf-7j
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662558; x=1703198558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xc5MYHOMGVFtrxdnb2BOI0WjdZAtZsCNEVi1/TetPEQ=;
 b=A0wiU/8KytY9b6UUq3QdQgtP72Eu+oW4FFQ2GcLsPMvUFi5HgWhpEhx+
 HLfJq87JTz3aLVpRTyEOi4G5dmiRjR3lvLEv2EIqJcfM1bTm0iYL7Wv7n
 LGulR/86ij3oBZhDtVko5WyYZOhVU37apibFM0/z9Tpm4tlTzr9h85XCT
 LGVQ0p7/DZ/hOMPdnVVuqzuu1eGvH/OuhE1ITcKN35rOXfzrlHj12WvOo
 7UEmQ3bA3DHZtwYaXn7M03Qp1gIw8zKnk3xg/U/g3py5cGgP3F4LImRKo
 q1V8XqV/WOZ7C4/M418V9fzjos2NRAik8VtdoOlS06STyBDvY4RCIfvT+ w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561427"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:39 +0800
IronPort-SDR: VSaETegnRLbzvkh3o5tnS78+/q7cT9zUKR2MObWT875j+iPApnJvvVh6ac2vyhEgOpyDbw5FmK
 E1/XMpxsGo2Hls8O12aPABuYW6pdUg/gm+SAYG9QHLdNIIRYah22dfSArJVU7uAtCJ6VTRiR4u
 MW+Vi52K1V/VZ4gvm3lakiSbXMKEsmD+ThEj3m3xBOFLvH3Nt7H4LmGhRIEkKdFbnNf1BEej2r
 DW3sqcx3uZU4ifRFL1fEInh7hyZ2gT+mEUXfwP3icjIEansXgz4HdNJn1dDHDMeTt+8AYWGJqV
 myE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:08 -0800
IronPort-SDR: oL8mJ7zzdqP5H19N6MA5kRMlcPZUOsN/ThEnyCMXOOzkvUF1Zop57ODTDH0LBFhSyQheTOdVdm
 EqXzX84hWdsW5PFWT20KX4BNd8ElIcRxjedEsA/1o5cRCNQnR4DGO5zz1mtnoHfsnz0BAUNhHm
 P7Ad1J2Qx5H0sG4uOAFevZCY/6S2fQpsd/1mrj5pDQswlzfMCR7ObW0BaMxWwQ2aOTCbDbFdwz
 /Uft0suUhzMVQbCRQe6cNS7iv7VNgz9lyIK4c3O6Evyn5yUlY6YZ1HfLN884tOIu7+EwSOl97t
 ViA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMl62ncz1RwtC
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662499; x=1674254500; bh=Xc5MYHO
 MGVFtrxdnb2BOI0WjdZAtZsCNEVi1/TetPEQ=; b=QiHm8R+i47cbyPTABVzeYSo
 Us4o0bQ3SA3tldKLQni8zq2ryuXz1BsgqiydORWO96es4tzACJr0/csQ4ea3naQ+
 XE8R8pHFW0g8lp9KvG8K5FcFDbbeecTUzKxihmQGk1G3Iep81fYwabMsuO2pN4FF
 zQvtWq2gcKZ5TUWdVUfluwc9I2zhorRfjgxUJnCj7zucsdVtLKywofOg48fjkSxk
 VjHiJ9JXK1jPiSTKGvFrDplGLYeDH3jvOV2EYQ4h2c0nmhsv4FpCELqLkdEiuvn1
 d1la0AOWgErI16ErM3hBTJ1qZ1IBhoma26wMTQ0ZusujIkrB8KPBtg61u60eN8g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UHmOqbHjF9A7 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMj23VVz1Rwt8;
 Wed, 21 Dec 2022 14:41:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL v2 33/45] hw/riscv: Sort machines Kconfig options in
 alphabetical order
Date: Thu, 22 Dec 2022 08:40:10 +1000
Message-Id: <20221221224022.425831-34-alistair.francis@opensource.wdc.com>
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


