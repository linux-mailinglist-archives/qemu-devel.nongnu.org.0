Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC61A648D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 11:20:14 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNvGH-0003Jb-OZ
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 05:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEk-0001TM-Bk
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 05:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEj-000643-Hs
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 05:18:38 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37966 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jNvEh-0005zM-6Z; Mon, 13 Apr 2020 05:18:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1C765453D2D92EB224A4;
 Mon, 13 Apr 2020 17:18:27 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 17:18:19 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 3/3] Typo: Correct the name of CPU hotplug memory region
Date: Mon, 13 Apr 2020 17:15:52 +0800
Message-ID: <20200413091552.62748-4-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200413091552.62748-1-zhukeqian1@huawei.com>
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace "acpi-mem-hotplug" with "acpi-cpu-hotplug"

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/acpi/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index e2c957ce00..3d6a500fb7 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -222,7 +222,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *ow=
ner,
         state->devs[i].arch_id =3D id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, sta=
te,
-                          "acpi-mem-hotplug", ACPI_CPU_HOTPLUG_REG_LEN);
+                          "acpi-cpu-hotplug", ACPI_CPU_HOTPLUG_REG_LEN);
     memory_region_add_subregion(as, base_addr, &state->ctrl_reg);
 }
=20
--=20
2.19.1


