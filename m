Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6330C09D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:03:14 +0100 (CET)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wGv-0002Ly-Rm
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6w5l-0000L9-Qy
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:51:41 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6w5h-0003pJ-68
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:51:41 -0500
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DVR026ZkDz67h9N;
 Tue,  2 Feb 2021 21:45:22 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Feb 2021 14:51:33 +0100
Received: from localhost (10.47.79.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 13:51:32 +0000
Date: Tue, 2 Feb 2021 13:50:46 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 10/31] hw/pxb: Use a type for realizing expanders
Message-ID: <20210202135046.000017ca@Huawei.com>
In-Reply-To: <20210202005948.241655-11-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-11-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.79.68]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
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
Cc: David
 Hildenbrand <david@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 16:59:27 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This opens up the possibility for more types of expanders (other than
> PCI and PCIe). We'll need this to create a CXL expander.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Minor suggestion inline but nothing important if you don't want to change it.

Jonathan

> ---
>  hw/pci-bridge/pci_expander_bridge.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index aedded1064..232b7ce305 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -24,6 +24,8 @@
>  #include "hw/boards.h"
>  #include "qom/object.h"
>  
> +enum BusType { PCI, PCIE };
> +
>  #define TYPE_PXB_BUS "pxb-bus"
>  typedef struct PXBBus PXBBus;
>  DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
> @@ -214,7 +216,8 @@ static gint pxb_compare(gconstpointer a, gconstpointer b)
>             0;
>  }
>  
> -static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
> +static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
> +                                   Error **errp)
>  {
>      PXBDev *pxb = convert_to_pxb(dev);
>      DeviceState *ds, *bds = NULL;
> @@ -239,7 +242,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>      }
>  
>      ds = qdev_new(TYPE_PXB_HOST);
> -    if (pcie) {
> +    if (type == PCIE) {

I'd make this a switch statement now given we are about to the 3 entries and may well
get more in the future.

>          bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
>      } else {
>          bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
> @@ -287,7 +290,7 @@ static void pxb_dev_realize(PCIDevice *dev, Error **errp)
>          return;
>      }
>  
> -    pxb_dev_realize_common(dev, false, errp);
> +    pxb_dev_realize_common(dev, PCI, errp);
>  }
>  
>  static void pxb_dev_exitfn(PCIDevice *pci_dev)
> @@ -339,7 +342,7 @@ static void pxb_pcie_dev_realize(PCIDevice *dev, Error **errp)
>          return;
>      }
>  
> -    pxb_dev_realize_common(dev, true, errp);
> +    pxb_dev_realize_common(dev, PCIE, errp);
>  }
>  
>  static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)


