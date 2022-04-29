Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32942514198
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:54:01 +0200 (CEST)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIdj-0003sI-VJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJj-0001Lj-78
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJh-0002Vn-G3
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206797; x=1682742797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ab2aZ0F6zZzhow2kQCc1l5k1n6QqFY0rwE5HDbqZ2nA=;
 b=lNUp7qBcaH/HMPQW7Lc49J+Gq7kkvlJpEAa26eEJ0HZwqzP5eQZOaHJf
 43qe8Zx6vJ/PQDsFyIcpvbhcZ8IBSqnKYRWc1e0Q6n49jolj64EcjGspH
 7RUg/jvqdyfxvKNXDlqpyGswO48QYb7h8/PMVnwUYUp4/MAqYXBdmOdLq
 DRuO37hHKemXPJQ8ogMN2jEata5zbpIPJGNXGNgLKZJYbx5L5OckZFcoq
 lRP2q4peqdOu32beKjYCwgdNE0iaT8Rc5p6YmAHUG4cLeuDblpdNIw6H+
 HWTzUePVAnZIKuWApfEyW+CyzmwwbCj9Sn/kncUWEf5fPfzQaW1RPy6nn Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203996004"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:54 +0800
IronPort-SDR: OZ4sT+Z29OWvP1+ENCpHmDMZupyb9FJ3M1fK9N0uxPNrFMYacmZmpooyGcvf+LPEbaHql+qGww
 lC1baiqEeW7oVkfTM9TS8wigZw5TSBbZ+IxAk+lbpuoBcOJZizqnh+BGW4e+ZWboshOTHGKqT+
 G7ceg+oZIiue8CqUuLRcNLmIvGI8hS1qY0o0+MRrJimJhsU509HiHC+L8uqURbo25xqmzc65Et
 ggKsOElrylXX/0TARehIZMbcKrRYKviqjQ1M6mP9jpbecPzOULzLysc0PBnSB6uOiBLpbnj7uh
 1kt3FfFdJEzKR91L9y0Cjy3g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:03:02 -0700
IronPort-SDR: gSuwtkakb40bda8UIGMWHyWLZo/lvdD++oi5X1MKK+zruPO46J6hVUMSUspo3xcQEiGwb4mfgL
 OmUxtvCdm34WG8x2idu/7uKZSBsqRZWZexhqYfsXx+wa63WbblnDu6R0xmhktB+vTu9AUX1TDX
 341vZ54G7j8OUteS6MUw8DtXzuEGMEk341sTYcEBcrZ0QmaYLp8ewESZ/hcod1RR8/GTZSgmnH
 nijSRZHDHM45nMhfVKD8gywcHqqO3EJGwlG2+11ZV5Y+6fRhB6dTS6j/9BQNL/YkQws+9N2qx/
 pAI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKNP5382z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206773; x=1653798774; bh=Ab2aZ0F6zZzhow2kQC
 c1l5k1n6QqFY0rwE5HDbqZ2nA=; b=M3iNGb3KZVpfD84Vas7Ni2yQ82s+MKSM2x
 +cs9PQrP1yoYjc4lGR/aUCPp94nNA9djY6aQ52XNBiU9sD85zjiDjWv0jx8VZLXC
 gXaXQR8/X7vreINEoIZYsUZYkBdDKY03Q0fVyiLyisI11aVD1br3heRNVlhH9/vd
 hRhSdwDYI8lnymh1bAqh1LVO/3FjWPjuyyOla2fQAJhpNRb9/nHDY9Rb5L8pc5cN
 3DEmHMfUYfp7e9LGi19oF8GyA24EtSYFt5FwancAkqPADgumJHGAWUOJM6QU0i5Z
 MmzEXR5DX1bL29SDfefoTZssWhyLVBai38BI79qitlIHRDspbE/g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KzabuRiHd9fy for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKNM0WPSz1Rvlc;
 Thu, 28 Apr 2022 21:32:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 24/25] hw/riscv: virt: Add device plug support
Date: Fri, 29 Apr 2022 14:31:18 +1000
Message-Id: <20220429043119.1478881-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Add support for plugging in devices, this was tested with the TPM
device.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220427234146.1130752-6-alistair.francis@opensource.wdc.com=
>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 12d0650b33..035c6fb581 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1569,10 +1569,37 @@ static void virt_set_aclint(Object *obj, bool val=
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
@@ -1584,6 +1611,10 @@ static void virt_machine_class_init(ObjectClass *o=
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
@@ -1614,6 +1645,10 @@ static const TypeInfo virt_machine_typeinfo =3D {
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


