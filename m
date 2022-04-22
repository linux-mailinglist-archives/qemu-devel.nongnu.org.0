Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348C50AD0F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:08:55 +0200 (CEST)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhn4-0003xQ-8O
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJt-000855-1k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:45 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJr-0005W4-4N
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587922; x=1682123922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZtMfNayAzWb857EUph0gC4EyuX8kVZF+e012B4DRfM=;
 b=DzDem2yainNA77M8NoonnX0TSxrjw/Jsj4q+WR0MqkXC0D+WBYD9GrRq
 mUs0PHltOBLuOniakkAr2Q1RBHU3jWg0cwWKpGkIFGjIelQ0UzmExhEKK
 5n5BhILgmvjzW7mUXJbIzmNA6qJF0LeY2xm2WThDVUOtvcv9qdq1YCXvT
 hZ7ognq201P/FnkepF94pcG2lROR73Pr9ZjHaKNJbdMTMQAIFCrhFDA0q
 RGSE1+LzqQNlnUdmn5gWSFoTP2UlEPUdHoO7TpWWF49J/snEG4ua4h+zJ
 R7z0pmzAbPmOubXZz0OyVe+4eW+qdOtRYzm+O3qeDwUCorWQBqEGnT5yO Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483442"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:30 +0800
IronPort-SDR: MNGm2m85Djrefwke3sx/WClZXPhk+wDZPCpEDpEmiM21QKoWASWxny0g2/dxi3CuKjqqn5gjSt
 gIsfRwBvH6x8Gx2dSFPVwxCbQdxSK3cUFwCXlv3agCDyZDpThkuHAlT2zOZ3ckH3PGI/qjbrNB
 9mqoiTq0ai6ws7N31RaO4+fmsoxaBYaNXXSuIHJD7UCXJdtEWJntVSglxRbQCYY28l0frrWsr7
 4b8Qg9RBiTD+xXeEJboNv8Js2mNmh7bh4anprUXxMxvsDL0rVvcxX0Pdupszi85Ohh6vFC16HI
 g9LWoV73qOELuRSjXiHagWEc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:47 -0700
IronPort-SDR: S/vLiaLoeavenu0P2HIcQJn1u+dWOibfiD198PVtoIouKsBxXP0FuTGhQldZXj0WyrFjDrxZkb
 n7g5meJdn9gvfUxmDEZHdOl6TU0WR1+Q/sXdjzTiKqniAyyd8VizVnp/5VOKvO1DAAHeNV6XRD
 PLwlIj4rGIn654g6xexTzDC+7C/tBq5etuiFB2WogEOmGwnGbBkE6EuFHQv887NFzq8orH0X/q
 nKMTJpnAW/Ph/jOk2R4AfrPoIvWdW170PzyDtDOyEc+X+/e3HyVBNNRnOfaG8MY8H5Eh9HJjRX
 eB0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWB05STz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587909; x=1653179910; bh=HZtMfNayAzWb857EUp
 h0gC4EyuX8kVZF+e012B4DRfM=; b=S4Ze9QehQgaTbfFv9Zp/gBUdB1N0QjQXfG
 y1FcnWWvmt4YMVLn6pBjq9gt3tOT9CIAVip7QUPLzaUHc0u85DEXrZ926zjY+bGr
 N1YV6d05jUtJVXh3pQigAx90JQAk7ZiadUlph14KnFuXHDISienaX593DsvDxfrE
 8Ep8uHePoPPr7P7H/2+FtmjJX3hMs3f/McUxTA/D6Xv/PyW/qYaEYLiHK4Gwqpb8
 2VqLiTKqqu+dQUWk4kG5TPctHwBUDyS4/1rM1XZyf4uQBcp6gOk8HPs8ZLcyGwTB
 noW9AZBMDpgh7rh5n8Ck6CN277YIT6VGdHsiRkCLNZhkXPkgo5Ow==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KqA8D1yMQERz for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwW70Yf5z1Rvlx;
 Thu, 21 Apr 2022 17:38:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 24/31] hw/intc: riscv_aclint: Add reset function of ACLINT
 devices
Date: Fri, 22 Apr 2022 10:36:49 +1000
Message-Id: <20220422003656.1648121-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Jim Shu <jim.shu@sifive.com>

This commit implements reset function of all ACLINT devices.
ACLINT device reset will clear MTIME and MSIP register to 0.

Depend on RISC-V ACLINT spec v1.0-rc4:
https://github.com/riscv/riscv-aclint/blob/v1.0-rc4/riscv-aclint.adoc

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220420080901.14655-5-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 3b3ab548f6..0412edc982 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -293,11 +293,29 @@ static void riscv_aclint_mtimer_realize(DeviceState=
 *dev, Error **errp)
     }
 }
=20
+static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
+{
+    /*
+     * According to RISC-V ACLINT spec:
+     *   - On MTIMER device reset, the MTIME register is cleared to zero=
.
+     *   - On MTIMER device reset, the MTIMECMP registers are in unknown=
 state.
+     */
+    RISCVAclintMTimerState *mtimer =3D RISCV_ACLINT_MTIMER(obj);
+
+    /*
+     * Clear mtime register by writing to 0 it.
+     * Pending mtime interrupts will also be cleared at the same time.
+     */
+    riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
+}
+
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *dat=
a)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D riscv_aclint_mtimer_realize;
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    rc->phases.enter =3D riscv_aclint_mtimer_reset_enter;
 }
=20
 static const TypeInfo riscv_aclint_mtimer_info =3D {
@@ -452,11 +470,32 @@ static void riscv_aclint_swi_realize(DeviceState *d=
ev, Error **errp)
     }
 }
=20
+static void riscv_aclint_swi_reset_enter(Object *obj, ResetType type)
+{
+    /*
+     * According to RISC-V ACLINT spec:
+     *   - On MSWI device reset, each MSIP register is cleared to zero.
+     *
+     * p.s. SSWI device reset does nothing since SETSIP register always =
reads 0.
+     */
+    RISCVAclintSwiState *swi =3D RISCV_ACLINT_SWI(obj);
+    int i;
+
+    if (!swi->sswi) {
+        for (i =3D 0; i < swi->num_harts; i++) {
+            /* Clear MSIP registers by lowering software interrupts. */
+            qemu_irq_lower(swi->soft_irqs[i]);
+        }
+    }
+}
+
 static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D riscv_aclint_swi_realize;
     device_class_set_props(dc, riscv_aclint_swi_properties);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    rc->phases.enter =3D riscv_aclint_swi_reset_enter;
 }
=20
 static const TypeInfo riscv_aclint_swi_info =3D {
--=20
2.35.1


