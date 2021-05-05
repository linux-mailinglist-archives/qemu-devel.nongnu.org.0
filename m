Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63875374BE3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:28:23 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQwI-0006Sl-Dy
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrc-0006vz-F8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:32 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQra-0000B0-J8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257010; x=1651793010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQcnq47NunDV4WKlnP2K9I0LwZt5ImuM/NUAvOuKrLw=;
 b=qdylStCCMJ3k1FH4Uy9ZaHsuhzibDw++kN/pe+1oVuhmU3tdjfFWi2Sz
 A6dBTwjj8hi48lpNuDT6YSS1SQ2EoHfWCpF6rrxnuKC+g4p6gKfFToZ9e
 8w3pn91bPRGLjGBBtf0uS9sIbMa5z7zu1NwSurnm0WsZnj2KLfObhwYmq
 oNjYD5sgq6TlGTx0jo1NkgoriY8AEiTzRl3TiHUMP8Q7qY/C8oH8+E5bP
 PlEY6msMaBNMdEUq2jrfFDGVbporBjWnxWYwtPNBemocVRE/Q7u1R9isv
 x4kS30noi/ADPOofmeNecSUkYC1o4D9isH4bAhDkCCnMOgcRNhm4c7OwK g==;
IronPort-SDR: lEkBV3DpUTzYg+QGFvbustCqyRaaJSFR13Q6Lufa6vt92NMM54ucNonvzYyLhSHEjxEPr0dv26
 Osnc6Zl9q8H7ep5Bd1Oc8aEwagxiknwBTCBD0knikyA+jIB899Ad/iE6Nv31/oGZD/VVsIiOoq
 jpc4KYMKrtP3+idY6s7fgIyAnQlnFzdg0eqpklH9O6JztQll6WHwBNloo/8wEwSdckdptD2y+D
 zw/RQOrlZX4gBUs/TxkukGiG4dtKigj03riFQJXNY23olOzsJKKYZOL5gDkmon+q6qq8PqeNUI
 XEc=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356866"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:29 +0800
IronPort-SDR: 4fFXAhpJA8siKSoD/nkVWeUMNlACkBcy+5LPm5665s0zNFxZbHaykZBA2AQVJTagTwZWv93tXk
 RfhMH1RP5t1B9rqzRS25vv+brE3AxGkXpMIvrps+oJQGycTEgNO9jIgY67BejFyacU8PNELVdS
 uZgKfyBEh6jazsyVt9ncf1cqelaxZLwl6XVW+6Nubp37dItDC5tkcKOBXg8e88uGitb8Ia2PDH
 OVJbV9NMT1fKPq/Ew9xT00oRpthoHP/WkMXE4tSWxbZMKPASc+25G5ibs4eExX0T7fK65+UEak
 x+HpqVd4npYZ0NPtb0OVNtp9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:10 -0700
IronPort-SDR: c44Dhs3VcTAASm3h91ow3wQTlihJMv16sCSS688p2YPtUfrdjjXI5XkmVuN9ZxM7Ej8Yu9QVuE
 OmT3aUL2OWGHcbIBUP/+hYeGFJGFYyJ2vOjfeONqRyO6qnSALuckpXPfR53+ryMBV9Nv+xOKRq
 j9Ikc3A2jPy3nUFJe073eVUCAvg0t9KQnYkSwy+OUHqlPzHmejO38wAGPrBTzLwkCE05CJ7PrH
 GvpoWMhzODOQwavGXB4E/+j8fCuG2Jx0dv3SC1PcluEaTALW/kHb7q9WzEmPMszpDHnVGFwKA6
 Mjo=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 04/42] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
Date: Thu,  6 May 2021 09:22:34 +1000
Message-Id: <20210505232312.4175486-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
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
Cc: Emmanuel Blot <eblot.ml@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This was accidentally dropped before. Add it back.

Fixes: 732612856a8 ("hw/riscv: Drop 'struct MemmapEntry'")
Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210331103612.654261-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e8b44b2c0..ddc658c8d6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -48,7 +48,7 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 
-static MemMapEntry sifive_e_memmap[] = {
+static const MemMapEntry sifive_e_memmap[] = {
     [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
     [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
     [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
-- 
2.31.1


