Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6116653926
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oD-0003DX-Rr; Wed, 21 Dec 2022 17:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nv-0003AW-Nd
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:15 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nt-0000Xf-ET
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662593; x=1703198593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3esrjL+0ACOe7jvODgUx8nE+o14tGGAQ9W+P0DFAYvY=;
 b=FPsBryOqKnUh+/NObzkrg2mRwFeBDLD+oVw7V1iz7mJlCPCVmcESBCLw
 ShXCYqZizD+QhOhUx8Unt4hA0rC55tr0kbL9uFjYb8DT+zc32GZ7X07qL
 gJQkjAm4I+CXZP00qNz5hFaiRqiQyhq1ufnOwHOad+eye8IW0/2G8ttV6
 mOF4fZH+ecHdf+CWzhGJw1jz4VOpnX9lSJNoUNn+tEaH7fNYZaWy0dWeO
 vtwQgUyZCUdrTase3XT53r/IO7z6xqsMsu1W3IGmNGp15CAQZmkXLzXRW
 P6doIrBdOOs3DKfPjE4JKnSWhrKrgFvmIJuGgvdi8/ufO71VLY0z9GKvh Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561453"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:51 +0800
IronPort-SDR: uhgVkPp2hDIshxLfHiNFw36fXnb4wP31DuECJGlI6Dx3Qnny5g+LuARReaSMEla4QDmvnXV3KI
 msU7+8+ivjfHYeLh3rixr20RSXXSEU/LH3XuYlzRw8avzHNjgxsdDHOqw9HXn11Lxp9zZxP9FB
 piJF2yGhxqf3gXV9TNOILlPT/A7ymX0/3G06gLtBkkxBmYdgax5beXEW6WJWaZTd2OTAZ27iBo
 rD3JjOG/bxIoSyH5L9NbLFQTs3p90at8D80tSeo7MBgbMGHhUt/fViZnpdjVQsPErCiJd1ZiSx
 IsM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:20 -0800
IronPort-SDR: bxvxhxbkCUtBnGiIkm7NjaMSsPUyoaru+B20p2FN3fNtuPg87SYrXyGacR5mJ416BioxSCdurH
 h2tEIcRZOfeAv6rW77q4aod3V++DSy3s0zhao+SlcVRmE+ZWq4gfoTc69aBS7SDo2ACH7KfZAc
 YO3g/sAbPhJLrIdLadxjtiOn+aBJoKw0xJOtEQv0KEY0VocKjQfwPmYAN6uaTgiXU5IfNncaOM
 CAsrcHKxBHntPmO51oFbZ9gQW8uoJk6If/CALChQQHwh6W6inUUABlsNNftAf1dhWilZtIB8YY
 lP8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMz6yNMz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662511; x=1674254512; bh=3esrjL+0ACOe7jvODg
 Ux8nE+o14tGGAQ9W+P0DFAYvY=; b=QyQnuu7ZAu2njD+43lwoOfw+SViImCMg9V
 D1n5phA6OZFRsvRHKG0RmZ49MwYzBrtWyseWmeV0LR7PwQ904da1Fq6MNFjkCzQM
 pNVWjCqAMbX3tAh95B9flOU+0zV7u59bTWKZ3Yb+fV5McY+ZbVeBAkw0wF50YsgF
 ht8F6rTq4dthXNvL50rOEapz//X3r1oipSOzLhCueBvtST+uv9ll0RlnaQEnzblZ
 6h5WsmsEasCbRLNvQ95vgUbJA4gXzxRPj1g1e6vTsnlT4Uebp1saSol0ysFvEZNl
 ER5s6ucdlgCBl13IPRShBDS8Kz5E46tREdnPK9nDINq26aZAZ5sQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6sl2JfNxT2T6 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMx4LS2z1Rwrq;
 Wed, 21 Dec 2022 14:41:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PULL v2 39/45] hw/riscv: microchip_pfsoc: Fix the number of
 interrupt sources of PLIC
Date: Thu, 22 Dec 2022 08:40:16 +1000
Message-Id: <20221221224022.425831-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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


