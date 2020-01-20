Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE0142176
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 02:32:28 +0100 (CET)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itLvX-0004yJ-5n
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 20:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLu3-0003yD-6c
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLu2-00051C-3E
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:55 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:33402 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1itLu1-0004zu-PT
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:54 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D6F079EF755BE1FBF7F3;
 Mon, 20 Jan 2020 09:30:51 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 Jan 2020 09:30:44 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] hw/acpi: Remove extra indent in ACPI GED hotplug cb
Date: Mon, 20 Jan 2020 09:27:54 +0800
Message-ID: <20200120012755.44581-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200120012755.44581-1-zhukeqian1@huawei.com>
References: <20200120012755.44581-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is extra indent in ACPI GED hotplug cb that should be
deleted.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_devic=
e.c
index 9cee90cc70..55eb29d80a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -175,7 +175,7 @@ static void acpi_ged_device_plug_cb(HotplugHandler *h=
otplug_dev,
     AcpiGedState *s =3D ACPI_GED(hotplug_dev);
=20
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp)=
;
+        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported devi=
ce"
                    " type: %s", object_get_typename(OBJECT(dev)));
--=20
2.19.1


