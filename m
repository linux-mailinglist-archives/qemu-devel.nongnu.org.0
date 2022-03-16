Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665F4DA7A4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 03:01:31 +0100 (CET)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUIyg-00084P-5V
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 22:01:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwb-00064n-V4
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:21 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwa-0006NR-1Z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647395960; x=1678931960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JULuWU7jjd4v+41kv9ixESO60ZWaWtvA4R2DIeLIsHk=;
 b=D52tlDkMh7SS3rcA6x9OMcY0G7/Fk7z8CFEPUYY0PFMg7CRazfFe9d8w
 Gh3UFf3Yk1sB3HHCvCSFfob4YuKftCpy8rq1Q8GZduQ8QykEwABeddR/J
 cpp2Ym3m+dqU9pC7E5zsbBvXpaccs52gkZ7Nr9btt+bb1X0xphGb0yZJB
 982E6NDCNk2rG3Bpie1FExg2rVnD8UmJ2fV43U2HcT0LafMT9KD/sG/nz
 NUwHg3ATyGvKh/2BJ8hsQUkG3mwygbN6QHz65iTS9EUXIakfWDIqnjEJV
 qR4SyUEOjNli/Hd8U7/vnRln/X88I8w3aySzXWJueyiuarEwOBomAEEdK Q==;
X-IronPort-AV: E=Sophos;i="5.90,185,1643644800"; d="scan'208";a="307412988"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2022 09:59:16 +0800
IronPort-SDR: x5RGNkWObcg/V3aroXFM1mv3aO/i1uqO+biXiu8CCuAQYH1jdrj/2YFs4ARBDCJMT/OQ1od0Do
 j9hqyj7nVxC9Rg98TL5JGoKRkhDG/2WpvSfCyVHxT70ncBygfWg9Iw4tQZCIYESWRa651hudee
 ViXZg8GYu+B02vZ/QvvsIBwcEiyZCdvfjzlkbIKelc/NJjBVsW72jqcTpH1wpd3y0PQtKi/Pz4
 0ZsHIWkaoTC1kh62rUsCrWhDpySxk1e1Y8HT3NbPZUDI6bV4cg/HEurqO6uDu5WmI1aneHZXRV
 g4q4aQk14BqTOcgv/X20SYZv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:30:23 -0700
IronPort-SDR: S6BX3cwIJ+qg0XUpUhhSEwShxyDKBWSityznt0smW42iZS+4/W6dXMw8NNA4Eyf6LZWQ5nIaSW
 z2yf9tgnH9Bf2i3OKq/EAgExJtV0maPs85Zb7AsBKBrDEnd1uGRfDZYmh2kthTJmDFDkmyEQxz
 AIp5gl/cAeTwX3fz/Ahwb7x7nZ2Qof28YilaSLI6Jlw5KsLwWilt/E8DrdKtnSYZuAlflKWnkF
 CfhkLii2Bqxykrq5b69qzR6HADpXwF80wBuLbfeXGB/g+rSz9jfPWaRLo0c1R/kJFuL74aznf/
 xvo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:59:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJD3S1h92z1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 18:59:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647395955; x=1649987956; bh=JULuWU7jjd4v+41kv9
 ixESO60ZWaWtvA4R2DIeLIsHk=; b=aW0iOks+rwYIHtq9CDbNMroI+pEl6RQR0n
 qb3k6IQgWTKK1G6+bhV9jXUhWoULhyFxS5f4UTWvTYw009mTlR3PT6hfN2QlajEV
 Vl/wkWcs5lxxjkE79BDxHkKtnjdQqZS63tUPTFRt1h6QAWYzBdZGRHrHUwOIcChU
 yaaw99ViOQ5wMw+cPhQTlAx+0SrmxXeXci7F2FFRGc2Z6sOmMG6Zm7CmFWn1YQPs
 xTayYw+3/VM0oEUAjWk8n6LfeCZ1FapkhXxRyt0auAgHPaZIMvNXUiKLBANVRrR/
 fZ3YfIPn5Jd1SsFEQidSNBHhM+tnYknksC+WSX/W+Fp0g5CFzpPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a2DhloofCRCe for <qemu-devel@nongnu.org>;
 Tue, 15 Mar 2022 18:59:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJD3M42XYz1Rvlx;
 Tue, 15 Mar 2022 18:59:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v2 1/2] target/riscv: cpu: Fixup indentation
Date: Wed, 16 Mar 2022 11:59:00 +1000
Message-Id: <20220316015901.3787779-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
References: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=0672150a7=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..41b757995d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -567,18 +567,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
-                       return;
-       }
+            return;
+        }
=20
         if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
             error_setg(errp,
                        "Either I or E extension must be set");
-                       return;
-       }
+            return;
+        }
=20
-       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                               cpu->cfg.ext_a & cpu->cfg.ext_f &
-                               cpu->cfg.ext_d)) {
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+                                cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i =3D true;
             cpu->cfg.ext_m =3D true;
@@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


