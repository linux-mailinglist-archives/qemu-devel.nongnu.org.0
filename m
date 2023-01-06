Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1565FA3A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEI-00039p-Ri; Thu, 05 Jan 2023 22:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDM-0002fG-LH
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDK-00088g-Ns
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974974; x=1704510974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xtaswa3+puUCw5K8ixUP9gn3dUD9NqOLDp9hqngCJdA=;
 b=CTb0nfxza+6p5wfTL8Bt1LuUg5TpxI+3GZ+j9Izl8kLxfzQd/P3b2aie
 vHViIybd2JEgoxC/WCrLpfodkMESyRxLWWrLUmrIHN0XP0hGadSpDgNxi
 G5BIc0m/GgPaGymVRChHYZTHD6HqGNyWgh53ryoM/dr0LjnwcqcIUSbmx
 ZH3gDfrAipe1Sml4GB8/xSpAFwa1cKSX2AFAQIYVKqrMdAIunvjr//9w9
 8K+wRfZ9cPdHWjFZSNQcrAUdEw7X1iloA31I0RwRr7BK17ZbU5/27aPAE
 JBJepO2PIZnuAt5cVY0tWGM7xCOIycU5jQsT8TK57h8BYLqIu46OLAQFb A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254839"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:10 +0800
IronPort-SDR: 7hfHiKRYhO8o3LDrMEYd6GFSkSp4KD8mhfPpcm4Q9tx9YcpedKVSzk0uq3brhbIBRJcVbsuOOK
 yYA11mDkGjoUv4mqhHOCmSG3vxtVdPWnJnBv/gZYJm7s+OLGf0gJgj3aEnrk3pMP/TxEs6T1n2
 GVuwbrsFio9gvof6jfh8rR/batvG6hBHDxPbJOsHTCXg6BlOFH657djwQNmKQU4Yxv54ipNNXf
 JMN1fMmuG4QIAQmcg4CPVGiH/xv32SCacL2UMllzRnbGrTeW4BJVktdys9iIvT9rDE2o2mXwo0
 kNE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:21 -0800
IronPort-SDR: DbeAWaJxkSiJn5BpMKmOWdK2IdLEo19GMnwM4dRbYMGHV0pECP4OTA85hyW68tWQOAh2xG9Hv4
 FUcGL/Mm8a02TPuMCW+xXVBXA2tq0u1vnw/8C1xsLjw6PUFFsw7a5e/3HuHg0bbWWbMmNe1MeK
 N4jSAe8+aD+P28AkEllZ4BtonNclE4kw3Z6oruAEL+j1pezsexgYSD1pBh9ewdVpiVgJjnG0dM
 rLLRoL1wYoIKILA0DSrXN6gueU4FVXXQpxZ51V6guGqhNU195KEqTZWXH9xD1pbw3p/x/9Mk3e
 GKc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kQ4QJjz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974909; x=1675566910; bh=Xtaswa3+puUCw5K8ix
 UP9gn3dUD9NqOLDp9hqngCJdA=; b=iG7Gu601kIiFCfx7FZl2cU3R7hyDeou9rH
 KMbTtE3qi6C+wCHNWy/9vzbYd9wBHZlytSmeBxReYiA18c8Ns3IS8Klj8GO9SviL
 o7hDG/VafshEqYnMDGqJLYQwssFY3OJ6tC5sZdMPJZu+a6/zFJh6Gv+5Ftyc2Tey
 ahQIk/BLfGbiT4tVm3+xvZSBP3rlR4CVmPfM3nX57WX0uEO74CBL9nSNDCS6V4Sb
 B7rliKVUp6sEDLTE1Tro+pjipfFIbSd4cczhBzF12pAdc7ygAuY9jN0BTeWwgePj
 CzXASZvdTT9ywm05VcAn7W647xTCVlHzMHhHFZHnOgiK5X9MyynA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CnJTnTYU8ogs for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:09 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kN2MbFz1Rwt8;
 Thu,  5 Jan 2023 19:15:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PULL v3 37/43] hw/riscv: microchip_pfsoc: Fix the number of
 interrupt sources of PLIC
Date: Fri,  6 Jan 2023 13:13:51 +1000
Message-Id: <20230106031357.777790-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
2.39.0


