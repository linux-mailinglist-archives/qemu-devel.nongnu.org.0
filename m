Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6F5B001E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:13:29 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVr7g-00071G-Cf
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4y-0004vZ-Hu
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4w-0004Ud-RP
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537994; x=1694073994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srnY74za0TZUnRHzAXTU9H0JVs+SoJHBAh5WmuyCWsc=;
 b=LFS0K5YcWruZNd/bZDaAJOr7AghUeLrryr34WrYzICuvoHmcG/WoH7n4
 Ir6f+bMl8FHWMhGJAiXDFZD7BZ4tQJzB/oG302BmVMeYfy6eLaMcAWcNI
 2W3lZZSri+jlsOUKBCERJWg7iEelTUuQfiYSrZ4BGDIcNW8VnPkWPDTaa
 zoJv+GdFZ3OMGxNgfwMaeP8rRauji9RD5/sPeFYTuuY6vxbdHcGzQADPg
 KQt3z19pN8XlRXhB73tIsDcapEnploUdFjDzNhEpA2ax4rWFTrQFE5DzN
 30UMyB2DotnEHp1Ck5Yr7ZjGAtM/jpLeuNQHGZMfjSgqEgfazwpUqG9se Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715111"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:18 +0800
IronPort-SDR: x9/4OXMmyUruGCfmTsPc8TPZPQAt6nVjIwMLvjDJ+Zonnx7cBdRg6AA/pYAJqDR0tGlWvy4ZR+
 IIF9grugzzM1+Nb3BLDxGbfM0CIlcAeGAN30LNulYoUsyvfpnvl2NcFQfmPmVWxfv2csnF1CRc
 /OGsKv3NM+rWW7Uu1E1pnkBqPjpB1WHOUWnlRDMQSIkTQ3yhGVbRw1bTbuDlCO72/1cHgB+6pk
 kmUiaxWwot5FSxymj29ElqjOALCj7tZkIj3NdZNa1vdi4Z3pOtJFvdmGCDP7fvC2RMkZ8mRReQ
 Rkz68nw8T0cqrfWlQJTaeqqi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:16 -0700
IronPort-SDR: tFZyn33NVCf6CU8D8lEO4+Aaeo9TYQiCiYz5JNzvXIhHuF1U+Q8KXxNowy/GycmJV/bwgFNo5y
 FTyulnZ9sBcBlI5gm51bvRsv7Q5r6Zc+ZAvtRLeBIBr/fThlGk+7JuDyeQ6hGsKybQxbq7rH2S
 YJTftWVCHMG7Ciud/Z8qMlau3zYbxj5oPYALoNeHxiYJsRBgfDktfZyDLIRwSubRZO6b2Vc7hv
 luIWrAPVMlYejP6NBBIQEJ9w63/Av1FDYEqaaR27Cpmbo67cloVsdm9z0iJRcu7sECKxCvj5Zk
 D7c=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:18 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Rahul Pathak <rpathak@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/44] target/riscv: Add xicondops in ISA entry
Date: Wed,  7 Sep 2022 10:03:44 +0200
Message-Id: <20220907080353.111926-36-alistair.francis@wdc.com>
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

From: Rahul Pathak <rpathak@ventanamicro.com>

XVentanaCondOps is Ventana custom extension. Add
its extension entry in the ISA Ext array

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220816045408.1231135-1-rpathak@ventanamicro.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d4635c7df4..e0d5941230 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -102,6 +102,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
-- 
2.37.2


