Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E960D6CE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 00:10:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onS4r-0000WS-IS; Tue, 25 Oct 2022 18:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1onS4h-00080d-3e
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:07:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1onS4d-00055Z-FV
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:07:06 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MxmGB16vyz6HJVH;
 Wed, 26 Oct 2022 06:05:22 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 00:06:44 +0200
Received: from localhost (10.45.158.174) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 23:06:43 +0100
Date: Tue, 25 Oct 2022 23:06:39 +0100
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, Huai-Cheng Kuo
 <hchkuo@avery-design.com.tw>, Chris Browy <cbrowy@avery-design.com>, "Gregory
 Price" <gregory.price@memverge.com>, <ira.weiny@intel.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v9 0/5] QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.
Message-ID: <20221025230621.00006ccb@huawei.com>
In-Reply-To: <20221014151045.24781-1-Jonathan.Cameron@huawei.com>
References: <20221014151045.24781-1-Jonathan.Cameron@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.158.174]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi Michael,

Any chance of this making 7.2?  Gregory has identified a bug
in the Linux kernel support that we've reported (debug marking
related). I don't think there are any other queries outstanding on this.

I've been holding off on sending other features to focus on
getting this in, but given timing those will probably have to wait
for next cycle now along with Gregory's series for volatile support
(which we don't have OS support for yet anyway).

Thanks,

Jonathan

On Fri, 14 Oct 2022 16:10:40 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Changes since v8:
>  - Take the entry enums out of the functions and prefix them
>    appropriately.
>  - Use the visibility of *_NUM_ENTRIES to allocate the cdat_table
>  - Fix volatile_mr -> nonvolatile_mr
> 
> V7 Cover letter - lightly edited.
> 
> Whilst I have carried on Huai-Cheng Kuo's series version numbering and
> naming, there have been very substantial changes since v6 so I would
> suggest fresh review makes sense for anyone who has looked at this before.
> In particularly if the Avery design folks could check I haven't broken
> anything that would be great.
> 
> For reference v6: QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0
> https://lore.kernel.org/qemu-devel/1623330943-18290-1-git-send-email-cbrowy@avery-design.com/
> 
> Summary of changes:
> 1) Linux headers definitions for DOE are now upstream so drop that patch.
> 2) Add CDAT for switch upstream port.
> 3) Generate 'plausible' default CDAT tables when a file is not provided.
> 4) General refactoring to calculate the correct table sizes and allocate
>    based on that rather than copying from a local static array.
> 5) Changes from earlier reviews such as matching QEMU type naming style.
> 6) Moved compliance and SPDM usecases to future patch sets.
> 
> Sign-offs on these are complex because the patches were originally developed
> by Huai-Cheng Kuo, but posted by Chris Browy and then picked up by Jonathan
> Cameron who made substantial changes.
> 
> Huai-Cheng Kuo confirmed they are happy to maintain this updated code.
> 
> What's here?
> 
> This series brings generic PCI Express Data Object Exchange support (DOE)
> DOE is defined in the PCIe Base Spec r6.0. It consists of a mailbox in PCI
> config space via a PCIe Extended Capability Structure.
> The PCIe spec defines several protocols (including one to discover what
> protocols a given DOE instance supports) and other specification such as
> CXL define additional protocols using their own vendor IDs.
> 
> In this series we make use of the DOE to support the CXL spec defined
> Table Access Protocol, specifically to provide access to CDAT - a
> table specified in a specification that is hosted by the UEFI forum
> and is used to provide runtime discoverability of the sort of information
> that would otherwise be available in firmware tables (memory types,
> latency and bandwidth information etc).
> 
> The Linux kernel gained support for DOE / CDAT on CXL type 3 EPs in 6.0.
> The version merged did not support interrupts (earlier versions did
> so that support in the emulation was tested a while back).
> 
> This series provides CDAT emulation for CXL switch upstream ports
> and CXL type 3 memory devices. Note that to exercise the switch support
> additional Linux kernel patches are needed.
> https://lore.kernel.org/linux-cxl/20220503153449.4088-1-Jonathan.Cameron@huawei.com/
> (I'll post a new version of that support shortly)
> 
> Additional protocols will be supported by follow on patch sets:
> * CXL compliance protocol.
> * CMA / SPDM device attestation.
> (Old version at https://gitlab.com/jic23/qemu/-/commits/cxl-next - will refresh
> that tree next week)
> Huai-Cheng Kuo (3):
>   hw/pci: PCIe Data Object Exchange emulation
>   hw/cxl/cdat: CXL CDAT Data Object Exchange implementation
>   hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
> 
> Jonathan Cameron (2):
>   hw/mem/cxl-type3: Add MSIX support
>   hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE
> 
>  MAINTAINERS                    |   7 +
>  hw/cxl/cxl-cdat.c              | 224 ++++++++++++++++++++
>  hw/cxl/meson.build             |   1 +
>  hw/mem/cxl_type3.c             | 264 ++++++++++++++++++++++++
>  hw/pci-bridge/cxl_upstream.c   | 195 +++++++++++++++++-
>  hw/pci/meson.build             |   1 +
>  hw/pci/pcie_doe.c              | 367 +++++++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_cdat.h      | 166 +++++++++++++++
>  include/hw/cxl/cxl_component.h |   7 +
>  include/hw/cxl/cxl_device.h    |   3 +
>  include/hw/cxl/cxl_pci.h       |   1 +
>  include/hw/pci/pci_ids.h       |   3 +
>  include/hw/pci/pcie.h          |   1 +
>  include/hw/pci/pcie_doe.h      | 123 +++++++++++
>  include/hw/pci/pcie_regs.h     |   4 +
>  15 files changed, 1366 insertions(+), 1 deletion(-)
>  create mode 100644 hw/cxl/cxl-cdat.c
>  create mode 100644 hw/pci/pcie_doe.c
>  create mode 100644 include/hw/cxl/cxl_cdat.h
>  create mode 100644 include/hw/pci/pcie_doe.h
> 


