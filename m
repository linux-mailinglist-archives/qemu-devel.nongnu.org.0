Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6FD151408
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 02:47:21 +0100 (CET)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iynJA-0007ge-P3
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 20:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynHW-00070T-Ul
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 20:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynHU-000718-RJ
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 20:45:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:50634 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynHN-0006rV-5L; Mon, 03 Feb 2020 20:45:30 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4631BB1E560719FDA459;
 Tue,  4 Feb 2020 09:45:24 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:45:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/7] Some cleanup in arm/virt/acpi
Date: Tue, 4 Feb 2020 09:43:18 +0800
Message-ID: <20200204014325.16279-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove conflict _ADR objects, and fix and refine PCI device definition in
ACPI/DSDT.

History:

v3 -> v2:
- update commit message for patch 4/7.
- remove diff keywords in commit message of patch 7/7 to avoid applying p=
atch
  failure.

v1 -> v2:
- flow the work flow in tests/qtest/bios-table-test.c to post ACPI relate=
d
  patches.
- update commit messages for removing "RP0" and "_ADR".
- add 3 more cleanup patches.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org

Heyi Guo (7):
  bios-tables-test: prepare to change ARM virt ACPI DSDT
  arm/virt/acpi: remove meaningless sub device "RP0" from PCI0
  arm/virt/acpi: remove _ADR from devices identified by _HID
  arm/acpi: fix PCI _PRT definition
  arm/acpi: fix duplicated _UID of PCI interrupt link devices
  arm/acpi: simplify the description of PCI _CRS
  virt/acpi: update golden masters for DSDT update

 hw/arm/virt-acpi-build.c          |  25 ++++++-------------------
 tests/data/acpi/virt/DSDT         | Bin 18462 -> 5307 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 6644 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 5307 bytes
 4 files changed, 6 insertions(+), 19 deletions(-)

--=20
2.19.1


