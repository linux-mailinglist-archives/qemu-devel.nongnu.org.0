Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4C4F71E0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 04:09:44 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncHag-0004oc-RD
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 22:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWP-0005Dx-VT
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:18 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:34929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWO-0007Oc-9X
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297115; x=1680833115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zccCpHtADMwu8/xP6fpo6+pa/5CgvCwfBlKHz72a2Pk=;
 b=hqUtJMe0NJTa7mRADNZmHbdlEx/vCeMtz56Tb1sI4acp42W43aWOoZYv
 MK02Q+sX06rJ6zaEjwSPoX+OimzxJmB3N+Bh1d+Ha+DibFncmsQ9+3qlF
 33K/fgb97WkwZWe9nx81SEln5MQod9/NIehqnD1S/Ec/uF8Clc2BRyaJi
 Uwqh9ncbXnf1QBxfA9OS/UueD50B4oiCrNciv5FWx8s5fs2j0Os0uk3No
 byZ+t0G/JjCyJz9F72jjdWhK8Z9PUAmiq9+ExVAAshCM4goZYZF0vYPmV
 Bb1UlW2iEnxkiEkUjP0nX0ycQRYVFqUOVfPwOOASkEUTlk9DfRyBxBJ+g g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="202145865"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:05:11 +0800
IronPort-SDR: N0BSdSgh76JFmq5L3lqu0E/UHyySbwyz4KMelwHewTHsyCijJscxyM8qnBROfySOmlbslb1OMp
 Ih1WnpxyWBn9pIm/st45D7kvoxgb9or1L40dbxnoUmNdGxJNl8AQrYGmSXbOFN6Q3+QCD6hVd5
 anIG0JWviuD7mZNzPzxwr9wX1SolesKAG5JpTjFrGjVn5sswTKt6utaWEVS2F//kFHwkEWgCjg
 7E2ihJJkh+j3mJ4KM4/Ds2vtlEuAptpOvZXXATxVTSW2gjWcnJH7obi7cb/G5HXzGzWBy/yYOE
 Dm1mULxMG0GFi8w1yYmDVxL3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:35:53 -0700
IronPort-SDR: b2zXrDlSjS5WaHUApoGeOV/c66ZxMxSXCfwGuXd9PF9teWJPhuWc7V7S8sMS+DuigiEwDA2hRe
 +0ihOqwkKw8Ikj7v/9TO5ZSrmXlxm2BHSksRCvl/phjiF2/0pA5EeJtSlGDEJPA2JkEWmIL8iN
 F5/DNLpeElPehsieDdikl8H8a5JFrv3AUsH+Ms63UACF1go/jkAgZkCdZMai0aGafBFIl+fFoK
 4pIKTw4d4k++9G+hLVnjiGgR8DQkXlmk7qYZEBUAgJqU7P6V8igPHqYFDUoogyF312q/08haNT
 4a8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:05:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl873v71z1SVp2
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:05:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297110; x=1651889111; bh=zccCpHtADMwu8/xP6f
 po6+pa/5CgvCwfBlKHz72a2Pk=; b=ArwyqFdzHv2QU/v89duN/CEM2VSo6mPNoJ
 3zukbdInGyVh3Byogq0n9mDpt9EBXmdwgcl8FMfjW+78fHdmb9KnjFwJpOQ8AdqX
 g5Iqy3fBZMU1G8NC3tNGfC85Y1fsf0ioF6V/evnrzvsTYabSLCYV50CGB3g7S6hm
 CFJFDXTWy02VuE1t8i9YQyq+8+NYIWPVwzS4VY+KdMo7Wnm4+Z+rnRXj2Zli7UhB
 oeRtmonGM8ED85MVapSDWFU54BfemNu2VLaLz6mqkMZYhf5azQAw6CkTxh+ypdHT
 BfvEbWqVLVDdNIIWpgik/8fWmG5KI6G7zPubWQr5cvTGDBdFFxjw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4iplh994NXZr for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:05:10 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl814Fjmz1SVp3;
 Wed,  6 Apr 2022 19:05:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 5/6] hw/riscv: virt: Add device plug support
Date: Thu,  7 Apr 2022 12:04:31 +1000
Message-Id: <20220407020432.4062829-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index eba8495e9a..bec83d26fd 100644
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


