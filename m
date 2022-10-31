Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C66137C8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUii-00067O-Lq; Mon, 31 Oct 2022 09:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1opUi0-00037Q-5H; Mon, 31 Oct 2022 09:20:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1opUhy-0005aC-3K; Mon, 31 Oct 2022 09:20:07 -0400
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1DHN0DY6z67x9D;
 Mon, 31 Oct 2022 21:18:24 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 14:20:02 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 13:20:01 +0000
Date: Mon, 31 Oct 2022 13:20:00 +0000
To: Yicong Yang <yangyicong@huawei.com>, <mst@redhat.com>
CC: Hesham Almatary <hesham.almatary@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@hisilicon.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
Message-ID: <20221031132000.000059fc@Huawei.com>
In-Reply-To: <20221031131717.00003cc4@Huawei.com>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
 <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
 <20221031131717.00003cc4@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 13:17:17 +0000
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 28 Oct 2022 17:53:40 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
> > Hi Hesham,
> > 
> > On 2022/10/27 18:00, Hesham Almatary wrote:
> > > This patchset adds support for AArch64/HMAT including a test.
> > > It relies on other two patch sets from:
> > > 
> > > Brice Goglin: to support -numa without initiators on q35/x86.
> > >   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> > > Xiang Chen: to enable/support HMAT on AArch64.
> > >   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> > > 
> > > I further add a test with ACPI/HMAT tables that uses the two
> > > patch sets.
> > >   
> > 
> > You seems to forget my tag :)
> > 
> > Anyway tested again for this series on master of commit
> > 052924548886, still works well and all tests passed for
> > qemu-system-aarch64.
> > 
> > Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Hi,
> 
> Michael, I think you said you'd pick this one up? (it hit during last
> freeze) Just want to confirm in case everyone was assuming this was
> someone else's problem ;) I want to add a bunch of stuff on top of
> this next cycle (Generic Ports in particular) so good to get this in
> place if we can.

Doh.  Failed to spot your pull request due to my local email filtering house of cards.
 Ignore me ;)

Jonathan


> 
> Jonathan
> 
> > 
> > > Changes from v2:
> > > - Rebased and fixed a merge conflict
> > > 
> > > Changes from v1:
> > > - Generate APIC and PPTT ACPI tables for AArch64/virt
> > > - Avoid using legacy syntax in numa/bios tests
> > > - Delete unchanged FACP tables
> > > 
> > > Brice Goglin (4):
> > >   hmat acpi: Don't require initiator value in -numa
> > >   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
> > >   tests: acpi: q35: add test for hmat nodes without initiators
> > >   tests: acpi: q35: update expected blobs *.hmat-noinitiators
> > > expected HMAT:
> > > 
> > > Hesham Almatary (3):
> > >   tests: Add HMAT AArch64/virt empty table files
> > >   tests: acpi: aarch64/virt: add a test for hmat nodes with no
> > >     initiators
> > >   tests: virt: Update expected *.acpihmatvirt tables
> > > 
> > > Xiang Chen (1):
> > >   hw/arm/virt: Enable HMAT on arm virt machine
> > > 
> > >  hw/arm/Kconfig                                |   1 +
> > >  hw/arm/virt-acpi-build.c                      |   7 ++
> > >  hw/core/machine.c                             |   4 +-
> > >  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144
> > > bytes tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 ->
> > > 8553 bytes tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0
> > > -> 288 bytes tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin
> > > 0 -> 312 bytes tests/data/acpi/virt/APIC.acpihmatvirt        |
> > > Bin 0 -> 396 bytes tests/data/acpi/virt/DSDT.acpihmatvirt
> > > | Bin 0 -> 5282 bytes tests/data/acpi/virt/HMAT.acpihmatvirt
> > >   | Bin 0 -> 288 bytes tests/data/acpi/virt/PPTT.acpihmatvirt
> > >    | Bin 0 -> 196 bytes tests/data/acpi/virt/SRAT.acpihmatvirt
> > >     | Bin 0 -> 240 bytes tests/qtest/bios-tables-test.c
> > >      | 109 ++++++++++++++++++ 13 files changed, 118
> > > insertions(+), 3 deletions(-) create mode 100644
> > > tests/data/acpi/q35/APIC.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/DSDT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/HMAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/SRAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/virt/APIC.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/DSDT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/HMAT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/PPTT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/SRAT.acpihmatvirt 
> 


