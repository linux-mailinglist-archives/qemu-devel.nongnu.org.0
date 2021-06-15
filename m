Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12653A8819
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:50:35 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDCs-0005di-Se
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ltD3s-0000Q2-7l
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:16 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ltD3k-0003ZY-KU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:15 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G4FjR6L5Sz6H81b;
 Wed, 16 Jun 2021 01:31:23 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:41:01 +0200
Received: from localhost (10.52.127.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 15 Jun
 2021 18:41:01 +0100
Date: Tue, 15 Jun 2021 18:40:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [PATCH v6 cxl2.0-v6-doe 2/6] include/hw/pci: headers for PCIe DOE
Message-ID: <20210615184055.00007b5c@Huawei.com>
In-Reply-To: <1623330957-18354-1-git-send-email-cbrowy@avery-design.com>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
 <1623330957-18354-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.127.68]
X-ClientProxiedBy: lhreml701-chm.china.huawei.com (10.201.108.50) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
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
 armbru@redhat.com, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 09:15:57 -0400
Chris Browy <cbrowy@avery-design.com> wrote:

> From: hchkuo <hchkuo@avery-design.com.tw>
> 
> Macros for the vender ID of PCI-SIG mentioned in "PCIe Data Object
> Exchange ECN, March 12, 2020" and the size of PCIe Data Object
> Exchange.
> 
> Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
> Signed-off-by: Chris Browy <cbrowy@avery-design.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/hw/pci/pci_ids.h   | 3 +++
>  include/hw/pci/pcie_regs.h | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 95f92d98e9..2656009cfe 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -157,6 +157,9 @@
>  
>  /* Vendors and devices.  Sort key: vendor first, device next. */
>  
> +/* Ref: PCIe Data Object Exchange ECN, March 12, 2020, Table 7-x2 */
> +#define PCI_VENDOR_ID_PCI_SIG            0x0001
> +
>  #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
>  #define PCI_DEVICE_ID_LSI_53C810         0x0001
>  #define PCI_DEVICE_ID_LSI_53C895A        0x0012
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 1db86b0ec4..963dc2e170 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -179,4 +179,8 @@ typedef enum PCIExpLinkWidth {
>  #define PCI_ACS_VER                     0x1
>  #define PCI_ACS_SIZEOF                  8
>  
> +/* DOE Capability Register Fields */
> +#define PCI_DOE_VER                     0x1
> +#define PCI_DOE_SIZEOF                  24
> +
>  #endif /* QEMU_PCIE_REGS_H */


