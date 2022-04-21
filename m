Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E4509975
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:49:08 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRYp-00028Q-Qs
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSP-0005us-8b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:25 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSN-0007zd-E2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523103; x=1682059103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZtMfNayAzWb857EUph0gC4EyuX8kVZF+e012B4DRfM=;
 b=lXRu2IYsKkxbHxFLYj0a5tok062Kil0SOfM+QWC19JdCIEjhHyfifEj0
 gHEoqpkSoG96t0GU/UJISd/e7VUUJzormr4qqDAbo9ZrE/Grl03LF5dvZ
 MWYyUEl92J1flJMVNuFu5DOfTez3SyH/8yTE+ETF5mA3my/QKGvS8Ywit
 /V35zkQjyKH84gXJhQVNx1E+ikQbUT5BKbrnPwocJPSRurZkDjBot7UEv
 PFmJ1O3PuOzgbmLluC/mCBb7r3Y9lV6zEKpVRTLmkpuT8lBabSnx8TP6f
 NKoUJaclakaj+TBgEBclbq5OEjZDphEHWy0fqSpj7DFmGGwafEJuBlZIy A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640018"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:01 +0800
IronPort-SDR: dhrdXWSZ9hDr2pOPpjZk/E+eapxppyylWBNvlq/AmSn71Wucxxd+/TbJLTmwziSFByMhqQsIzM
 jFVWxTz8nJKQkY7FwtiL/fOHsmfYNc68Qs95lg8biUGIlXkJbY46H6gwxJQjp+YLkSxOdaJSPJ
 95qcrfvWZn0OWfFjkQUMbHptDK44DrFi6zBXPFK4O787R72NzP0Xi3AUmGIGS18yD6VtqDM7hO
 Ha4W5dvR/BEzr6eE9/hh+PekfPU0vWdficVrqU2TGPY4FB/JYtfcV2ql6pBiFLLbWnOXGomE8/
 csGP7YQWLbTJq4aJPqVJAnAW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:03 -0700
IronPort-SDR: VcUarwsjLB+ekUaZcJS+ik6zK1+MjvXxIZQG/2uRKI6K+DJ7qyBcXM5regBIZT6Z9BOpmbmvEm
 Gdx9yyJUVFZGZNKbaY3Tp8mcDkZmb+WDY4JOW9978JtH1DC/iumttGmCBl6Izvr5ZF3COnSHWU
 FC3r9HOaPUAxCqs39BWYbdMSdX2JOYT4rLw6glesG+VDQAj+mBqiUdLFxxrtQ06onhMc2qzqMt
 GzDe+SYG3+Bpp02yPvZrliMo7voEt8pYEq87SUrts0MHmaoa3OOCvjDrliKSVUWDHpfgc3zUz5
 S5g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXT0r9Yz1SVp1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523080; x=1653115081; bh=HZtMfNayAzWb857EUp
 h0gC4EyuX8kVZF+e012B4DRfM=; b=UXnpzXh0VUZDbpaMfJSBoyY65DXRgpwyX6
 oJDjuJZvAneecyNx0NTLLW7aIljVgHbkGa08d5vWhxopKB4IOrtN9rXMZSRiIM60
 wdf5dY/PgCwrz0INqL/u4iJQIB+1h2I5Q51aVKRcXF8EBL99mQXnLucOVVPrbkta
 YsecC8Mpkb6lew53prNVdq19ItKFdGSTdj/t6RkQ+OUBfHFG6A5nXAW2nebIHrev
 26grfp/irIXK0/4fE9GLps7eA7y6no8wGIlueiNK7ZtriiV5qBo2G9QfzwymofRj
 INctgqaZSnup22v6RCq2uL8UMqXWHV0uhfIskblushdsknstyz9A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Xx6OqRBAC6EI for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXQ0V0Xz1SVp2;
 Wed, 20 Apr 2022 23:37:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/31] hw/intc: riscv_aclint: Add reset function of ACLINT
 devices
Date: Thu, 21 Apr 2022 16:36:23 +1000
Message-Id: <20220421063630.1033608-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


