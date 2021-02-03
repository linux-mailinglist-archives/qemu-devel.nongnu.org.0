Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8030E184
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:56:58 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MOe-0000qH-Pi
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l7M1e-0007SL-QR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:33:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l7M1c-0005xM-TJ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:33:10 -0500
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DW7w74h6yz67kfF;
 Thu,  4 Feb 2021 01:29:27 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 3 Feb 2021 18:32:58 +0100
Received: from localhost (10.47.71.126) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:32:57 +0000
Date: Wed, 3 Feb 2021 17:32:11 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 0/4] hw/cxl/ + /hw/pci/: PCI DOE + CXL CDAT emulation
Message-ID: <20210203173211.0000691c@Huawei.com>
In-Reply-To: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.71.126]
X-ClientProxiedBy: lhreml705-chm.china.huawei.com (10.201.108.54) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 23:16:25 +0800
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Whilst I know others are working on an implementation of at least some of
> this, a desire to work on the kernel user of this required an
> implementation so I threw this together in the meantime and am sending
> it out on the basis that it may be of use to others.
> 
> As it is an RFC I have been lazy on some cleanup and error handling.
> Will fix that in a future version if we decide to take this forwards.

In the interests of info for anyone seeing this, note there is an
alternative version from Chris Browy and colleagues.

https://lore.kernel.org/qemu-devel/alpine.LRH.2.23.451.2102021543190.30097@server4/

Note that it's proved useful because we disagreed on a few things some
of which I believe need spec clarification.
(definitely one spec misread in this version - oops).

> 
> Based on Ben's cxl-2.0v3 branch from https://gitlab.com/bwidawsk/qemu
> Possible I've picked an unstable branch so this may or may not currently
> apply :)  I'll rebase on Ben's next version when avaialble.
> 
> Jonathan Cameron (4):
>   include/standard-headers/linux/pci_regs: temp hack to add necessary
>     DOE definitions.
>   hw/pci/pcie_doe: Introduce utility functions for PCIe DOE
>   hw/cxl/cxl-cdat: Initial CDAT implementation for use by CXL devices
>   hw/mem/cxl_type3: Enabled DOE mailbox for access to CDAT
> 
>  hw/cxl/cxl-cdat.c                         | 252 +++++++++++++++++++++
>  hw/cxl/meson.build                        |   1 +
>  hw/mem/cxl_type3.c                        |  49 ++++-
>  hw/pci/meson.build                        |   2 +-
>  hw/pci/pcie_doe.c                         | 257 ++++++++++++++++++++++
>  include/hw/cxl/cxl.h                      |   1 +
>  include/hw/cxl/cxl_cdat.h                 | 101 +++++++++
>  include/hw/pci/doe.h                      |  40 ++++
>  include/hw/pci/pci_ids.h                  |   2 +
>  include/standard-headers/linux/pci_regs.h |  33 ++-
>  10 files changed, 734 insertions(+), 4 deletions(-)
>  create mode 100644 hw/cxl/cxl-cdat.c
>  create mode 100644 hw/pci/pcie_doe.c
>  create mode 100644 include/hw/cxl/cxl_cdat.h
>  create mode 100644 include/hw/pci/doe.h
> 


