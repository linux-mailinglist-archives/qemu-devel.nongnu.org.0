Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5715AFF44
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:32 +0200 (CEST)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqYt-0008Um-AS
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2w-0003cO-1i
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2t-0004Ot-MB
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537867; x=1694073867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbLBsHEKTTMaUtZr03yzCSozxF8FcWOiyWx4YWzP88A=;
 b=QawWANfSHqkMobr65Kgkp9pegSeLb35BfMVh2phk6/wwph6n/Kl+OtFA
 U5qWbVxSQdwtX3A4wbEODlU5biJPnpkvm7FgvrnA9MW+hfeIv8bk2OjiF
 rl4fWhN+V5H0UyJkvr/tFTY0uWPGQFJXLet0c2Hm//qmK6KIITF7G7hx3
 ag1dXy13zbHOnyRux3kD5U52JBCK9PoCS8ylwF1Eu/w5/zod2VR143jnv
 jxpJIcVLm9U5aqFiqxrUYkqFW7fdn6rrfZzHrETZHpi/82JNmu+FQWMNr
 nKBgAPzzKjgH3BYr1NrUtwMSaO5eGYk/mHpYlBIei6Np/cLOWz8fClF7Z A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714959"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:25 +0800
IronPort-SDR: lAdcvmvmQdXOT+Bg5IDAbXx32X31ZvJiCdfHRKsk16hq507JLrhfm6bBZaI/EERnYRTn01rOFb
 y6NLeZJxUHEKOsizi7JHDogZcfKRRgRY+ynDI4X5C/mZZ6F54TAgpXwv5eDLuCTCUgw3FSVY/I
 Vbbl2AYqaNDtk/98UUkmqK0u7QkbBoT+6t7MlPHu4YYjzveKGeYg6S9Z8MWcEDnmz9E1k4YDHx
 5BdpCyHNp75sqiUGU/55rJtO/+TzxQkgj3VePQip7fjmvkIstnKKrLW54wMPfYV5ljPJscXvts
 A7vMXiYngd2bdM+qjuMXZaBo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:22 -0700
IronPort-SDR: eXsi10egrBuOhCHMle3rIDAC6yBdhoDFRz7weWwU+kWNljAyRLaG47yt4dLlnot24PtQ5rjXNu
 j7RRNLtpDbNmyhczIRURLIN9Vb/USa9+iCMa6LbOtxvGDX+QakzD/7lIAXE9OIIyEwEVjDVDR/
 cBrKX6MYvPdyn2CtLmBJBNfZ9in5Ypih/wfa24TPLijXZp2QTJoEcck8frsuhCp84ySXkS3Q1F
 LViQdLZLc/bCA/FqpigJXCxOTHow4h8OIEdTGvBXuMdpEx7ruveH4XpZ2j159Qm0DlE7WOfTXr
 zzc=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:24 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 07/44] target/riscv: H extension depends on I extension
Date: Wed,  7 Sep 2022 10:03:16 +0200
Message-Id: <20220907080353.111926-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add check for "H depends on an I base integer ISA with 32 x registers"
which is stated at the beginning of chapter 8 of the riscv-privileged
spec(draft-20220717)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220718130955.11899-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b919ad9056..fb37ffac64 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -727,6 +727,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+            error_setg(errp,
+                       "H depends on an I base integer ISA with 32 x registers");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
-- 
2.37.2


