Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E65065F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:05 +0200 (CEST)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiNA-00014x-7U
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghka-0003wI-Go
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:54:12 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkY-0004KS-Sd
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351249; x=1681887249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8cubxdE+5rkaf0Cjh3SiUez+sCYKeMPtlbdA9NTcPVM=;
 b=ahcyjRpeAquQJxTrk/PPgqpcqXN+3BjyqioJMOjgN4Ne34tsiselXGYu
 6s5ri/abekF9LSESfN3S49JkYiYNt1J2YxRpv9fbylXDWsZe4u6aUoln1
 cL6HmTS6GMo63N+OuodbTzPfXIMQSNScrhs6Ifp142WXMVSNEEqBs1w1E
 1yP//oyiyMHpLNgu9JTdXmOVM+48skh2wt/c9JD/Cf+o/H7JvAc/SKqtZ
 OQrCNxYfGsWlFMDMANXFUrBFsV82DsNUPVp/tdcjDoLDScPZcib7d5G1B
 QuBkEN7jwjC8ecbDnxjcgnpUsTPcTKI/UOiCMaxGlMQJ64WWy7fMe8IOn Q==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="198236528"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:54:08 +0800
IronPort-SDR: sXd+xNi7zFt4pMlBgfY8s45wvSwCGgUFvNEpX6eOcUsbPHt1nOactyJanoyfFKgjiS9yaGRKxo
 ilLj4AkhXbKZVlDFDJIYYXxa0hrcLXEvttDoiMxIGnqC5NRa3/ZgnWV6kH0BemqgtfjKjcIOXS
 UQye/fAXVbo+h5mSOohtuhKbpxJ6zN3v5FwMA5AG6MWm/DNJTDdFP1yqcKs7RRFb7KEQLdbFEl
 HXQkQDhSWrLi9gTPbIU1vG19XUpg67MA7/V2kD8inW7eysHr8tNtOuWiY5SGS/uy8sqgrLqMa+
 ZAdjlevkZdqJCpgPJ164n4OF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:25:15 -0700
IronPort-SDR: yN0Hhmto2+D3ZNAI2GlfJhKDLQQmqR3mtO+HAkhuiSdF4z9ul4Zq3TYLVZbsATt/bHc9JVNdTj
 IrFN4OxaUvRnqH/lAYqwhesdRAyJEnGuSSq3uq+aCtmA2ggpAPnO22qjjWaXTFzjrqxtT/GVI4
 WBLxsuBNeuKJRZRfWgN6tcdIRHRSznRmBPeTTTc/unG/ZEzYIeTlCjQUUlGtWEq9HJAmKewdwr
 H7R7IyVAVnrhqHqwXb/maTXFYdYjG7qIRM3B1UHomu4tpPemJATXs7bwZlrOA1pI6uBbn/rxYG
 PAo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:54:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjF0067pYz1SVp2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 23:54:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351248; x=1652943249; bh=8cubxdE+5rkaf0Cjh3
 SiUez+sCYKeMPtlbdA9NTcPVM=; b=FjlwgZ4VEC9itcFGmBDEK8TJW0hdShhMT/
 lwCNT4Vd6417VADHECvQAN3Efq1bxfAxK6P29kDiY4+Y3fwqFEBMdN4BebdTz4sV
 5YDn0KnOoPLECylXcPxxZrPwJCmFpP3Kh3UERPnPV/8NkwE+K1UDbElDsE1xC/cL
 /hqHgdEVZwMDvoNL/oHjaXs/nIeKxTpcDUtHp4LGGx3Y5KnzaMrIRBYfcS+roo9h
 +sQvH82h+cBNUmmEhWLahcWbPWKaUrKiJUUm/6O1QL7SkBR1UQAqHVKY/Bw4K4lT
 QFMvvf7sBt2WSqfEq70aA/xY+toylXV1TRx6avnEB2aLo9omQ4DQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zDGnmEe11hwR for <qemu-devel@nongnu.org>;
 Mon, 18 Apr 2022 23:54:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzx2xQ7z1SVp0;
 Mon, 18 Apr 2022 23:54:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 5/6] hw/riscv: virt: Add device plug support
Date: Tue, 19 Apr 2022 16:53:41 +1000
Message-Id: <20220419065342.878415-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

Add support for plugging in devices, this was tested with the TPM
device.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e4a5c6c28b..6eed1f4d70 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1564,10 +1564,37 @@ static void virt_set_aclint(Object *obj, bool val=
ue, Error **errp)
     s->have_aclint =3D value;
 }
=20
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *ma=
chine,
+                                                        DeviceState *dev=
)
+{
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
+static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(hotplug_dev);
+
+    if (s->platform_bus_dev) {
+        MachineClass *mc =3D MACHINE_GET_CLASS(s);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
+            platform_bus_link_device(PLATFORM_BUS_DEVICE(s->platform_bus=
_dev),
+                                     SYS_BUS_DEVICE(dev));
+        }
+    }
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     char str[128];
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
=20
     mc->desc =3D "RISC-V VirtIO board";
     mc->init =3D virt_machine_init;
@@ -1579,6 +1606,10 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
     mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported =3D true;
     mc->default_ram_id =3D "riscv_virt_board.ram";
+    assert(!mc->get_hotplug_handler);
+    mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
+
+    hc->plug =3D virt_machine_device_plug_cb;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
=20
@@ -1609,6 +1640,10 @@ static const TypeInfo virt_machine_typeinfo =3D {
     .class_init =3D virt_machine_class_init,
     .instance_init =3D virt_machine_instance_init,
     .instance_size =3D sizeof(RISCVVirtState),
+    .interfaces =3D (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
=20
 static void virt_machine_init_register_types(void)
--=20
2.35.1


