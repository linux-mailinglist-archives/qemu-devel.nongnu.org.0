Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42C5080EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:17:09 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3eA-0008Jl-KG
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HM-0008K4-7K
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HK-0004VK-6G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650434006; x=1681970006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8cubxdE+5rkaf0Cjh3SiUez+sCYKeMPtlbdA9NTcPVM=;
 b=ms0euG66Nn24jlQvHjegf8EIWsNgJTH9h0TUv2SJDSGTKHCo7bQFdHCN
 sEdNzz2TmHn52ZQHanFm4XGibcSmi5dkewsRhnQ4+X9cCwb9E046rULCY
 GcEYQGFwuqHYkR3SRVboiZUTCwsMBtehyWcBa9BjLQhQ/o+Bukq3DuQII
 vpk0OkEzdeuHXkIHIIvYXkTSuGHNirO83GuXI8eAGbxnwy90jv4jTFL/R
 4azVvfOwkzwoMMmDCNS48UM6cmNKTKGdu4sLKPHtrQsb/I8pp1B47gzj6
 pxfJjtN2/DlTgEFMsHCWJdMfHORFoLYzQbakaLzbHBeQvgfJnz6oPmnIO w==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="199228723"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:23 +0800
IronPort-SDR: 64vecbpmTx6Kx4tj38nEmWvBJeIZCp6dpn5YDHspaiNY+q6d3Ap3zX3ITqtZEJnD4SZ9+dQQ0a
 XWAjAQiLpwvjZBIWK0DHCQMleDMAF+c37uaU2B8eTp2xbFJPI8eK50yKhqzIUe5JABMbfUtkLh
 16x4UjvSfh3Ov1vPicP1s0HaBQfN2nGf0FtJbDClXMl+IYRpiOTCyFvdHZLxbd1jb/rZg/hZGQ
 buRk5XXdLKho01sMmlfkQM5PUvQV28pLRUE5ord3MPZy4as84UKFeIXYGN8UQRG+MWbyeXWXUh
 I4blKBxzjzJ2ZmvZITT4tTRK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:24:27 -0700
IronPort-SDR: S5mA9CwoafHBqUXhDHL+lhMIpdo+C+pdTwK26S4pUJ3Tao80Wh0VEzB6aD09PjSVdVA0ZU4MwS
 Q1C+iGZtTY5dXOgZSDKjomXNVDjY4yNIAEVlWoyyTs69HVi8g6UOmjB4j/LAScPraXQUTDanTt
 SsRcnmrFobFtaEq0g5OPhuxHXSW5b6YxWWa/0ZX8y6LkdkgkOW5U4PpGONQ8fszLorKXOUi8ib
 oBOgDefVuPsFvPQFPFuZLH3hgUwwPomM+q78y02IBChjUBlGbRxFwrydBhtFVhOAJ+tCZ0YFgV
 mss=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqbQ5bnMz1SVpC
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 22:53:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650434001; x=1653026002; bh=8cubxdE+5rkaf0Cjh3
 SiUez+sCYKeMPtlbdA9NTcPVM=; b=kUi/OCtqePGP+chTWFNFpktuiG6/mjZ0hi
 51onv+2fpgz5O4wgSCHDnK7DA3SHAnmpOhRSBVjoTlNUb7XNPzEby2rw9zrvAH6K
 i85210kfrWjGD6QCnTeUycoB8xyntQ78Msa9aoAOAQEUi5pTrEkscmGaPpd1jFbw
 c9JidQkGx/02KV6RNOsjmzU3Tb91LIdcCRHQmEkkHvS7t7IMcx0EZE05KZ9Kuw9H
 N2ybcen1dPHzPnofQI1nYhPlXgQFV6iusS89gEP394EJsXAHuhznTjzhux2CNnoX
 FC5VhHA2SHPbjs1qu5OJBkq/iQU0N0uxdcMHxSWtmmPkbg+nXusQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P5-d5qPVS4fs for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 22:53:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqbK4Kntz1Rwrw;
 Tue, 19 Apr 2022 22:53:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 5/6] hw/riscv: virt: Add device plug support
Date: Wed, 20 Apr 2022 15:52:47 +1000
Message-Id: <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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


