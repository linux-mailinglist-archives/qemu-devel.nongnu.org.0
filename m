Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065055AFEEF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:27:17 +0200 (CEST)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqOy-0004vL-4Z
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2w-0003cN-1F
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2t-0004Nn-LM
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537867; x=1694073867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nXufRUxT9zYMpg1DFqTbhHFfRqOPx3w+tlhDwe9Lyg0=;
 b=AMKKZrgX0Fl1BY2g8MHlcIJKVZjyYfusDjIP/+WuDXPHFp6WKdqLMncE
 TXFDXauLGFwFZVem8e0jSJbyYY0UQKiXcRTf1rPH5GqKTKliCSAqv+IfX
 BEirbu+RyY+Ds3uuGTps8bsoehwQy9/1bvwjdhBrBbEtuQAJ/4FSaXxwP
 lw3Ev3b0Kr1H8Mj29TpB/wZbK7gdkiFDJBA2Eyo6XX4jDVsWj0cNk011G
 iKBrf+pE/dd/f2i6rQkdO18cEASEEBlqRl+dlcnR0W/XzhopiE7/xj740
 ZvJFuXVU01dMkDm4+RiVwxkodCGFhr71TDknnhpG9JX2sIdoUit62vAJg Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714952"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:23 +0800
IronPort-SDR: 0vFlDjukQrEl6ZnY1X44ZAeUb9Q/OE3icdmwc+N3DHncBRKaS2pXBIhnrEWc+vf+tJuCBLza5l
 W0eMHDzETMXfyik96wNosgSelzkK+DurioqtrZKRJBsxCU181q1/topI8/kzIV4BTl89+qNhl7
 HaM7oXM+t1wSS6tzVbcaOFIy+rijRFRMLWb3fKIV1uUI68SLdJgdaINH0aXuAITKaIkFD2M6SD
 k1KG0+FQLsB2/SKkC/80u2tDv62ixEt8VjZN7JJOPZwsq6rv83CJBNpbbq8yVMsWrq90CA8b/L
 fiuz10fBzXcglcSHHazrePvw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:20 -0700
IronPort-SDR: awlGsd7hQpBe5fCidEqco0bGH9McKjSECHxqxaoGcGCZixzxes4tuI2wJjWIHN8S5ltPqPBiEW
 HjP/jhz6sKVpktV6ya7TmQgyTk1kSqxOYlBsq5vTrCtuUaGSbaKjktFB63/1n7smvkqstIiJfN
 GTyr5oelja4WXwbE/Ns7dZZhUlrKs4gyRZe/cH66Ok/EiCH35kzbpT33H931+JNxqiZzwmBFAa
 9bial57tr2JxtBck9hkTdBfTd5GaxCmbMXVIMUGINHwzrSvXh803KVC5Zp7B6OLtvae6jfjnPi
 RQk=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:22 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 06/44] target/riscv: Add check for supported privilege mode
 combinations
Date: Wed,  7 Sep 2022 10:03:15 +0200
Message-Id: <20220907080353.111926-7-alistair.francis@wdc.com>
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

There are 3 suggested privilege mode combinations listed in section 1.2
of the riscv-privileged spec(draft-20220717):
1) M, 2) M, U 3) M, S, U

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220718130955.11899-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a3e4e2477f..b919ad9056 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -721,6 +721,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+            error_setg(errp,
+                       "Setting S extension without U extension is illegal");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
-- 
2.37.2


