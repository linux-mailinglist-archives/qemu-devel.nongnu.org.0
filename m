Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19763650654
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kE-0001pA-OD; Sun, 18 Dec 2022 21:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75k3-0001hn-P1
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:00 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75k1-0001CM-VC
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416337; x=1702952337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3esrjL+0ACOe7jvODgUx8nE+o14tGGAQ9W+P0DFAYvY=;
 b=Ulk505pvnsuq2v5qyR19PAsPDXNbzbM5n1ZruxaIWMA034KEt0JtCgZH
 JH2rt66NzOOWl1lagRZOIwk4oJCqYv9bjOO9taz83OR0wU1+cNaX1VkOL
 cDs56qfCXCY1MDiJ3myTc9z8fmAEkQPhKJ0Ct+RRJDFlO1DLQtb3g6sWj
 Ug1JhJPI9eLpiVSzhUTpH6Cl9404pgK/k0Krs9B5aQAdC8vLDDDm3EjLi
 a8rlgAYMVZ7YwCgZ0iyKjxuScbkPrtzJ65ParpQEWxFryWgAdbizgh0U1
 3LTFKqW9vNI2LDRrG9vuLqDcTQKQGLn1imXfMuFZYFEp1bGW6t7+s33T0 w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056823"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:46 +0800
IronPort-SDR: tkO1a9CFfVTrhXng3gCCmfM+yOnyjXXhg/gSZVx+UB8J+jGSQ+7cRzZEYQkfUbwY5qUX0JtdFo
 ugodTL+Gss0jwytS88nUo6+jJ+obVOpF6vTWJ9i0lCkFe9eoWb7kQrffdgVJmAoB5LvCLl//J+
 7HdnFQ466wZAAfXgm/jPYhRuY914WFCV4oslyQo9NO1jJJRVNPe7OqKtTUcYVMma3dVtqN5XSH
 BBa5llAM29KI7OSwdi5NNWkLeYX1y28mGE0ZqHmKCltwjAlGjd2x6Z9cXKhKj4FYhNTTcmGDVm
 3m0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:03 -0800
IronPort-SDR: G2t0Bu/hR6k9OwYoneUfy/jnJekoOmX+5+Dj09R9Dhefebbb/dnTtCgIwEnVgNbmSgoUZqoLX0
 l62Ueu4sOs6RrnLnkWOwG1eLk7uboN/3qLUquunyeV+xu+wFlVPoiremcxIYbbWeBb7VE1I+6d
 gxZ2rlJL2iZI0Pg5d5K/uxC2+trMjZKe1wNYisrE+u2UG+j44O/9bwGHnATI2MrrBiaz8gaYQG
 NdcmVqhIjTKVYiaLRB8S1qGZXfwDcFMrIjvMgjWaI62WzuuSg2V1kNdaGLqG11Gy51o/THooz/
 xZU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:47 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kg0PHKz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416326; x=1674008327; bh=3esrjL+0ACOe7jvODg
 Ux8nE+o14tGGAQ9W+P0DFAYvY=; b=gwLdqsleSu4AsS7IUBaE6GMb+L6AH7osH3
 YoLF/jRByV/7xkR+vvoBtGi/WuGisXk64dlQuTJbxslLv4CV+le2Yi9F3BrH7HU1
 BO7sKwCxc4SDpxEpwWY3EacGqa787HSyTJcEf0Q756MOSQlwVnq63pXiqVhJKeIh
 c9/Ibm/b4OM8aQVhijD5GvRSwXIAtfHT5tJTjnjZLuzMb8JbjC0gEK4NOw4PhsnV
 gnVP/bOAS48RHaGRwryeUtu8p3y3H0wUMZ+jLfrMFYwgcMDa/MIT0FXO6JXmHOwg
 Iu6auIV8ibuhlnUGxBsirSxXvKBTTwUm/UZm3kt07e5txh95sD3g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TS9uURvHeteC for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:46 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kc2kW0z1RvLy;
 Sun, 18 Dec 2022 18:18:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PULL 39/45] hw/riscv: microchip_pfsoc: Fix the number of interrupt
 sources of PLIC
Date: Mon, 19 Dec 2022 12:16:57 +1000
Message-Id: <20221219021703.20473-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

Per chapter 6.5.2 in [1], the number of interupt sources including
interrupt source 0 should be 187.

[1] PolarFire SoC MSS TRM:
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDo=
cuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Technical_Reference_Manua=
l_VC.pdf

Fixes: 56f6e31e7b7e ("hw/riscv: Initial support for Microchip PolarFire S=
oC Icicle Kit board")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Message-Id: <20221211030829.802437-10-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index 69a686b54a..577efad0c4 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -153,7 +153,7 @@ enum {
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
 #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
=20
-#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
+#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
 #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
--=20
2.38.1


