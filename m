Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F055962B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:13:45 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fNo-00064u-5l
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4fHk-0000c2-9r; Fri, 24 Jun 2022 05:07:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4fHh-00037W-6m; Fri, 24 Jun 2022 05:07:27 -0400
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LTrmk4W2Nz6H7kx;
 Fri, 24 Jun 2022 17:05:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 24 Jun 2022 11:07:14 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 10:07:13 +0100
Date: Fri, 24 Jun 2022 10:07:09 +0100
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v11 0/2] arm/virt: CXL support via pxb_cxl
Message-ID: <20220624100709.00001640@Huawei.com>
In-Reply-To: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 16 Jun 2022 15:19:48 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> Previously patches 40 and 41 of
> [PATCH v10 00/45] CXl 2.0 emulation Support
> https://lore.kernel.org/qemu-devel/20220429144110.25167-45-Jonathan.Cameron@huawei.com/#r
> 
> Now the base CXL support including for x86/pc is upstream (patches 1-39)
> there are no dependencies between the next few CXL elements in my queue
> so they can be reviewed / merged in parallel.  Hence I'll be sending switch
> support (43-45) separately and hopefully DOE / CDAT support in a few days.
> I'm assuming this particular series should go through the arm tree if
> the maintainers are happy?

Hi All,

If Peter or anyone else has time to look at this with a view to getting
ARM support on par with x86 that would be great.  I 'think' this should
be uncontroversial but I'm far from an expert!  I'm particularly keen on
getting this upstream as most of my testing is on ARM/virt.

Thanks,

Jonathan

> 
> Changes since v10:
>  - CXL machine setup is now entirely from the supporting machines rather
>    than via code in machine.c and vl.c.  Change made for x86 in:
>    https://lore.kernel.org/qemu-devel/20220608145440.26106-1-Jonathan.Cameron@huawei.com/
>  - Dropped Ben's sign off from patch 1 which resulted from him carrying
>    these patches of mine for a while. It isn't a useful bit of history
>    to carry now they are back to me.
> 
> This short series adds support for CXL host bridges and CXL fixed memory
> windows on arm/virt.  Two types of memory region are needed:
> 1. Register space for CXL host bridges (static allowance for 16)
> 2. CXL fixed memory windows: Ranges of host PA space which
>    are statically mapped to an interleave across 1 or more CXL host
>    bridges.
> 
> Both of these types of region are described via appropriate ACPI tables.
> As the CEDT table is created with the same code as for x86 I don't think
> there is much value in duplicating the existing CXL bios-tables test.
> 
> The second patch adds a single complex test. We test a lot more configurations
> on x86 but it does not seem useful to duplicate them all on ARM and this single
> test should act as a smoke test for any problems that occur.
> 
> Run through CI at:
> https://gitlab.com/jic23/qemu/-/pipelines/564934276
> Intermittent (unrelated I assume) failure in msys64 aio-test resolved
> with a retry.
> 
> Thanks,
> 
> Jonathan
> 
> Jonathan Cameron (2):
>   hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
>     pxb-cxl
>   qtest/cxl: Add aarch64 virt test for CXL
> 
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++
>  hw/arm/virt.c            | 44 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  3 +++
>  tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build  |  1 +
>  5 files changed, 121 insertions(+), 9 deletions(-)
> 


