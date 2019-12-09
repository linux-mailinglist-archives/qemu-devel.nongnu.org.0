Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286D1166FF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 07:39:57 +0100 (CET)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieCi4-0006Qn-D2
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 01:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ieCh1-0005Kl-Gn
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 01:38:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ieCh0-0004c1-Jo
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 01:38:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:60986 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ieCgx-0004aK-V8; Mon, 09 Dec 2019 01:38:48 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A3CBF6D634ECE13C9D14;
 Mon,  9 Dec 2019 14:38:42 +0800 (CST)
Received: from linux-XCyijm.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 14:38:33 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/2] arm/acpi: simplify aml code and enable SHPC
Date: Mon, 9 Dec 2019 14:37:17 +0800
Message-ID: <20191209063719.23086-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the introduction of generic PCIe root port and PCIe-PCI bridge, we =
will
also have SHPC controller on ARM, and we don't support ACPI hot plug, so =
just
enable SHPC native hot plug.

Igor also spotted the store operation outside of bit and/or is not necess=
ary, so
simply the code at first.

v6:
- Fix "make check" errors by updating tests/data/acpi/virt/DSDT*.

v5:
- Refine commit message of patch 1/2

v4:
- Improve the code indention.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>



Heyi Guo (2):
  hw/arm/acpi: simplify AML bit and/or statement
  hw/arm/acpi: enable SHPC native hot plug

 hw/arm/virt-acpi-build.c          |  21 +++++++++++++--------
 tests/data/acpi/virt/DSDT         | Bin 18470 -> 18462 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19807 -> 19799 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18470 -> 18462 bytes
 4 files changed, 13 insertions(+), 8 deletions(-)

--=20
2.19.1


