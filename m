Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9539EADF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:39:30 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPmD-0003Hv-9m
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdu-00016f-G3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPds-0004Fk-JH
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112252; x=1654648252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VfLnArKZIuTC9bTJHLxKXJgC1W3DcGyhFsgWGQaT8fA=;
 b=L/UpxDkVOZ4tFs2CyyRwS41nM8vSH3PeJ+N4CvEY7+HqfRYsYEB9wYkS
 7FRMAWfGsSu11cNhHV6/PqRF6yakPm1oS2fKYrqFgP/m6oygyV6tgbNk1
 aPShx58X7TMZS32sqyzXOUGi8hNIpnQ98Kz+YOlRcdpVVXBrpHbDwuNKJ
 eFoW0ueCqFnn7twIzU0VYfgGt5d951pSNmVfWrRQ5yrCwgriMKRG6RpqT
 mQDf/+SlkHt+09s3S9+gDzusg1fPu/RidILifBg43+7WZNtb2o4JgyBm2
 6MHEiw6TbU/O2R0UZZMmPBQqUXOD2XIFUbr1wxUB1e1BoRC6FHgKEEk/C A==;
IronPort-SDR: mBIdmtoYHuY2+bU2/pR3m3NLoHGkcWG9lG+XEw1M/YrNc9A3s3KyX7n92T4I6Bm1kWbAvHz76l
 QOcFIMf8Rh0JyWzgZ0A50XCUEWhTgFyzDcRi0ebikeZyp/HpSjPcQSrMa8xZ7UE4WrPKjop+42
 OQhKuS9ynxKgoZMsa79w1Ue4T5YQh9MEMWFWroW0waZO5jXEGlQTkI0ECRmziWMZukTFsUr3ef
 t6K5bZI/0+UNkUg9Swcd14JCsDBHJAbOtUMrYbSqnNa5ciwpdt/YYBH7JVccuo4ijlFjBVCkrr
 iXY=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087376"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:51 +0800
IronPort-SDR: 4R5Lwj3BDYIWcUDIziculrYa1e61k78nQ9y9lQE89i2z26PlRB+IcXqTXL3hcGNzVEHXiBvru3
 onApQ1f4pBqrVjfoRjrKH9Thw3vIgF3sdnNOHmyD26bCEv8fuj9eXhTputvqXEgLvjHTYB9nHv
 esY4Dz1hQmjBTGG6QYDKRLql6nRwphG3RMqyAfvDDwt2XYut924yZF1tf4H5CVv5C5QcDLt6YU
 vK5EvigRxR3mxevfsKr682pZLxe5HuCibYEgghejfD+y4cTGfntnx8uXqXMpWsIHG3WMXh3eWF
 aCezq0/YfAf71hT0RXDUQG6m
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:58 -0700
IronPort-SDR: knPExsXT/si32p39+ISn431HuYNBhQPXSL/GC1wZbZcwGBtIu+wCrdQPluNN/c6y1ATV9UuMTY
 fhO5ebcdvWMl3bfP0xNjGSA9KMIPNAdUQrHT++9k1FbJ/Kt41Vz3of0oJsuETfu/nAYpVYHl4a
 8ubcTntZ7ig/S6MfUsr/S11AUANx6zR9lujE0Nz/FQvWSrbvv+FoG5SUNQJSetLnlkr7bBD2pD
 XC+zmn6m2dfTjQEK8P28+8IFwXznz70woFTpTnpxRRlarJ6B7cJcbsb//Ag5R5mPewBCs8rmym
 f2I=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:48 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/32] target/riscv: Dump CSR mscratch/sscratch/satp
Date: Tue,  8 Jun 2021 10:29:28 +1000
Message-Id: <20210608002947.1649775-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Changbin Du <changbin.du@gmail.com>

This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
the output of CSR mtval/stval.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210519155738.20486-1-changbin.du@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aa48bca830..ee2523f66b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -286,12 +286,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.31.1


