Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A76534EEA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:14:02 +0200 (CEST)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCNM-00012e-Sc
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nuCKa-0006xA-F8
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:11:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nuCKM-0007Xo-SB
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:10:56 -0400
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L86BT5wtPz67MpP;
 Thu, 26 May 2022 20:07:29 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 14:10:43 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 13:10:42 +0100
Date: Thu, 26 May 2022 13:10:41 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky
 <ben.widawsky@intel.com>, <linux-cxl@vger.kernel.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v11 0/2] hw/arm/virt: CXL 2.0 emulation support
Message-ID: <20220526131041.000077e2@Huawei.com>
In-Reply-To: <20220520163732.27545-1-Jonathan.Cameron@huawei.com>
References: <20220520163732.27545-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
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

On Fri, 20 May 2022 17:37:30 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> The initial CXL support including support on x86/pc has now merged
> (thanks Michael!).
> 
> This is the first of the two remaining parts of that series, unchanged
> since v10.  The second is CXL switch support which can be applied
> separately to this series and will be sent shortly.
> 
> CXL support requires two types of memory regions and this hooks them
> up in arm/virt.
> 
> 1) CXL host bridge control register regions.  This allows for up to
>    16 host bridges which should keep anyone happy. The CEDT ACPI table
>    is used by system software to find these regions.
> 2) CXL Fixed Memory Windows. CFMWs are regions of PA space that are
>    configured to perform interleaved accesses over multiple host bridges.
>    They are fixed, but the OS may select between multiple CFMWs to find
>    one suitable for the interleave it desires.  All interleave in the
>    host bridges and switches is programmable and discoverable - only
>    these top level regions are static and described to system software
>    via another structure in CEDT.
> 
> A simple test cases is added to existing cxl-test qtest.
> 
> Jonathan Cameron (2):
>   hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
>     pxb-cxl
>   qtest/cxl: Add aarch64 virt test for CXL
> 
>  hw/arm/virt-acpi-build.c | 33 +++++++++++++++++++++++++++
>  hw/arm/virt.c            | 40 ++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h    |  1 +
>  tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build  |  1 +
>  5 files changed, 113 insertions(+), 10 deletions(-)
> 

Note I'll send out a v12 of this series after resolving Paolo's
feedback on the main CXL series that proceeded this.
Principal impacts on this series will be updated tests for the
new command line and a move of CXLState into the virt machine
specific state structure.

Thanks,

Jonathan

