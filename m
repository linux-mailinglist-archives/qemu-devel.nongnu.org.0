Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93BF36D620
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:09:30 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi4P-0003py-Oy
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lbhwk-0005yb-Kp
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:34 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lbhwh-0004ll-N7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:34 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FVbC10vSsz72f7M;
 Wed, 28 Apr 2021 18:55:41 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 13:01:18 +0200
Received: from localhost (10.52.123.69) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 28 Apr
 2021 12:01:17 +0100
Date: Wed, 28 Apr 2021 11:59:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [PATCH v5 cxl2.0-v3-doe 2/6] include/hw/pci: headers for PCIe DOE
Message-ID: <20210428115944.00004ead@Huawei.com>
In-Reply-To: <1619457403-12901-1-git-send-email-cbrowy@avery-design.com>
References: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
 <1619457403-12901-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.123.69]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ben.widawsky@intel.com, jgroves@micron.com, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, mst@redhat.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org,
 hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 13:16:43 -0400
Chris Browy <cbrowy@avery-design.com> wrote:

> From: hchkuo <hchkuo@avery-design.com.tw>
> 
> Macros for the vender ID of PCI-SIG and the size of PCIe Data Object
> Exchange.

The PCI SIG vendor ID is a little tricky to track down as it's only
called out indirectly in PCI specs.

In a similar fashion to what Bjorn asked for in the kernel code, perhaps
a reference to where it is in the DOE ECN would at least reassure people
that 0x0001 definitely is the PCI-SIG?

> 
> Signed-off-by: Chris Browy <cbrowy@avery-design.com>
One comment inline.

Jonathan

> ---
>  include/hw/pci/pci_ids.h   | 2 ++
>  include/hw/pci/pcie_regs.h | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 95f92d98e9..471c915395 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -157,6 +157,8 @@
>  
>  /* Vendors and devices.  Sort key: vendor first, device next. */
>  
> +#define PCI_VENDOR_ID_PCI_SIG            0x0001
> +
>  #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
>  #define PCI_DEVICE_ID_LSI_53C810         0x0001
>  #define PCI_DEVICE_ID_LSI_53C895A        0x0012
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 1db86b0ec4..5ec7014211 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -179,4 +179,7 @@ typedef enum PCIExpLinkWidth {
>  #define PCI_ACS_VER                     0x1
>  #define PCI_ACS_SIZEOF                  8
>  
> +/* DOE Capability Register Fields */
> +#define PCI_DOE_SIZEOF                  24
I wonder if we should do the same thing as for other cases above and also
have the PCI_DOE_VER defined here?

In theory the SIZEOF only refers to the current version of DOE - it might get
bigger in future...

Jonathan

> +
>  #endif /* QEMU_PCIE_REGS_H */


