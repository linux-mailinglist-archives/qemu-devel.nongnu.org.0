Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA41412F25
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:14:43 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZzG-0003uy-UE
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgy-0008Qr-2p
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:48 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:30779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgw-0004bV-AZ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207344; x=1663743344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+7i1/ikkPN4/VNr77qOp15/AgdcbLQRSk33SZZi9l4=;
 b=azUE7u9twNZ/AEBmdiXZWXarm7N8b1R6JUFHz3cAUyJxUq8rmP0n9F6s
 4Kycex60kqDWPSZohZtQ1FylRhynUnrrC9ypvI291keGxEsxkenYGx2L5
 Ob5OOcmsIaG56k++mkyX9W2oyKPpb828T7T6EvYVcNayDVStMapEVv45G
 NJk7+Jdi8LbC8GEuk2cYeS6tsamENk1SC3dsMYjCUSSB72RW5Kn+lApLn
 y1ZY0hbh6YSOs+ec8+QMVEeDeyxAH/mPJWjSpvTOTDpIVF3L5w9q02m4z
 +yrs6MIsrRM3g8/pBxVYz2CpS+XE5OJSVg2DFEk3JlEOZnHOaIQyj8F2k A==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="185304908"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:43 +0800
IronPort-SDR: U0kgilTQJZ8CAT+gtmZo267A9W51ZSLJ+GC3p/F+EglYy3gKbFdqo6dY+YFCJBxlVKDL3+roEb
 sut5Ka44/Ht/Q0Vw6RqkyjKdwtiVy+UcCHT7ix5xSjnxYm5QjZYEwTpVuY7lFqidU47mY85QRt
 hI0nceZiGSpyQPVgL19W8fAAA4JlRnb1YX4XiaU5oWas9VOIAVemoyLdFg37CcSYd6csVX+znF
 U6YD+XO/FtzOPjC3sCSmlaUKkP1bYmwg1vEHsEmOkgPljWujZCH3kVi/oKuAJHcNcjRqt+ExXP
 H781v+5exfQHJxuEjx5qKVvD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:59 -0700
IronPort-SDR: A6loEbgVJ1lq9mWRxNvjYSio7bp9gjC0K8v6dl82vynakolEBfeYdrWNwndFWSGqXwA8nXz6Tk
 UqoEHTbeKsDVcLQI5hzijbVmYpmBbUwdIbPD+fxCTs/hcNZ2jQJq2crLXraJD94a8iI+eMCbtX
 +/+7FgT4/iBpsP3yahbZfsHOFjrI9qh0EV62lCNq4AGrFdA6b5/fTa9NF9xb7+pDvhEXVm5yB8
 oH12wjn7o3bbQaa2OW7GZ5Yh1wKfrFEqC9Yc4iSu2d3/A6zojzBdaXnHas/h6UA6Thr6KxQ+MU
 A1s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBym5Ng7z1RvlV
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207344; x=1634799345; bh=d+7i1/ikkPN4/VNr77
 qOp15/AgdcbLQRSk33SZZi9l4=; b=UHWYP4Rw6QBeWMEtHrjkKKi2WP71aEIQ/b
 kpsVxvMZjAIS9KKRJyyqCyUv2e2KUGax12WMMP8EyBODPW1+IWFqXr8BMx/KRH26
 wEU6lGz9owvVVDiGtsGv1DvJ8sYt4ouJsDiF0rPpw7emYpNJMiPwADlYsmi4b1e0
 5NSbMAal/EOXvxYN3ecFjzXI2BRcBH0mjp8KWfGEOOzS4jqCQnRD+u3waxIxlHP/
 Z8wxS75qnjHdhTMq0B2LBsqtehCkmT1x7mMd+tNzt4Mz+0VhVy16/VfeaIgyVoNo
 sSC4x+MaGFVACN89ldnmoL5OuJ5GQ+sbfCrcHPtkdwOQg1N/4gLQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WSbDGwaVvgo0 for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:44 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDByg1JdFz1RvlH;
 Mon, 20 Sep 2021 23:55:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 14/21] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Tue, 21 Sep 2021 16:54:05 +1000
Message-Id: <20210921065412.312381-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Setting Control.claim clears all of the chanel's Next registers.
This is effective only when Control.claim is set from 0 to 1.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210912130553.179501-2-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 9b2ac2017d..d92e27dfdc 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -54,6 +54,13 @@
 #define DMA_EXEC_DST        0x110
 #define DMA_EXEC_SRC        0x118
=20
+/*
+ * FU540/FU740 docs are incorrect with NextConfig.wsize/rsize reset valu=
es.
+ * The reset values tested on Unleashed/Unmatched boards are 6 instead o=
f 0.
+ */
+#define CONFIG_WRSZ_DEFAULT 6
+#define CONFIG_RDSZ_DEFAULT 6
+
 enum dma_chan_state {
     DMA_CHAN_STATE_IDLE,
     DMA_CHAN_STATE_STARTED,
@@ -221,6 +228,7 @@ static void sifive_pdma_write(void *opaque, hwaddr of=
fset,
 {
     SiFivePDMAState *s =3D opaque;
     int ch =3D SIFIVE_PDMA_CHAN_NO(offset);
+    bool claimed;
=20
     if (ch >=3D SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -231,6 +239,17 @@ static void sifive_pdma_write(void *opaque, hwaddr o=
ffset,
     offset &=3D 0xfff;
     switch (offset) {
     case DMA_CONTROL:
+        claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
+
+        if (!claimed && (value & CONTROL_CLAIM)) {
+            /* reset Next* registers */
+            s->chan[ch].next_config =3D (CONFIG_RDSZ_DEFAULT << CONFIG_R=
DSZ_SHIFT) |
+                                      (CONFIG_WRSZ_DEFAULT << CONFIG_WRS=
Z_SHIFT);
+            s->chan[ch].next_bytes =3D 0;
+            s->chan[ch].next_dst =3D 0;
+            s->chan[ch].next_src =3D 0;
+        }
+
         s->chan[ch].control =3D value;
=20
         if (value & CONTROL_RUN) {
--=20
2.31.1


