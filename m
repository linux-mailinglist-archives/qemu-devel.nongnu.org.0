Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2C5E6687
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:12:35 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNsP-0008Le-Uj
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1obNEu-0007gV-AC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:31:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1obNEr-0007Eu-9Q
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:31:43 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MYHfD1Crpz685ZG;
 Thu, 22 Sep 2022 22:26:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 16:31:31 +0200
Received: from localhost (10.81.208.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 15:31:30 +0100
Date: Thu, 22 Sep 2022 15:31:28 +0100
To: Yicong Yang <yangyicong@huawei.com>
CC: <mst@redhat.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: Re: [PATCH 0/4] Only generate cluster node in PPTT when specified
Message-ID: <20220922153128.000035a4@huawei.com>
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.208.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 22 Sep 2022 21:11:39 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This series mainly change the policy for building a cluster topology node
> in PPTT. Previously we'll always build a cluster node in PPTT without
> asking the user, after this set the cluster node will be built only the
> the user specify through "-smp clusters=X".
> 
> Update the tests and test tables accordingly.
Hi Yicong,

Does this bring an issue with backwards compatibility?
I'm assuming we need to make this something controlled in
virt_machine_7_1_options()?

One of those things we probably should have noticed originally but now
we are stuck with the slightly messy backwards compatibility problem.

Also, looks like you picked up a bunch of tables that are unrelated
to the change.

Jonathan


> 
> Yicong Yang (4):
>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>   tests: virt: update expected ACPI tables for virt test
>   tests: acpi: aarch64: add topology test for aarch64
>   tests: acpi: aarch64: add *.topology tables
> 
>  hw/acpi/aml-build.c                |   2 +-
>  hw/core/machine-smp.c              |   3 +++
>  include/hw/boards.h                |   2 ++
>  tests/data/acpi/virt/APIC.pxb      | Bin 0 -> 168 bytes
>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>  tests/data/acpi/virt/DBG2.memhp    | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.numamem  | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.pxb      | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.topology | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>  tests/data/acpi/virt/FACP.pxb      | Bin 0 -> 268 bytes
>  tests/data/acpi/virt/FACP.topology | Bin 0 -> 268 bytes
>  tests/data/acpi/virt/GTDT.pxb      | Bin 0 -> 96 bytes
>  tests/data/acpi/virt/GTDT.topology | Bin 0 -> 96 bytes
>  tests/data/acpi/virt/IORT.topology | Bin 0 -> 128 bytes
>  tests/data/acpi/virt/MCFG.pxb      | Bin 0 -> 60 bytes
>  tests/data/acpi/virt/MCFG.topology | Bin 0 -> 60 bytes
>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>  tests/data/acpi/virt/PPTT.memhp    | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.numamem  | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.pxb      | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>  tests/data/acpi/virt/SPCR.pxb      | Bin 0 -> 80 bytes
>  tests/data/acpi/virt/SPCR.topology | Bin 0 -> 80 bytes

>  tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
>  25 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/APIC.pxb
>  create mode 100644 tests/data/acpi/virt/APIC.topology
>  create mode 100644 tests/data/acpi/virt/DBG2.memhp
>  create mode 100644 tests/data/acpi/virt/DBG2.numamem
>  create mode 100644 tests/data/acpi/virt/DBG2.pxb
>  create mode 100644 tests/data/acpi/virt/DBG2.topology
>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>  create mode 100644 tests/data/acpi/virt/FACP.pxb
>  create mode 100644 tests/data/acpi/virt/FACP.topology
>  create mode 100644 tests/data/acpi/virt/GTDT.pxb
>  create mode 100644 tests/data/acpi/virt/GTDT.topology
>  create mode 100644 tests/data/acpi/virt/IORT.topology
>  create mode 100644 tests/data/acpi/virt/MCFG.pxb
>  create mode 100644 tests/data/acpi/virt/MCFG.topology
>  create mode 100644 tests/data/acpi/virt/PPTT.memhp
>  create mode 100644 tests/data/acpi/virt/PPTT.numamem
>  create mode 100644 tests/data/acpi/virt/PPTT.pxb
>  create mode 100644 tests/data/acpi/virt/PPTT.topology
>  create mode 100644 tests/data/acpi/virt/SPCR.pxb
>  create mode 100644 tests/data/acpi/virt/SPCR.topology
> 


