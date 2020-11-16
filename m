Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8CE2B4BBD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:55:58 +0100 (CET)
Received: from localhost ([::1]:48710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehnJ-0003UB-DN
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehlz-0002wE-9H
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:54:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehlw-0006rc-JJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:54:35 -0500
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZZr9184lz67DYt;
 Tue, 17 Nov 2020 00:52:41 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 17:54:27 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 16:54:26 +0000
Date: Mon, 16 Nov 2020 16:54:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 15/25] acpi/pxb/cxl: Reserve host bridge MMIO
Message-ID: <20201116165419.000003eb@Huawei.com>
In-Reply-To: <20201111054724.794888-16-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-16-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.36]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:37:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Dan
 Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 21:47:14 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> For all host bridges, reserve MMIO space with _CRS. The MMIO for the
> host bridge lives in a magically hard coded space in the system's
> physical address space. The standard mechanism to tell the OS about
> regions which can't be used for host bridges is _CRS.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  hw/i386/acpi-build.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index aaed7da7dc..fae4fa28e1 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -28,6 +28,7 @@
>  #include "qemu/bitmap.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci/pci.h"
> +#include "hw/cxl/cxl.h"
>  #include "hw/core/cpu.h"
>  #include "target/i386/cpu.h"
>  #include "hw/misc/pvpanic.h"
> @@ -1486,7 +1487,7 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
>      aml_append(table, scope);
>  }
>  
> -enum { PCI, PCIE };
> +enum { PCI, PCIE, CXL };
>  static void init_pci_acpi(Aml *dev, int uid, int type)
>  {
>      if (type == PCI) {
> @@ -1635,20 +1636,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              uint8_t bus_num = pci_bus_num(bus);
>              uint8_t numa_node = pci_bus_numa_node(bus);
>              int32_t uid = pci_bus_uid(bus);
> +            int type;
>  
>              /* look only for expander root buses */
>              if (!pci_bus_is_root(bus)) {
>                  continue;
>              }
>  
> +            type = pci_bus_is_cxl(bus) ? CXL :
> +                                         pci_bus_is_express(bus) ? PCIE : PCI;
> +
>              if (bus_num < root_bus_limit) {
>                  root_bus_limit = bus_num - 1;
>              }
>  
>              scope = aml_scope("\\_SB");
> -            dev = aml_device("PC%.02X", bus_num);
> +            if (type == CXL) {
> +                dev = aml_device("CXL%.01X", pci_bus_uid(bus));
> +            } else {
> +                dev = aml_device("PC%.02X", bus_num);
> +            }
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> -            init_pci_acpi(dev, uid, pci_bus_is_express(bus) ? PCIE : PCI);
> +            init_pci_acpi(dev, uid, type);

Ah, so you are relying on the fact you didn't do a switch in init_pci_acpi.
I'd rather see that called out explicitly there though as then obvious what
subset of bus types share the same init. It isn't trivial to follow through
this code right now adn work out what ends up in the AML for each type.
It might even be worth just allowing some repetition to make that easier
to see.

>  
>              if (numa_node != NUMA_NODE_UNASSIGNED) {
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
> @@ -1659,6 +1668,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              aml_append(dev, aml_name_decl("_CRS", crs));
>              aml_append(scope, dev);
>              aml_append(dsdt, scope);
> +
> +            /* Handle the ranges for the PXB expanders */
> +            if (type == CXL) {
> +                uint64_t base = CXL_HOST_BASE + uid * 0x10000;
> +                crs_range_insert(crs_range_set.mem_ranges, base,
> +                                 base + 0x10000 - 1);
> +            }
>          }
>      }
>  


